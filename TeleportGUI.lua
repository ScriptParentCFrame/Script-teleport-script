-- GUI Oluşturma
local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "TeleportGui"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0

local xBox = Instance.new("TextBox", frame)
xBox.Size = UDim2.new(0, 90, 0, 30)
xBox.Position = UDim2.new(0, 10, 0, 10)
xBox.PlaceholderText = "X"
xBox.Text = ""

local yBox = Instance.new("TextBox", frame)
yBox.Size = UDim2.new(0, 90, 0, 30)
yBox.Position = UDim2.new(0, 105, 0, 10)
yBox.PlaceholderText = "Y"
yBox.Text = ""

local zBox = Instance.new("TextBox", frame)
zBox.Size = UDim2.new(0, 90, 0, 30)
zBox.Position = UDim2.new(0, 200, 0, 10)
zBox.PlaceholderText = "Z"
zBox.Text = ""

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(1, -20, 0, 40)
button.Position = UDim2.new(0, 10, 0, 50)
button.Text = "IŞINLA!"
button.BackgroundColor3 = Color3.fromRGB(100, 255, 100)

button.MouseButton1Click:Connect(function()
	local x = tonumber(xBox.Text)
	local y = tonumber(yBox.Text)
	local z = tonumber(zBox.Text)
	if x and y and z then
		local char = game.Players.LocalPlayer.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			char.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
		end
	end
end)

-- Sürüklenebilirlik kodu
local UserInputService = game:GetService("UserInputService")

local dragging = false
local dragInput = nil
local dragStart = nil
local startPos = nil

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or
       input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or
       input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)
