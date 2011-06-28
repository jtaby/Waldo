" ===========================================================================
" Author:   Majd Taby <mtaby@me.com>
" License:  MIT License
" ===========================================================================

" NOTE: This plugin is based heavily on Geoffrey Grosenbach's peepopen.vim 
" plugin.

" Exit quickly when:
" - this plugin was already loaded (or disabled)
" - when 'compatible' is set
if &cp || exists("g:waldo_loaded") && g:waldo_loaded
  finish
endif
let g:waldo_loaded = 1

let s:save_cpo = &cpo
set cpo&vim

" ============================================================================
" Waldo support

function s:LaunchWaldoViaVim()
  let cwd = getcwd()
  silent exe  "!open -a Waldo " . shellescape(cwd)
endfunction

command! Waldo :call <SID>LaunchWaldoViaVim()

noremap <unique> <script> <Plug>Waldo <SID>Launch
noremap <SID>Launch :call <SID>LaunchWaldoViaVim()<CR>

if !hasmapto('<Plug>Waldo')
  map <unique> <silent> <Leader>f <Plug>Waldo
endif
