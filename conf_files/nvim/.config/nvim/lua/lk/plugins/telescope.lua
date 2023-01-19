-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if(not telescope_setup)
then
  print('telescope not found')
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if(not actions_setup)
then
  print('telescope.actions not found')
  return
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
  extensions = {
    fzf = {
      -- fuzzy = true,                    -- false will only do exact matching
      -- override_generic_sorter = true,  -- override the generic sorter
      -- override_file_sorter = true,     -- override the file sorter
      case_mode = 'smart_case',        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    file_browser = {
      theme = 'dropdown',
      -- theme = 'ivy',
      hijack_netrw = true,
      mappings = {
        n = {
          -- ['h'] = fb_actions.goto_parent_dir,
        },
        i = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
      }
    }
  },
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("neoclip")
-- telescope.load_extension("media_files")

local keymap = vim.keymap  -- for conciseness
local opts = {noremap=true, silent=true}

keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>', opts, {desc = '[F]ind files'})
keymap.set('n', '<leader>h', '<cmd>Telescope find_files hidden=true<CR>', {desc = 'Search in dotfiles'})
keymap.set('n', '<leader>e', '<cmd>Telescope file_browser<CR>', opts, {desc = '[B]rowse files'})
keymap.set('n', '<leader>cg', '<cmd>Telescope live_grep<CR>', opts, {desc = '[G]rep search'})
keymap.set('n', '<leader>cs', '<cmd>Telescope grep_string<CR>', opts, {desc = 'Search current word'})
keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>', opts, {desc = '[F]ind existing buffers'})
keymap.set('n', '<leader>?', '<cmd>Telescope help_tags<CR>', opts, {desc='Search help'})
keymap.set('n', '<leader>d', '<cmd>Telescope diagnostics<CR>', opts, {desc='Search [D]iagnostics'})
keymap.set('n', '<leader>m', '<cmd>Telescope keymaps<CR>', opts, {desc='Key[M]aps'})
keymap.set('n', '<leader>cr', '<cmd>Telescope resume<CR>', opts, {desc='Back to last search'})
keymap.set('n', '<leader>cc', '<cmd>Telescope neoclip<CR>', opts, {desc='[C]lipboard history'})
keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 30,
    previewer = false,
  })
end, {desc='[/] Fuzzyly search in current buffer'}
)
