if exists("loaded_mmixal_fmt_plugin")
    finish
endif

let loaded_mmixal_fmt_plugin = 1

if !executable("mmixal-fmt")
    finish
endif

function! s:MMIXALFMT()
    let pos = getpos(".")
    silent execute "%! mmixal-fmt"
    call setpos(".", pos)
endfunction

command! -buffer MMIXALFMT call s:MMIXALFMT()

autocmd BufWritePre,FileWritePre *.mms call s:MMIXALFMT()

