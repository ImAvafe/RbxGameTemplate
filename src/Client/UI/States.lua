local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

local CONTROLLERS = {}
local SERVICES = {}

local States = {

}

function States:Start()
  for _, ControllerName in ipairs(CONTROLLERS) do
    self[ControllerName] = Knit.GetController(ControllerName)
  end
  for _, ServiceName in ipairs(SERVICES) do
    self[ServiceName] = Knit.GetService(ServiceName)
  end
end

return States