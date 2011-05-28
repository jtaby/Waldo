" ===========================================================================
" Author:   Majd Taby <mtaby@me.com>
" License:  MIT License
" ===========================================================================

" NOTE: This plugin is based heavily on Geoffrey Grosenbach's peepopen.vim 
" plugin.

" Exit quickly when:
" - this plugin was already loaded (or disabled)
" - when 'compatible' is set
if &cp || exists("g:vimack_loaded") && g:vimack_loaded
  finish
endif
let g:vimack_loaded = 1

let s:save_cpo = &cpo
set cpo&vim

" ============================================================================
" VimAck support

function s:LaunchVimAckViaVim()
  let cwd = getcwd()
  silent exe "!open -a VimAck " . shellescape(cwd)
endfunction

command! VimAck :call <SID>LaunchVimAckViaVim()

noremap <unique> <script> <Plug>VimAck <SID>Launch
noremap <SID>Launch :call <SID>LaunchVimAckViaVim()<CR>

if !hasmapto('<Plug>VimAck')
  map <unique> <silent> <Leader>f <Plug>VimAck
endif
