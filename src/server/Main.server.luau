local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Config = require(ReplicatedStorage.Shared.Config)

print(string.format("[%s] Server started - version %s", Config.GameName, Config.Version))
