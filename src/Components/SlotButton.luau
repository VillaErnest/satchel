--!strict

--[[
	Slot button component representing a tool slot in the hotbar.
]]

-- local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")

local SlotButton = {}
SlotButton.__index = SlotButton

export type ClassType = typeof(setmetatable(
	{} :: {
		activated: RBXScriptSignal,
		tool: Tool | HopperBin?,
		_instance: {
			button: TextButton,
			hint: TextLabel,
			icon: ImageLabel,
			tooltip: TextLabel,
		},
		_connections: { RBXScriptConnection },
	},
	SlotButton
))

function SlotButton.new(): ClassType
	local buttonInstance = Instance.new("TextButton")
	buttonInstance.Name = "Slot"
	buttonInstance:AddTag("Slot")

	local hintText = Instance.new("TextLabel")
	hintText.Name = "NumberHint"
	hintText:AddTag("SlotNumber")
	hintText.Parent = buttonInstance

	local iconImage = Instance.new("ImageLabel")
	iconImage.Name = "TextureIcon"
	iconImage.Parent = buttonInstance

	local tooltipText = Instance.new("TextLabel")
	tooltipText.Name = "ToolTip"
	tooltipText:AddTag("ToolTip")
	tooltipText.Parent = buttonInstance

	local self = setmetatable({
		activated = buttonInstance.Activated,
		tool = nil :: Tool | HopperBin?,
		_instance = {
			button = buttonInstance,
			hint = hintText,
			icon = iconImage,
			tooltip = tooltipText,
		},
		_connections = {},
	}, SlotButton)

	-- Initial hint visibility based on preferred input
	local preferredInputChangedConnection = UserInputService:GetPropertyChangedSignal("PreferredInput")
		:Connect(function()
			self:onPreferredInputChanged()
		end)
	self:onPreferredInputChanged()
	table.insert(self._connections, preferredInputChangedConnection)

	-- local defaultTransparency = buttonInstance.BackgroundTransparency
	-- local preferredTransparencyChangedConnection = GuiService:GetPropertyChangedSignal("PreferredTransparency")
	-- 	:Connect(function()
	-- 		self:onPreferredTransparencyChanged(defaultTransparency)
	-- 	end)
	-- self:onPreferredTransparencyChanged(defaultTransparency)
	-- table.insert(self._connections, preferredTransparencyChangedConnection)

	return self
end

-- Cleans up the slot button and disconnects events
function SlotButton.destroy(self: ClassType)
	self.tool = nil
	self._instance.button:Destroy()

	for _, connection in self._connections do
		connection:Disconnect()
	end
end

-- Updates the hint visibility based on preferred input method
function SlotButton.onPreferredInputChanged(self: ClassType)
	local preferredInput = UserInputService.PreferredInput
	local isKeyboardAndMouse = preferredInput == Enum.PreferredInput.KeyboardAndMouse

	self._instance.hint.Visible = isKeyboardAndMouse
end

-- function SlotButton.onPreferredTransparencyChanged(self: ClassType, defaultTransparency: number)
-- 	local preferredTransparency = GuiService.PreferredTransparency

-- 	self._instance.button.BackgroundTransparency = defaultTransparency * preferredTransparency
-- end

-- Sets whether this slot is unlocked and draggable
function SlotButton.setUnlocked(self: ClassType, unlocked: boolean)
	if unlocked then
		self._instance.button:AddTag("Unlocked")
	else
		self._instance.button:RemoveTag("Unlocked")
	end
end

-- Sets whether the slot is equipped and has selection outline shown
function SlotButton.setEquipped(self: ClassType, equipped: boolean)
	if equipped then
		self._instance.button:AddTag("Equipped")
	else
		self._instance.button:RemoveTag("Equipped")
	end
end

-- Sets the tool associated with this slot button
function SlotButton.setTool(self: ClassType, tool: Tool | HopperBin?)
	self.tool = tool

	-- Update the button based on the tool
	local function onToolChange()
		if self.tool then
			self:setText(self.tool.Name)
			self:setIcon(self.tool.TextureId)
			if self.tool:IsA("Tool") then
				self:setTooltip(self.tool.ToolTip)
			end
		else
			self:setText("")
			self:setIcon("")
			self:setTooltip("")
		end
	end
	onToolChange()

	-- Connect to tool property changes
	local toolChangedConnection = tool.Changed:Connect(function(property)
		if property == "Name" or property == "TextureId" or property == "ToolTip" then
			onToolChange()
		end
	end)
	table.insert(self._connections, toolChangedConnection)
end

-- Sets the text displayed on the slot button
function SlotButton.setText(self: ClassType, text: string)
	self._instance.button.Text = text
end

-- Sets the icon image of the slot button
function SlotButton.setIcon(self: ClassType, image: string)
	self._instance.icon.Image = image
end

-- Sets the tooltip text of the slot button
function SlotButton.setTooltip(self: ClassType, text: string)
	self._instance.tooltip.Text = text
end

-- Sets the (number) hint text of the slot button
function SlotButton.setHint(self: ClassType, hint: string)
	self._instance.hint.Text = tostring(hint)
end

-- Sets the parent of the slot button
function SlotButton.setParent(self: ClassType, parent: GuiBase2d?)
	self._instance.button.Parent = parent
end

return SlotButton
