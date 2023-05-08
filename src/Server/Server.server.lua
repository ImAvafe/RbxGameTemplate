local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local Knit = require(ReplicatedStorage.Packages.Knit)
local Loader = require(ReplicatedStorage.Packages.Loader)

Knit.AddServices(ServerScriptService.Services)

Knit.Start():andThen(function()
   print('KnitStart server!')

   Loader.LoadDescendants(ServerScriptService.Components, function(Descendant)
      return Descendant:IsA("ModuleScript")
   end)
end)