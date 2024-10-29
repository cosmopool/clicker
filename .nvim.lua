local lineLength = 80
vim.o.colorcolumn = tostring(lineLength)

require('flutter-tools').setup({
  fvm = true,
  debugger = {
    enabled = true,
    run_via_dap = true,
    -- exception_breakpoints = {}
  },
  lsp = {
    settings = {
      showTodos = true,
      renameFilesWithClasses = 'always',
      completeFunctionCalls = true,
      enableSnippets = true,
      updateImportsOnRename = true,
      lineLength = lineLength,
    },
  },
})

require('flutter-tools').setup_project({
  -- {
  --   name = 'Development',
  --   flavor = 'dev',
  --   target = 'lib/main.dart',
  --   pre_run_callback = nil,
  --   dart_define_from_file = '.dart_define.json',
  -- },
  -- {
  --   name = 'QA',
  --   flavor = 'qa',
  --   target = 'lib/main.dart',
  --   pre_run_callback = nil,
  --   dart_define_from_file = '.dart_define.json',
  -- },
  -- {
  --   name = 'Prod',
  --   flavor = 'prod',
  --   target = 'lib/main.dart',
  --   pre_run_callback = nil,
  --   dart_define_from_file = '.dart_define.json',
  -- },
  -- {
  --   name = 'Profile',
  --   flutter_mode = 'profile',
  --   flavor = 'dev',
  --   target = 'lib/main.dart',
  --   dart_define_from_file = '.dart_define.json',
  -- }
})
