return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Avoid conflicting with <Tab>
      vim.g.copilot_no_tab_map = true

      -- Accept Copilot suggestion with <C-L>
      vim.api.nvim_set_keymap(
        "i", "<C-L>",
        'copilot#Accept("<CR>")',
        { expr = true, silent = true }
      )
    end,
  },
}
