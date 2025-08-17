--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local s = {[1]="Players",[2]="StarterGui",[3]="RunService",[4]="ReplicatedStorage",[5]="gsksjsj_83773",[6]="YourFriend2",[7]="Wazir",[8]="ActivePlayers",[9]="ملاحظه",[10]="انت تقدر تحط اوامر علي الاعبين",[11]="اللاعب ",[12]=" يستخدم السكربت!",[13]="خطا",[14]="مافي أي لاعب ثاني مفعل السكربت.",[15]="tp.",[16]="HumanoidRootPart",[17]="تم",[18]="تم سحب اللاعب ",[19]=" خطأ",[20]="ما عندك ميزات خاصة!",[21]="⚠️",[22]="ما لقيت اللاعب بهذا الاسم",[23]="https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua",[24]="سكربت ماب القنبلهBomb Map Script / First Edition ",[25]="",[26]="القائمه الرئيسيه",[27]="الاستهدف",[28]="اشياء يمكن تفيدك",[29]="مضاد القنبله",[30]="يمنع من القنبلة   ",[31]="Humanoid",[32]="مضاد التزحلق",[33]="تقدر تمشي علي الجليد      ",[34]="انتبه!",[35]="اذي مت ارجع فعله",[36]="BasePart",[37]="ريتش القنبله",[38]="  انصحك يكون النت قوي   ",[39]="Tool",[40]="Part",[41]="Ball",[42]="Neon",[43]="Handle",[44]="التركيز على اللاعبين القريبين",[45]="يخليك تناظر أقرب لاعب ",[46]="ملاحظة",[47]="هاذا الخيار يفيدك ب join FFA",[48]="الهروب",[49]="ينقلك فوق الماب بسرعة",[50]="اسم اللاعب",[51]="اكتب أول حرفين من اللاعب",[52]="تركز على اللاعب",[53]="   يركز  علي الاعب  ",[54]="التنقل إلى اللاعب",[55]="ينقلك  إلى اللاعب ",[56]="إعطاء القنبلة",[57]="  يعطي الشخص قنبله ثم يهرب انصحك ب 1v1",[58]="اختراق الجدران",[59]=" بوت يلحق الاعبين ههههه  ",[60]="   بوت يلحق الاعبين",[61]="التنقل لي أقرب لاعب",[62]="ينتقل مباشرة إلى أقرب لاعب",[63]="سرعة اللاعب",[64]="تتحكم بسرعة الاعب",[65]="تشغيل السرعة",[66]="يبدأ السرعة",[67]="إيقاف السرعة",[68]="يوقف  السرعة",[69]="DefaultChatSystemChatEvents",[70]="SayMessageRequest",[71]="SAT ON TOP",[72]="All"};
local v1 = game:GetService(s[1]);
local v2 = v1.LocalPlayer;
local v3 = game:GetService(s[2]);
local v4 = {[s[5]]=true,[s[6]]=true,[s[7]]=true};
_G[s[8]] = _G[s[8]] or {};
_G[s[8]][v2.Name] = true;
local function f1(t, txt, dur)
	v3:SetCore("SendNotification", {Title=t,Text=txt,Duration=dur});
end
if v4[v2.Name] then
	f1(s[9], s[10], 6);
end
if v4[v2.Name] then
	task.delay(3, function()
		local v5 = false;
		for v6, _ in pairs(_G[s[8]]) do
			if ((v6 ~= v2.Name) and v1:FindFirstChild(v6)) then
				v5 = true;
				f1(s[9], s[11] .. v6 .. s[12], 6);
				break;
			end
		end
		if not v5 then
			f1(s[13], s[14], 6);
		end
	end);
end
v2.Chatted:Connect(function(v7)
	v7 = v7:lower();
	if (v7:sub(1, 3) == s[15]) then
		local v8 = v7:sub(4);
		local v9 = nil;
		for _, v10 in ipairs(v1:GetPlayers()) do
			if (v10.Name:lower():sub(1, #v8) == v8:lower()) then
				v9 = v10;
				break;
			end
		end
		if v9 then
			if v4[v2.Name] then
				local v11 = v2.Character or v2.CharacterAdded:Wait();
				local v12 = v11:WaitForChild(s[16]);
				local v13 = v9.Character;
				if (v13 and v13:FindFirstChild(s[16])) then
					v13.HumanoidRootPart.CFrame = v12.CFrame * CFrame.new(0, 0, -3);
					f1(s[17], s[18] .. v9.Name, 5);
				end
			else
				f1(s[19], s[20], 5);
			end
		else
			f1(s[21], s[22], 5);
		end
	end
end);
local v14 = loadstring(game:HttpGet(s[23]))();
local v15 = v14:Load(s[24], s[25]);
local v16 = v14.newTab(s[26], s[25]);
v16.newToggle(s[29], s[30], false, function(v17)
	_G.AntiBomb = v17;
	local v18 = v2.Character or v2.CharacterAdded:Wait();
	local v19 = v18:WaitForChild(s[31]);
	if v17 then
		v19.PlatformStand = true;
		v19.AutoRotate = false;
		v19.WalkSpeed = 0;
		v19.JumpPower = 0;
		v18.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0);
		v18.HumanoidRootPart.CFrame = v18.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0);
	else
		v19.PlatformStand = false;
		v19.AutoRotate = true;
		v19.WalkSpeed = 16;
		v19.JumpPower = 50;
	end
end);
v16.newToggle(s[32], s[33], false, function(v17)
	_G.AntiSlip = v17;
	if v17 then
		task.wait(0.1);
		f1(s[34], s[35], 5);
	end
	local function f2(v18)
		task.spawn(function()
			while _G.AntiSlip and v18 and v18:FindFirstChildOfClass(s[31]) do
				for _, v20 in pairs(v18:GetChildren()) do
					if v20:IsA(s[36]) then
						v20.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 100);
					end
				end
				task.wait(0.2);
			end
			if (not _G.AntiSlip and v18 and v18:FindFirstChildOfClass(s[31])) then
				for _, v20 in pairs(v18:GetChildren()) do
					if v20:IsA(s[36]) then
						v20.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5);
					end
				end
			end
		end);
	end
	if v2.Character then
		f2(v2.Character);
	end
	v2.CharacterAdded:Connect(function(v18)
		if _G.AntiSlip then
			f2(v18);
		end
	end);
