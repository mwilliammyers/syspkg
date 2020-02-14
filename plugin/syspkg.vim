let s:file_path=expand('<sfile>:p:h')

function! syspkg#install(...) abort
  return system(s:file_path . "/./piu install " . join(a:000, " "))
endfunction

function! syspkg#remove(...) abort
  return system(s:file_path . "/./piu remove " . join(a:000, " "))
endfunction

function! syspkg#purge(...) abort
  return system(s:file_path . "/./piu purge " . join(a:000, " "))
endfunction

function! syspkg#search(...) abort
  return system(s:file_path . "/./piu search " . join(a:000, " "))
endfunction

function! syspkg#manual(...) abort
  return system(s:file_path . "/./piu manual " . join(a:000, " "))
endfunction

function! syspkg#upgrade(...) abort
  return system(s:file_path . "/./piu update " . join(a:000, " "))
endfunction

function! syspkg#update(...) abort
  return system(s:file_path . "/./piu cache " . join(a:000, " "))
endfunction

function! syspkg#list() abort
  return split(system(s:file_path . "/./piu list"), "\n")
endfunction


command! -bar -nargs=+ SyspkgInstall :echom(syspkg#install(<args>))
command! -bar -nargs=+ SyspkgRemove :echom(syspkg#remove(<args>))
command! -bar -nargs=+ SyspkgPurge :echom(syspkg#purge(<args>))
command! -bar -nargs=+ SyspkgSearch :echom(syspkg#search(<args>))
command! -bar -nargs=+ SyspkgManual :echom(syspkg#manual(<args>))
command! -bar -nargs=+ SyspkgUpgrade :echom(syspkg#upgrade(<args>))
command! -bar -nargs=+ SyspkgUpdate :echom(syspkg#update(<args>))
command! SyspkgList :echom(join(syspkg#list(), " "))


" TODO: make this smarter?
function! s:maybe_sudo_system(cmd, args)
  if executable(a:cmd)
    if executable("apt-get")
      call system("sudo " . a:cmd . " " . a:args)
    else
      call system(a:cmd . " " . a:args)
    endif
  endif
endfunction


function! syspkg#npm_install(...) abort
  return s:maybe_sudo_system("npm",  "install -g " . join(a:000, " "))
endfunction

function! syspkg#pip2_install(...) abort
  return s:maybe_sudo_system("pip2",  "install " . join(a:000, " "))
endfunction

function! syspkg#pip3_install(...) abort
  return s:maybe_sudo_system("pip3",  "install " . join(a:000, " "))
endfunction

function! syspkg#cargo_install(...) abort
  return system("cargo install " . join(a:000, " "))
endfunction

