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
    attr_accessor :searchQuery, :tableView, :searchButton, :tableViewController, :statsLabel
    attr_accessor :literalMatch, :caseSensitive, :queue
    
    def runQuery(sender)
        
        searchButton.setTitle "Searching..."
        @queue = Dispatch::Queue.new('org.macruby.synchronizer')
        performSelector :perform_search, withObject:nil, afterDelay:0
        
    end
    
    def perform_search()
        
        outData = nil
        
        @queue.sync do
            
            arguments = []
            arguments << "--ignore-case" if @caseSensitive.state == 0
            arguments << "-Q" if @literalMatch.state == 1
            arguments << self.searchQuery.stringValue
            
            bundle_path = NSBundle.mainBundle.resourcePath
            
            ackTask = NSTask.alloc.init
            ackTask.setLaunchPath "#{bundle_path}/ack"
            ackTask.setCurrentDirectoryPath @projectRoot
            
            ackTask.setArguments arguments
            
            outputPipe = NSPipe.alloc.init
            errorPipe = NSPipe.alloc.init
            
            ackTask.setStandardOutput outputPipe
            ackTask.setStandardError errorPipe
            
            ackTask.launch
            
            outData = outputPipe.fileHandleForReading.readDataToEndOfFile
            errData = errorPipe.fileHandleForReading.readDataToEndOfFile
            
            ackTask.waitUntilExit
            status = ackTask.terminationStatus
            
            if status == 0
                stdOutput = NSString.alloc.initWithData(outData, encoding:NSUTF8StringEncoding)
                process_output stdOutput
                
            elsif status == 1
                no_matches
                
            else
                ack_error
            end
        end
        
        searchButton.setTitle "Find" 
    end
    
    def no_matches
        @statsLabel.setStringValue "No results found"        
        tableViewController.records = []
        tableViewController.table_view.reloadData
    end
    
    def ack_error
        errOutput = NSString.alloc.initWithData(errData, encoding:NSUTF8StringEncoding)
        @statsLabel.setStringValue(NSString.stringWithFormat("Error: %@", status))           
    end
    
    def process_output(output)
        lines = output.split "\n"
        
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
        
        @statsLabel.stringValue = "Found #{lines.length} matches in #{files.size} files."

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
