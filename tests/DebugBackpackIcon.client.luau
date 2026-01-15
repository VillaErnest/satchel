--!strict

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Icon = require(ReplicatedStorage.Packages.topbarplus)

local player = Players.LocalPlayer :: Player

local toolIcon = Icon.new()
toolIcon:setLabel("Backpack Options")
toolIcon:align("Right")
toolIcon:setDropdown({
	Icon.new()
		:setLabel("Add Tool")
		:bindEvent("deselected", function()
			local backpack = player:FindFirstChildOfClass("Backpack") :: Backpack
			local tool = Instance.new("Tool")
			tool.Parent = backpack
		end)
		:oneClick(),
	Icon.new()
		:setLabel("Add HopperBin")
		:bindEvent("deselected", function()
			local backpack = player:FindFirstChildOfClass("Backpack") :: Backpack
			local hopperBin = Instance.new("HopperBin")
			hopperBin.Parent = backpack
		end)
		:oneClick(),
	Icon.new()
		:setLabel("Clear Backpack")
		:bindEvent("deselected", function()
			local backpack = player:FindFirstChildOfClass("Backpack") :: Backpack
			backpack:ClearAllChildren()
		end)
		:oneClick(),
})
