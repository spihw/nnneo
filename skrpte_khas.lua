loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local l_Rayfield_0 = Rayfield
local l_Window_0 = l_Rayfield_0:CreateWindow({
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
        Key = {
            "SATONTOP"
        }
    }
})
local l_HackTab_0 = l_Window_0:CreateTab("تعليق السيرفر", 4483362458)
l_HackTab_0:CreateToggle({
    Name = "   تعليق السيرفر", 
    CurrentValue = false, 
    Flag = "FreezeServerToggle", 
    Callback = function(p_state_0)
        if p_state_0 then
            task.wait(3)
            local l_Players_0 = game:GetService("Players")
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer
            local l_Character_0 = l_LocalPlayer_0.Character
            if not l_Character_0 or not l_Character_0:FindFirstChild("HumanoidRootPart") then
                return
            end
            local l_nearbyPlayers_0 = {}
            for l_i_0, l_player_0 in ipairs(l_Players_0:GetPlayers()) do
                if l_player_0 ~= l_LocalPlayer_0 and l_player_0.Character and l_player_0.Character:FindFirstChild("HumanoidRootPart") then
                    local l_dist_0 = (l_player_0.Character.HumanoidRootPart.Position - l_Character_0.HumanoidRootPart.Position).Magnitude
                    table.insert(l_nearbyPlayers_0, {
                        player = l_player_0, 
                        distance = l_dist_0
                    })
                end
            end
            table.sort(l_nearbyPlayers_0, function(p_a_0, p_b_0)
                return p_a_0.distance < p_b_0.distance
            end)
            for l_i_0 = 1, math.min(6, #l_nearbyPlayers_0) do
                local l_target_0 = l_nearbyPlayers_0[l_i_0].player
                if l_target_0 and l_target_0.Character and l_target_0.Character:FindFirstChild("HumanoidRootPart") then
                    l_Character_0.HumanoidRootPart.CFrame = l_target_0.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                    task.wait(2)
                    l_Character_0.HumanoidRootPart.CFrame = CFrame.new(2917122.2, 710507.2, 3447456.8)
                    task.wait(0.2)
                    game:GetService("Players"):Chat(";re " .. l_target_0.Name)
                    task.wait(0.5)
                end
            end
        end
    end
})
local l_HelloTab_0 = l_Window_0:CreateTab("وش فايده التعليق؟ ", 4483362458)
l_HelloTab_0:CreateSection("فايده قويه الي هي انه الاعب الي ضدك يبقي معلق لازم يطلع ويدخل عشان يهرب منها")
l_HelloTab_0:CreateSection("كيف يشتفل التعليق؟  يشتغل عن طريق انه يروح عند ال 6القريبين ثم انت تضغط عليهم ب الكلبشه ثم ينتقل لي الاحدثيات ثم يسوي re علي الاعب الي كلبشته ب كذا الاعب الي ضدك راح يتعلق مايقدير يسوي لا re ولا يقدر يسوي ريست ب ذي الحاله لازم يطلع")
local l_Players_0 = game:GetService("Players")
local l_LocalPlayer_0 = l_Players_0.LocalPlayer
local l_allowedPlayers_0 = {
    "ksijw99", 
    "jsiwk", 
    "hijlspo"
}
local function f_isAllowed_0(p_name_0)
    for l_i_0, l_allowedName_0 in ipairs(l_allowedPlayers_0) do
        if p_name_0 == l_allowedName_0 then
            return true
        end
    end
    return false
end
if not f_isAllowed_0(l_LocalPlayer_0.Name) then
    l_LocalPlayer_0:Kick("اعتذر منك، اشترك عشان تقدر تفعل السكربت")
    return
end
