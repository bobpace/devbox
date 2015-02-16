NeoBundle 'mattn/emmet-vim'
let g:user_emmet_leader_key = '<c-e>'

function! s:zen_html_tab()
	let line = getline('.')
	if match(line, '<.*>') < 0
		return "\<c-y>,"
	endif
	return "\<c-y>n"
endfunction

autocmd FileType html,cjsx,jsx imap <buffer><expr><tab> <sid>zen_html_tab()
