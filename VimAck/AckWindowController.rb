#
#  AckController.rb
#  VimAck
#
#  Created by Majd Taby on 5/13/11.
#  Copyright 2011 University of Michigan - Dearborn. All rights reserved.
#

class AckWindowController < NSWindowController
    
    attr_writer :directoryPath
    attr_accessor :searchQuery, :tableView, :searchButton
    
    def runQuery(sender)
        
        # arguments = ["--output=\"\\n$\\`\\n$&\\n$'\"", self.searchQuery.stringValue];
        arguments = ["-Q", self.searchQuery.stringValue];
        bundle_path = NSBundle.mainBundle.resourcePath
        
        cmd = "#{bundle_path}/ack #{arguments.join " "}"
        
        puts "------ Dir.chdir: #{@directoryPath}"
        Dir.chdir @directoryPath
        
        puts "------ Running: #{cmd}"
        puts `#{cmd}`
        puts "== Status: #{$?}"
    end
end
