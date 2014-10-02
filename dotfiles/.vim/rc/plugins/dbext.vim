NeoBundleLazy 'vim-scripts/dbext.vim', {'autoload':{'filetypes':['sql']}}
let g:dbext_default_profile_PG = 'type=PGSQL:user=postgres:host=$POSTGRES_PORT_5432_TCP_ADDR:port=$POSTGRES_PORT_5432_TCP_PORT'
let g:dbext_default_profile = 'PG'
