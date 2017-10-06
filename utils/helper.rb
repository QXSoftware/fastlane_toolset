
def check_params(params, *symbols)
	result = true
	symbols.each do |s|
		arg = params[s]
		if arg == nil then
			result = false
			FastlaneCore::UI.error("Paramaters must contain #{s}!")
		end
	end
	return result
end

def get_full_path_from_cur_dir(curFilePath, relativePath)
	dir = File.dirname(curFilePath)
	fullPath = File.expand_path(File.join(dir, relativePath))
	return fullPath
end
