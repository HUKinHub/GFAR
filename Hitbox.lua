-- โหลด Orion UI Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "HitBox Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "HitBoxConfig"})

-- บริการของ Roblox
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ค่าตัวแปรหลัก
local HitBoxEnabled = false
local HitBoxSize = 10
local HitBoxTransparency = 0.7

-- สร้าง Tab เมนู
local MainTab = Window:MakeTab({
	Name = "Main Features",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- 1. ปุ่มเปิด-ปิด (Toggle)
MainTab:AddToggle({
	Name = "Enable HitBox",
	Default = false,
	Callback = function(Value)
		HitBoxEnabled = Value
		-- ถ้าระบุปิด ให้รีเซ็ตขนาดผู้เล่นทุกคนกลับเป็นปกติ
		if not Value then
			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					local hrp = player.Character.HumanoidRootPart
					hrp.Size = Vector3.new(2, 2, 1) -- ขนาดมาตรฐาน Roblox
					hrp.Transparency = 1 -- ซ่อนตามปกติ
				end
			end
		end
	end    
})

-- 2. แถบปรับขนาด (Slider)
MainTab:AddSlider({
	Name = "HitBox Size",
	Min = 2,
	Max = 50,
	Default = 10,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "Studs",
	Callback = function(Value)
		HitBoxSize = Value
	end    
})

-- 3. แถบปรับความใส (Transparency Slider)
MainTab:AddSlider({
	Name = "HitBox Transparency",
	Min = 0,
	Max = 1,
	Default = 0.7,
	Color = Color3.fromRGB(255, 0, 0),
	Increment = 0.1,
	ValueName = "Alpha",
	Callback = function(Value)
		HitBoxTransparency = Value
	end    
})

-- ลูปทำงานหลัก (รองรับการขึ้นรถ ไม่ค้าง)
task.spawn(function()
	while task.wait(0.3) do
		if HitBoxEnabled then
			pcall(function()
				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= LocalPlayer then
						local character = player.Character
						if character and character:FindFirstChild("HumanoidRootPart") then
							local hrp = character.HumanoidRootPart
							
							-- ปรับขนาดและคุณสมบัติ
							hrp.Size = Vector3.new(HitBoxSize, HitBoxSize, HitBoxSize)
							hrp.Transparency = HitBoxTransparency
							hrp.BrickColor = BrickColor.new("Really red")
							hrp.Material = Enum.Material.Neon
							
							-- สำคัญ: ปิด CanCollide เพื่อไม่ให้ HitBox ไปดันตัวถังรถจนรถค้าง
							hrp.CanCollide = false
						end
					end
				end
			end)
		end
	end
end)

OrionLib:Init()
