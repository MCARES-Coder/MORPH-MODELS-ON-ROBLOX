-- Oyuncunun arayüzüne doğrudan yazdıralım ki ekranda kesin görebilelim
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Eski test varsa sil
if PlayerGui:FindFirstChild("TestGui") then
    PlayerGui.TestGui:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TestGui"
screenGui.Parent = PlayerGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 400, 0, 80)
textLabel.Position = UDim2.new(0.5, -200, 0.2, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
textLabel.TextSize = 18
textLabel.Font = Enum.Font.GothamBold
textLabel.Text = "Script Basariyla Calisti!"
textLabel.Parent = screenGui

print("Script calisti ve yazi eklendi!")
