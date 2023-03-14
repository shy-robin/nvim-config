vim.g.vrc_set_default_mapping = 0
vim.g.vrc_output_buffer_name = "__VRC_OUTPUT.json"
vim.g.vrc_curl_opts = {
	["-sS"] = "",
	["--connect-timeout"] = 10,
	["-i"] = "",
	["--max-time"] = 60,
	["-k"] = "",
}
-- 自动格式化 json 响应
vim.g.vrc_auto_format_response_patterns = {
	json = "python3 -m json.tool",
}
-- 转换中文
vim.g.vrc_auto_format_uhex = 1
