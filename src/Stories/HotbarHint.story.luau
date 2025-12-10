--!strict

local React = require("../../react")
local ReactRoblox = require("../../react-roblox")

local HotbarHint = require("../Components/HotbarHint")

local controls = {
	HintImage = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png",
}

return {
	react = React,
	reactRoblox = ReactRoblox,
	controls = controls,
	story = function(props)
		local component = React.createElement(HotbarHint, {
			hintImage = props.controls.HintImage,
		}, {
			StyleLink = React.createElement("StyleLink", {
				StyleSheet = game.ReplicatedStorage.Design.SatchelStyleSheet,
			}),
		})

		return component
	end,
}
