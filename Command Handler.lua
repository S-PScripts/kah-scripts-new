-- Command Handler.lua --

getgenv().prefix = "." -- Prefix
getgenv().version = "v0.00 Alpha" -- Version

-- Variables for Chatted --
local admin = {prefix = prefix, version = version}
local commands = {}
local descriptions = {}

-- Variables for credits --
local creditables = {}
local creddesc = {}

-- Connections --
local connections = {}

-- Command adder --
-- From Shortcut v2 NEW (https://github.com/Tech-187/Lua-scripts/blob/main/Shortcut__v2_src2.lua)
local debounce = tick()
function addcommand(information)
	local cmdName = information.name
	local cmdAlias = information.aliases
	local cmdFunction = information.funct
	local cmdDescription = information.description

	commands[cmdName] = cmdName
	descriptions[cmdName] = cmdDescription

	connections[#connections + 1] = 
		game.Players.LocalPlayer.Chatted:Connect(function(msg)
			if 0.5 > tick() - debounce then return else debounce = tick() end
			msg = msg:lower()
			args = msg:split(" ")
			if args[1] == admin.prefix .. cmdName then
			cmdFunction()
		end

			for _, alias in ipairs(cmdAlias) do
			if args[1] == admin.prefix .. alias then
				cmdFunction()
				break
			end
		end
		end)
end

-- Example --
addcommand({
	name = "helloworld",
	aliases = {"hiworld"},
	description = "prints hello world",
	funct = function()
		print("hello world")
	end
})

-- Credit adder --
function addcredit(cName, cDescription)
	creditables[cName] = cName
	creddesc[cName] = cDescription
end

-- Example --
addcredit("TS2021",
	"created Command Handler.lua"
)
