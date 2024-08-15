local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local appearance = require "appearance"

wezterm.on("update-status", function(window)
  local utf8  = require("utf8")
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  local color_scheme = window:effective_config().resolved_palette
  local bg = color_scheme.background
  local fg = color_scheme.foreground

  window:set_right_status(wezterm.format({
    { Background = { Color = "none"} },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = " " .. wezterm.hostname() .. " " },
  }))
end)

if appearance.is_dark() then
  config.color_scheme = "Tokyo Night"
else
  config.color_scheme = "Tokyo Night Day"
end

config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
config.window_decorations = "RESIZE"

config.window_frame = {
  font = wezterm.font({ family = "Source Sans Pro", weight = "Bold"}),
  font_size = 12,
}

return config