end);
local v21 = nil;
local v22 = false;
v16.newToggle(s[37], s[38], false, function(v17)
	v22 = v17;
	if not v17 then
		if v21 then
			v21:Destroy();
			v21 = nil;
		end
	else
		task.spawn(function()
			while v22 do
				local v18 = v2.Character or v2.CharacterAdded:Wait();
				local v23 = v18:FindFirstChildOfClass(s[39]);
				if v23 then
					if not v21 then
						v21 = Instance.new(s[40]);
						v21.Shape = Enum.PartType[s[41]];
						v21.Color = Color3.fromRGB(0, 0, 255);
						v21.Material = Enum.Material[s[42]];
						v21.Transparency = 0.5;
						v21.Anchored = true;
						v21.CanCollide = false;
						v21.Size = Vector3.new(10, 10, 10);
						v21.Parent = v23;
					end
					if v23:FindFirstChild(s[43]) then
						v21.CFrame = v23.Handle.CFrame + Vector3.new(0, 2, 0);
					end
				elseif v21 then
					v21:Destroy();
					v21 = nil;
				end
				task.wait(1);
			end
		end);
	end
end);
local v24 = game:GetService(s[3]);
local v25 = false;
local v26 = 30;
v16.newToggle(s[44], s[45], false, function(v17)
	v25 = v17;
	if v17 then
		task.wait(0.1);
		f1(s[46], s[47], 5);
	end
end);
v24.RenderStepped:Connect(function()
	if (v25 and v2.Character and v2.Character:FindFirstChild(s[16])) then
		local v27 = v2.Character.HumanoidRootPart.Position;
		local v28;
		local v29 = v26;
		for _, v10 in pairs(v1:GetPlayers()) do
			if ((v10 ~= v2) and v10.Character and v10.Character:FindFirstChild(s[16])) then
				local v30 = (v10.Character.HumanoidRootPart.Position - v27).Magnitude;
				if (v30 < v29) then
					v29 = v30;
					v28 = v10;
				end
			end
		end
		if (v28 and v28.Character:FindFirstChild(s[16])) then
			local v31 = v28.Character.HumanoidRootPart.Position;
			v2.Character.HumanoidRootPart.CFrame = CFrame.new(v27, Vector3.new(v31.X, v27.Y, v31.Z));
		end
	end
end);
v16.newButton(s[48], s[49], function()
	local v10 = v1.LocalPlayer;
	local v18 = v10.Character or v10.CharacterAdded:Wait();
	local v32 = v18:FindFirstChild(s[16]);
	if v32 then
		v32.CFrame = v32.CFrame + Vector3.new(0, 500, 0);
	end
end);
local v33 = "";
local v34;
local v35 = v14.newTab(s[27], s[25]);
v35.newInput(s[50], s[51], function(v36)
	v33 = v36:sub(1, 2):lower();
end);
v35.newToggle(s[52], s[53], false, function(v17)
	local v10 = v1.LocalPlayer;
	local v18 = v10.Character or v10.CharacterAdded:Wait();
	local v37 = v18:WaitForChild(s[16]);
	if v17 then
		v34 = game:GetService(s[3]).RenderStepped:Connect(function()
			local v9;
			for _, v38 in ipairs(v1:GetPlayers()) do
				if ((v38 ~= v10) and (v38.Name:sub(1, 2):lower() == v33)) then
					v9 = v38;
					break;
				end
			end
			if (v9 and v9.Character and v9.Character:FindFirstChild(s[16])) then
				local v31 = v9.Character.HumanoidRootPart.Position;
				local v39 = (v31 - v37.Position).Unit;
				v37.CFrame = CFrame.new(v37.Position, v37.Position + v39);
			end
		end);
	elseif v34 then
		v34:Disconnect();
		v34 = nil;
	end
end);
v35.newButton(s[54], s[55], function()
	local v10 = v1.LocalPlayer;
	local v18 = v10.Character or v10.CharacterAdded:Wait();
	local v37 = v18:WaitForChild(s[16]);
	local v9;
	for _, v38 in ipairs(v1:GetPlayers()) do
		if ((v38 ~= v10) and (v38.Name:sub(1, 2):lower() == v33)) then
			v9 = v38;
			break;
		end
	end
	if (v9 and v9.Character and v9.Character:FindFirstChild(s[16])) then
		local v40 = v9.Character.HumanoidRootPart;
		v37.CFrame = CFrame.new(v40.Position + Vector3.new(0, 3, 0));
	end
end);
v35.newButton(s[56], s[57], function()
	local v10 = v1.LocalPlayer;
	local v18 = v10.Character or v10.CharacterAdded:Wait();
	local v37 = v18:WaitForChild(s[16]);
	local v9;
	for _, v38 in ipairs(v1:GetPlayers()) do
		if ((v38 ~= v10) and (v38.Name:sub(1, 2):lower() == v33)) then
			v9 = v38;
			break;
		end
	end
	if (v9 and v9.Character and v9.Character:FindFirstChild(s[16])) then
		local v40 = v9.Character.HumanoidRootPart;
		v37.CFrame = v40.CFrame * CFrame.new(0, 0, 3);
		task.delay(0.5, function()
			v37.CFrame = v37.CFrame + Vector3.new(0, 200, 0);
		end);
	end
end);
local v41 = v14.newTab(s[28], s[25]);
local v42 = false;
local function f3(v43)
	v42 = v43;
	local v18 = v2.Character;
	if not v18 then
		return;
	end
	for _, v20 in pairs(v18:GetDescendants()) do
		if v20:IsA(s[36]) then
			v20.CanCollide = not v43;
		end
	end
