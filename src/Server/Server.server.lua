local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local Knit = require(ReplicatedStorage.Packages.Knit)
local Loader = require(ReplicatedStorage.Packages.Loader)

Loader.LoadDescendants(ServerScriptService.Services, function(Descendant)
	if Descendant:IsA("ModuleScript") and Descendant.Name:match("Service$") ~= nil then
		return Knit.CreateService(require(Descendant))
	end
end)

Knit.Start():andThen(function()
	print("KnitStart server!")

	Loader.LoadDescendants(ServerScriptService.Components, function(Descendant)
		return Descendant:IsA("ModuleScript")
	end)
end)
