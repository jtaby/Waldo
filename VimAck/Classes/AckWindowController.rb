#
#  AckController.rb
#  Waldo
#
#  Copyright 2011 Majd Taby. All rights reserved.
#

# AckWindowController is responsible for managing the xib of the application
# as well as startup the ack process and parsing the results
class AckWindowController < NSWindowController
    
    attr_accessor :searchQuery, :tableView, :searchButton, :tableViewController, :statsLabel
    attr_accessor :literalMatch, :caseSensitive, :queue, :cached_symbols
    attr_reader :projectRoot
    
    def runQuery(sender)
        
        searchButton.setTitle "Searching..."
        @queue = Dispatch::Queue.new('org.macruby.synchronizer')
        performSelector :perform_search, withObject:nil, afterDelay:0
        
    end
    
    def reset
        @cached_symbols = nil
    end
    
    def projectRoot= (val)
        reset
        @projectRoot = val
    end
    
    def perform_search()
        
        outData = nil

        @queue.sync do
            bundle_path = NSBundle.mainBundle.resourcePath

            temp_file = "#{bundle_path}/tags"
            
            arguments = %W(#{bundle_path}/jsctags -o #{temp_file})
            arguments.concat Dir["#{@projectRoot}/**/*.js"]
            
            ackTask = NSTask.alloc.init
            ackTask.setLaunchPath "#{bundle_path}/node-64"
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
                
            else
                ack_error errData, status
            end
        end
        
        searchButton.setTitle "Find" 
    end
    
    def no_matches
        @statsLabel.setStringValue "No results found"        
        tableViewController.records = []
        tableViewController.table_view.reloadData
    end
    
    def ack_error(errData, status)
        errOutput = NSString.alloc.initWithData(errData, encoding:NSUTF8StringEncoding)
        @statsLabel.setStringValue(NSString.stringWithFormat("Error: %@", errOutput))           
    end
    
    def process_output(output)

        records = @cached_symbols || parse_tags()
        search_results = []
        
        matches = records.each do |matched_file|        
            matches = matched_file.records.select do |matched_line|
                puts "comparing #{matched_line.query} to #{@searchQuery.stringValue}"
                matched_line.query.include? @searchQuery.stringValue
            end
            
            if matches.length > 0
                cloned_file_obj = matched_file.dup
                cloned_file_obj.records = matches
                
                search_results << cloned_file_obj
            end
            
        end
        
        tableViewController.records = search_results
        tableViewController.projectRoot = @projectRoot
        tableViewController.table_view.reloadData
        tableView.expandItem(nil, expandChildren:true)
    end
    
    def parse_tags
    
        files = Hash.new {|h,k| h[k] = MatchedFile.new(k, []) }

        bundle_path = NSBundle.mainBundle.resourcePath
        temp_file = "#{bundle_path}/tags"

        File.open temp_file, "r" do |file|
            file.readlines.each do |line|
                next if line =~ /^[!%]/

                line =~ %r{([^\t]*)\t+([^\t]*)\t+/\^(.*)\$/;.*lineno:(\d+)}
                #"
                
                symbol_name = $1
                file = $2
                matched_line = $3
                line_number = $4
                
                puts symbol_name
#                next if not @searchQuery.stringValue =~ symbol_name
                
                files[file].records << MatchedLine.new(file, line_number, matched_line, nil, symbol_name)
            end
        end
        
        File.delete temp_file
        @cached_symbols = files.values if not @cached_symbols

        files.values
    end
end
