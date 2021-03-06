" Plugins are managed by Vundle. Once VIM is open run :BundleInstall to
" install plugins.

" Plugins requiring no additional configuration or keymaps
  Bundle "git://github.com/oscarh/vimerl.git"
  Bundle "git://github.com/tpope/vim-git.git"
  Bundle "git://github.com/harleypig/vcscommand.vim.git"
  Bundle "git://github.com/altercation/vim-colors-solarized.git"
  Bundle "git://github.com/tpope/vim-cucumber.git"
  Bundle "git://github.com/tpope/vim-endwise.git"
  Bundle "git://github.com/tpope/vim-fugitive.git"
  Bundle "git://github.com/tpope/vim-haml.git"
  Bundle "git://github.com/pangloss/vim-javascript.git"
  Bundle "git://github.com/vim-scripts/L9.git"
  Bundle "git://github.com/tpope/vim-rake.git"
  Bundle "git://github.com/vim-ruby/vim-ruby.git"
  Bundle "git://github.com/ervandew/supertab.git"
  Bundle "git://github.com/tomtom/tcomment_vim.git"
  Bundle "git://github.com/michaeljsmith/vim-indent-object.git"
  Bundle "git://github.com/tsaleh/vim-matchit.git"
  Bundle "git://github.com/kana/vim-textobj-user.git"
  Bundle "git://github.com/nelstrom/vim-textobj-rubyblock.git"
  Bundle "git://github.com/tpope/vim-repeat.git"
  Bundle "git://github.com/vim-scripts/ruby-matchit.git"
  Bundle "git://github.com/wgibbs/vim-irblack.git"
  " Bundle git://github.com/skammer/vim-css-color.git
  " Use Aaron Baker's Fork to add SASS/SCSS color highlighting
  " Bundle "git@github.com:bakis2011/vim-css-color.git"
  Bundle 'flazz/vim-colorschemes'

" CtrlP - with FuzzyFinder compatible keymaps
  Bundle "git://github.com/kien/ctrlp.vim.git"
    " respect the .gitignore
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Mustache
  Bundle "git://github.com/juvenn/mustache.vim.git"
    " Copied from the plugin; not sure why it isn't working normally
    au BufNewFile,BufRead *.mustache,*.handlebars,*.hbs set filetype=mustache

" Less
  Bundle "git://github.com/groenewege/vim-less.git"
    au BufNewFile,BufRead *.less set filetype=less

" Handlebars
  Bundle "git://github.com/nono/vim-handlebars.git"
    au BufNewFile,BufRead *.hbs set filetype=handlebars

" Stylus
  Bundle "git://github.com/wavded/vim-stylus.git"
    au BufNewFile,BufRead *.styl set filetype=stylus

" Coffee script
  Bundle "git://github.com/kchmck/vim-coffee-script.git"
    au BufNewFile,BufRead *.coffee set filetype=coffee


" AG aka The Silver Searcher
  Bundle 'git://github.com/rking/ag.vim.git'
    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gq :ccl<CR>
    nmap gl :cwindow<CR>


" Tagbar for navigation by tags using CTags
  Bundle "git://github.com/majutsushi/tagbar.git"
    let g:tagbar_autofocus = 1
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <Leader>. :TagbarToggle<CR>


" Markdown syntax highlighting
  Bundle "git://github.com/tpope/vim-markdown.git"
    augroup mkd
      autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    augroup END


" Markdown preview to quickly preview markdown files
  Bundle "git://github.com/maba/vim-markdown-preview.git"
  map <buffer> <Leader>mp :Mm<CR>


" NERDTree for project drawer
  Bundle "git://github.com/scrooloose/nerdtree.git"
    let NERDTreeHijackNetrw = 0
    nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>

" Tabular for aligning text
  Bundle "git://github.com/godlygeek/tabular.git"
    function! CustomTabularPatterns()
      if exists('g:tabular_loaded')
        AddTabularPattern! symbols         / :/l0
        AddTabularPattern! hash            /^[^>]*\zs=>/
        AddTabularPattern! chunks          / \S\+/l0
        AddTabularPattern! assignment      / = /l0
        AddTabularPattern! comma           /^[^,]*,/l1
        AddTabularPattern! colon           /:\zs /l0
        AddTabularPattern! options_hashes  /:\w\+ =>/
      endif
    endfunction

    autocmd VimEnter * call CustomTabularPatterns()

    " shortcut to align text with Tabular
    map <Leader>a :Tabularize<space>

" ZoomWin to fullscreen a particular buffer without losing others
  Bundle "git://github.com/vim-scripts/ZoomWin.git"
    map <Leader>z :ZoomWin<CR>


" Unimpaired for keymaps for quicky manipulating lines and files
  Bundle "git://github.com/tpope/vim-unimpaired.git"
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv


