 augroup jsoncFtdetect
    autocmd!

    " " Recognize some extensions known to have JSON with comments
    " " Note: If conflicts are found, please report them.

    " autocmd BufNewFile,BufRead .babelrc set filetype=jsonc

    " " https://github.com/mohae/cjson
    " autocmd BufNewFile,BufRead *.cjsn setfiletype jsonc
    " " https://github.com/mohae/cjson
    " autocmd BufNewFile,BufRead *.cjson setfiletype jsonc
    " " https://github.com/Microsoft/vscode/issues/48969
    " " https://komkom.github.io/
    " " https://github.com/mochajs/mocha/issues/3753
    " autocmd BufNewFile,BufRead *.jsonc setfiletype jsonc

    " " Recognize some files known to support JSON with comments
    " " Entries sorted by pattern

    " " https://eslint.org/docs/user-guide/configuring
    " autocmd BufNewFile,BufRead .eslintrc.json set filetype=jsonc
    " " https://jshint.com/docs/
    " autocmd BufNewFile,BufRead .jshintrc set filetype=jsonc
    " autocmd BufNewFile,BufRead .jslintrc set filetype=jsonc
    " " https://mochajs.org/#configuring-mocha-nodejs
    " autocmd BufNewFile,BufRead .mocharc.json set filetype=jsonc
    " autocmd BufNewFile,BufRead .mocharc.jsonc set filetype=jsonc
    " " https://github.com/neoclide/coc.nvim
    " autocmd BufNewFile,BufRead coc-settings.json set filetype=jsonc
    " " https://github.com/clutchski/coffeelint/pull/407
    " autocmd BufNewFile,BufRead coffeelint.json set filetype=jsonc
    " " https://github.com/microsoft/TypeScript/pull/5450
    " " autocmd BufNewFile,BufRead tsconfig.json set filetype=jsonc
    " autocmd! BufNewFile,BufRead tsconfig*.json set filetype=jsonc

    " autocmd BufNewFile,BufRead jsconfig.json set filetype=jsonc
    " " https://github.com/Alexays/Waybar/wiki/Configuration
    " autocmd BufNewFile,BufRead */waybar/config set filetype=jsonc
    " autocmd BufNewFile,BufRead */.vscode/*.json set filetype=jsonc
   autocmd FileType json set filetype=jsonc
augroup END
