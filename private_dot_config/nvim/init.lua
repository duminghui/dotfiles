-- bootstrap lazy.nvim, LazyVim and your plugins
require("xxx.core.g")
require("config.lazy")

--- 加载顺序
---------- 无文件打开时的顺序 -------------
--- config/lazy.lua
--- lazyvim/config/options.lua
--- config/options.lua
--- config/lazy.lua中lazy配置项spec定义的插件顺序, 如果有子文件则按ascii顺序加载
--- colors/COLORSCHEME.lua
-------- Autocmd: LazyVim-VeryLazy start ---------
--- lazyvim/config/autocmds.lua
--- config/autocmds.lua
--- lazyvim/config/keymaps.lua
--- config/keymaps.lua
-------- Autocmd: LazyVim-VeryLazy end ---------

---------- 有文件打开时的顺序 -------------
--- config/lazy.lua
--- lazyvim/config/options.lua
--- config/options.lua
--- config/lazy.lua中lazy配置项spec定义的插件顺序, 如果有子文件则按ascii顺序加载
--- lazyvim/config/autocmds.lua
--- config/autocmds.lua
--- colors/COLORSCHEME.lua
-------- Autocmd: LazyVim-VeryLazy start ---------
--- lazyvim/config/keymaps.lua
--- config/keymaps.lua
-------- Autocmd: LazyVim-VeryLazy end ---------
