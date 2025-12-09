--!strict

local React = require("../../react")

export type Props = {
	children: any?,
}

local function HotbarFrame(props: Props)
	return React.createElement("Frame", {
		[React.Tag] = "Hotbar",
	}, props.children)
end

return HotbarFrame
