--!strict

local React = require("../../react")

export type Props = {
	hintImage: string,
	order: number?,

	children: any?,
}

local function HintSlotImageLabel(props: Props)
	return React.createElement("ImageLabel", {
		Image = props.hintImage,
		LayoutOrder = props.order,
		[React.Tag] = "HintSlot",
	}, props.children)
end

return HintSlotImageLabel
