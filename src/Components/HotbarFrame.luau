--!strict

--[[
	Hotbar frame which holds the slot buttons and hints.
]]

local HotbarFrame = {}
HotbarFrame.__index = HotbarFrame

export type ClassType = typeof(setmetatable(
	{} :: {
		_instance: {
			hotbar: Frame,
		},
	},
	HotbarFrame
))

function HotbarFrame.new(): ClassType
	local frameInstance = Instance.new("Frame")
	frameInstance.Name = "Hotbar"
	frameInstance:AddTag("Hotbar")

	local self = setmetatable({
		_instance = {
			hotbar = frameInstance,
		},
	}, HotbarFrame)

	return self
end

function HotbarFrame.destroy(self: ClassType)
	self._instance.hotbar:Destroy()
end

function HotbarFrame.setVisible(self: ClassType, visible: boolean)
	self._instance.hotbar.Visible = visible
end

function HotbarFrame.setParent(self: ClassType, parent: GuiBase2d?)
	self._instance.hotbar.Parent = parent
end

return HotbarFrame