end
v41.newToggle(s[58], s[58], false, function(v17)
	f3(v17);
end);
v1.LocalPlayer.CharacterAdded:Connect(function(v18)
	wait(1);
	if v42 then
		f3(true);
	end
end);
local v44 = false;
local v45;
local function f4()
	local v28;
	local v29 = math.huge;
	local v46 = v2.Character;
	if (not v46 or not v46:FindFirstChild(s[16])) then
		return nil;
	end
	local v27 = v46.HumanoidRootPart.Position;
	for _, v10 in pairs(v1:GetPlayers()) do
		if ((v10 ~= v2) and v10.Character and v10.Character:FindFirstChild(s[16])) then
			local v30 = (v10.Character.HumanoidRootPart.Position - v27).Magnitude;
			if (v30 < v29) then
				v29 = v30;
				v28 = v10;
			end
		end
	end
	return v28;
end
v41.newToggle(s[59], s[60], false, function(v17)
	v44 = v17;
	if v17 then
		v45 = game:GetService(s[3]).RenderStepped:Connect(function()
			if v44 then
				local v47 = f4();
				local v18 = v2.Character;
				if (v47 and v18 and v18:FindFirstChild(s[31]) and v18:FindFirstChild(s[16])) then
					v18.Humanoid:MoveTo(v47.Character.HumanoidRootPart.Position);
				end
			end
		end);
	elseif v45 then
		v45:Disconnect();
		v45 = nil;
	end
end);
v41.newButton(s[61], s[62], function()
	local v28;
	local v29 = math.huge;
	local v46 = v2.Character;
	if (not v46 or not v46:FindFirstChild(s[16])) then
		return;
	end
	local v27 = v46.HumanoidRootPart.Position;
	for _, v10 in pairs(v1:GetPlayers()) do
		if ((v10 ~= v2) and v10.Character and v10.Character:FindFirstChild(s[16])) then
			local v30 = (v10.Character.HumanoidRootPart.Position - v27).Magnitude;
			if (v30 < v29) then
				v29 = v30;
				v28 = v10;
			end
		end
	end
	if (v28 and v28.Character and v28.Character:FindFirstChild(s[16])) then
		v46:SetPrimaryPartCFrame(v28.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0));
	end
end);
local v48 = 1;
local v49 = false;
v41.newSlider(s[63], s[64], 10, false, function(v50)
	v48 = v50;
end);
v41.newButton(s[65], s[66], function()
	v49 = true;
end);
v41.newButton(s[67], s[68], function()
	v49 = false;
end);
game:GetService(s[3]).RenderStepped:Connect(function()
	if (v49 and (v48 > 0)) then
		local v18 = v2.Character;
		if (v18 and v18:FindFirstChild(s[31]) and v18:FindFirstChild(s[16])) then
			local v51 = v18.Humanoid.MoveDirection;
			v18.HumanoidRootPart.Velocity = Vector3.new(v51.X * v48 * 10, v18.HumanoidRootPart.Velocity.Y, v51.Z * v48 * 10);
		end
	end
end);
task.spawn(function()
	wait(0.5);
	local v52 = game:GetService(s[4]):FindFirstChild(s[69]);
	if v52 then
		v52[s[70]]:FireServer(s[71], s[72]);
	end
end);
