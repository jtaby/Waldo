#
#  AppDelegate.rb
#  Waldo
#
#  Copyright 2011 Majd Taby. All rights reserved.
#

require 'FileUtils'

class AppDelegate
    
    attr_accessor :windowController, :statusMenu
    
    def initialize
        @windowController = nil
        
        super
    end
    
    def applicationDidFinishLaunching(a_notification)
        
        # Install the Vim plugin if it's not installed already
        # Might want to check it for changes so we can update it if needed
        # Something like: FileUtils.compare_file(vim_plugin, plugin_match.first)
        vim_root = '~/.vim/'.stringByExpandingTildeInPath
        plugin_match = Dir.glob(File.join(vim_root, '**/Waldo.vim'))
        
        if plugin_match.empty?
            installVimPlugin vim_root
        end

		showStatusBarMenu
        
        # Create the File Open Dialog class.
        openDialog = NSOpenPanel.openPanel
                
        openDialog.setCanChooseFiles false
        openDialog.setCanChooseDirectories true
        openDialog.setAllowsMultipleSelection false
        openDialog.setTitle "Choose a Project Folder to Search in"
        
        # Display the dialog.  If the OK button was pressed,
        # process the files.
        if openDialog.runModal == NSOKButton
            file = openDialog.filenames[0]
            openWaldoWithProjectRoot file
        end
    end

    def application(theApplication, openFile:path)
        puts path
        openWaldoWithProjectRoot path
        return true
    end

private

    def showStatusBarMenu
        statusItem = NSStatusBar.systemStatusBar.statusItemWithLength NSVariableStatusItemLength
        statusItem.menu = statusMenu
        statusItem.title = "Waldo"
        statusItem.highlightMode = true
    end
    
    def installVimPlugin(vim_root)
        
        install_path = File.join(vim_root, 'plugin/Waldo.vim')
        if File.exists?(File.join(vim_root, 'bundle')) # see if they use pathogen
            install_path = install_path.gsub('plugin', 'bundle/Waldo/plugin')
        end
        
        vim_plugin = File.join(NSBundle.mainBundle.resourcePath.fileSystemRepresentation, 'Waldo.vim')
        
        FileUtils.mkdir_p(install_path.chomp('Waldo.vim'))
        FileUtils.install(vim_plugin, install_path)
        
        title    = "Waldo.vim is now installed!"
        message  = "Restart MacVim and use Waldo with <leader>f\n\nView the file at:\n#{install_path}"
        alert = NSAlert.alertWithMessageText(title,
                                             defaultButton: 'OK',
                                             alternateButton: nil,
                                             otherButton: nil,
                                             informativeTextWithFormat: message)
        
        alert.runModal
    end
    
    def openWaldoWithProjectRoot(path) 
        if @windowController
            @windowController.projectRoot = path
            @windowController.window.setTitle "Searching in #{path}"
            @windowController.searchQuery.setStringValue ""
            @windowController.window.makeKeyAndOrderFront(nil) unless @windowController.window.isVisible
        else
            ackWindowController = AckWindowController.alloc.initWithWindowNibName "AckWindow"
            ackWindowController.projectRoot = path
            ackWindowController.window.setTitle "Searching in #{path}"
            ackWindowController.showWindow nil
            ackWindowController.window.defaultButtonCell = ackWindowController.searchButton
            @windowController = ackWindowController
        end
    end
end

