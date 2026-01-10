return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    vim.notify = notify
    notify.setup({
      stages = "fade_in_slide_out",
      timeout = 3000,
      background_colour = "#000000",
    })
  end,
}
