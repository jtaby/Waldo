#
#  AppDelegate.rb
#  VimAck
#
#  Copyright 2011 Majd Taby. All rights reserved.
#

class AppDelegate
    def applicationDidFinishLaunching(a_notification)
        # Fill in
    end
    
    def application(theApplication, openFile:path)
        
        ackWindowController = AckWindowController.alloc.initWithWindowNibName "AckWindow"
        ackWindowController.projectRoot = path
        ackWindowController.window.setTitle "Searching in #{path}" 
        ackWindowController.showWindow nil
        ackWindowController.searchQuery.setStringValue "SC.Object.create"
        ackWindowController.window.defaultButtonCell = ackWindowController.searchButton
        
        return true
    end
    
end

