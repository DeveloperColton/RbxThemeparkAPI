--[[
 __                                   __                  
|__)  _  _   _   _  _   _   _   _  _ /    _  | |_  _   _  
|    |  (_) (_) |  (_| ||| ||| (- |  \__ (_) | |_ (_) | ) 
            _/
__________________________________________________________

	RbxThemeparkAPI by ProgrammerColton
	
	A simple API that gets wait times and information based on the themeparks that you choose on ROBLOX game servers.
	
	Note: This ain't nothing special, just did it for fun and probably will really server no purpose. 
	I did it solely to improve my knowledge of the JS coding language and how to work with http and various servers.
	
	Docs:
	
	Path: /parks/list
	Desc: Returns a list of all parks and their ids.

	Path: /parks/:park/rides
	Desc: Returns a list of all rides and their data in the park.
	Params: {park, which must be the park id from "/parks/list}
	
	Path: /parks/:park/ride/:ride
	Desc: Returns data about a specific ride from a park.
	Params: {park, which must be the park id from "/parks/list}
			{ride, which must be the ride name which can be gotten from "/parks/:park/rides"}
	
	You can also visit the repository here:
	https://github.com/ProgrammerColton/RbxThemeparkAPI
		
	If you want to view the possible parks, go to this page:
	https://github.com/cubehouse/themeparks

--]]

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

--[[
Example above prints:

Magic Kingdom - Walt Disney World Florida
Epcot - Walt Disney World Florida
Hollywood Studios - Walt Disney World Florida
Animal Kingdom - Walt Disney World Florida
Magic Kingdom - Disneyland Resort
California Adventure - Disneyland Resort
Magic Kingdom - Disneyland Paris
Walt Disney Studios - Disneyland Paris
Magic Kingdom - Shanghai Disney Resort
Tokyo Disney Resort - Magic Kingdom
Tokyo Disney Resort - Disney Sea
Hong Kong Disneyland
Universal Studios Florida
Universal's Islands Of Adventure
Universal Volcano Bay
Universal Studios Hollywood
Universal Studios Singapore
Europa Park
Six Flags Over Texas
Six Flags Over Georgia
Six Flags St. Louis
Six Flags Great Adventure
Six Flags Magic Mountain
Six Flags Great America
Six Flags Fiesta Texas
Six Flags Hurricane Harbor, Arlington
Six Flags Hurricane Harbor, Los Angeles
Six Flags America
Six Flags Discovery Kingdom
Six Flags New England
Six Flags Hurricane Harbor, Jackson
The Great Escape
Six Flags White Water, Atlanta
Six Flags México
La Ronde, Montreal
Alton Towers
Thorpe Park
Chessington World Of Adventures
Parc-Asterix
Hershey Park
Silver Dollar City
Dollywood
Knott's Berry Farm
Cedar Point
Carowinds
Canada's Wonderland
Kings Island
California's Great America
Efteling
--]]
