NeoBundleLazy 'mattn/emmet-vim', {'autoload':{'filetypes':['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache', 'jsx', 'cjsx']}}
function! s:zen_html_tab()
	let line = getline('.')
	if match(line, '<.*>') < 0
		return "\<c-y>,"
	endif
	return "\<c-y>n"
endfunction
autocmd FileType xml,xsl,xslt,xsd,css,sass,scss,less,mustache imap <buffer><tab> <c-y>,
autocmd FileType html,cjsx imap <buffer><expr><tab> <sid>zen_html_tab()
