local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local HitBoxEnabled = false
local HitBoxSize = 10
local HitBoxTransparency = 0.7

-- สร้าง UI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ToggleBtn = Instance.new("TextButton")
local SizeBtn = Instance.new("TextButton")

ScreenGui.Name = "HitboxGui"
ScreenGui.Parent = game:GetService("CoreGui")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Position = UDim2.new(0.05, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 140)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Hitbox Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

ToggleBtn.Parent = MainFrame
ToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
ToggleBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
ToggleBtn.Size = UDim2.new(0.8, 0, 0, 35)
ToggleBtn.Font = Enum.Font.SourceSans
ToggleBtn.Text = "Hitbox: OFF"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 16

SizeBtn.Parent = MainFrame
SizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SizeBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
SizeBtn.Size = UDim2.new(0.8, 0, 0, 35)
SizeBtn.Font = Enum.Font.SourceSans
SizeBtn.Text = "Size: " .. tostring(HitBoxSize)
SizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SizeBtn.TextSize = 16

ToggleBtn.MouseButton1Click:Connect(function()
	HitBoxEnabled = not HitBoxEnabled
	if HitBoxEnabled then
		ToggleBtn.Text = "Hitbox: ON"
		ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
	else
		ToggleBtn.Text = "Hitbox: OFF"
		ToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local hrp = player.Character.HumanoidRootPart
				hrp.Size = Vector3.new(2, 2, 1)
				hrp.Transparency = 1
			end
		end
	end
end)

SizeBtn.MouseButton1Click:Connect(function()
	HitBoxSize = HitBoxSize + 5
	if HitBoxSize > 30 then
		HitBoxSize = 5
	end
	SizeBtn.Text = "Size: " .. tostring(HitBoxSize)
end)

task.spawn(function()
	while task.wait(0.3) do
		if HitBoxEnabled then
			pcall(function()
				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
						local hrp = player.Character.HumanoidRootPart
						hrp.Size = Vector3.new(HitBoxSize, HitBoxSize, HitBoxSize)
						hrp.Transparency = HitBoxTransparency
						hrp.BrickColor = BrickColor.new("Really red")
						hrp.Material = Enum.Material.Neon
						hrp.CanCollide = false
					end
				end
			end)
		end
	end
end)
