return {
    "saghen/blink.cmp",
    opts = {
        keymap = { preset = "default" },
        completion = {
            menu = {
                border = "rounded",
                winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpKindFunction,CursorLine:BlinkCmpMenuSelection,Search:None",
                draw = {
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                },
            },
        },
        documentation = {
            auto_show = false,
            window = {
                border = "rounded",
            },
        },
        ghost_text = {
            enabled = false,
        },
    },
}
