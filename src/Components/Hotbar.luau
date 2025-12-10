--!strict

local React = require("../../react")

export type Props = {
	children: any?,
}

local function Hotbar(props: Props)
	return React.createElement("Frame", {
		[React.Tag] = "Hotbar",
	}, props.children)
end

return Hotbar
