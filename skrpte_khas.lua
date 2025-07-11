wait(0.1)
game.StarterGui:SetCore("SendNotification", {
    Title = "تنبيه!";
    Text = "المطورين غير مسؤول عند تصرفاتك"; -- ARAB TEAM --
    Duration = 5;
})





local OrionLib = 
loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()
local Players = game:GetService("Players")
local Camera = game.Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local TargetedPlayerName = ""

local Window = OrionLib:MakeWindow({
    Name = "سكربت تخريب شاليه محمد   ",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "SMLT",
    Theme = "Midnight"
})

local TargetTab = Window:MakeTab({
    Name = "الاستهداف",
    Icon = "rbxassetid://6031277600",
    PremiumOnly = false
})

TargetTab:AddTextbox({
    Name = "اكتب أول حروف اسم اللاعب",
    Default = "",
    TextDisappear = false,
    Callback = function(txt)
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and string.sub(plr.Name:lower(), 1, #txt) == txt:lower() then
                TargetedPlayerName = plr.Name
                OrionLib:MakeNotification({
                    Name = "تم الاستهداف",
                    Content = "استهدف هاذا كلاب شاليه محمد: " .. TargetedPlayerName,
                    Image = "rbxassetid://6031280882",
                    Time = 4
                })
                return
            end
        end
        TargetedPlayerName = ""
        OrionLib:MakeNotification({
            Name = "مافيه يوزر موجود ب السيرفر زي كذا",
            Content = "تأكد كاتب اليوزر صح!.",
            Image = "rbxassetid://6031071050",
            Time = 4
        })
    end
})

TargetTab:AddButton({
    Name = "تصغير اللاعب",
    Callback = function()
        if TargetedPlayerName ~= "" then
            game:GetService("Players"):Chat("/size " .. TargetedPlayerName .. " 0")
        end
    end
})

TargetTab:AddButton({
    Name = "وصخ تغيير الشكل",
    Callback = function()
        if TargetedPlayerName ~= "" then
            game:GetService("Players"):Chat("/char " .. TargetedPlayerName .. " miri")
        end
    end
})

TargetTab:AddToggle({
    Name = "تخريب",
    Default = false,
    Callback = function(state)
        if TargetedPlayerName ~= "" then
            if state then
                game:GetService("Players"):Chat("/size " .. TargetedPlayerName .. " 0")
                wait(0.2)
                game:GetService("Players"):Chat("/sit " .. TargetedPlayerName)
                wait(0.2)
                game:GetService("Players"):Chat("/titlepk " .. TargetedPlayerName .. " مهان السيرفر")
            end
        end
    end
})

local spectating = false
TargetTab:AddToggle({
    Name = "تشوف اللاعب",
    Default = false,
    Callback = function(state)
        spectating = state
        if state then
            if TargetedPlayerName ~= "" and Players:FindFirstChild(TargetedPlayerName) then
                local targetChar = Players[TargetedPlayerName].Character
                if targetChar and targetChar:FindFirstChild("Humanoid") then
                    Camera.CameraSubject = targetChar.Humanoid
                end
            end
        else
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                Camera.CameraSubject = LocalPlayer.Character.Humanoid
            end
        end
    end
})

local PlayerTab = Window:MakeTab({
    Name = " اللاعب والتخريب",
    Icon = "rbxassetid://6031302912",
    PremiumOnly = false
})

PlayerTab:AddTextbox({
    Name = "سرعة اللاعب (10 - 500)",
    Default = "16",
    TextDisappear = true,
    Callback = function(value)
        local speed = tonumber(value)
        if speed and speed >= 10 and speed <= 500 then
            LocalPlayer.Character.Humanoid.WalkSpeed = speed
        else
            OrionLib:MakeNotification({
                Name = "غلط حبي",
                Content = "اكتب رقم بين 10 و 500",
                Image = "rbxassetid://6031071050",
                Time = 3
            })
        end
    end
})

PlayerTab:AddTextbox({
    Name = "قوة القفز (10 - 500)",
    Default = "50",
    TextDisappear = true,
    Callback = function(value)
        local jump = tonumber(value)
        if jump and jump >= 10 and jump <= 500 then
            LocalPlayer.Character.Humanoid.JumpPower = jump
        else
            OrionLib:MakeNotification({
                Name = "حط السرعه",
                Content = "اكتب رقم بين 10 و 500",
                Image = "rbxassetid://6031071050",
                Time = 3
            })
        end
    end
})

PlayerTab:AddButton({
    Name = "تخريب اللاعبين القريبين",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 40 then --   
                    game:GetService("Players"):Chat("/size " .. player.Name .. " 0")
                    wait(0.2)
                end
            end
        end
    end
})

PlayerTab:AddButton({
    Name = "تغيير سكنات القريبين  ",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 30 then --   
                    game:GetService("Players"):Chat("/char " .. player.Name .. " msgirl")
                    wait(0.2)
                end
            end
        end
    end
})

PlayerTab:AddButton({
    Name = "تغير اساميهم",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 40 then
                    game:GetService("Players"):Chat("/titlepk " .. player.Name .. " كلاب شاليه محمد ")
                    wait(0.2)
                end
            end
        end
    end
})

PlayerTab:AddButton({
    Name = "تغيير أسمائهم 2",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 40 then -- تقدر تغير المسافة هنا
                    game:GetService("Players"):Chat("/titlepk " .. player.Name .. " افضل سكربت تخريب؟ ")
                    wait(0.2)
                end
            end
        end
    end
})

PlayerTab:AddButton({
    Name = "القريبين منك  (Re)",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 30 then
                    game:GetService("Players"):Chat("/re " .. player.Name)
                    wait(0.2)
                end
            end
        end
    end
})

PlayerTab:AddButton({
    Name = "تكبير لاعبين قريبين",
    Callback = function()
        local count = 0
        for _, player in ipairs(Players:GetPlayers()) do
            if count >= 2 then break end
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 39 then --  المسافة
                    game:GetService("Players"):Chat("/size " .. player.Name .. " 2")
                    count = count + 1
                    wait(0.2)
                end
            end
        end
    end
})


-- 
PlayerTab:AddTextbox({
    Name = "اكتب اسم السكن",
    Default = "اكتب الاسكن هنا عشان تغير اسكنات القربين منك",
    TextDisappear = false,
    Callback = function(value)
        chosenSkin = value
    end
})

PlayerTab:AddButton({
    Name = "إضغط هنا عشان تفعل الي فوق",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 40 then
                    Players:Chat("/char " .. player.Name .. " " .. chosenSkin)
                    wait(0.2)
                end
            end
        end
    end
})

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local GameID = game.PlaceId

--     ""
local OtherTab = Window:MakeTab({
    Name = "أخرى",
    Icon = "rbxassetid://6031094678",
    PremiumOnly = false
})

--   
OtherTab:AddButton({
    Name = "نسخ حسابي تيك توك",
    Callback = function()
        setclipboard("ipur_1")
    end
})

--     
OtherTab:AddButton({
    Name = "إعادة دخول السيرفر",
    Callback = function()
        TeleportService:Teleport(GameID, LocalPlayer)
    end
})

--     
OtherTab:AddButton({
    Name = "تغيير السيرفر",
    Callback = function()
        local function getNewServer()
            local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. GameID .. "/servers/Public?sortOrder=Asc&limit=100")).data
            for _, server in pairs(servers) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    return server.id
                end
            end
        end

        local newServer = getNewServer()
        if newServer then
            TeleportService:TeleportToPlaceInstance(GameID, newServer, LocalPlayer)
        end
    end
})

