local lushwright = require("shipwright.transform.lush")
run(
  require("lush_theme.boomer"),
  lushwright.to_lua,
  { patchwrite, vim.fn.stdpath("config") .. "/colors/custom.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" }
)
