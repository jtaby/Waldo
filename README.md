
# VimAck

VimAck is a port of TextMate's Find-in-Project feature, designed to work with [MacVim.app](https://github.com/b4winckler/macvim)

![VimAck Screenshot](https://github.com/jtaby/VimAck/raw/master/resources/vimack_shot.png)

### [Screencast Demo](https://github.com/jtaby/VimAck/raw/master/resources/vimack_demo.mov)

## Usage

- Download VimAck.zip and put the .app in your Applications folder
- Put the bundled VimAck.vim plugin in your plugins/ directory for vim

  _If you're using [Janus](https://github.com/carlhuda/janus), put VimAck.vim in ~/.vim/plugins_

- Open MacVim.app and trigger VimAck using the `<leader>f` mapping
	
*NOTE:* Make sure you `cd` into your project folder. If you don't, 

## Release Notes

The current version (0.1) of VimAck only supports case-insensitive, non-regex searches. It also expects you to launch it with a project directory from the command line.

## Roadmap

### Version 0.2
- Ability to specify project root in VimAck.app
- Add safe-guards against generic project roots (~, /, etc.)
- Prevent multiple instances of VimAck to open when you trigger `<leader>f`

### Version 0.3
- Add support for case-sensitive searches
- Add support for regex searches

### Version 0.4
- Keyboard navigation
- Launch as menu item (not dock app)

### Version 0.5
- Add history to search field
- Add ignore-directories feature

## Contributing

I highly encourage you to fork my project and implement any of the features in the Roadmap. Just submit a pull request and be sure to give yourself credit in the comments of the file!

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