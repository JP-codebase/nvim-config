return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"
    end,

    config = function()
        -- Enable filetype detection, plugin, and indent (usually auto-enabled by plugin managers)
        vim.cmd("filetype plugin indent on")

        -- Enable syntax highlighting
        vim.cmd("syntax enable")

        -- VimTeX configuration
        vim.g.vimtex_view_method = 'zathura'

        -- Alternatively use a generic PDF viewer (overrides method if uncommented)
        -- vim.g.vimtex_view_general_viewer = 'okular'
        -- vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'

        -- Use 'latexrun' as the compiler backend
        vim.g.vimtex_compiler_method = 'latexmk'

        -- Set the local leader key (used by VimTeX mappings)
        -- vim.g.maplocalleader = ","
    end,

}
