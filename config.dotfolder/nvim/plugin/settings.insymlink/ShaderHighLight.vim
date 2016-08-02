" vim-scripts/ShaderHighLight

if g:vim_plug.is_ready('ShaderHighLight')
    autocmd FileType cg,hlsl,glsl,shaderlab setlocal formatoptions+=l
endif
