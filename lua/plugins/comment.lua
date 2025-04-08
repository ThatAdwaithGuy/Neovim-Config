return {
	"numToStr/Comment.nvim",
	config = function()
		local ft = require("Comment.ft")

		ft.templ = { "//%s", "/*%s*/" }
		require("Comment").setup()
	end,
}
