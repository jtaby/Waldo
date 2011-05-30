
# VimAck

VimAck is a port of TextMate's Find-in-Project feature, designed to work with [MacVim.app](https://github.com/b4winckler/macvim)

![VimAck Screenshot](https://github.com/jtaby/VimAck/raw/master/resources/vimack_shot.png)

### [Screencast Demo](https://github.com/jtaby/VimAck/raw/master/resources/vimack_demo.mov)

## Usage

- Download VimAck.zip and put the .app in your Applications folder
- Launch VimAck.app to install the Vim plugin
- Open MacVim.app and trigger VimAck using the `<leader>f` mapping
	
*NOTE:* Make sure you `cd` into your project folder. If you don't, 

## Release Notes

The current version (0.2) of VimAck only supports case-insensitive, non-regex searches. It also expects you to launch it with a project directory from the command line.

## Changelog

### Version 0.2
- Perform ack subprocess on a separate thread
- Support for Sparkle.framework to ship updates automatically
- Prevent multiple instances of VimAck to open when you trigger `<leader>f`

## Roadmap

### Version 0.3
- Ability to specify project root in VimAck.app
- Add safe-guards against generic project roots (~, /, etc.)
- Auto-install vim plugin on first launch (thanks zef)
- Add support for case-sensitive searches (thanks zef)
- Add support for regex searches (thanks zef)
- Launch VimAck as a menu item (thanks ashchan)

### Version 0.4
- Keyboard navigation
- Launch as menu item (not dock app)

### Version 0.4
- Add history to search field
- Add ignore-directories feature

## Contributing

I highly encourage you to fork my project and implement any of the features in the Roadmap. Just submit a pull request and be sure to give yourself credit here!

### Contributors
- [Zef Houssney](http://madebykiwi.com)
- [James Chen](http://blog.ashchan.com)


## License

	Copyright (C) 2011 by Majd Taby

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.