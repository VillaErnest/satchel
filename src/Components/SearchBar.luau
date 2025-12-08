--!strict

local React = require("../../react")

export type Props = {
	size: UDim2?,
}

local function SearchBarTextBox(props: Props)
	return React.createElement("TextBox", {
		Size = props.size,
		[React.Tag] = "SearchBar",
	})
end

return SearchBarTextBox
