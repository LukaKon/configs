local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if(not status)
then
  print('nvim-treesitter.configs not found')
  return
end


treesitter.setup({
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  -- A list of parser names, or "all"
  ensure_installed = {
    'cpp',
    'css',
    'dockerfile',
    'gitignore',
    'html',
    'javascript',
    'json',
    'latex',
    'lua',
    'markdown',
    'nix',
    'python',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'yaml',
  },
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
})
