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
         \ 'errorformat':
                \ '[ERROR] %f:[%l,%v] %m'
         \ }
endfunction