-- Zeroblox v4.1 - Otomatik Sistem
-- Owner: cakiryagiz2014-boop
-- Bu kodu GitHub'daki Zeroblox.lua içine yapıştır.

local success, err = pcall(function()
    if not game:IsLoaded() then game.Loaded:Wait() end
    
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    
    local Window = Rayfield:CreateWindow({
        Name = "Zeroblox v4.1",
        LoadingTitle = "Zeroblox Sistemi Başlatılıyor...",
        LoadingSubtitle = "by yagız",
        ConfigurationSaving = { Enabled = true, FolderName = "ZerobloxConfig", FileName = "zeroblox.json" },
        KeySystem = false
    })
    
    local MainTab = Window:CreateTab("Main", 4483362458)
    
    -- --- FONKSİYONLAR ---
    
    _G.WalkSpeed = 16
    local function applySpeed()
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = _G.WalkSpeed
        end
    end

    -- Karakter her doğduğunda hızı tekrar uygula (Otomatik sistem)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        applySpeed()
    end)

    local flying = false
    local function toggleFly(state)
        flying = state
        local char = player.Character
        if not char then return end
        local root = char:WaitForChild("HumanoidRootPart")
        
        if flying then
            local bv = Instance.new("BodyVelocity", root)
            bv.Name = "ZerobloxFly"
            bv.MaxForce = Vector3.new(1,1,1) * 10^6
            bv.Velocity = Vector3.new(0,0,0)
            
            task.spawn(function()
                while flying and root and bv.Parent do
                    bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
                    task.wait()
                end
                if bv then bv:Destroy() end
            end)
        end
    end

    -- --- UI ELEMENTLERİ ---

    MainTab:CreateSlider({
        Name = "Hız Ayarı",
        Range = {16, 300},
        Increment = 1,
        CurrentValue = 16,
        Callback = function(Value)
            _G.WalkSpeed = Value
            applySpeed()
        end,
    })

    MainTab:CreateToggle({
        Name = "Uçuş Modu (Fly)",
        CurrentValue = false,
        Callback = function(Value)
            toggleFly(Value)
        end,
    })

    Rayfield:Notify({
        Title = "Sistem Hazır!",
        Content = "Zeroblox başarıyla GitHub'dan çekildi.",
        Duration = 5
    })
end)

if not success then
    warn("Zeroblox Yükleme Hatası: " .. tostring(err))
end
