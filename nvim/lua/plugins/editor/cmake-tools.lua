return {
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/overseer.nvim",
    },
    ft = { "cmake" },
    cmd = {
      "CMakeGenerate",
      "CMakeBuild",
      "CMakeRun",
      "CMakeDebug",
      "CMakeSelectConfigurePreset",
      "CMakeSelectBuildTarget",
    },
    keys = {
      { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake configure/generate" },
      { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake build" },
      { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake run" },
      { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake debug" },
      { "<leader>cS", "<cmd>CMakeSelectConfigurePreset<cr>", desc = "CMake configure preset" },
      { "<leader>cT", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake build target" },
    },
    opts = {
      cmake_use_preset = true,
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" },
      cmake_compile_commands_options = {
        action = "copy",
        target = function()
          return vim.fn.getcwd()
        end,
      },
      cmake_executor = {
        name = "overseer",
        default_opts = {
          overseer = {
            new_task_opts = {},
          },
        },
      },
      cmake_runner = {
        name = "overseer",
        default_opts = {
          overseer = {
            new_task_opts = {},
          },
        },
      },
      cmake_dap_configuration = {
        name = "CMake debug",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
      },
    },
  },
}