" Syntastic for catching syntax errors on save
  Bundle "git://github.com/scrooloose/syntastic.git"
    let g:syntastic_enable_signs=1
    let g:syntastic_quiet_messages = {'level': 'warnings'}
    " syntastic is too slow for haml and sass
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['haml','scss','sass'] }
    let g:syntastic_javascript_checkers = ['eslint']



" gundo for awesome undo tree visualization
  Bundle "git://github.com/sjl/gundo.vim.git"
    map <Leader>h :GundoToggle<CR>


" rails.vim, nuff' said
  Bundle "git://github.com/tpope/vim-rails.git"
    map <Leader>oc :Rcontroller<Space>
    map <Leader>ov :Rview<Space>
    map <Leader>om :Rmodel<Space>
    map <Leader>oh :Rhelper<Space>
    map <Leader>oj :Rjavascript<Space>
    map <Leader>os :Rstylesheet<Space>
    map <Leader>oi :Rintegration<Space>


" surround for adding surround 'physics'
  Bundle "git://github.com/tpope/vim-surround.git"
    " # to surround with ruby string interpolation
    let g:surround_35 = "#{\r}"
    " - to surround with no-output erb tag
    let g:surround_45 = "<% \r %>"
    " = to surround with output erb tag
    let g:surround_61 = "<%= \r %>"


" Clojure"
  Bundle 'guns/vim-clojure-static'
  " Bundle "https://github.com/vim-scripts/VimClojure.git"
  autocmd BufNewFile,BufRead *.clj set filetype=clojure

  Bundle 'tpope/vim-fireplace'

  Bundle 'paredit.vim'
  autocmd BufNewFile,BufRead *.clj let g:paredit_mode=1
  " let g:paredit_shortmaps = 1
  "let g:paredit_electric_return = 1


" Jade Highlighting"
  Bundle "git://github.com/digitaltoad/vim-jade.git"
  autocmd BufNewFile,BufRead *.jade set filetype=jade

" Refactoring
  Bundle "https://github.com/ecomba/vim-ruby-refactoring"

" Easy RSpec and Mocha running
  " Bundle 'thoughtbot/vim-rspec'
  Bundle 'geekjuice/vim-spec'
  " let g:rspec_command = "!spring rspec --no-profile {spec}"
  " let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
  let g:rspec_command = 'call VimuxRunCommand("spring rspec {spec}\n")'
  let g:mocha_coffee_command = 'call VimuxRunCommand("NODE_ENV=test mocha --compilers coffee:coffee-script/register {spec}\n")'
  nmap <Leader>rf :wa<CR> :call RunCurrentSpecFile()<CR>
  nmap <Leader>rn :wa<CR>:call RunNearestSpec()<CR>
  nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
  nmap <C-\>:wa<CR> :call RunLastSpec()<CR>
  nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>


" Tmux integration
  Bundle 'benmills/vimux'
  nmap <Leader>vi :VimuxInspectRunner<CR>
  function! VimuxZoomRunner()
    call VimuxInspectRunner()
    call system("tmux resize-pane -Z")
  endfunction
  nmap <Leader>vv :call VimuxZoomRunner()<CR>

" Tmux
  Bundle 'christoomey/vim-tmux-navigator'

" In Tmux Set the cursor to a vertical line in insert mode and a solid block in command mode
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    " Upon hitting escape to change modes, send successive move-left and move-right commands to immediately redraw the cursor
    inoremap <special> <Esc> <Esc>hl
    " don't blink the cursor
    set guicursor+=i:blinkwait0
  endif

  let g:slime_target = "tmux"
  Bundle 'git://github.com/jpalardy/vim-slime.git'

" Drag visual selections easily
  Bundle 'gavinbeatty/dragvisuals.vim'
  vmap  <expr>  H  DVB_Drag('left')
  vmap  <expr>  L  DVB_Drag('right')
  vmap  <expr>  J  DVB_Drag('down')
  vmap  <expr>  K  DVB_Drag('up')
  vmap  <expr>  D  DVB_Duplicate()
  " Remove any introduced trailing whitespace after moving...
  let g:DVB_TrimWS = 1

" Yank rink for better yank/delete recall
" Bundle 'YankRing.vim'

" Abolish for easy case conversions
Bundle 'abolish.vim'

" Python mode
Bundle "git://github.com/klen/python-mode.git"

"PyTest
Bundle "git://github.com:alfredodeza/pytest.vim.git"
" Pytest
nmap <silent><Leader>F <Esc>:Pytest file<CR>
nmap <silent><Leader>f <Esc>:Pytest file<CR>:Pytest first<CR>
nmap <silent><Leader>M <Esc>:Pytest method<CR>
nmap <silent><Leader>m <Esc>:Pytest method<CR>:Pytest first<CR>
