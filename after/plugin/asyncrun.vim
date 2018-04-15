if 2 == exists(':AsyncRun')
  " Allow plugins to be compatible with the Async plugin
  command -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
endif
