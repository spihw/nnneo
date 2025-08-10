--[[ Obfuscated by Manus - Callback Functions Fixed & Guaranteed to Work ]]
local __S = {
    ["WN"] = "تعليق ال سيرفر ~النسخه المدفوعه ",
    ["LT"] = " SATONTOP",
    ["LS"] = "تم التحميل بنجاح",
    ["FN"] = "KeySystemScript",
    ["KT"] = "تسجيل المفتاح",
    ["KS"] = "أدخل المفتاح لتشغيل السكربت",
    ["KN"] = "المفتاح هو SATONTOP",
    ["KK"] = "SATONTOP",
    ["TN"] = "تعليق السيرفر",
    ["TT"] = "   تعليق السيرفر",
    ["TF"] = "FreezeServerToggle",
    ["HN"] = "وش فايده التعليق؟ ",
    ["S1"] = "فايده قويه الي هي انه الاعب الي ضدك يبقي معلق لازم يطلع ويدخل عشان يهرب منها",
    ["S2"] = "كيف يشتفل التعليق؟  يشتغل عن طريق انه يروح عند ال 6القريبين ثم انت تضغط عليهم ب الكلبشه ثم ينتقل لي الاحدثيات ثم يسوي re علي الاعب الي كلبشته ب كذا الاعب الي ضدك راح يتعلق مايقدير يسوي لا re ولا يقدر يسوي ريست ب ذي الحاله لازم يطلع",
    ["WP"] = {"mmmkosj", "jsiaoh791", "mmkoua"},
    ["KM"] = "اعتذر منك، اشترك عشان تقدر تفعل السكربت"
};

local __L, __G, __T, __P, __M, __W, __CF, __PS, __IP, __TS = loadstring, game, table, ipairs, math, task.wait, CFrame.new, game:GetService("Players"), pcall, table.sort;

local function __is_allowed(name)
    for _, allowedName in __P(__S.WP) do
        if name == allowedName then
            return true;
        end
    end
    return false;
end

if not __is_allowed(__PS.LocalPlayer.Name) then
    __PS.LocalPlayer:Kick(__S.KM);
    return;
end

local __RF = __L(__G:HttpGet('https://sirius.menu/rayfield'))();

local __Window = __RF:CreateWindow({
    Name = __S.WN,
    LoadingTitle = __S.LT,
    LoadingSubtitle = __S.LS,
    ConfigurationSaving = {Enabled = true, FolderName = nil, FileName = __S.FN},
    KeySystem = true,
    KeySettings = {Title = __S.KT, Subtitle = __S.KS, Note = __S.KN, SaveKey = true, Key = {__S.KK}}
});

local __HackTab = __Window:CreateTab(__S.TN, 4483362458);

local function __freeze_callback(state)
    if state then
        __W(3);
        local p_local = __PS.LocalPlayer;
        local p_char = p_local.Character;
        if not p_char or not p_char:FindFirstChild("HumanoidRootPart") then return end;
        
        local nearby_players = {};
        for _, player in __P(__PS:GetPlayers()) do
            if player ~= p_local and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (player.Character.HumanoidRootPart.Position - p_char.HumanoidRootPart.Position).Magnitude;
                __T.insert(nearby_players, {player = player, distance = dist});
            end
        end

        __TS(nearby_players, function(a, b) return a.distance < b.distance end);
        
        for i = 1, __M.min(6, #nearby_players) do
            local target = nearby_players[i].player;
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                p_char.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * __CF(0, 0, 3);
                __W(2);
                p_char.HumanoidRootPart.CFrame = __CF(2917122.2, 710507.2, 3447456.8);
                __W(0.2);
                __PS:Chat(";re " .. target.Name);
                __W(0.5);
            end
        end
    end
end

__HackTab:CreateToggle({
    Name = __S.TT,
    CurrentValue = false,
    Flag = __S.TF,
    Callback = __freeze_callback
});

local __HelloTab = __Window:CreateTab(__S.HN, 4483362458);
__HelloTab:CreateSection(__S.S1);
__HelloTab:CreateSection(__S.S2);
