local _s = {
    [1] = "Players", [2] = "StarterGui", [3] = "RunService", [4] = "ReplicatedStorage",
    [5] = "gsksjsj_83773", [6] = "YourFriend2", [7] = "Wazir", [8] = "ActivePlayers",
    [9] = "ملاحظه", [10] = "انت تقدر تحط اوامر علي الاعبين", [11] = "اللاعب ",
    [12] = " يستخدم السكربت!", [13] = "خطا", [14] = "مافي أي لاعب ثاني مفعل السكربت.",
    [15] = "tp.", [16] = "HumanoidRootPart", [17] = "تم", [18] = "تم سحب اللاعب ",
    [19] = "خطأ", [20] = "ما عندك ميزات خاص!", [21] = "⚠️", [22] = "ما لقيت اللاعب بهذا الاسم",
    [23] = "https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua",
    [24] = "سكربت ماب القنبلهBomb Map Script / First Edition ", [25] = "", [26] = "القائمه الرئيسيه",
    [27] = "الاستهدف", [28] = "اشياء يمكن تفيدك", [29] = "مضاد القنبله", [30] = "يمنع من القنبلة",
    [31] = "Humanoid", [32] = "مضاد التزحلق", [33] = "تقدر تمشي علي الجليد", [34] = "انتبه!",
    [35] = "اذي مت ارجع فعله", [36] = "BasePart", [37] = "ريتش القنبله", [38] = "انصحك يكون النت قوي",
    [39] = "Tool", [40] = "Part", [41] = "Ball", [42] = "Neon", [43] = "Handle",
    [44] = "التركيز على اللاعبين القريبين", [45] = "يخليك تناظر أقرب لاعب ", [46] = "ملاحظة",
    [47] = "هاذا الخيار يفيدك ب join FFA", [48] = "الهروب", [49] = "ينقلك فوق الماب بسرعة",
    [50] = "اسم اللاعب", [51] = "اكتب أول حرفين من اللاعب", [52] = "تركز على اللاعب",
    [53] = "يركز  علي الاعب", [54] = "التنقل إلى اللاعب", [55] = "ينقلك  إلى اللاعب ",
    [56] = "إعطاء القنبلة", [57] = "يعطي الشخص قنبله ثم يهرب انصحك ب 1v1", [58] = "اختراق الجدران",
    [59] = " بوت يلحق الاعبين ههههه  ", [60] = "   بوت يلحق الاعبين", [61] = "التنقل لي أقرب لاعب",
    [62] = "ينتقل مباشرة إلى أقرب لاعب", [63] = "سرعة اللاعب", [64] = "تتحكم بسرعة الاعب",
    [65] = "تشغيل السرعة", [66] = "يبدأ السرعة", [67] = "إيقاف السرعة", [68] = "يوقف  السرعة",
    [69] = "DefaultChatSystemChatEvents", [70] = "SayMessageRequest", [71] = "SAT ON TOP", [72] = "All"
};

local _g = game;
local _p = _g:GetService(_s[1]);
local _sg = _g:GetService(_s[2]);
local _rs = _g:GetService(_s[3]);
local _rps = _g:GetService(_s[4]);
local _lp = _p.LocalPlayer;

local function _notify(t, txt, d) _sg:SetCore("SendNotification", {Title = t, Text = txt, Duration = d}); end

local _sp = {[_s[5]] = true, [_s[6]] = true, [_s[7]] = true};
_G[_s[8]] = _G[_s[8]] or {};
_G[_s[8]][_lp.Name] = true;

if _sp[_lp.Name] then
    _notify(_s[9], _s[10], 6);
    task.delay(3, function()
        local _f = false;
        for n, _ in pairs(_G[_s[8]]) do
            if n ~= _lp.Name and _p:FindFirstChild(n) then
                _f = true;
                _notify(_s[9], _s[11] .. n .. _s[12], 6);
                break;
            end
        end
        if not _f then _notify(_s[13], _s[14], 6); end
    end);
end

