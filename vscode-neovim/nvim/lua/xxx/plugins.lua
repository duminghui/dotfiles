local plugins = {
    { 'wbthomason/packer.nvim' },

    -- Log --
    { "Tastyep/structlog.nvim" },

    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            require("xxx.plugin-config.hop").setup()
        end
    },

    {
        "kylechui/nvim-surround",
        config = function()
            require("xxx.plugin-config.surround").setup()
        end,
    },

    -- { "nvim-lua/popup.nvim", opt = true },
    -- { "nvim-lua/plenary.nvim", module = "plenary" },

    -- { 'kyazdani42/nvim-web-devicons', },
}
return plugins
