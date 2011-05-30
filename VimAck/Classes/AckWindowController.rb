#
#  AckController.rb
#  VimAck
#
#  Copyright 2011 Majd Taby. All rights reserved.
#

# TODO: Review state of memory management in this class

# AckWindowController is responsible for managing the xib of the application
# as well as startup the ack process and parsing the results
class AckWindowController < NSWindowController
    
    attr_writer :projectRoot
    attr_accessor :searchQuery, :tableView, :searchButton, :tableViewController
    
    def runQuery(sender)
        
        searchButton.setTitle "Searching..."
        performSelector :perform_search, withObject:nil, afterDelay:0
        
    end
    
    def perform_search()
        
        # Creating a group to synchronize block execution.
        group = Dispatch::Group.new
        
        result_queue = Dispatch::Queue.new('access-queue.1')
        
        # Dispatch a task to the default concurrent queue.
        Dispatch::Queue.concurrent.async(group) do
            
            arguments = ["--ignore-case", "-Q", self.searchQuery.stringValue];
            bundle_path = NSBundle.mainBundle.resourcePath
            
            ackTask = NSTask.alloc.init
            ackTask.setLaunchPath "#{bundle_path}/ack"
            ackTask.setCurrentDirectoryPath @projectRoot
            
            ackTask.setArguments arguments
            
            outputPipe = NSPipe.alloc.init
            errorPipe = NSPipe.alloc.init
            
            ackTask.setStandardOutput outputPipe
            ackTask.setStandardError errorPipe
            
            #outputPipe.release
            #errorPipe.release
            ackTask.launch
            
            outData = outputPipe.fileHandleForReading.readDataToEndOfFile
            errData = errorPipe.fileHandleForReading.readDataToEndOfFile
            
            ackTask.waitUntilExit
            
            status = ackTask.terminationStatus
            #ackTask.release
            
            if status != 0
                errOutput = NSString.alloc.initWithData(errData, encoding:NSUTF8StringEncoding)
                self.statusMessage.setStringValue(NSString.stringWithFormat("Error: %@", status))
                #errOutput.release
                else              
                stdOutput = NSString.alloc.initWithData(outData, encoding:NSUTF8StringEncoding)
                
                process_output stdOutput
                #stdOutput.release
            end
        end
        
        # Wait for all the blocks to finish.
        group.wait
        
        searchButton.setTitle "Find" 
    end
    
    def process_output(output)
        lines = output.split "\n"
        puts "Found #{lines.length} matches" 
        
        tokenizer = Regexp.new(/(.*):(\d+):(.*)/)
        
        files = {}
        
        lines.each do |line|
            if line.match tokenizer
                
                filename = $1
                
                if not files[filename]
                    file_record = MatchedFile.new
                    file_record.filename = filename
                    file_record.records = []
                    
                    files[filename] = file_record
                else
                    file_record = files[filename]
                end
                
                line_record = MatchedLine.new
                line_record.filename = filename
                line_record.line_number = $2
                line_record.matched_line = $3
                line_record.query = self.searchQuery.stringValue
                line_record.matched_ranges = find_matches(line_record.matched_line, line_record.query)
                
                file_record.records << line_record
            else
                throw "Could not parse output from ack: #{line}"
            end
        end
        
        tableViewController.records = files.values
        tableViewController.projectRoot = @projectRoot
        tableViewController.table_view.reloadData
        tableView.expandItem(nil, expandChildren:true)
    end
    
    def find_matches(haystack, needle)
        matches = []
        
        length = needle.length
        offset = haystack.downcase.index(needle.downcase)
        
        while offset do            
            matches << offset
            offset = haystack.downcase.index(needle.downcase, offset + length)
        end
                                    
        matches
    end
end
