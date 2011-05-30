#
#  AppDelegate.rb
#  VimAck
#
#  Copyright 2011 Majd Taby. All rights reserved.
#

class AppDelegate
    
    attr_accessor :windowController
    
    def initialize
        @windowController = nil
        
        super
    end
    
    def applicationDidFinishLaunching(a_notification)
        # Fill in
    end
    
    def application(theApplication, openFile:path)
        
        if @windowController
            @windowController.projectRoot = path
            @windowController.window.setTitle "Searching in #{path}" 
            @windowController.searchQuery.setStringValue ""
        else
            ackWindowController = AckWindowController.alloc.initWithWindowNibName "AckWindow"
            ackWindowController.projectRoot = path
            ackWindowController.window.setTitle "Searching in #{path}" 
            ackWindowController.showWindow nil
            ackWindowController.searchQuery.setStringValue "SC.Object.create"
            @windowController = ackWindowController
        end
        
        return true
    end
    
end

