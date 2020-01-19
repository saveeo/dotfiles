"
" Plugin section
"
packadd minpac
call minpac#init()

" minpac must have {'type':'opt'} so that it can be loaded with 'packadd'
call minpac#add('k-takata/minpac',{'type': 'opt'})

" add another plugins
call minpac#add('tpope/vim-unimpaired')

" call minpac#add('tpope/vim-scriptease',{'type': 'opt'})
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')

" adding vim airline plugin for statusbar
" call minpac#add('vim-airline/vim-airline')
" call minpac#add('vim-airline/vim-airline-themes')

" 
" vim statusline plugin
" minimalistic / configurability / orthogonality
"
call minpac#add("itchyny/lightline.vim")

" adding gruvbox theme as plugin
call minpac#add('morhetz/gruvbox')

" add commands! for minpac update and clean (unintall plugin)
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
" 
" Plugin section end 
"

" 
" filetype plugin section 
" 
filetype plugin indent on

" 
" FZF plugin configuration
"
" Customize Fzf.vim plugin
let g:fzf_command_prefix = 'Fzf'

let g:lightline = {}
let g:lightline.colorscheme = 'one'

