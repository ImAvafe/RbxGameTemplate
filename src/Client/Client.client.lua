local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")

local Knit = require(ReplicatedStorage.Packages.Knit)
local Loader = require(ReplicatedStorage.Packages.Loader)

Loader.LoadDescendants(StarterPlayer.StarterPlayerScripts.Controllers, function(Descendant)
	if Descendant:IsA("ModuleScript") and Descendant.Name:match("Controller$") ~= nil then
		return Knit.CreateController(require(Descendant))
	end
end)

Knit.Start():andThen(function()
	print("KnitStart client!")

	Loader.LoadDescendants(StarterPlayer.StarterPlayerScripts.Components, function(Descendant)
		return Descendant:IsA("ModuleScript")
	end)
end)
