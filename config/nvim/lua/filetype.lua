vim.filetype.add({
	extension = {
		ansible = "yaml.ansible",
	},
	filename = {
		[".ansible"] = "yaml.ansible",
	},
	-- pattern = {
	--   ['.*/etc/foo/.*'] = 'fooscript',
	--   -- Using an optional priority
	--   ['.*/etc/foo/.*%.conf'] = { 'dosini', { priority = 10 } },
	--   -- A pattern containing an environment variable
	--   ['${XDG_CONFIG_HOME}/foo/git'] = 'git',
	--   ['README.(%a+)$'] = function(path, bufnr, ext)
	--     if ext == 'md' then
	--       return 'markdown'
	--     elseif ext == 'rst' then
	--       return 'rst'
	--     end
	--   end,
	-- },
})
