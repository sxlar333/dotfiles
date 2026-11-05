require("nvchad.configs.lspconfig").defaults()

-- clangd needs a compile database (compile_commands.json / compile_flags.txt)
-- for accurate completions. Also index the project in the background.
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--completion-style=detailed",
    "--function-arg-placeholders=1",
  },
  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    "CMakeLists.txt",
    "Makefile",
    "meson.build",
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "configure.ac",
    ".git",
  },
})

vim.lsp.enable "clangd"

-- read :h vim.lsp.config for changing options of lsp servers 
