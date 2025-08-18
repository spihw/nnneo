local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

_G.ActiveUsers = _G.ActiveUsers or {}
if not table.find(_G.ActiveUsers, LocalPlayer.Name) then
    table.insert(_G.ActiveUsers, LocalPlayer.Name)

    wait(0.1)
    game.StarterGui:SetCore("SendNotification", {
        Title = "تنبيه";
        Text = "لاتنسي تدخل سيرفر الدسكورد ";
        Duration = 5;
    })
end

local SpecialUsers = {"emocoolgirl_505", "gsksjsj_83773"}

for _, name in pairs(SpecialUsers) do
    if LocalPlayer.Name == name then
        wait(0.1)
        game.StarterGui:SetCore("SendNotification", {
            Title = "منور مازن";
            Text = "ترا الميزه تشتغل ولا لا ترا ماعرف! ";
            Duration = 5;
        })
    end
end






-- جدول لتخزين اللاعبين المفعلين للسكربت
_G.ActiveUsers = _G.ActiveUsers or {}
if not table.find(_G.ActiveUsers, LocalPlayer.Name) then
    table.insert(_G.ActiveUsers, LocalPlayer.Name)
end

-- إضافة أي لاعب جديد للقائمة عند انضمامه
Players.PlayerAdded:Connect(function(player)
    task.spawn(function()
        if not table.find(_G.ActiveUsers, player.Name) then
            table.insert(_G.ActiveUsers, player.Name)
        end
    end)
end)

-- دالة تنفيذ الأوامر
local function executeCommand(msg, sender)
    local args = string.split(msg, " ")
    local command = args[1]:lower()
    local targetInitials = args[2] or ""

    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            -- يتحقق من أول حرفين وكون اللاعب مفعل السكربت
            if string.sub(player.Name:lower(),1,2) == targetInitials:lower() and table.find(_G.ActiveUsers, player.Name) then
                local hrp = player.Character.HumanoidRootPart
                if command == ".tp" and sender == LocalPlayer then
                    -- النقل
                    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if myHRP then
                        myHRP.CFrame = hrp.CFrame + Vector3.new(0,3,0)
                        print("تم سحب اللاعب: " .. player.Name) -- الرسالة تظهر لك فقط في الـ Output
                    end
                elseif command == ".fling" then
                    -- فلنق
                    hrp.Velocity = Vector3.new(math.random(-50,50),50,math.random(-50,50))
                    if sender == LocalPlayer then
                        print("تم  اللاعب: " .. player.Name) -- تظهر لك فقط
                    end
                end
            end
        end
    end
end

-- مراقبة شات جميع اللاعبين المفعلين + شاتك أنت
Players.PlayerChatted:Connect(function(player, message)
    if table.find(_G.ActiveUsers, player.Name) or player == LocalPlayer then
        executeCommand(message, player)
    end
end)

-- نهاية الكود
local DrRayLibrary =
loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("سكربت ماب القنبلهBomb Map Script / First Edition ", "")

local tab = DrRayLibrary.newTab("القائمه الرئيسيه", "ImageIdHere")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer

-- مضاد القنبلة (يبقى كما هو)
tab.newToggle("مضاد القنبله", "يمنع من القنبلة   ", false, function(toggleState)
    _G.AntiBomb = toggleState
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")

    if toggleState then
        hum.PlatformStand = true
        hum.AutoRotate = false
        hum.WalkSpeed = 0
        hum.JumpPower = 0
        char.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90),0,0)
    else
        hum.PlatformStand = false
        hum.AutoRotate = true
        hum.WalkSpeed = 16
        hum.JumpPower = 50
    end
end)

