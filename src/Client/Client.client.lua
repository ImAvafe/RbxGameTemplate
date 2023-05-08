local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayerScripts = game:GetService("StarterPlayer"):WaitForChild("StarterPlayerScripts")

local Knit = require(ReplicatedStorage.Packages.Knit)
local Loader = require(ReplicatedStorage.Packages.Loader)

Knit.AddControllers(StarterPlayerScripts.Controllers)

Knit.Start():andThen(function()
   print('KnitStart client!')

   Loader.LoadDescendants(StarterPlayerScripts.Components, function(Descendant)
      return Descendant:IsA("ModuleScript")
   end)
end)