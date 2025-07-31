local player = game.Players.LocalPlayer

-- GUI oluştur
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "TeleportGUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 200)
frame.Position = UDim2.new(0.05, 0, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "GizliBlox Teleport GUI"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20

-- X Girişi
local xBox = Instance.new("TextBox", frame)
xBox.PlaceholderText = "X Koordinatı"
xBox.Position = UDim2.new(0, 10, 0, 40)
xBox.Size = UDim2.new(1, -20, 0, 30)
xBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
xBox.TextColor3 = Color3.new(1,1,1)
xBox.Font = Enum.Font.SourceSans
xBox.TextSize = 16
xBox.ClearTextOnFocus = false

-- Y Girişi
local yBox = xBox:Clone()
yBox.Parent = frame
yBox.Position = UDim2.new(0, 10, 0, 80)
yBox.PlaceholderText = "Y Koordinatı"

-- Z Girişi
local zBox = xBox:Clone()
zBox.Parent = frame
zBox.Position = UDim2.new(0, 10, 0, 120)
zBox.PlaceholderText = "Z Koordinatı"

-- Işınla Butonu
local tpButton = Instance.new("TextButton", frame)
tpButton.Text = "IŞINLA"
tpButton.Position = UDim2.new(0.5, -50, 1, -40)
tpButton.Size = UDim2.new(0, 100, 0, 30)
tpButton.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
tpButton.TextColor3 = Color3.new(1,1,1)
tpButton.Font = Enum.Font.SourceSansBold
tpButton.TextSize = 18

-- Işınlama Fonksiyonu
tpButton.MouseButton1Click:Connect(function()
	local x = tonumber(xBox.Text)
	local y = tonumber(yBox.Text)
	local z = tonumber(zBox.Text)
	
	if x and y and z then
		local char = player.Character or player.CharacterAdded:Wait()
		local root = char:WaitForChild("HumanoidRootPart")
		root.CFrame = CFrame.new(x, y, z)
	end
end)
