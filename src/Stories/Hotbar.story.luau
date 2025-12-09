--!strict

local React = require("../../react")
local ReactRoblox = require("../../react-roblox")

local Hotbar = require("../Components/Hotbar")
local HintSlot = require("../Components/HintSlot")
local Slot = require("../Components/Slot")

return {
	react = React,
	reactRoblox = ReactRoblox,
	story = function()
		local component = React.createElement(Hotbar, {}, {
			HintSlotL1 = React.createElement(HintSlot, {
				hintImage = "rbxasset://textures/ui/Controls/DesignSystem/ButtonL1.png",
				order = -1,
			}),
			Tool = React.createElement(Slot, {
				toolName = "Classic Sword",
				tooltipText = "A classic sword",
				slotNumber = 1,
				toolImage = "rbxasset://Textures/Sword128.png",
				order = 1,
			}),
			HintSlotR1 = React.createElement(HintSlot, {
				hintImage = "rbxasset://textures/ui/Controls/DesignSystem/ButtonR1.png",
				order = 100,
			}),
			StyleLink = React.createElement("StyleLink", {
				StyleSheet = game.ReplicatedStorage.Design.SatchelStyleSheet,
			}),
		})

		return component
	end,
}
