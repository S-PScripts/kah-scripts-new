-- Serverlock.lua --

-- VARIABLES --

-- Serverlock toggle --
getgenv().slockenabled = false

-- LocalPlayer variable --
local lplr = game:GetService("Players").LocalPlayer

-- LISTS --

special = {}

-- People blacklisted from the server --
special.blacklisted = {}

-- People whitelisted from getting serverlocked --
special.whitelisted = {"ScriptingProgrammer"}

-- Connections --
local connections = {}

connections[#connections + 1] =
	game:GetService("RunService").RenderStepped:Connect(function()
		for i, v in game.Players:GetPlayers() do 
			if slockenabled == true then
				if v.Name ~= lplr.Name and not table.find(special.whitelisted) then
					if not game.Lighting:FindFirstChild(v.Name) then
                                        	Chat('punish '..v.Name)
                                         	Chat('blind '..v.Name)   
                                        	Chat('skydive '..v.Name)        
					end
				end
			end
		end
		
		for i, v in game.Players:GetPlayers() do 
			if table.find(special.blacklisted, v.Name) then
				if not game.Lighting:FindFirstChild(v.Name) then
                                         Chat('punish '..v.Name)
                                         Chat('blind '..v.Name)   
                                         Chat('skydive '..v.Name)        
				end
			end
		end
	end)
