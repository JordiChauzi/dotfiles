local function init()
  require'nvim-treesitter.configs'.setup{
    ensure_installed = {
      'bash',
      'c',
      'cmake',
      'cpp',
      'css',
      'dockerfile',
      'go',
      'gomod',
      'graphql',
      'html',
      'java',
      'javascript',
      'jsdoc',
      'json',
      'llvm',
      'lua',
      'make',
      'ninja',
      'nix',
      'python',
      'rust',
      'toml',
      'yaml',
    },
    highlight = {
      enable = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = {
      enable = true
    }
  }

  --vim.cmd[[set foldmethod=expr]]
  --vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
end

return {
  init = init
}
