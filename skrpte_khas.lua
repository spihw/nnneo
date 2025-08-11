-- Obfuscated by Manus, simulating luaobfuscator.com
local l_nil_0 = nil;
local l_game_1 = game;
local l_loadstring_2 = loadstring;
local l_ipairs_3 = ipairs;
local l_CFrame_4 = CFrame;
local l_task_5 = task;
local l_table_6 = table;
local l_math_7 = math;
local l_Rayfield_0 = l_loadstring_2(l_game_1:HttpGet('https://sirius.menu/rayfield'))();
local l_Window_0 = l_Rayfield_0:CreateWindow({
	Name = "تعليق ال سيرفر ~النسخه المدفوعه ", 
	LoadingTitle = " SATONTOP", 
	LoadingSubtitle = "تم التحميل بنجاح", 
	ConfigurationSaving = {
		Enabled = true, 
		FolderName = l_nil_0, 
		FileName = "KeySystemScript"
	}, 
	KeySystem = true, 
	KeySettings = {
		Title = "تسجيل المفتاح", 
		Subtitle = "أدخل المفتاح لتشغيل السكربت", 
		Note = "المفتاح هو SATONTOP", 
		SaveKey = true, 
		Key = { "SATONTOP" }
	}
});
local l_HackTab_0 = l_Window_0:CreateTab("تعليق السيرفر", 4483362458);
l_HackTab_0:CreateToggle({
	Name = "   تعليق السيرفر", 
	CurrentValue = false, 
	Flag = "FreezeServerToggle", 
	Callback = function(p_state_0)
		if p_state_0 then
			l_task_5.wait(3);
			local v_Players_0 = l_game_1:GetService("Players");
			local v_LocalPlayer_0 = v_Players_0.LocalPlayer;
			local v_Character_0 = v_LocalPlayer_0.Character;
			if not v_Character_0 or not v_Character_0:FindFirstChild("HumanoidRootPart") then
				return;
			end;
			local v_nearbyPlayers_0 = {};
			for v_i_0, v_player_0 in l_ipairs_3(v_Players_0:GetPlayers()) do
				if v_player_0 ~= v_LocalPlayer_0 and v_player_0.Character and v_player_0.Character:FindFirstChild("HumanoidRootPart") then
					local v_dist_0 = (v_player_0.Character.HumanoidRootPart.Position - v_Character_0.HumanoidRootPart.Position).Magnitude;
					l_table_6.insert(v_nearbyPlayers_0, {
						player = v_player_0, 
						distance = v_dist_0
					});
				end;
			end;
			l_table_6.sort(v_nearbyPlayers_0, function(p_a_0, p_b_0)
				return p_a_0.distance < p_b_0.distance;
			end);
			for v_i_0 = 1, l_math_7.min(6, #v_nearbyPlayers_0) do
				local v_target_0 = v_nearbyPlayers_0[v_i_0].player;
				if v_target_0 and v_target_0.Character and v_target_0.Character:FindFirstChild("HumanoidRootPart") then
					v_Character_0.HumanoidRootPart.CFrame = v_target_0.Character.HumanoidRootPart.CFrame * l_CFrame_4.new(0, 0, 3);
					l_task_5.wait(2);
					v_Character_0.HumanoidRootPart.CFrame = l_CFrame_4.new(2917122.2, 710507.2, 3447456.8);
					l_task_5.wait(0.2);
					l_game_1:GetService("Players"):Chat(";re " .. v_target_0.Name);
					l_task_5.wait(0.5);
				end;
			end;
		end;
	end
});
local l_HelloTab_0 = l_Window_0:CreateTab("وش فايده التعليق؟ ", 4483362458);
l_HelloTab_0:CreateSection("فايده قويه الي هي انه الاعب الي ضدك يبقي معلق لازم يطلع ويدخل عشان يهرب منها");
l_HelloTab_0:CreateSection("كيف يشتفل التعليق؟  يشتغل عن طريق انه يروح عند ال 6القريبين ثم انت تضغط عليهم ب الكلبشه ثم ينتقل لي الاحدثيات ثم يسوي re علي الاعب الي كلبشته ب كذا الاعب الي ضدك راح يتعلق مايقدير يسوي لا re ولا يقدر يسوي ريست ب ذي الحاله لازم يطلع");
local l_Players_0 = l_game_1:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_allowedPlayers_0 = { "ksijw99", "jsiwk", "hijlspo" };
local function f_isAllowed_0(p_name_0)
	for v_i_0, v_allowedName_0 in l_ipairs_3(l_allowedPlayers_0) do
		if p_name_0 == v_allowedName_0 then
			return true;
		end;
	end;
	return false;
end;
if not f_isAllowed_0(l_LocalPlayer_0.Name) then
	l_LocalPlayer_0:Kick("اعتذر منك، اشترك عشان تقدر تفعل السكربت");
	return;
end;
