local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "تعليق ال سيرفر ~النسخه المدفوعه ",
    LoadingTitle = " SATONTOP",
    LoadingSubtitle = "تم التحميل بنجاح",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "KeySystemScript"
    },
    KeySystem = true, 
    KeySettings = {
        Title = "تسجيل المفتاح",
        Subtitle = "أدخل المفتاح لتشغيل السكربت",
        Note = "المفتاح هو SATONTOP",
        SaveKey = true,
        Key = {"SATONTOP"}
    }
})

local HackTab = Window:CreateTab("تعليق السيرفر", 4483362458) 

HackTab:CreateToggle({
    Name = "   تعليق السيرفر",
    CurrentValue = false,
    Flag = "FreezeServerToggle",
    Callback = function(state)
        if state then
            task.wait(3) -- انتظار 3 ثواني قبل التشغيل

            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Character = LocalPlayer.Character
            if not Character or not Character:FindFirstChild("HumanoidRootPart") then return end

            local nearbyPlayers = {}
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = (player.Character.HumanoidRootPart.Position - Character.HumanoidRootPart.Position).Magnitude
                    table.insert(nearbyPlayers, {player = player, distance = dist})
                end
            end

            table.sort(nearbyPlayers, function(a, b) return a.distance < b.distance end)
            
            for i = 1, math.min(6, #nearbyPlayers) do
                local target = nearbyPlayers[i].player
                if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    
                    -- يجي خلف اللاعب
                    Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                    task.wait(2) -- ينتظر 2 ثانية

                    -- يروح للإحداثيات
                    Character.HumanoidRootPart.CFrame = CFrame.new(2917122.2, 710507.2, 3447456.8)
                    task.wait(0.2) -- انتظار قصير للتأكد من الوصول

                    -- يسوي re
                    game:GetService("Players"):Chat(";re " .. target.Name)

                    task.wait(0.5) -- وقت بسيط قبل اللاعب التالي
                end
            end
        end
    end
})

local HelloTab = Window:CreateTab("وش فايده التعليق؟ ", 4483362458)

HelloTab:CreateSection("فايده قويه الي هي انه الاعب الي ضدك يبقي معلق لازم يطلع ويدخل عشان يهرب منها")

HelloTab:CreateSection("كيف يشتفل التعليق؟  يشتغل عن طريق انه يروح عند ال 6القريبين ثم انت تضغط عليهم ب الكلبشه ثم ينتقل لي الاحدثيات ثم يسوي re علي الاعب الي كلبشته ب كذا الاعب الي ضدك راح يتعلق مايقدير يسوي لا re ولا يقدر يسوي ريست ب ذي الحاله لازم يطلع")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- حط هنا اسماء اللاعبين المسموح لهم
local allowedPlayers = {
    "gsksjsj_83773",
    "jsiwk",
    "hijlspo"
}

local function isAllowed(name)
    for _, allowedName in ipairs(allowedPlayers) do
        if name == allowedName then
            return true
        end
    end
    return false
end

if not isAllowed(LocalPlayer.Name) then
    LocalPlayer:Kick("اعتذر منك، اشترك عشان تقدر تفعل السكربت")
    return -- يوقف السكربت
end

-- باقي اكوادك تشتغل تحت


