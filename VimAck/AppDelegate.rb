#
#  AppDelegate.rb
#  VimAck
#
#  Created by Majd Taby on 5/13/11.
#  Copyright 2011 University of Michigan - Dearborn. All rights reserved.
#

class AppDelegate
    def applicationDidFinishLaunching(a_notification)
        # Fill in
    end
    
    def application(theApplication, openFile:path)
        
        ackWindowController = AckWindowController.alloc.initWithWindowNibName "AckWindow"
        ackWindowController.setDirectoryPath path
        ackWindowController.window.setTitle "Searching in #{path}" 
        ackWindowController.showWindow nil
        ackWindowController.searchQuery.setStringValue "Object"
        
        return true
    end
    
end

