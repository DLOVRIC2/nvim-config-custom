require('rose-pine').setup({
    variant = 'main',  -- main, moon, or dawn
    dark_variant = 'main',
    disable_background = true,

    highlight_groups = {
        -- Make sure syntax is visible
        ColorColumn = { bg = 'rose' },

        -- Ensure these are bright enough
        String = { fg = 'foam', italic = true },
        Function = { fg = 'love' },
        Keyword = { fg = 'pine' },
        Comment = { fg = 'muted' },
    },
})

function ColorMyPencils(color)
	color = color or "rose-pine-moon"  -- Using moon variant which is brighter
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
