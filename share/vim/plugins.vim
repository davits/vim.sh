
let s:utils_path = fnamemodify($VIM, ":h") . "/utils"
if glob("`find ~/.fonts -name PowerlineSymbols.otf -print`") == ""
    echo "Run the following commands to fix ugly symbols in your new statusline plugin:"
    echo "mkdir ~/.fonts"
    echo "cp " . s:utils_path . "/fontconfig/PowerlineSymbols.otf ~/.fonts/"
    echo "fc-cache -f ~/.fonts"
    echo "cp " . s:utils_path . "/fontconfig/10-powerline-symbols.conf ~/.fontconfig/"
endif

"{ Vundle options
set nocompatible
filetype off

"Set rtp for Vundle
execute "set rtp+=" . $VIM . "/plugins/bundle/Vundle.vim"
call vundle#begin($VIM . "/plugins/bundle")

Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'Raimondi/delimitMate'

call vundle#end()

" Insert $VIM/plugins directory into rtp, after $HOME/.vim entry,
" which is the first one by default
let s:rtp_list = split(&rtp, ',')
call insert(s:rtp_list, $VIM . '/plugins', 1)
execute 'set rtp=' . join(s:rtp_list, ',')

filetype plugin indent on
"} Vundle options

"delimitMate options
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
" Turn off <S-Tab> mapping since it mess up with YCM
let g:delimitMate_tab2exit = 0

"UltiSnips
let g:UltiSnipsDontReverseSearchPath = 1
let g:UltiSnipsExpandTrigger = "<c-j>"

"{ YCM options
"let g:ycm_path_to_python_interpreter = '/bin/python'
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = $VIM . '/ycm_extra_conf.py'
let g:ycm_goto_buffer_command = 'new-tab'
nnoremap gD :YcmCompleter GoTo<CR>
nnoremap gd :YcmCompleter GoToImprecise<CR>
"} YCM options

"Syntastic options
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
"Config file for verilator
let g:syntastic_verilog_config_file = '.config'

"Fuzzy Finder
nnoremap <C-f> :FufFile<CR>

"Airline options
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
" Do not show airline bar on preview and list windows
let g:airline_exclude_filetypes = ['fuf', 'qf']
"let g:airline#extensions#bufferline#overwrite_variables = 0
"let g:airline#extensions#tabline#enabled = 1

"Toggle mappings
map <F6> :NERDTreeToggle<CR>

augroup myPlugins
    autocmd!
    "Automatically close NERDTree when file is closed
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END
