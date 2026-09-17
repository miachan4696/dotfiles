local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- システム動作設定
config.automatically_reload_config = true
config.default_prog = { 'powershell.exe' }
config.use_ime = true

-- 見た目（Appearance）の設定を読み込んで適用
local appearance = require("appearance")
appearance.apply_config(config)

-- キーバインド設定（Zennからコピーした keybinds.lua がある前提）
-- もしファイルがない状態で起動エラーが出る場合は、下の2行を -- でコメントアウトしてください
config.disable_default_key_bindings = true
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables

return config