_lp.Chatted:Connect(function(m)
    local _m = m:lower();
    if _m:sub(1, 3) == _s[15] then
        local _tn = _m:sub(4);
        local _tp = nil;
        for _, p in ipairs(_p:GetPlayers()) do
            if p.Name:lower():sub(1, #_tn) == _tn:lower() then _tp = p; break; end
        end
        if _tp then
            if _sp[_lp.Name] then
                local _mc = _lp.Character or _lp.CharacterAdded:Wait();
                local _mhrp = _mc:WaitForChild(_s[16]);
                local _tc = _tp.Character;
                if _tc and _tc:FindFirstChild(_s[16]) then
                    _tc.HumanoidRootPart.CFrame = _mhrp.CFrame * CFrame.new(0, 0, -3);
                    _notify(_s[17], _s[18] .. _tp.Name, 5);
                end
            else
                _notify(_s[19], _s[20], 5);
            end
        else
            _notify(_s[21], _s[22], 5);
        end
    end
end);

local _lib = loadstring(_g:HttpGet(_s[23]))();
local _win = _lib:Load(_s[24], _s[25]);
local _tab1 = _lib.newTab(_s[26], _s[25]);
local _tab2 = _lib.newTab(_s[27], _s[25]);
local _tab3 = _lib.newTab(_s[28], _s[25]);

_G.AntiBomb = false;
_G.AntiSlip = false;
local _br_e = false;
local _aim_e = false;
local _f_conn;
local _m_conn;
local _wh_e = false;
local _s_val = 1;
local _s_e = false;
local _t_name = "";

local function _set_char(c, st)
    local h = c:WaitForChild(_s[31]);
    h.PlatformStand = st;
    h.AutoRotate = not st;
    h.WalkSpeed = st and 0 or 16;
    h.JumpPower = st and 0 or 50;
    if st then
        c.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0);
        c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0);
    end
end

_tab1.newToggle(_s[29], _s[30], false, function(st)
    _G.AntiBomb = st;
    local c = _lp.Character or _lp.CharacterAdded:Wait();
    _set_char(c, st);
end);

local function _apply_as(c)
    task.spawn(function()
        while _G.AntiSlip and c and c:FindFirstChildOfClass(_s[31]) do
            for _, pt in pairs(c:GetChildren()) do
                if pt:IsA(_s[36]) then pt.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 100); end
            end
            task.wait(0.2);
        end
        if not _G.AntiSlip and c and c:FindFirstChildOfClass(_s[31]) then
            for _, pt in pairs(c:GetChildren()) do
                if pt:IsA(_s[36]) then pt.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5); end
            end
        end
    end);
end

_tab1.newToggle(_s[32], _s[33], false, function(st)
    _G.AntiSlip = st;
    if st then _notify(_s[34], _s[35], 5); end
    if _lp.Character then _apply_as(_lp.Character); end
end);

_lp.CharacterAdded:Connect(function(c)
    if _G.AntiSlip then _apply_as(c); end
    task.wait(1);
    if _wh_e then
        for _, pt in pairs(c:GetDescendants()) do
            if pt:IsA(_s[36]) then pt.CanCollide = false; end
        end
    end
end);

_tab1.newToggle(_s[37], _s[38], false, function(st)
    _br_e = st;
    local sph = nil;
    if not st and sph then sph:Destroy(); sph = nil; return; end
    if st then
        task.spawn(function()
            while _br_e do
                local c = _lp.Character or _lp.CharacterAdded:Wait();
                local tl = c:FindFirstChildOfClass(_s[39]);
                if tl then
                    if not sph then
                        sph = Instance.new(_s[40], tl);
                        sph.Shape = Enum.PartType[_s[41]];
                        sph.Color = Color3.fromRGB(0, 0, 255);
                        sph.Material = Enum.Material[_s[42]];
                        sph.Transparency = 0.5;
                        sph.Anchored = true;
                        sph.CanCollide = false;
                        sph.Size = Vector3.new(10, 10, 10);
                    end
                    if tl:FindFirstChild(_s[43]) then sph.CFrame = tl.Handle.CFrame + Vector3.new(0, 2, 0); end
                elseif sph then
                    sph:Destroy();
                    sph = nil;
                end
                task.wait(1);
            end
        end);
    end
end);

_tab1.newToggle(_s[44], _s[45], false, function(st)
    _aim_e = st;
    if st then _notify(_s[46], _s[47], 5); end
end);

_tab1.newButton(_s[48], _s[49], function()
    local c = _lp.Character or _lp.CharacterAdded:Wait();
    local r = c:FindFirstChild(_s[16]);
    if r then r.CFrame = r.CFrame + Vector3.new(0, 500, 0); end
end);

_tab2.newInput(_s[50], _s[51], function(txt) _t_name = txt:sub(1, 2):lower(); end);

local function _get_tp()
    for _, p in ipairs(_p:GetPlayers()) do
        if p ~= _lp and p.Name:sub(1, 2):lower() == _t_name then return p; end
    end
    return nil;
end

