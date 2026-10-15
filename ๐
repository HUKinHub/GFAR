--[[
    ================================================================================
    ☁️ [QZXHUB] ULTIMATE MULTI-MAP HUB (Maru-Style Structure)
    📌 รองรับ: Fisch, Westbound, War Tycoon, Steal an Egg และ Universal
    ================================================================================
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TeleportService = game:GetService("TeleportService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId

-- ป้องกันการรันซ้ำ
if CoreGui:FindFirstChild("QZXHUB_Ultimate") then CoreGui.QZXHUB_Ultimate:Destroy() end
if LocalPlayer.PlayerGui:FindFirstChild("QZXHUB_Ultimate") then LocalPlayer.PlayerGui["QZXHUB_Ultimate"]:Destroy() end

--------------------------------------------------------------------------------
-- 1. สร้าง UI หน้าต่างหลัก (Universal Window)
--------------------------------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "QZXHUB_Ultimate"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = (gethui and gethui()) or CoreGui or LocalPlayer:WaitForChild("PlayerGui")

-- ปุ่มเปิด/ปิด โลโก้กลมลากได้
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(0, 20, 0.3, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Text = "QZX"
ToggleBtn.Font = Enum.Font.FredokaOne
ToggleBtn.TextSize = 16
ToggleBtn.Active = true
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local tCorner = Instance.new("UICorner")
tCorner.CornerRadius = UDim.new(1, 0)
tCorner.Parent = ToggleBtn

local tStroke = Instance.new("UIStroke")
tStroke.Thickness = 2.5
tStroke.Color = Color3.fromRGB(100, 150, 255)
tStroke.Parent = ToggleBtn

-- Main Window Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 360)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local mCorner = Instance.new("UICorner")
mCorner.CornerRadius = UDim.new(0, 14)
mCorner.Parent = MainFrame

local mStroke = Instance.new("UIStroke")
mStroke.Thickness = 1.5
mStroke.Color = Color3.fromRGB(40, 40, 60)
mStroke.Parent = MainFrame

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
Header.Parent = MainFrame

local hCorner = Instance.new("UICorner")
hCorner.CornerRadius = UDim.new(0, 14)
hCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -20, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.FredokaOne
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- ตรวจจับแมพเพื่อแสดงชื่อบนหัว Hub
local currentMapName = "Universal Hub"
local FischID = 16732694052      -- ตัวอย่าง PlaceId Fisch
local WestboundID = 2377868063   -- ตัวอย่าง Westbound
local WarTycoonID = 6068496247   -- ตัวอย่าง War Tycoon
local StealEggID = 0000000000    -- ใส่ PlaceId แมพ Steal an egg ของคุณ

if PlaceId == FischID then
    currentMapName = "Fisch - Pro Edition"
elseif PlaceId == WestboundID then
    currentMapName = "Westbound - Combat Edition"
elseif PlaceId == WarTycoonID then
    currentMapName = "War Tycoon - Dominance"
else
    currentMapName = "Universal Mode (All Games)"
end

Title.Text = "☁️ QZXHUB | " .. currentMapName

-- Container ใส่ฟังก์ชัน
local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(1, -20, 1, -60)
Container.Position = UDim2.new(0, 10, 0, 52)
Container.BackgroundTransparency = 1
Container.ScrollBarThickness = 4
Container.Parent = MainFrame

local cLayout = Instance.new("UIListLayout")
cLayout.Padding = UDim.new(0, 8)
cLayout.Parent = Container

local function CreateActionBtn(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
    btn.TextColor3 = Color3.fromRGB(240, 240, 255)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.Parent = Container

    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(0, 8)
    bCorner.Parent = btn

    btn.MouseButton1Click:Connect(callback)
end

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

--------------------------------------------------------------------------------
-- 2. ระบบฟังก์ชันแยกตาม PlaceId แบบจัดเต็ม
--------------------------------------------------------------------------------

-- ถ้าอยู่แมพ Fisch
if PlaceId == FischID then
    CreateActionBtn("🎣 [Fisch] Auto Shake (ออโต้เขย่าเบ็ด)", function()
        task.spawn(function()
            while task.wait(0.1) do
                pcall(function()
                    local pg = LocalPlayer:FindFirstChild("PlayerGui")
                    if pg and pg:FindFirstChild("shakeui") then
                        local btn = pg.shakeui.safezone.button
                        if btn and btn.Visible then
                            for _, conn in pairs(getconnections(btn.MouseButton1Click)) do
                                conn:Fire()
                            end
                        end
                    end
                end)
            end
        end)
    end)

-- ถ้าอยู่แมพ Westbound
elseif PlaceId == WestboundID then
    CreateActionBtn("🤠 [Westbound] ESP Highlight Players (มองทะลุกำแพง)", function()
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and not p.Character:FindFirstChild("Highlight") then
                local hl = Instance.new("Highlight")
                hl.FillColor = Color3.fromRGB(255, 50, 50)
                hl.Parent = p.Character
            end
        end
    end)

-- ถ้าอยู่แมพ War Tycoon
elseif PlaceId == WarTycoonID then
    CreateActionBtn("⚔️ [War Tycoon] Head Hitbox Expander (หัวโตยิงง่าย)", function()
        task.spawn(function()
            while task.wait(0.5) do
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                        p.Character.Head.Size = Vector3.new(9, 9, 9)
                        p.Character.Head.Transparency = 0.5
                        p.Character.Head.CanCollide = false
                    end
                end
            end
        end)
    end)

-- แมพ Steal an egg
elseif PlaceId == StealEggID then
    CreateActionBtn("🥚 [Steal an Egg] Auto Collect / Farm (ออโต้เก็บไข่)", function()
        task.spawn(function()
            while task.wait(0.2) do
                pcall(function()
                    for _, obj in ipairs(Workspace:GetDescendants()) do
                        if obj:IsA("TouchTransmitter") and obj.Parent then
                            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj.Parent, 0)
                            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj.Parent, 1)
                        end
                    end
                end)
            end
        end)
    end)
end

--------------------------------------------------------------------------------
-- 3. ระบบ Universal (ใช้งานได้ทุกแมพ)
--------------------------------------------------------------------------------
CreateActionBtn("🚀 เพิ่มความเร็วเดิน (WalkSpeed 100)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end
end)

CreateActionBtn("🦘 กระโดดสูงพิเศษ (JumpPower 150)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.UseJumpPower = true
        LocalPlayer.Character.Humanoid.JumpPower = 150
    end
end)

CreateActionBtn("👁️ ESP มองเห็นผู้เล่นทั่วแมพ (Universal ESP)", function()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and not p.Character:FindFirstChild("QZX_ESP") then
            local hl = Instance.new("Highlight")
            hl.Name = "QZX_ESP"
            hl.FillColor = Color3.fromRGB(0, 180, 255)
            hl.Parent = p.Character
        end
    end
end)

CreateActionBtn("🔄 รีเซิร์ฟเวอร์เดิม (Rejoin Server)", function()
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)

print("QZXHUB Ultimate Hub Loaded Successfully!")
