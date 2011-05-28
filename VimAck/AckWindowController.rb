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
        arguments = [self.searchQuery.stringValue];
        
        Dir.chdir @directoryPath
        cmd = "/usr/local/bin/ack -Q #{arguments.join " "} #{Dir.pwd}"
        puts `#{cmd}`
    end
end