_tab2.newToggle(_s[52], _s[53], false, function(st)
    if st then
        _f_conn = _rs.RenderStepped:Connect(function()
            local tp = _get_tp();
            local c = _lp.Character;
            if tp and c and c.HumanoidRootPart and tp.Character and tp.Character.HumanoidRootPart then
                local hrp = c.HumanoidRootPart;
                local t_pos = tp.Character.HumanoidRootPart.Position;
                hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + (t_pos - hrp.Position).Unit);
            end
        end);
    elseif _f_conn then
        _f_conn:Disconnect();
        _f_conn = nil;
    end
end);

_tab2.newButton(_s[54], _s[55], function()
    local tp = _get_tp();
    local c = _lp.Character or _lp.CharacterAdded:Wait();
    if tp and tp.Character and tp.Character.HumanoidRootPart and c and c.HumanoidRootPart then
        c.HumanoidRootPart.CFrame = CFrame.new(tp.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0));
    end
end);

_tab2.newButton(_s[56], _s[57], function()
    local tp = _get_tp();
    local c = _lp.Character or _lp.CharacterAdded:Wait();
    if tp and tp.Character and tp.Character.HumanoidRootPart and c and c.HumanoidRootPart then
        local hrp = c.HumanoidRootPart;
        local t_hrp = tp.Character.HumanoidRootPart;
        hrp.CFrame = t_hrp.CFrame * CFrame.new(0, 0, 3);
        task.delay(0.5, function() hrp.CFrame = hrp.CFrame + Vector3.new(0, 200, 0); end);
    end
end);

_tab3.newToggle(_s[58], _s[58], false, function(st)
    _wh_e = st;
    local c = _lp.Character;
    if not c then return; end
    for _, pt in pairs(c:GetDescendants()) do
        if pt:IsA(_s[36]) then pt.CanCollide = not st; end
    end
end);

local function _get_cp()
    local cp, sd = nil, math.huge;
    local mc = _lp.Character;
    if not mc or not mc.HumanoidRootPart then return nil; end
    local m_pos = mc.HumanoidRootPart.Position;
    for _, p in pairs(_p:GetPlayers()) do
        if p ~= _lp and p.Character and p.Character.HumanoidRootPart then
            local d = (p.Character.HumanoidRootPart.Position - m_pos).Magnitude;
            if d < sd then sd = d; cp = p; end
        end
    end
    return cp;
end

_tab3.newToggle(_s[59], _s[60], false, function(st)
    if st then
        _m_conn = _rs.RenderStepped:Connect(function()
            local cl = _get_cp();
            local c = _lp.Character;
            if cl and c and c.Humanoid and c.HumanoidRootPart then
                c.Humanoid:MoveTo(cl.Character.HumanoidRootPart.Position);
            end
        end);
    elseif _m_conn then
        _m_conn:Disconnect();
        _m_conn = nil;
    end
end);

_tab3.newButton(_s[61], _s[62], function()
    local cp = _get_cp();
    local mc = _lp.Character;
    if cp and mc and mc.PrimaryPart and cp.Character and cp.Character.HumanoidRootPart then
        mc:SetPrimaryPartCFrame(cp.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0));
    end
end);

_tab3.newSlider(_s[63], _s[64], 10, false, function(n) _s_val = n; end);
_tab3.newButton(_s[65], _s[66], function() _s_e = true; end);
_tab3.newButton(_s[67], _s[68], function() _s_e = false; end);

_rs.RenderStepped:Connect(function()
    if _aim_e and _lp.Character and _lp.Character.HumanoidRootPart then
        local cp = _get_cp();
        if cp and cp.Character and cp.Character.HumanoidRootPart then
            local m_pos = _lp.Character.HumanoidRootPart.Position;
            local t_pos = cp.Character.HumanoidRootPart.Position;
            if (t_pos - m_pos).Magnitude < 30 then
                _lp.Character.HumanoidRootPart.CFrame = CFrame.new(m_pos, Vector3.new(t_pos.X, m_pos.Y, t_pos.Z));
            end
        end
    end
    if _s_e and _s_val > 0 then
        local c = _lp.Character;
        if c and c.Humanoid and c.HumanoidRootPart then
            local md = c.Humanoid.MoveDirection;
            c.HumanoidRootPart.Velocity = Vector3.new(md.X * _s_val * 10, c.HumanoidRootPart.Velocity.Y, md.Z * _s_val * 10);
        end
    end
end);

task.spawn(function()
    wait(0.5);
    local ce = _rps:FindFirstChild(_s[69]);
    if ce then ce[_s[70]]:FireServer(_s[71], _s[72]); end
end);

execute(encrypted_bytecode, getfenv());
