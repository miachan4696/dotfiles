local wezterm = require("wezterm")
local module = {}

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

function module.apply_config(config)

    -- Background style
    config.window_background_opacity = 0.65
    config.win32_system_backdrop = 'Acrylic'
    
    
    -- フォント設定
    config.font = wezterm.font_with_fallback({
        {
            family = "UDEV Gothic 35NFLG",
            weight = "Regular",
            stretch = "Normal",
            italic = false,
        },
    })
    config.font_size = 12.0
    config.unicode_version = 14 -- 特殊記号の幅を正しく計算する

    -- --- ウィンドウ余白（ペイン分割時に「文字が割れる」のを防ぐため狭めに設定） ---
    config.window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
    }

    -- --- タブバー・タイトルバーの基本設定 ---
    config.window_decorations = "RESIZE"
    config.show_tabs_in_tab_bar = true
    config.hide_tab_bar_if_only_one_tab = true
    config.use_fancy_tab_bar = true
    config.show_new_tab_button_in_tab_bar = false

    config.window_frame = {
        inactive_titlebar_bg = "none",
        active_titlebar_bg = "none",
    }

    config.window_background_gradient = {
        colors = { "#000000" },
    }

    -- --- タブの形をカスタマイズ（三角形の装飾） ---
    wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
        local background = "#5c6d74"
        local foreground = "#FFFFFF"
        local edge_background = "none"
        
        if tab.is_active then
            background = "#ae8b2d" -- アクティブなタブの色
            foreground = "#FFFFFF"
        end
        
        local edge_foreground = background
        local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

        
        return {
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = SOLID_LEFT_ARROW },
            { Background = { Color = background } },
            { Foreground = { Color = foreground } },
            { Text = title },
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = SOLID_RIGHT_ARROW },
        }
    end)
end

return module
