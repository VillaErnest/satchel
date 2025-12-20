--!strict

local templateObjects = script.Parent.Parent.Objects

local slotButtonTemplate: TextButton = templateObjects.Slot

local SlotButton = {}
SlotButton.__index = SlotButton

export type ClassType = typeof(setmetatable(
	{} :: {
		_instance: {
			button: TextButton,
			hint: TextLabel,
			icon: ImageLabel,
			tooltip: TextLabel,
		},
	},
	SlotButton
))

function SlotButton.new(): ClassType
	local buttonInstance = slotButtonTemplate:Clone()
	local hintText = buttonInstance:WaitForChild("NumberHint") :: TextLabel
	local iconImage = buttonInstance:WaitForChild("TextureIcon") :: ImageLabel
	local tooltipText = buttonInstance:WaitForChild("ToolTip") :: TextLabel

	local self = setmetatable({
		activated = buttonInstance.Activated,
		_instance = {
			button = buttonInstance,
			hint = hintText,
			icon = iconImage,
			tooltip = tooltipText,
		},
	}, SlotButton)

	return self
end

function SlotButton.setParent(self: ClassType, parent: GuiBase2d?)
	self._instance.button.Parent = parent
end

function SlotButton.setText(self: ClassType, text: string)
	local slotTextLabel = self._instance.button

	slotTextLabel.Text = text
end

function SlotButton.setTooltipText(self: ClassType, text: string)
	local tooltipTextLabel = self._instance.tooltip
	tooltipTextLabel.Text = text
end

function SlotButton.setNumber(self: ClassType, number: number)
	local numberTextLabel = self._instance.hint

	numberTextLabel.Text = tostring(number)
end

function SlotButton.destroy(self: ClassType)
	self._instance.button:Destroy()
end

return SlotButton
