--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))();
local window = DrRayLibrary:Load("سكربت ماب القنبلهBomb Map Script / First Edition ", "");
local tab = DrRayLibrary.newTab("القائمه الرئيسيه", "ImageIdHere");
local Players = game:GetService("Players");
local plr = Players.LocalPlayer;
tab.newToggle("مضاد القنبله", "يمنع من القنبلة   ", false, function(toggleState)
	_G.AntiBomb = toggleState;
	local char = plr.Character or plr.CharacterAdded:Wait();
	local hum = char:WaitForChild("Humanoid");
	if toggleState then
		hum.PlatformStand = true;
		hum.AutoRotate = false;
		hum.WalkSpeed = 0;
		hum.JumpPower = 0;
		char.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0);
		char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0);
	else
		hum.PlatformStand = false;
		hum.AutoRotate = true;
		hum.WalkSpeed = 16;
		hum.JumpPower = 50;
	end
end);
tab.newToggle("مضاد التزحلق", "تقدر تمشي علي الجليد      ", false, function(toggleState)
	_G.AntiSlip = toggleState;
	if toggleState then
		task.wait(0.1);
		game.StarterGui:SetCore("SendNotification", {Title="انتبه!",Text="اذي مت ارجع فعله",Duration=5});
	end
	local function applyAntiSlip(char)
		task.spawn(function()
			while _G.AntiSlip and char and char:FindFirstChildOfClass("Humanoid") do
				for _, part in pairs(char:GetChildren()) do
					if part:IsA("BasePart") then
						part.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 100);
					end
				end
				task.wait(0.2);
			end
			if (not _G.AntiSlip and char and char:FindFirstChildOfClass("Humanoid")) then
				for _, part in pairs(char:GetChildren()) do
					if part:IsA("BasePart") then
						part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5);
					end
				end
			end
		end);
	end
	if plr.Character then
		applyAntiSlip(plr.Character);
	end
	plr.CharacterAdded:Connect(function(char)
		if _G.AntiSlip then
			applyAntiSlip(char);
		end
	end);
end);
local bombReachSphere = nil;
local bombReachEnabled = false;
local bombReachSphere = nil;
local bombReachEnabled = false;
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
local ReachEnabled = false;
local ReachSize = 5;
local function applyReach()
	local tool = Character:FindFirstChildOfClass("Tool");
	if not tool then
		return;
	end
	local part = tool:FindFirstChildWhichIsA("BasePart") or Character:FindFirstChild("RightHand") or Character:FindFirstChild("Right Arm");
	if not part then
		return;
	end
	game:GetService("RunService").RenderStepped:Connect(function()
		if not ReachEnabled then
			return;
		end
		for _, player in pairs(game:GetService("Players"):GetPlayers()) do
			if ((player ~= LocalPlayer) and player.Character) then
				local hum = player.Character:FindFirstChild("HumanoidRootPart");
				if (hum and ((hum.Position - part.Position).Magnitude <= ReachSize)) then
					if tool:FindFirstChildWhichIsA("BasePart") then
						firetouchinterest(tool:FindFirstChildWhichIsA("BasePart"), hum, 0);
						firetouchinterest(tool:FindFirstChildWhichIsA("BasePart"), hum, 1);
					end
				end
			end
		end
	end);
