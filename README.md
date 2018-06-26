# RbxThemeparkAPI
A simple API that gets wait times based on the themepark that you choose on ROBLOX game servers.

# Setup

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

- Click the button above and rename the app to whatever you wish.
- Click "deploy app" and wait for it to finish.
- Click "view" and grab the url from the top of the page. (save it for later).
- Go back and click "manage app".
- Head towards "settings" at the top and look for "revel config vars".
- Click it and copy the TOKEN_KEY (save it for later).

# In-studio

- Create a server script in ServerScriptService, name it whatever.
- Create a modulescript in the script you just created, name it **RbxThemeparkAPI**.

- Grab the code from [here](https://github.com/ProgrammerColton/RbxThemeparkAPI/blob/master/roblox/api.lua) and paste it into the server script.

There is an example inside the above code but I'll post it here as well.

```lua
--// Example:
local httpService = game:GetService("HttpService");
local themeparkModule = require(script.RbxThemeparkAPI);
local themeparkAPI = themeparkModule:Init("YOUR_URL_HERE","YOUR_TOKEN_HERE")
--// Note: I recommend removing the "/" at the end of your url, it looks better when you send a path.
--// If you don't remove it though, you'll have to send a path like this "parks/list" instead of "/parks/list".

local test = themeparkAPI:Get("/parks/list");
for i,v in pairs(test) do
	print(v.name);
end
```

- Grab the code from [here](https://github.com/ProgrammerColton/RbxThemeparkAPI/blob/master/roblox/rbxthemeparkapi.lua) and paste it into the module script.

# Extra

If you need help, I'm open on my email, which can be found at:
*programmercolton@gmail.com*





