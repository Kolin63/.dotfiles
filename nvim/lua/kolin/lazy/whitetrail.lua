return {
  "kolin63/whitetrail",

  config = function()
    require("whitetrail").setup({
      whitespace = { " ", "\t" }
    })
  end
}
