--[[
 __                                   __                  
|__)  _  _   _   _  _   _   _   _  _ /    _  | |_  _   _  
|    |  (_) (_) |  (_| ||| ||| (- |  \__ (_) | |_ (_) | ) 
            _/
__________________________________________________________

--]]

local RbxThemeparkAPI = {}

--// Variables:
local httpService = game:GetService("HttpService");

function RbxThemeparkAPI:Init(url, token)
	self.url = url;
	self.token = token;
	return self;
end

function RbxThemeparkAPI:Get(path)
	local data = {
		["token"] = self.token;
	}
	if not(path) then
		return "Error: Path null."
	end
	local result;
	local decode;
	print("Fetching data...");
	local success, err = pcall(function()
		result = httpService:GetAsync(self.url..path, false, data);
		decode = httpService:JSONDecode(result);
	end)
	if not(success) then
		return ("Error: " .. err);
	end
	return decode;
end

return RbxThemeparkAPI
