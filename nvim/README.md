# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## C/C++ and CMake

This configuration supports C and C++ development with:

- `clangd` through Mason and the Neovim LSP client
- C, C++, and CMake Treesitter parsers and highlighting
- `clang-format` through Mason and the existing Conform configuration
- CMake configure/generate, build, run, debug, configure-preset selection, and build-target selection
- Overseer as the CMake Tools executor and runner

The current `nvim-treesitter` `main` branch requires **Neovim 0.12.0 or newer**. The configuration was tested with Neovim 0.12.5.

### External dependencies

Install these on the operating system (Mason can install `clangd` and `clang-format`):

- `clang` or `gcc`
- `clangd`
- `clang-format`
- `cmake`
- `ninja` or another CMake generator
- `tree-sitter-cli` when parser compilation is required
- `CodeLLDB`, or `GDB`/`LLDB`, for debugging

### Basic CMake workflow

Open a buffer in a project containing `CMakeLists.txt`, optionally select a configure preset and build target, then use the CMake mappings below. Configure presets are read from `CMakePresets.json` or `CMakeUserPresets.json`. CMake Tools generates `compile_commands.json` and copies it to the project root so `clangd` can use it.

Debugging requires an externally installed debugger and the existing `codelldb` adapter configuration. CMake Tools' debug command uses `nvim-dap`; it cannot debug without a compatible debugger executable on `PATH`.

### CMake keymaps

| Key | Action |
| --- | --- |
| `<leader>cg` | CMake configure/generate |
| `<leader>cb` | CMake build |
| `<leader>cr` | CMake run |
| `<leader>cd` | CMake debug |
| `<leader>cS` | Select configure preset |
| `<leader>cT` | Select build target |
