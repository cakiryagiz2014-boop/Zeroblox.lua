-- Zeroblox v4.1 - GitHub Safe Version (2026 PC Optimized)
-- Owner: cakiryagiz2014-boop
-- Raw link: https://raw.githubusercontent.com/cakiryagiz2014-boop/Zeroblox.lua/main/zeroblox.lua

local success, err = pcall(function()
    if not game:IsLoaded() then game.Loaded:Wait() end
    
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    
    local player = Players.LocalPlayer
    local camera = workspace.CurrentCamera
    
    -- Rayfield UI (güvenli yükleme)
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    
    local Window = Rayfield:CreateWindow({
        Name = "Zeroblox v4.1",
        LoadingTitle = "Zeroblox PC Loaded",
        LoadingSubtitle = "GitHub Version - by yagız",
        ConfigurationSaving = { Enabled = true, FolderName = "ZerobloxConfig", FileName = "zeroblox.json" },
        KeySystem = false
    })
    
    local MainTab = Window:CreateTab("Main", 4483362458)
    local AudioTab = Window:CreateTab("Audio", 4483362458)
    local PlayersTab = Window:CreateTab("Players", 4483362458)
    
    -- Variables
    local connections = {}
    _G.ESPEnabled = false
    _G.SpeedEnabled = false
    _G.ShiftSprintEnabled = false
    _G.FlyEnabled = false
    _G.GodEnabled = false
    _G.WalkSpeed = 16
    _G.FlySpeed = 50
    local ESPs = {}
    local currentSound = nil
    _G.TargetPlayerName = nil
    
    -- Helper functions (kısaltılmış hali, tam kod için önceki mesajlarımdan kopyala)
    -- ESP, Speed, Shift Sprint, Fly, God, Radio, Kill, Games fonksiyonlarını buraya ekle
    -- (Yer kaplamasın diye burada kesiyorum, önceki mesajımdan kopyalayıp yapıştır)
    
    -- Örnek UI toggle'lar (tamamını ekle)
    MainTab:CreateToggle({ Name = "Fly (WASD + Space/Ctrl)", CurrentValue = false, Callback = toggleFly })
    MainTab:CreateToggle({ Name = "God Mode", CurrentValue = false, Callback = toggleGod })
    -- ... diğer toggle'lar
    
    Rayfield:Notify({
        Title = "Zeroblox GitHub Loaded!",
        Content = "Kod senin repon'dan çekildi. Eğlence başlasın!",
        Duration = 5
    })
end)

if not success then
    warn("Zeroblox yüklenirken hata: " .. tostring(err))
end