end
tab.newToggle("ريتـش للقنبله", "ريتش قوي انصحك بكون النت قوي", false, function(state)
	ReachEnabled = state;
	if state then
		applyReach();
		print(" الريتش شغال");
	else
		print(" توقف الريتش");
	end
end);
tab.newSlider("حجم الريتش", "حدد قوة الريتش", 10, false, function(num)
	ReachSize = num;
end);
LocalPlayer.CharacterAdded:Connect(function(char)
	Character = char;
	if ReachEnabled then
		task.wait(1);
		applyReach();
	end
end);
local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local LocalPlayer = Players.LocalPlayer;
local aimEnabled = false;
local aimDistance = 30;
tab.newToggle("التركيز على اللاعبين القريبين", "يخليك تناظر أقرب لاعب ", false, function(toggleState)
	aimEnabled = toggleState;
	if toggleState then
		task.wait(0.1);
		game.StarterGui:SetCore("SendNotification", {Title="ملاحظة",Text="هاذا الخيار يفيدك ب join FFA",Duration=5});
	end
end);
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local highlightEnabled = false;
local highlights = {};
tab.newToggle("كشف اللاعبين", " كشف الاعبين   ", false, function(toggleState)
	highlightEnabled = toggleState;
	if highlightEnabled then
		for _, player in pairs(Players:GetPlayers()) do
			if ((player ~= LocalPlayer) and player.Character) then
				local char = player.Character;
				if highlights[player] then
					highlights[player]:Destroy();
				end
				local highlight = Instance.new("Highlight");
				highlight.Adornee = char;
				highlight.FillColor = Color3.fromRGB(255, 255, 255);
				highlight.OutlineColor = Color3.fromRGB(255, 255, 255);
				highlight.Parent = char;
				highlights[player] = highlight;
			end
		end
	else
		for _, hl in pairs(highlights) do
			if hl then
				hl:Destroy();
			end
		end
		highlights = {};
	end
end);
Players.PlayerAdded:Connect(function(player)
	if (highlightEnabled and (player ~= LocalPlayer)) then
		player.CharacterAdded:Connect(function(char)
			local highlight = Instance.new("Highlight");
			highlight.Adornee = char;
			highlight.FillColor = Color3.fromRGB(255, 255, 255);
			highlight.OutlineColor = Color3.fromRGB(255, 255, 255);
			highlight.Parent = char;
			highlights[player] = highlight;
		end);
	end
end);
RunService.RenderStepped:Connect(function()
	if (aimEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
		local myPos = LocalPlayer.Character.HumanoidRootPart.Position;
		local closestPlayer;
		local closestDistance = aimDistance;
		for _, player in pairs(Players:GetPlayers()) do
			if ((player ~= LocalPlayer) and player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
				local distance = (player.Character.HumanoidRootPart.Position - myPos).Magnitude;
				if (distance < closestDistance) then
					closestDistance = distance;
					closestPlayer = player;
				end
			end
		end
		if (closestPlayer and closestPlayer.Character:FindFirstChild("HumanoidRootPart")) then
			local targetPos = closestPlayer.Character.HumanoidRootPart.Position;
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(myPos, Vector3.new(targetPos.X, myPos.Y, targetPos.Z));
		end
	end
end);
tab.newButton("الهروب", "ينقلك فوق الماب بسرعة", function()
	local player = game.Players.LocalPlayer;
	local char = player.Character or player.CharacterAdded:Wait();
	local root = char:FindFirstChild("HumanoidRootPart");
	if root then
		root.CFrame = root.CFrame + Vector3.new(0, 500, 0);
	end
end);
local TargetName = "";
local TargetName = "";
local AimConnection;
local TargetName = "";
local FocusConnection;
tab.newButton("  اعاده دخول السيرفر", "  اعاده دخول السبرفر .", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/j2ex7NdF"))();
end);
tab.newButton("تغير السيرفر", "تغير ال سيرفر ", function()
	local TeleportService = game:GetService("TeleportService");
	local PlaceID = game.PlaceId;
	TeleportService:Teleport(PlaceID, game.Players.LocalPlayer);
end);
local tab = DrRayLibrary.newTab("الاستهدف", "ImageIdHere");
tab.newInput("اسم اللاعب", "اكتب أول حرفين من اللاعب", function(text)
	TargetName = text:sub(1, 2):lower();
	print("اللاعب المستهدف يبدأ بـ: " .. TargetName);
end);
tab.newToggle("تركز على اللاعب", "   يركز  علي الاعب  ", false, function(toggleState)
	local plr = game.Players.LocalPlayer;
	local char = plr.Character or plr.CharacterAdded:Wait();
	local hrp = char:WaitForChild("HumanoidRootPart");
	if toggleState then
		FocusConnection = game:GetService("RunService").RenderStepped:Connect(function()
			local targetPlayer;
			for _, p in ipairs(game.Players:GetPlayers()) do
				if ((p ~= plr) and (p.Name:sub(1, 2):lower() == TargetName)) then
					targetPlayer = p;
					break;
				end
			end
			if (targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then
				local targetPos = targetPlayer.Character.HumanoidRootPart.Position;
				local direction = (targetPos - hrp.Position).Unit;
				hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + direction);
			end
		end);
	elseif FocusConnection then
		FocusConnection:Disconnect();
		FocusConnection = nil;
	end
end);
tab.newButton("التنقل إلى اللاعب", "ينقلك  إلى اللاعب ", function()
	local plr = game.Players.LocalPlayer;
	local char = plr.Character or plr.CharacterAdded:Wait();
	local hrp = char:WaitForChild("HumanoidRootPart");
	local targetPlayer;
	for _, p in ipairs(game.Players:GetPlayers()) do
		if ((p ~= plr) and (p.Name:sub(1, 2):lower() == TargetName)) then
			targetPlayer = p;
			break;
		end
	end
	if (targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then
		local targetHRP = targetPlayer.Character.HumanoidRootPart;
		hrp.CFrame = CFrame.new(targetHRP.Position + Vector3.new(0, 3, 0));
		print("تم الانتقال إلى اللاعب المستهدف!");
	else
		print("اللاعب غير موجود أو لم تدخل أول حرفين بشكل صحيح");
	end
end);
tab.newButton("إعطاء القنبلة", "  يعطي الشخص قنبله ثم يهرب انصحك ب 1v1", function()
	local plr = game.Players.LocalPlayer;
	local char = plr.Character or plr.CharacterAdded:Wait();
	local hrp = char:WaitForChild("HumanoidRootPart");
	local targetPlayer;
	for _, p in ipairs(game.Players:GetPlayers()) do
		if ((p ~= plr) and (p.Name:sub(1, 2):lower() == TargetName)) then
			targetPlayer = p;
			break;
		end
	end
	if (targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then
		local targetHRP = targetPlayer.Character.HumanoidRootPart;
		hrp.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3);
		task.delay(0.5, function()
			hrp.CFrame = hrp.CFrame + Vector3.new(0, 200, 0);
		end);
	else
		print("اللاعب المستهدف غير موجود");
	end
end);
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local moveConnection;
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local moveConnection;
local MoveToTargetEnabled = false;
tab.newToggle("يلحق اللاعب ", "يلحق الاعب انصحك 1v1 ", false, function(toggleState)
	MoveToTargetEnabled = toggleState;
	if toggleState then
		print("On");
		moveConnection = RunService.RenderStepped:Connect(function()
			if (MoveToTargetEnabled and TargetName) then
				for _, plr in pairs(Players:GetPlayers()) do
					if ((plr ~= LocalPlayer) and (plr.Name:lower():sub(1, 2) == TargetName)) then
						local char = LocalPlayer.Character;
						if (plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and char and char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart")) then
							char.Humanoid:MoveTo(plr.Character.HumanoidRootPart.Position);
						end
					end
				end
			end
		end);
	else
		print("Off");
		if moveConnection then
			moveConnection:Disconnect();
			moveConnection = nil;
		end
	end
end);
local tab = DrRayLibrary.newTab("اشياء يمكن تفيدك", "ImageIdHere");
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local RunService = game:GetService("RunService");
local MoveToClosestEnabled = false;
local moveConnection;
local function getClosestPlayer()
	local closestPlayer;
	local shortestDistance = math.huge;
	local myCharacter = LocalPlayer.Character;
	if (not myCharacter or not myCharacter:FindFirstChild("HumanoidRootPart")) then
		return nil;
	end
	local myPosition = myCharacter.HumanoidRootPart.Position;
	for _, player in pairs(Players:GetPlayers()) do
		if ((player ~= LocalPlayer) and player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
			local distance = (player.Character.HumanoidRootPart.Position - myPosition).Magnitude;
			if (distance < shortestDistance) then
				shortestDistance = distance;
				closestPlayer = player;
			end
		end
	end
	return closestPlayer;
end
tab.newToggle(" بوت يلحق الاعبين ههههه  ", "   بوت يلحق الاعبين", false, function(toggleState)
	MoveToClosestEnabled = toggleState;
	if toggleState then
		print("On");
		moveConnection = RunService.RenderStepped:Connect(function()
			if MoveToClosestEnabled then
				local closest = getClosestPlayer();
				local char = LocalPlayer.Character;
				if (closest and char and char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart")) then
					char.Humanoid:MoveTo(closest.Character.HumanoidRootPart.Position);
				end
			end
		end);
	else
		print("Off");
		if moveConnection then
			moveConnection:Disconnect();
			moveConnection = nil;
		end
	end
end);
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
tab.newButton("التنقل لي أقرب لاعب", "ينتقل مباشرة إلى أقرب لاعب", function()
	local closestPlayer;
	local shortestDistance = math.huge;
	local myCharacter = LocalPlayer.Character;
	if (not myCharacter or not myCharacter:FindFirstChild("HumanoidRootPart")) then
		return;
	end
	local myPos = myCharacter.HumanoidRootPart.Position;
	for _, player in pairs(Players:GetPlayers()) do
		if ((player ~= LocalPlayer) and player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
			local distance = (player.Character.HumanoidRootPart.Position - myPos).Magnitude;
			if (distance < shortestDistance) then
				shortestDistance = distance;
				closestPlayer = player;
			end
		end
	end
	if (closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart")) then
		myCharacter:SetPrimaryPartCFrame(closestPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0));
		print("تم الانتقال إلى أقرب لاعب:", closestPlayer.Name);
	end
end);
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local speedValue = 1;
local speedEnabled = false;
tab.newSlider("سرعة اللاعب", "تتحكم بسرعة الاعب", 10, false, function(num)
	speedValue = num;
	print("تم تعيين السرعة إلى:", speedValue);
end);
tab.newButton("تشغيل السرعة", "يبدأ السرعة", function()
	speedEnabled = true;
end);
tab.newButton("إيقاف السرعة", "يوقف  السرعة", function()
	speedEnabled = false;
end);
game:GetService("RunService").RenderStepped:Connect(function()
	if (speedEnabled and (speedValue > 0)) then
		local char = LocalPlayer.Character;
		if (char and char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart")) then
			local moveDir = char.Humanoid.MoveDirection;
			char.HumanoidRootPart.Velocity = Vector3.new(moveDir.X * speedValue * 10, char.HumanoidRootPart.Velocity.Y, moveDir.Z * speedValue * 10);
		end
	end
end);
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local RunService = game:GetService("RunService");
local RedClone = nil;
local FollowConnection = nil;
local function createRedClone(character)
	if RedClone then
		RedClone:Destroy();
	end
	local clone = character:Clone();
	for _, v in pairs(clone:GetDescendants()) do
		if (v:IsA("Script") or v:IsA("LocalScript") or v:IsA("Tool")) then
			v:Destroy();
		elseif v:IsA("BasePart") then
			v.BrickColor = BrickColor.new("Bright red");
			v.Material = Enum.Material.SmoothPlastic;
		end
	end
	clone.Name = "RedClone";
	clone.Parent = workspace;
	FollowConnection = RunService.RenderStepped:Connect(function()
		if (character:FindFirstChild("HumanoidRootPart") and clone:FindFirstChild("HumanoidRootPart")) then
			clone:SetPrimaryPartCFrame(character.HumanoidRootPart.CFrame);
		end
	end);
	RedClone = clone;
end
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local RunService = game:GetService("RunService");
local RedClone = nil;
local FollowConnection = nil;
local function createRedClone(character)
	if RedClone then
		RedClone:Destroy();
	end
	local clone = character:Clone();
	clone.Parent = workspace;
	clone.Name = "LocalRedClone";
	for _, v in pairs(clone:GetDescendants()) do
		if (v:IsA("Script") or v:IsA("LocalScript") or v:IsA("Tool")) then
			v:Destroy();
		elseif v:IsA("BasePart") then
			v.BrickColor = BrickColor.new("Really red");
			v.Material = Enum.Material.SmoothPlastic;
		end
	end
	local hrp = clone:FindFirstChild("HumanoidRootPart");
	local origHrp = character:FindFirstChild("HumanoidRootPart");
	if (hrp and origHrp) then
		FollowConnection = RunService.RenderStepped:Connect(function()
			if (origHrp and hrp) then
				hrp.CFrame = origHrp.CFrame;
			end
		end);
	end
	RedClone = clone;
end
tab.newToggle("تخفيف الاعب فعله مع ريتش ويصير شي قوي", "تخفيف العب", false, function(toggle)
	if toggle then
		if LocalPlayer.Character then
			createRedClone(LocalPlayer.Character);
			print(" الجسم الأحمر مفعل (Local)");
		end
	else
		if RedClone then
			RedClone:Destroy();
			RedClone = nil;
		end
		if FollowConnection then
			FollowConnection:Disconnect();
			FollowConnection = nil;
		end
		print(" تم إيقاف الجسم الأحمر ");
	end
end);
LocalPlayer.CharacterAdded:Connect(function(char)
	if RedClone then
		RedClone:Destroy();
		RedClone = nil;
	end
	if FollowConnection then
		FollowConnection:Disconnect();
		FollowConnection = nil;
	end
end);
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local allowedPlayers = {"rete740","gsksjsj_83773"};
local LocalPlayer = game.Players.LocalPlayer;
local canShowTab = false;
for _, name in ipairs(allowedPlayers) do
	if (name == LocalPlayer.Name) then
		canShowTab = true;
		break;
	end
end
if canShowTab then
	local tab = DrRayLibrary.newTab("استهداف اللاعبين", "ImageIdHere");
	local TargetName = "";
	tab.newInput("اسم اللاعب", "اكتب أول حرفين من اسم اللاعب", function(text)
		TargetName = text:sub(1, 2):lower();
	end);
	tab.newButton("  يسحبه", "يقتل ويسحب ويجمد اللاعب", function()
		local targetPlayer;
		for _, p in ipairs(game.Players:GetPlayers()) do
			if ((p ~= LocalPlayer) and (p.Name:sub(1, 2):lower() == TargetName)) then
				targetPlayer = p;
				break;
			end
		end
		if (targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then
			if targetPlayer:FindFirstChild("HasMyScript") then
				local hrp = targetPlayer.Character.HumanoidRootPart;
				targetPlayer.Character.Humanoid.PlatformStand = true;
				hrp.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0);
				targetPlayer.Character:BreakJoints();
			else
				game.StarterGui:SetCore("SendNotification", {Title="خطأ",Text=("اللاعب " .. targetPlayer.Name .. " لم يفعل  سكربت!"),Duration=3});
			end
		else
			game.StarterGui:SetCore("SendNotification", {Title="خطأ",Text="اللاعب غير موجود أو لم  حرفين بشكل؟ ",Duration=3});
		end
	end);
end
game.Players.PlayerAdded:Connect(function(plr)
end);
