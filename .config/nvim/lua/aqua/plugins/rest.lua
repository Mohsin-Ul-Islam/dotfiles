local lazy_root = vim.fn.stdpath("data") .. "/lazy"

-- rest.nvim's pure-Lua deps keep their modules at the repo root (not lua/),
-- so put those repos on package.path instead of installing them with luarocks.
local function add_lua_root(plugin_name)
	local root = lazy_root .. "/" .. plugin_name
	package.path = root .. "/?.lua;" .. root .. "/?/init.lua;" .. package.path
end

local function set_formatprg(filetype, command)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		callback = function(event)
			vim.bo[event.buf].formatprg = command
		end,
	})
end

return {
	"rest-nvim/rest.nvim",
	ft = "http",
	-- Skip lazy's luarocks build: deps come from git below, the http parser from nvim-treesitter.
	build = false,
	dependencies = {
		"nvim-neotest/nvim-nio",
		"j-hui/fidget.nvim",
		{ "lunarmodules/lua-mimetypes", lazy = true, build = false },
		{ "manoelcampos/xml2lua", lazy = true, build = false },
	},
	init = function()
		add_lua_root("lua-mimetypes")
		add_lua_root("xml2lua")

		-- Response bodies are formatted with each filetype's formatprg.
		set_formatprg("json", "jq .")
		set_formatprg("html", "tidy -i -q -")

		vim.g.rest_nvim = {
			request = {
				skip_ssl_verification = false,
				hooks = {
					encode_url = true,
				},
			},
			response = {
				hooks = {
					format = true,
				},
			},
			env = {
				enable = true,
				pattern = "^%.env$",
			},
			highlight = {
				enable = true,
				timeout = 150,
			},
		}
	end,
}
