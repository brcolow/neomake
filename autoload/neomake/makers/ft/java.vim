function! neomake#makers#ft#java#EnabledMakers()
        let l:makers = ['javac']
        if neomake#utils#Exists('mvn')
            call add (l:makers, 'mvn')
        endif
        return l:makers
endfunction

function! neomake#makers#ft#java#javac()
    return {
         \ 'errorformat':
                \ '%f:%l: error: %m'
         \ }
endfunction

function! neomake#makers#ft#java#mvn()
    let l:args = ['package -P fastest']
    return {
         \ 'args': l:args,
         \ 'errorformat': '[%tRROR]\ %#Malformed\ POM\ %f:\ %m@%l:%c%.%#,' .
            \ '[%tRROR]\ %#Non-parseable\ POM\ %f:\ %m\ %#\\@\ line\ %l\\,\ column\ %c%.%#,' .
            \ '[%[A-Z]%#]\ %f:[%l\\,%c]\ %t%[a-z]%#:\ %m,' .
            \ '[%t%[A-Z]%#]\ %f:[%l\\,%c]\ %[%^:]%#:\ %m,' .
            \ '%A[%[A-Z]%#]\ Exit\ code:\ %[0-9]%#\ -\ %f:%l:\ %m,' .
            \ '%A[%[A-Z]%#]\ %f:%l:\ %m,' .
            \ '%-Z[%[A-Z]%#]\ %p^,' .
            \ '%C[%[A-Z]%#]\ %#%m'
        \ }
endfunction