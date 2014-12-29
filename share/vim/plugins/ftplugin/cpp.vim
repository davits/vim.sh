function! s:SpaceIfNeccessary()
    let l:prevchr = getline(".")[col(".") - 2]
    if l:prevchr == " " || l:prevchr == ""
        return ""
    else
        return " "
    endif
endfunction

let s:spaced_sts = ["if", "for", "while", "switch"]

function! s:SpaceAfterStatement()
    let l:words = split(getline(".")[ : col(".") - 2])
    if empty(l:words) || index(s:spaced_sts, l:words[-1]) == -1
        return ""
    endif
    return s:SpaceIfNeccessary()
endfunction

" Unmap delimitMate mappings
"iunmap <buffer> (
"iunmap <buffer> {

" Map enhanced delimitMate mappings
"if $USER == 'davits'
"    inoremap <buffer> <expr> ( "\<C-]>".<SID>SpaceAfterStatement().delimitMate#ParenDelim(")")
"    inoremap <buffer> <expr> { "\<C-]>".<SID>SpaceIfNeccessary().delimitMate#ParenDelim("}")
"    inoremap <buffer> <expr> ) delimitMate#JumpOut("\)")
"    inoremap <buffer> <expr> } delimitMate#JumpOut("\}")
"endif
