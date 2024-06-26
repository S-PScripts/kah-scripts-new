-- Anti Crash.lua --

-- Remind --
local function Remind(text, num)
	if num == nil then
		num = 1
	end
	game:GetService("StarterGui"):SetCore("SendNotification",
	{
		Title = "Anti Crash.lua",
		Text = text,
		Duration = num
	}
	)
end

-- Execution check --
getgenv().executed2 = false

if getgenv().executed2 then 
	return Remind("KohlsECO is already executed.")
end

-- Regen --
local function regen()
  if fireclickdetector then
			if workspace.Terrain["_Game"].Admin:FindFirstChild("Regen") then
				fireclickdetector(workspace.Terrain["_Game"].Admin.Regen.ClickDetector, 0)
			else
				Remind("The regen pad is not loaded - please find it first.")
			end	
	else
			Remind("Cannot regen; Your exploit does not support the fireclickdetector function.")
	end
end

-- VARIABLES --

getgenv().antigear = false -- No one except you can use gears with this on
getgenv().anticrash = true -- No one except you can crash the servers (gears only)

-- LocalPlayer variable --
local lplr = game:GetService("Players").LocalPlayer

-- LISTS --

-- Tools that can crash servers -- 
getgenv().crashTools = {
	"VampireVanquisher", 
	"OrinthianSwordAndShield", 
	"BitePlant", 
	"Emerald Knights of the Seventh Sanctum Sword and Shield"
}

special = {}

-- People whitelisted from antigear/anticrash --
special.gearwhitelisted = {"ScriptingProgrammer", "kevin3050ti"}

-- People blacklisted from using gears --
special.gearbanned = {}

-- Connections --
getgenv().connections = {}

-- Anti crash for gears and anti gear
connections[#connections + 1] =
	game:GetService("RunService").RenderStepped:Connect(function()
	
		for i, v in game.Players:GetPlayers() do
				if v.Name ~= lplr.Name and not table.find(special.gearwhitelisted, v.Name) then
					if v.Backpack:FindFirstChildOfClass("Tool") then
						if antigear or table.find(special.gearbanned, v.Name) then
							Chat("ungear " .. v.Name)
							Chat("punish " .. v.Name)
							Chat("clr")
              regen()
						end
					end
				end

				if v.Name ~= lplr.Name and not table.find(special.gearwhitelisted, v.Name) then
					if v.Character and v.Character:FindFirstChildOfClass("Tool") then
						if antigear or table.find(special.gearbanned, v.Name) then
							Chat("ungear " .. v.Name)
							Chat("punish " .. v.Name)
							Chat("clr")
              regen()
						end
					end
				end
		end

		for i, tool in crashTools do
				for i, v in game.Players:GetPlayers() do
					if v.Name ~= lplr.Name and not table.find(special.gearwhitelisted, v.Name) then
						if v.Backpack:FindFirstChild(tool) then
							if anticrash or table.find(special.gearbanned, v.Name) then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
                regen()
							end
						end
					end

					if v.Name ~= lplr.Name and not table.find(special.gearwhitelisted, v.Name) then
						if v.Character and v.Character:FindFirstChild(tool) then
							if antigear or table.find(special.gearbanned, v.Name) then
								Chat("ungear " .. v.Name)
								Chat("punish " .. v.Name)
								Chat("clr")
                regen()
							end
						end
					end
				end

				if workspace:FindFirstChild(tool) then
					Chat("ungear others")
					Chat("punish others")
					Chat("clr")
          regen()
				end
		end
	end)
