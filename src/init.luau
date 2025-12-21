--!strict

local Players = game:GetService("Players")

local SlotButton = require(script.Components.SlotButton)

local player = Players.LocalPlayer :: Player
local playerGui = player:FindFirstChild("PlayerGui") :: PlayerGui

local satchelGui = Instance.new("ScreenGui")
satchelGui.Name = "SatchelGui"
satchelGui.ResetOnSpawn = false
satchelGui.Parent = playerGui

local styleLink = Instance.new("StyleLink")
styleLink.StyleSheet = script.StyleSheets.SatchelStyleSheet
styleLink.Parent = satchelGui

local swordTool = Instance.new("Tool")
swordTool.Name = "Sword"
swordTool.TextureId = "rbxasset://Textures/Sword128.png"
swordTool.ToolTip = "A classic sword"
swordTool.Parent = player:WaitForChild("Backpack")

local button = SlotButton.new()
button:setTool(swordTool)
button:setParent(satchelGui)

return {}
