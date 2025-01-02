return {
    "saghen/blink.cmp",
    opts = {
        completion = {
            menu = {
                border = "single",
                winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpKindFunction,CursorLine:BlinkCmpMenuSelection,Search:None",
                draw = {
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                },
            },
            documentation = {
                auto_show = false,
                window = {
                    border = "single",
                },
            },
            ghost_text = {
                enabled = false,
            },
        },
    },
}