local ProtectionTab = Window:MakeTab({
    Name = "مضادات وحمايه",
    Icon = "rbxassetid://6031068420", --   
    PremiumOnly = false
})

local Humanoid = LocalPlayer.Character:WaitForChild("Humanoid")
local originalDescription = Humanoid:GetAppliedDescription()

local AntiCopyingRunning = false

ProtectionTab:AddToggle({
    Name = "مضاد نسخ",
    Default = false,
    Callback = function(state)
        AntiCopyingRunning = state

        if state then
            OrionLib:MakeNotification({
                Name = "مضاد النسخ",
                Content = "أنصحك يكون معك أدمن عشان يشتغل بدون مشاكل. !",
                Image = "rbxassetid://6031068420",
                Time = 6
            })

            task.spawn(function()
                while AntiCopyingRunning do
                    task.wait(2)
                    local currentDesc = Humanoid:GetAppliedDescription()
                    if currentDesc.Head ~= originalDescription.Head or
                       currentDesc.Torso ~= originalDescription.Torso or
                       currentDesc.GraphicTShirt ~= originalDescription.GraphicTShirt or
                       currentDesc.Pants ~= originalDescription.Pants or
                       currentDesc.Shirt ~= originalDescription.Shirt or
                       currentDesc.Face ~= originalDescription.Face then
                        game.Players:Chat("/re me")
                    end
                end
            end)
        end
    end
})

--// 

local ImportantTab = Window:MakeTab({
    Name = " كلام مره مهم!",
    Icon = "rbxassetid://6031280882",
    PremiumOnly = false
})

ImportantTab:AddButton({
    Name = "اضغط هنا. عشان تعرف الي ابي اقوله!",
    Callback = function()
        local MsgScreen = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
        MsgScreen.Name = "Important_Message"

        local BigFrame = Instance.new("Frame", MsgScreen)
        BigFrame.Size = UDim2.new(1, 0, 1, 0)
        BigFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        BigFrame.BackgroundTransparency = 0.1

        local TextBox = Instance.new("TextLabel", BigFrame)
        TextBox.Size = UDim2.new(1, -80, 1, -80)
        TextBox.Position = UDim2.new(0, 40, 0, 40)
        TextBox.Text = [[
تبي النسخة المدفوعه؟

النسخة المدفوعة فيها ميزات عالية وقوية
وفيها أشياء ماتحصلها بالمجانية.

سعرها 20 روبوكس فقط.
خذها عبر الرابط الدسكور 🥰
أعطيك نسخة مدفوعة للتجربة.
إذا ماعجبتك؟ لا تدفع شيء.
إذا عجبتك؟ خذها بأقل الأسعار.
انتظر اشوي وتروح العلامه السوداء 
حسابي تيك توك: ipur_5
        ]]
        TextBox.TextColor3 = Color3.fromRGB(0, 170, 255)
        TextBox.TextScaled = true
        TextBox.Font = Enum.Font.SourceSansBold
        TextBox.BackgroundTransparency = 1
        TextBox.TextWrapped = true

        wait(8)
        MsgScreen:Destroy()
    end
})


