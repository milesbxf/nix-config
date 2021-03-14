
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({ 'omni_patterns': { 'go': '[^. *\t]\.\w*' }, 'camel_case': v:true })
call deoplete#enable_logging("DEBUG", $HOME."/.deoplete.log")

