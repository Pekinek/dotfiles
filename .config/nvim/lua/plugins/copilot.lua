return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,

      keymap = {
        accept = "<M-CR>", -- handled by nvim-cmp / blink.cmp
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
  },
}