-- مضاد التزحلق (يستمر بعد الموت مع رسالة تنبيه)
tab.newToggle("مضاد التزحلق", "تقدر تمشي علي الجليد      ", false, function(toggleState)
    _G.AntiSlip = toggleState

    if toggleState then
        -- عرض رسالة عند تفعيل الخيار
        task.wait(0.1)
        game.StarterGui:SetCore("SendNotification", {
            Title = "انتبه!";
            Text = "اذي مت ارجع فعله"; -- ARAB TEAM
            Duration = 5;
        })
    end

    local function applyAntiSlip(char)
        task.spawn(function()
            while _G.AntiSlip and char and char:FindFirstChildOfClass("Humanoid") do
                for _, part in pairs(char:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 100)
                    end
                end
                task.wait(0.2)
            end

            if not _G.AntiSlip and char and char:FindFirstChildOfClass("Humanoid") then
                for _, part in pairs(char:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
                    end
                end
            end
        end)
    end

    if plr.Character then
        applyAntiSlip(plr.Character)
    end

    plr.CharacterAdded:Connect(function(char)
        if _G.AntiSlip then
            applyAntiSlip(char)
        end
    end)
end)

local bombReachSphere = nil
local bombReachEnabled = false

local bombReachSphere = nil
local bombReachEnabled = false

tab.newToggle("ريتش القنبله", "  انصحك يكون النت قوي   ", false, function(toggleState)
    bombReachEnabled = toggleState

    if not toggleState then
        if bombReachSphere then
            bombReachSphere:Destroy()
            bombReachSphere = nil
        end
    else
        task.spawn(function()
            while bombReachEnabled do
                local char = plr.Character or plr.CharacterAdded:Wait()
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    if not bombReachSphere then
                        bombReachSphere = Instance.new("Part")
                        bombReachSphere.Shape = Enum.PartType.Ball
                        bombReachSphere.Color = Color3.fromRGB(0,0,255)
                        bombReachSphere.Material = Enum.Material.Neon
                        bombReachSphere.Transparency = 0.5 -- لجعلها شفافة
                        bombReachSphere.Anchored = true
                        bombReachSphere.CanCollide = false
                        bombReachSphere.Size = Vector3.new(10,10,10)
                        bombReachSphere.Parent = tool
                    end

                    if tool:FindFirstChild("Handle") then
                        bombReachSphere.CFrame = tool.Handle.CFrame + Vector3.new(0,2,0)
                    end
                else
                    if bombReachSphere then
                        bombReachSphere:Destroy()
                        bombReachSphere = nil
                    end
                end
                task.wait(1)
            end
        end)
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local aimEnabled = false
local aimDistance = 30 -- المسافة المسموح بها للتصويب

tab.newToggle("التركيز على اللاعبين القريبين", "يخليك تناظر أقرب لاعب ", false, function(toggleState)
    aimEnabled = toggleState
    
    if toggleState then
        task.wait(0.1)
        game.StarterGui:SetCore("SendNotification", {
            Title = "ملاحظة";
            Text = "هاذا الخيار يفيدك ب join FFA"; -- ARAB TEAM
            Duration = 5;
        })
    end
end)

RunService.RenderStepped:Connect(function()
    if aimEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local myPos = LocalPlayer.Character.HumanoidRootPart.Position
        local closestPlayer
        local closestDistance = aimDistance
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (player.Character.HumanoidRootPart.Position - myPos).Magnitude
                if distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = player
                end
            end
        end
        
        if closestPlayer and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos = closestPlayer.Character.HumanoidRootPart.Position
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(myPos, Vector3.new(targetPos.X, myPos.Y, targetPos.Z))
        end
    end
end)

tab.newButton("الهروب", "ينقلك فوق الماب بسرعة", function()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local root = char:FindFirstChild("HumanoidRootPart")

    if root then
        root.CFrame = root.CFrame + Vector3.new(0, 500, 0)
    end
end)

local TargetName = ""

local TargetName = ""
local AimConnection

local TargetName = ""
local FocusConnection

local tab = DrRayLibrary.newTab("الاستهدف", "ImageIdHere")

-- إدخال اسم اللاعب
tab.newInput("اسم اللاعب", "اكتب أول حرفين من اللاعب", function(text)
    TargetName = text:sub(1,2):lower() -- أول حرفين
    print("اللاعب المستهدف يبدأ بـ: " .. TargetName)
end)

-- زر التركيز على اللاعب
tab.newToggle("تركز على اللاعب", "   يركز  علي الاعب  ", false, function(toggleState)
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    if toggleState then
        FocusConnection = game:GetService("RunService").RenderStepped:Connect(function()
            local targetPlayer
            for _, p in ipairs(game.Players:GetPlayers()) do
                if p ~= plr and p.Name:sub(1,2):lower() == TargetName then
                    targetPlayer = p
                    break
                end
            end

            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPos = targetPlayer.Character.HumanoidRootPart.Position
                local direction = (targetPos - hrp.Position).Unit
                hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + direction)
            end
        end)
    else
        if FocusConnection then
            FocusConnection:Disconnect()
            FocusConnection = nil
        end
    end
end)

tab.newButton("التنقل إلى اللاعب", "ينقلك  إلى اللاعب ", function()
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    -- نجيب اللاعب المستهدف حسب أول حرفين
    local targetPlayer
    for _, p in ipairs(game.Players:GetPlayers()) do
        if p ~= plr and p.Name:sub(1,2):lower() == TargetName then
            targetPlayer = p
            break
        end
    end

    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetHRP = targetPlayer.Character.HumanoidRootPart
        hrp.CFrame = CFrame.new(targetHRP.Position + Vector3.new(0,3,0)) -- ينقلك فوق اللاعب شوي
        print("تم الانتقال إلى اللاعب المستهدف!")
    else
        print("اللاعب غير موجود أو لم تدخل أول حرفين بشكل صحيح")
    end
end)

tab.newButton("إعطاء القنبلة", "  يعطي الشخص قنبله ثم يهرب انصحك ب 1v1", function()
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    -- نجيب اللاعب المستهدف
    local targetPlayer
    for _, p in ipairs(game.Players:GetPlayers()) do
        if p ~= plr and p.Name:sub(1,2):lower() == TargetName then
            targetPlayer = p
            break
        end
    end

    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetHRP = targetPlayer.Character.HumanoidRootPart
        
        -- يجي ورا ظهر اللاعب
        hrp.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)

        -- بعد نص ثانية يهرب فوق الماب
        task.delay(0.5, function()
            hrp.CFrame = hrp.CFrame + Vector3.new(0, 200, 0)
        end)
    else
        print("اللاعب المستهدف غير موجود")
    end
end)

