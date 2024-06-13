local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

local config = {}

-- Use config builder object if possible.
if wezterm.config_builder then config = wezterm.config_builder() end

-- wezterm.on('update-right-status', function(window, pane)
--   window:set_right_status(window:active_workspace())
-- end)

wezterm.on('mux-startup', function()
  local tab, pane, window = mux.spawn_window {}
  pane:split { direction = 'Top' }
end)

-- Visual bell
wezterm.on('bell', function(window, pane)
  wezterm.log_info('bell: ' .. pane:pane_id() .. '!')
end)
--
-- Settings
--
config.check_for_updates = false
config.show_update_window = false
config.default_domain = "local"
-- config.default_prog = { '/run/current-system/sw/bin/fish', '-l', '-C cd' }
-- config.default_prog = { '/run/current-system/sw/bin/bash', }
-- config.default_prog = { '/usr/local/bin/bash', }
config.default_cwd = "$HOME"
config.hide_mouse_cursor_when_typing = true

config.color_scheme = 'Gruvbox dark, medium (base16)'

config.font = wezterm.font_with_fallback({
  { family = "CaskaydiaCove Nerd Font",  scale = 1.0 },
  -- { family = "FantasqueSansM Nerd Font", scale = 1.0 },
  -- { family = "CaskaydiaCove Nerd Font",  scale = 1.0 },
  -- { family = "FantasqueSansM Nerd Font", scale = 1.0 },
})

config.font_size = 13.0

config.audible_bell = "Disabled"

config.force_reverse_video_cursor = false

config.window_background_opacity = 0.8

config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 9000
config.default_workspace = "home"

-- Tab bar
config.tab_max_width = 20
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.status_update_interval = 1000

wezterm.on("update-status", function(window, pane)
  -- Workspace name
  local stat = window:active_workspace()
  local stat_color = "#f7768e"
  -- It's a little silly to have workspace name all the time
  -- Utilize this to display LDR or current key table name
  if window:active_key_table() then
    stat = window:active_key_table()
    stat_color = "#7dcfff"
  end
  if window:leader_is_active() then
    stat = "LDR"
    stat_color = "#bb9af7"
  end

  -- Current working directory
  local basename = function(s)
    -- Nothing a little regex can't fix
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end
  -- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l). Not a big deal, but check in case
  local cwd = pane:get_current_working_dir()
  cwd = cwd and basename(cwd) or ""
  -- Current command
  -- local cmd = pane:get_foreground_process_name()
  -- cmd = cmd and basename(cmd) or "no cmd"
  -- Domain name
  local domain = pane:get_domain_name()
  -- Time
  local time = wezterm.strftime("%H:%M")

  -- Left status (left of the tab line)
  window:set_left_status(wezterm.format({
    { Foreground = { Color = stat_color } },
    { Text = "  " },
    { Text = wezterm.nerdfonts.cod_workspace_trusted .. "  " .. stat },
    { Text = " |" },
  }))

  -- Right status
  window:set_right_status(wezterm.format({
    -- Wezterm has a built-in nerd fonts
    -- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
    { Text = wezterm.nerdfonts.cod_folder .. "  " .. cwd },
    { Text = " | " },
    { Foreground = { Color = "#e0af68" } },
    { Text = wezterm.nerdfonts.cod_code .. "  " .. domain },
    -- { Text = wezterm.nerdfonts.cod_code .. "  " .. cmd },
    -- "ResetAttributes",
    { Text = " | " },
    { Text = " " .. time },
    { Text = "  " },
  }))
end)

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.6,
  brightness = 0.7,
}

--
-- Keys
--
config.leader = {
  key = 'a',
  mods = 'CTRL',
  timeout_milliseconds = 1500,
}

config.keys = {
  -- Send C-a when pressing C-a twice
  { key = "a",          mods = "LEADER|CTRL", action = act.SendKey { key = "a", mods = "CTRL" } },
  { key = "c",          mods = "LEADER",      action = act.ActivateCopyMode },
  { key = "phys:Space", mods = "LEADER",      action = act.ActivateCommandPalette },

  -- Pane keybindings
  { key = 's',          mods = 'LEADER',      action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'v',          mods = 'LEADER',      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'q',          mods = 'LEADER',      action = act.CloseCurrentTab { confirm = true }, },
  { key = "x",          mods = "LEADER",      action = act.CloseCurrentPane { confirm = true } },
  { key = "h",          mods = "LEADER",      action = act.ActivatePaneDirection("Left") },
  { key = "j",          mods = "LEADER",      action = act.ActivatePaneDirection("Down") },
  { key = "k",          mods = "LEADER",      action = act.ActivatePaneDirection("Up") },
  { key = "l",          mods = "LEADER",      action = act.ActivatePaneDirection("Right") },
  { key = "z",          mods = "LEADER",      action = act.TogglePaneZoomState },
  { key = "o",          mods = "LEADER",      action = act.RotatePanes "Clockwise" },

  -- custom "mode" in the name of "KeyTable"
  {
    key = "r",
    mods = "LEADER",
    action = act.ActivateKeyTable {
      name = "resize_pane",
      one_shot = false
    }
  },

  -- Tab keybindings
  { key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "n", mods = "LEADER", action = act.ShowTabNavigator },
  {
    key = "e",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Renaming Tab Title...:" },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end)
    }
  },

  -- Key table for moving tabs around
  {
    key = "m",
    mods = "LEADER",
    action = act.ActivateKeyTable {
      name = "move_tab",
      one_shot = false
    }
  },
  -- Or shortcuts to move tab w/o move_tab table. SHIFT is for when caps lock is on
  { key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
  { key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

  -- Workspaces
  {
    key = "w",
    mods = "LEADER",
    action = act.ShowLauncherArgs {
      flags = "FUZZY|WORKSPACES"
    }
  },
}

-- Tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1)
  })
end

config.key_tables = {
  resize_pane = {
    { key = "h",      action = act.AdjustPaneSize { "Left", 1 } },
    { key = "j",      action = act.AdjustPaneSize { "Down", 1 } },
    { key = "k",      action = act.AdjustPaneSize { "Up", 1 } },
    { key = "l",      action = act.AdjustPaneSize { "Right", 1 } },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  },
  move_tab = {
    { key = "h",      action = act.MoveTabRelative(-1) },
    { key = "j",      action = act.MoveTabRelative(-1) },
    { key = "k",      action = act.MoveTabRelative(1) },
    { key = "l",      action = act.MoveTabRelative(1) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  }
}

return config
