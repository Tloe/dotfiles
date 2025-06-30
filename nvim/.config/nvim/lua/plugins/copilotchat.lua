return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    { "github/copilot.vim" },            -- Official Copilot plugin
    { "nvim-lua/plenary.nvim" },         -- Required
    { "nvim-telescope/telescope.nvim" }, -- Optional: for Telescope picker integration
    { "MunifTanjim/nui.nvim" },          -- Optional: for enhanced UI
  },
  build = "make tiktoken",
  opts = {
    -- Optional config: customize if you want
    show_help = true,
    window = { layout = "vertical" },
    integrations = { telescope = true },
    mappings = {
      reset = "<space>cr",
      ["C-l"] = false,
    }
  },
  cmd = { "CopilotChat", "CopilotChatToggle", "CopilotChatQuick", "CopilotChatPick" },
  keys = {
    { "<space>cd", "<cmd>CopilotChatToggle<cr>",  desc = "Copilot Chat Toggle" },
    { "<space>cq", "<cmd>CopilotChatQuick<cr>",   desc = "Copilot Chat Quick" },
    { "<space>ce", "<cmd>CopilotChatExplain<cr>", desc = "Copilot Chat Explain" },
    {
      "<space>cf",
      function()
        local tb = require("telescope.builtin")
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        tb.find_files({
          prompt_title = "Pick file to insert as #file:",
          attach_mappings = function(_, map)
            map("i", "<CR>", function(bufnr)
              local entry = action_state.get_selected_entry()
              actions.close(bufnr)

              local rel = vim.fn.fnamemodify(entry.path, ":.")
              local prefix = "> #file:" .. rel

              -- Open or focus CopilotChat buffer
              vim.cmd("CopilotChat")
              vim.api.nvim_win_call(0, function()
                -- Append input line at the bottom
                vim.api.nvim_buf_set_lines(0, -1, -1, false, { prefix })
                -- Move cursor to end
                vim.cmd("stopinsert")
              end)
            end)
            return true
          end,
        })
      end,
      desc = "CopilotChat: pick file"
    },
  },
  config = function(_, opts)
    require("CopilotChat").setup(opts)

    vim.api.nvim_create_autocmd("WinEnter", {
      callback = function()
        local ft = vim.bo.filetype
        if ft == "copilot-chat" then
          vim.cmd("wincmd =")
        end
      end,
    })
  end,
}
