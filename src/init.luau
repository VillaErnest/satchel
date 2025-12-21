local Players = game:GetService("Players")

local React = require("./react")
local ReactRoblox = require("./react-roblox")

local player = Players.LocalPlayer :: Player
local playerGui = player.PlayerGui

local Backpack = require("@self/Components/Backpack")

local handle = Instance.new("ScreenGui")
handle.Name = "SatchelGui"
handle.Parent = playerGui

local styleLink = Instance.new("StyleLink")
styleLink.StyleSheet = script.StyleSheets.SatchelStyleSheet
styleLink.Parent = handle

local root = ReactRoblox.createRoot(handle)
root:render({ Backpack = React.createElement(Backpack) })

return {}