local tab = DrRayLibrary.newTab("اشياء يمكن تفيدك", "ImageIdHere")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local WallHackEnabled = false

-- الدالة لتفعيل/إيقاف اختراق الجدران
local function applyWallHack(enable)
    WallHackEnabled = enable
    local character = LocalPlayer.Character
    if not character then return end

    -- نجعل جميع أجزاء الشخصية CanCollide = false عند التفعيل
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not enable
        end
    end
end

-- الـ Toggle داخل الـ tab باسم "اختراق الجدران"
tab.newToggle("اختراق الجدران", "اختراق الجدران", false, function(toggleState)
    applyWallHack(toggleState)
    
    if toggleState then
        print("On")
    else
        print("Off")
    end
end)

-- إعادة تطبيق WallHack عند Respawn
Players.LocalPlayer.CharacterAdded:Connect(function(char)
    wait(1)
    if WallHackEnabled then
        applyWallHack(true)
    end
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local MoveToClosestEnabled = false
local moveConnection

-- دالة للحصول على أقرب لاعب
local function getClosestPlayer()
    local closestPlayer
    local shortestDistance = math.huge
    local myCharacter = LocalPlayer.Character
    if not myCharacter or not myCharacter:FindFirstChild("HumanoidRootPart") then return nil end
    local myPosition = myCharacter.HumanoidRootPart.Position

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - myPosition).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = player
            end
        end
    end

    return closestPlayer
end

-- زر التنقل لي أقرب لاعب باستخدام tab.newToggle
tab.newToggle(" بوت يلحق الاعبين ههههه  ", "   بوت يلحق الاعبين", false, function(toggleState)
    MoveToClosestEnabled = toggleState

    if toggleState then
        print("On")
        -- ربط الحركة بالـ RenderStepped
        moveConnection = RunService.RenderStepped:Connect(function()
            if MoveToClosestEnabled then
                local closest = getClosestPlayer()
                local char = LocalPlayer.Character
                if closest and char and char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart") then
                    char.Humanoid:MoveTo(closest.Character.HumanoidRootPart.Position)
                end
            end
        end)
    else
        print("Off")
        if moveConnection then
            moveConnection:Disconnect()
            moveConnection = nil
        end
    end
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- زر النقل الفوري لأقرب لاعب
tab.newButton("التنقل لي أقرب لاعب", "ينتقل مباشرة إلى أقرب لاعب", function()
    local closestPlayer
    local shortestDistance = math.huge
    local myCharacter = LocalPlayer.Character
    if not myCharacter or not myCharacter:FindFirstChild("HumanoidRootPart") then return end
    local myPos = myCharacter.HumanoidRootPart.Position

    -- إيجاد أقرب لاعب
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - myPos).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = player
            end
        end
    end

    -- النقل الفوري إلى أقرب لاعب
    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
        myCharacter:SetPrimaryPartCFrame(closestPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0))
        print("تم الانتقال إلى أقرب لاعب:", closestPlayer.Name)
    end
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local speedValue = 1
local speedEnabled = false

-- شريط تمرير لتغيير السرعة
tab.newSlider("سرعة اللاعب", "تتحكم بسرعة الاعب", 10, false, function(num)
    speedValue = num
    print("تم تعيين السرعة إلى:", speedValue)
end)

-- تفعيل السرعة عبر زر
tab.newButton("تشغيل السرعة", "يبدأ السرعة", function()
    speedEnabled = true
end)

tab.newButton("إيقاف السرعة", "يوقف  السرعة", function()
    speedEnabled = false
end)

-- تطبيق السرعة على HumanoidRootPart مثل السكربت الأصلي
game:GetService("RunService").RenderStepped:Connect(function()
    if speedEnabled and speedValue > 0 then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart") then
            local moveDir = char.Humanoid.MoveDirection
            char.HumanoidRootPart.Velocity = Vector3.new(
                moveDir.X * speedValue * 10,
                char.HumanoidRootPart.Velocity.Y,
                moveDir.Z * speedValue * 10
            )
        end
    end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")

task.spawn(function()
    wait(0.5)
    -- تأكد أن RemoteEvent موجود
    local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if chatEvent then
        chatEvent.SayMessageRequest:FireServer("SAT ON TOP", "All")
    end
end)

