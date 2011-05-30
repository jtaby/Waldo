#
#  AppDelegate.rb
#  VimAck
#
#  Copyright 2011 Majd Taby. All rights reserved.
#

require 'FileUtils'

class AppDelegate
  def applicationDidFinishLaunching(a_notification)
    
    # Install the Vim plugin if it's not installed already
    # Might want to check it for changes so we can update it if needed
    # Something like: FileUtils.compare_file(vim_plugin, plugin_match.first)
    vim_root = '~/.vim/'.stringByExpandingTildeInPath
    plugin_match = Dir.glob(File.join(vim_root, '**/VimAck.vim'))

    if plugin_match.empty?

      install_path = File.join(vim_root, 'plugin/VimAck.vim')
      if File.exists?(File.join(vim_root, 'bundle')) # see if they use pathogen
        install_path = install_path.gsub('plugin', 'bundle/VimAck/plugin')
      end

      vim_plugin = File.join(NSBundle.mainBundle.resourcePath.fileSystemRepresentation, 'VimAck.vim')

      FileUtils.mkdir_p(install_path.chomp('VimAck.vim'))
      FileUtils.install(vim_plugin, install_path)

      title    = "VimAck.vim is now installed!"
      message  = "Restart MacVim and use VimAck with <leader>f\n\nView the file at:\n#{install_path}"
      alert = NSAlert.alertWithMessageText(title,
                                           defaultButton: 'OK',
                                           alternateButton: nil,
                                           otherButton: nil,
                                           informativeTextWithFormat: message)

      alert.runModal
    end
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

