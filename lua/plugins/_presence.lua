require("presence"):setup({
    auto_update       = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua Presence:update()`)
    editing_text      = "Coding Around",               -- Editing format string (either string or function(filename: string|nil, buffer: string): string)
    workspace_text    = "Working in @!#$&, you peeker!",
    neovim_image_text = "My lovely text editor",
    main_image        = "neovim",                   -- Main image display (either "neovim" or "file")
    log_level         = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout  = 15,                         -- Number of seconds to debounce TextChanged events (or calls to `:lua Presence:update(<buf>, true)`)
})
