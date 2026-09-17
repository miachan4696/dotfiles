return {
    {
        "michaelb/sniprun",
        branch = "master",
        build = vim.fn.has("win32") == 1 and false or "sh install.sh",
        cmd = { "SnipRun", "SnipInfo", "SnipClose", "SnipReset", "SnipReplMemoryClean", "SnipLive" },
        opts = {
            display = { "VirtualTextOk", "TempFloatingWindow" },
            display_options = { notification_timeout = 5 },
        },
    },
}
