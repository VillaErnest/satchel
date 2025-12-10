--!strict

local React = require("../../react")

export type Props = {
	hintImage: string,
	order: number?,

	children: any?,
}

local function HotbarHint(props: Props)
	return React.createElement("ImageLabel", {
		Image = props.hintImage,
		LayoutOrder = props.order,
		[React.Tag] = "HintSlot",
	}, props.children)
end

return HotbarHint
