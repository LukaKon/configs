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

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    mappings = {
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
  },
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension("fzf")

local keymap = vim.keymap  -- for conciseness

keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>', {desc = '[F]earch files'})
keymap.set('n', '<leader>s', '<cmd>Telescope live_grep<cr>', {desc = 'Search by grep'})
keymap.set('n', '<leader>c', '<cmd>Telescope grep_string<cr>', {desc = 'Search current word'})
keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>', {desc = '[ ]Find exitsting buffers'})
keymap.set('n', '<leader>h', '<cmd>Telescope help_tags<cr>', {desc='Search help'})
keymap.set('n', '<leader>th', '<cmd> Telescope find_files hidden=true<cr>', {desc='Search in dotfiles'})
keymap.set('n', '<leader>td', '<cmd> Telescope.diagnostics', {desc='Search diagnostics'})
keymap.set('n', '<leader>m', '<cmd>Telescope keymap<CR>')
