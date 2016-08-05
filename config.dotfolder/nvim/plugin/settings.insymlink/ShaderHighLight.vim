" vim-scripts/ShaderHighLight

if g:vim_plug.is_ready('ShaderHighLight')
    " 加上l 在超出textwidth时不自动换行
    autocmd FileType cg,hlsl,glsl,shaderlab setlocal formatoptions+=l
endif
