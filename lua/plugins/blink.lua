return {
    "saghen/blink.cmp",
    lazy = false,
    opts = {
        keymap = { preset = "default" },
        sources = {
            completion = {
                enabled_providers = { "lsp", "path", "snippets", "buffer" },
            },
        },
        windows = {
            autocomplete = {
                border = "rounded",
                winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpKindFunction,CursorLine:BlinkCmpMenuSelection,Search:None",
                draw = {
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                },
            },
            documentation = {
                border = "rounded",
                auto_show = false,
            },
            ghost_text = {
                enabled = false,
            },
        },
    },
}
