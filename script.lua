local InsertService = game:GetService("InsertService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Kendi Model ID'ni buraya yaz
local modelId = 10017660726 

-- Ekranda hata göstermek için ScreenGui oluşturalım
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DebugGui"
screenGui.Parent = game.CoreGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 400, 0, 50)
textLabel.Position = UDim2.new(0.5, -200, 0.1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 14
textLabel.Font = Enum.Font.Code
textLabel.Text = "Model yükleniyor..."
textLabel.Parent = screenGui

local success, result = pcall(function()
    return InsertService:LoadAsset(modelId)
end)

if success and result then
    textLabel.Text = "Başarılı! Model indirildi."
    textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    result.Parent = workspace
    
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        result:MoveTo(char.HumanoidRootPart.Position + Vector3.new(0, 0, -5))
    end
    
    task.wait(3)
    screenGui:Destroy()
else
    -- Hatanın ne olduğunu ekranda koca koca gösterelim
    textLabel.Size = UDim2.new(0, 600, 0, 100)
    textLabel.Text = "HATA: " .. tostring(result)
    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
end
