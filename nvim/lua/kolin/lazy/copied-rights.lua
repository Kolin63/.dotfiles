return {
  "kolin63/copied-rights",

  config = function()
    require("copied-rights").setup({
      -- if file is encountered, the search for an override file will stop
      search_stop = { ".git/" },

      -- how many directories to move back through for an override file search
      max_search = 4,

      -- if only this amount of chars are different, then header will be
      -- replaced rather than a new one being added
      max_diff = 4,

      -- file name for override files
      override_file = ".copied-rights.lua",

      headers = {
        {
          file = "*.cpp",
          lines = {
            "// SPDX-License-Identifier: MIT",
            "// Copyright (c) Colin Melican 2025",
            "",
          }
        },
        {
          file = "*.h",
          lines = {
            "// SPDX-License-Identifier: MIT",
            "// Copyright (c) Colin Melican 2025",
            "",
          }
        },
        {
          file = "*.lua",
          lines = {
            "-- SPDX-License-Identifier: MIT",
            "-- Copyright (c) Colin Melican 2025",
            "",
          }
        },
        {
          file = "*.py",
          lines = {
            "# SPDX-License-Identifier: MIT",
            "# Copyright (c) Colin Melican 2025",
            "",
          }
        },
        {
          file = "*.c",
          lines = {
            "// SPDX-License-Identifier: MIT",
            "// Copyright (c) Colin Melican 2025",
            "",
          }
        },
      },
    })
  end
}
