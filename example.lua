local DonLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/donhubroblox/donhubroblox/refs/heads/main/donhubui"))()

-- Create Window
local Window = DonLib:CreateWindow({
    Name = "DonHub Premium",
    Subtitle = "v2.0 - The Ultimate Script",
    Icon = "🎮"
})

-- Create Tabs
local MainTab = Window:CreateTab({
    Name = "Main",
    Icon = "⚡"
})

local SettingsTab = Window:CreateTab({
    Name = "Settings",
    Icon = "⚙️"
})

-- Main Tab Elements
MainTab:CreateSection("Auto Farm")

MainTab:CreateToggle({
    Name = "Auto Collect Money",
    Default = false,
    Callback = function(value)
        print("Auto Collect:", value)
        Window:Notify({
            Title = "Auto Collect",
            Message = value and "Enabled!" or "Disabled!",
            Icon = "💰",
            Duration = 3
        })
    end
})

MainTab:CreateToggle({
    Name = "Auto Equip Best Brainrot",
    Default = false,
    Callback = function(value)
        print("Auto Equip:", value)
    end
})

MainTab:CreateDivider()

MainTab:CreateSection("Teleports")

-- MULTI-SELECT DROPDOWN - Perfect for eggs/locations!
MainTab:CreateMultiDropdown({
    Name = "Auto Farm Locations",
    Options = {"Spawn", "Shop", "Secret Area", "Boss Arena", "Egg Room", "VIP Zone"},
    Default = {"Spawn"},
    Callback = function(selected)
        print("Farming locations:", table.concat(selected, ", "))
        Window:Notify({
            Title = "Locations Updated",
            Message = #selected .. " locations selected",
            Icon = "📍",
            Duration = 2
        })
    end
})

MainTab:CreateMultiDropdown({
    Name = "Auto Open Eggs",
    Options = {"Basic Egg", "Golden Egg", "Diamond Egg", "Mythic Egg", "Legendary Egg"},
    Default = {},
    Callback = function(selected)
        print("Opening eggs:", table.concat(selected, ", "))
    end
})

MainTab:CreateDivider()

MainTab:CreateSection("Character")

MainTab:CreateSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Increment = 1,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

MainTab:CreateSlider({
    Name = "Jump Power",
    Min = 50,
    Max = 300,
    Default = 50,
    Increment = 5,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

-- Settings Tab
SettingsTab:CreateSection("UI Settings")

SettingsTab:CreateColorPicker({
    Name = "UI Accent Color",
    Default = Color3.fromRGB(100, 100, 255),
    Callback = function(color)
        print("Color changed:", color)
    end
})

SettingsTab:CreateKeybind({
    Name = "Toggle UI",
    Default = Enum.KeyCode.RightShift,
    Callback = function(key)
        print("Keybind set to:", key.Name)
    end,
    OnPress = function()
        print("UI Toggle pressed!")
    end
})

SettingsTab:CreateDivider()

SettingsTab:CreateSection("Info")

SettingsTab:CreateLabel("DonHub v2.0 - Made by Connor")
SettingsTab:CreateLabel("Thanks for using DonHub! 🎮")

local progressBar = SettingsTab:CreateProgressBar({
    Name = "Script Load Progress",
    Default = 0
})

-- Simulate loading
spawn(function()
    for i = 0, 100, 5 do
        progressBar:Set(i / 100)
        task.wait(0.1)
    end
end)

SettingsTab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Window:Destroy()
    end
})

-- Test Notification
Window:Notify({
    Title = "Welcome!",
    Message = "DonHub loaded successfully!",
    Icon = "✨",
    Color = Color3.fromRGB(100, 255, 100),
    Duration = 5
})
