au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

au FileType go set autowrite

 " can I has all the syntax highlights plz
 let g:go_highlight_types = 1
 let g:go_highlight_fields = 1
 let g:go_highlight_functions = 1
 let g:go_highlight_function_calls = 1
 let g:go_highlight_operators = 1
 let g:go_highlight_extra_types = 1
 let g:go_highlight_build_constraints = 1
 let g:go_highlight_generate_tags = 1

 let g:go_fmt_command = "goimports"
 " let g:go_def_mode='gopls'

 let g:go_term_enabled = 1

 let g:go_auto_type_info = 1
 let g:go_auto_sameids = 1

 " update info a bit quicker (vim gets pretty sluggish for values lower than
 " this)
 let g:go_updatetime = 2000


 " open everything in quickfix window
 let g:go_list_type = "quickfix"

 " run :GoBuild or :GoTestCompile based on the go file
 function! s:build_go_files()
   let l:file = expand('%')
   if l:file =~# '^\f\+_test\.go$'
     call go#test#Test(0, 1)
   elseif l:file =~# '^\f\+\.go$'
     call go#cmd#Build(0)
   endif
 endfunction

let g:go_gopls_use_placeholders = 1


