-- Obfuscated by Manus (Safe Mode for Libraries)
local l_loadstring_0 = loadstring
local l_game_1 = game
local l_task_2 = task
local l_CFrame_3 = CFrame
local l_math_4 = math
local l_table_5 = table
local l_ipairs_6 = ipairs

local v_Rayfield_0 = l_loadstring_0(l_game_1:HttpGet('https://sirius.menu/rayfield'))()

local v_Window_1 = v_Rayfield_0:CreateWindow({
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

local v_HackTab_2 = v_Window_1:CreateTab("تعليق السيرفر", 4483362458)

v_HackTab_2:CreateToggle({
    Name = "   تعليق السيرفر",
    CurrentValue = false,
    Flag = "FreezeServerToggle",
    Callback = function(p_state_0)
        if p_state_0 then
            l_task_2.wait(3)
            local v_Players_3 = l_game_1:GetService("Players")
            local v_LocalPlayer_4 = v_Players_3.LocalPlayer
            local v_Character_5 = v_LocalPlayer_4.Character
            if not v_Character_5 or not v_Character_5:FindFirstChild("HumanoidRootPart") then return end
            local v_nearbyPlayers_6 = {}
            for _, v_player_7 in l_ipairs_6(v_Players_3:GetPlayers()) do
                if v_player_7 ~= v_LocalPlayer_4 and v_player_7.Character and v_player_7.Character:FindFirstChild("HumanoidRootPart") then
                    local v_dist_8 = (v_player_7.Character.HumanoidRootPart.Position - v_Character_5.HumanoidRootPart.Position).Magnitude
                    l_table_5.insert(v_nearbyPlayers_6, {player = v_player_7, distance = v_dist_8})
                end
            end
            l_table_5.sort(v_nearbyPlayers_6, function(p_a_1, p_b_2) return p_a_1.distance < p_b_2.distance end)
            for v_i_9 = 1, l_math_4.min(6, #v_nearbyPlayers_6) do
                local v_target_10 = v_nearbyPlayers_6[v_i_9].player
                if v_target_10 and v_target_10.Character and v_target_10.Character:FindFirstChild("HumanoidRootPart") then
                    v_Character_5.HumanoidRootPart.CFrame = v_target_10.Character.HumanoidRootPart.CFrame * l_CFrame_3.new(0, 0, 3)
                    l_task_2.wait(2)
                    v_Character_5.HumanoidRootPart.CFrame = l_CFrame_3.new(2917122.2, 710507.2, 3447456.8)
                    l_task_2.wait(0.2)
                    l_game_1:GetService("Players"):Chat(";re " .. v_target_10.Name)
                    l_task_2.wait(0.5)
                end
            end
        end
    end
})

local v_HelloTab_11 = v_Window_1:CreateTab("وش فايده التعليق؟ ", 4483362458)
v_HelloTab_11:CreateSection("فايده قويه الي هي انه الاعب الي ضدك يبقي معلق لازم يطلع ويدخل عشان يهرب منها")
v_HelloTab_11:CreateSection("كيف يشتفل التعليق؟  يشتغل عن طريق انه يروح عند ال 6القريبين ثم انت تضغط عليهم ب الكلبشه ثم ينتقل لي الاحدثيات ثم يسوي re علي الاعب الي كلبشته ب كذا الاعب الي ضدك راح يتعلق مايقدير يسوي لا re ولا يقدر يسوي ريست ب ذي الحاله لازم يطلع")

local v_Players_12 = l_game_1:GetService("Players")
local v_LocalPlayer_13 = v_Players_12.LocalPlayer
local v_allowedPlayers_14 = {"ksijw99", "jsiwk", "hijlspo"}

local function f_isAllowed_15(p_name_0)
    for _, v_allowedName_16 in l_ipairs_6(v_allowedPlayers_14) do
        if p_name_0 == v_allowedName_16 then
            return true
        end
    end
    return false
end

