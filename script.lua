-- Servisler
local Players = game:GetService("Players")
local InsertService = game:GetService("InsertService")
local LocalPlayer = Players.LocalPlayer

-- BURAYA KENDİ MODELİNİN ASSET ID'SİNİ YAZ (Örn: 123456789)
local modelId = 10017660726 

local function spawnSCP()
    local success, asset = pcall(function()
        return InsertService:LoadAsset(modelId)
    end)
    
    if success and asset then
        asset.Parent = workspace
        
        -- Karakterin önüne yerleştirme
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local rootPart = char.HumanoidRootPart
            
            -- Modelin içindeki parçaları/modeli oyuncunun önüne taşı
            for _, child in ipairs(asset:GetChildren()) do
                if child:IsA("Model") or child:IsA("BasePart") then
                    if asset.PrimaryPart then
                        asset:SetPrimaryPartCFrame(rootPart.CFrame * CFrame.new(0, 0, -5))
                    elseif child:IsA("BasePart") then
                        child.CFrame = rootPart.CFrame * CFrame.new(0, 0, -5)
                    end
                end
            end
        end
        print("SCP Başarıyla Çağrıldı!")
    else
        warn("Model yüklenemedi! ID'yi veya modelin izinlerini kontrol et.")
    end
end

-- Fonksiyonu çalıştır
spawnSCP()
