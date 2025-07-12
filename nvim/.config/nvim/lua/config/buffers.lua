local function close_unused_bufs()
	local cur_buf = vim.api.nvim_get_current_buf()
	local bufs = vim.api.nvim_list_bufs()
	local closed_bufs = {}
	local cwd_prefix = "^" .. vim.fn.getcwd() .. "/"
	for _, buf in ipairs(bufs) do
		if vim.api.nvim_buf_is_loaded(buf) and buf ~= cur_buf then
			local name = vim.api.nvim_buf_get_name(buf):gsub(cwd_prefix, "")
			if name == "" then
				name = "[No Name]"
			end

			table.insert(closed_bufs, name)
			vim.cmd(":bd " .. buf)
		end
	end
	print("closed " .. #closed_bufs .. " buffers: " .. table.concat(closed_bufs, ", "))
end

vim.keymap.set("n", "<C-c>", ":bd<CR>")
vim.keymap.set("n", "<leader>u", close_unused_bufs)
vim.keymap.set("n", "<leader>n", ":bnext<CR>")
vim.keymap.set("n", "<leader>p", ":bprev<CR>")
