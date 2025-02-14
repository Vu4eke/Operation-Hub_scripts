local Luna = loadstring(game:HttpGet("https://paste.ee/r/WSCKThwW", true))()
local configFile = "Hanslo.json"
local userId = game.Players.LocalPlayer.UserId
local config = {
    itemESPEnabled = false
}




local Window = Luna:CreateWindow({
    Name = "Hanslo-AI",
    Subtitle = nil,
    LogoID = "90804827107744",
    LoadingEnabled = true,
    LoadingTitle = "By Selene Rewrite",
    LoadingSubtitle = "Jujutsu Infinite",

    ConfigSettings = {
		RootFolder = nil, 
		ConfigFolder = "Hanslo-AI" 
    },
})

Window:CreateHomeTab({
	SupportedExecutors = {}, -- A Table Of Executors Your Script Supports. Add strings of the executor names for each executor.
	DiscordInvite = "pFT7qnRzgn",
	Icon = 1, -- By Default, The Icon Is The Home Icon. If You would like to change it to dashboard, replace the interger with 2
})



local Settings = Window:CreateTab({
    Name = "Settings",
    Icon = "settings",
    ImageSource = "Material",
    ShowTitle = true
})

-- ESP Settings
local ESPEnabled = false
local blacklistedItems = {"Chest"} -- Blacklist
local ESPFolder = Instance.new("Folder", game.CoreGui) -- Store ESP drawings

-- Utility Functions
local function createESP(model)
    -- Get the Root part of the model
    local rootPart = model:FindFirstChild("Root")
    if not rootPart then return end

    -- Create BillboardGui
    local billboard = Instance.new("BillboardGui", ESPFolder)
    billboard.Adornee = rootPart
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel", billboard)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.TextScaled = true
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.Font = Enum.Font.GothamBold

    -- Update Text and Distance
    spawn(function()
        while ESPEnabled and model.Parent do
            local playerRoot = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if playerRoot then
                local distance = math.floor((playerRoot.Position - rootPart.Position).Magnitude)
                textLabel.Text = string.format("%s\n(%d studs)", model.Name, distance)
            end
            task.wait(0.1)
        end
        billboard:Destroy()
    end)
end

local function toggleESP(enabled)
    ESPEnabled = enabled
    if ESPEnabled then
        for _, model in pairs(workspace.Objects.Drops:GetChildren()) do
            if not table.find(blacklistedItems, model.Name) and model:IsA("Model") then
                createESP(model)
            end
        end
        -- Notify
        Luna:Notification({
            Title = "ESP Enabled",
            Icon = "notifications_active",
            ImageSource = "Material",
            Content = "Item ESP has been enabled."
        })
    else
        -- Clear ESP
        ESPFolder:ClearAllChildren()
        -- Notify
        Luna:Notification({
            Title = "ESP Disabled",
            Icon = "notifications_off",
            ImageSource = "Material",
            Content = "Item ESP has been disabled."
        })
    end
end

-- Watch for New Items
workspace.Objects.Drops.ChildAdded:Connect(function(child)
    if ESPEnabled and not table.find(blacklistedItems, child.Name) and child:IsA("Model") then
        createESP(child)
    end
end)

-- Create Toggle
local Toggle = Settings:CreateToggle({
    Name = "Enable Item ESP",
    Description = "Toggle the item ESP feature to display item distances and names.",
    Callback = function(Value)
        toggleESP(Value) 
    end
})
