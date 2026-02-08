-- Zeroblox v4.1 - Full Functional Version
-- Owner: cakiryagiz2014-boop

local success, err = pcall(function()
    if not game:IsLoaded() then game.Loaded:Wait() end
    
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    
    local Window = Rayfield:CreateWindow({
        Name = "Zeroblox v4.1",
        LoadingTitle = "Zeroblox PC Loaded",
        LoadingSubtitle = "by yagız",
        ConfigurationSaving = { Enabled = true, FolderName = "ZerobloxConfig", FileName = "zeroblox.json" },
        KeySystem = false
    })
    
    local MainTab = Window:CreateTab("Main", 4483362458)
    
    -- --- ASIL FONKSİYONLAR BURADA BAŞLIYOR ---
    
    -- Speed (Hız) Fonksiyonu
    local function setSpeed(value)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = value
        end
    end

    -- Fly (Uçma) Değişkenleri
    local flying = false
    local function toggleFly(state)
        flying = state
        local char = player.Character
        local hum = char:WaitForChild("Humanoid")
        local root = char:WaitForChild("HumanoidRootPart")
        
        if flying then
            local bv = Instance.new("BodyVelocity", root)
            bv.Name = "ZerobloxFly"
            bv.MaxForce = Vector3.new(1,1,1) * 10^6
            bv.Velocity = Vector3.new(0,0,0)
            
            task.spawn(function()
                while flying do
                    bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
                    task.wait()
                end
                bv:Destroy()
            end)
        end
    end

    -- --- UI ELEMENTLERİ ---

    MainTab:CreateSlider({
        Name = "WalkSpeed (Hız)",
        Range = {16, 300},
        Increment = 1,
        Suffix = "Speed",
        CurrentValue = 16,
        Callback = function(Value)
            setSpeed(Value)
        end,
    })

    MainTab:CreateToggle({
        Name = "Fly (Uçma)",
        CurrentValue = false,
        Callback = function(Value)
            toggleFly(Value)
        end,
    })

    Rayfield:Notify({
        Title = "Zeroblox Aktif!",
        Content = "Tüm fonksiyonlar yüklendi.",
        Duration = 5
    })
end)

if not success then
    warn("Hata: " .. tostring(err))
end
