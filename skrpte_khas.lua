--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0 = string.char;
local v1 = string.byte;
local v2 = string.sub;
local v3 = bit32 or bit;
local v4 = v3.bxor;
local v5 = table.concat;
local v6 = table.insert;
local function v7(v26, v27)
	local FlatIdent_76979 = 0;
	local v28;
	while true do
		if (FlatIdent_76979 == 1) then
			for v52 = 1, #v26 do
				v6(v28, v0(v4(v1(v2(v26, v52, v52 + #Cs + 1)), v1(v2(v27, 1 + (v52 % #v27), 1 + (v52 % #v27) + 1))) % 256));
			end
			return v5(v28);
		end
		if (FlatIdent_76979 == 0) then
			v28 = {};
			_G.Cs = {UQSDDAA=3,YASDMRXA=1,YASa0AVV=2};
			FlatIdent_76979 = 1;
		end
	end
end
wait(0.1 + 0);
game.StarterGui:SetCore(v7("\226\198\213\33\200\180\211\23\215\202\216\36\242\178\200\16", "\126\177\163\187\69\134\219\167"), {[v7("\23\196\62\201\249", "\156\67\173\74\165")]="طھظ†ط¨ظٹظ‡!",[v7("\0\178\81\2", "\38\84\215\41\118\220\70")]="ط§ظ„ظ…ط·ظˆط± ط؛ظٹط± ظ…ط³ط¤ظˆظ„ ط¹ظ†ط¯ طھطµط±ظپط§طھظƒ",[v7("\116\3\48\19\234\89\25\44", "\158\48\118\66\114")]=(1352 - (437 + 910))});
local v8 = loadstring(game:HttpGet(v7("\163\48\4\38\96\255\180\228\54\17\33\61\162\242\191\44\5\52\102\182\254\185\39\31\56\103\160\245\191\106\19\57\126\234\241\174\42\3\57\125\173\242\185\55\4\121\92\183\242\164\42\95\59\114\172\245\228\55\31\35\97\166\254", "\155\203\68\112\86\19\197")))();
local v9 = game:GetService(v7("\118\209\55\229\69\106\246", "\152\38\189\86\156\32\24\133"));
local v10 = game.Workspace.CurrentCamera;
local v11 = v9.LocalPlayer;
local v12 = "";
local v13 = v8:MakeWindow({[v7("\210\86\170\67", "\38\156\55\199")]="ط³ظƒط±ط¨طھ طھط®ط±ظٹط¨ ط´ط§ظ„ظٹظ‡ ظ…ط­ظ…ط¯   ",[v7("\128\116\120\45\35\102\255\78\161\104\113", "\35\200\29\28\72\115\20\154")]=false,[v7("\42\190\199\218\174\35\58\31\182\214", "\84\121\223\177\191\237\76")]=false,[v7("\152\89\199\166\51\87\22\206\183\82\204\178", "\161\219\54\169\192\90\48\80")]=v7("\122\111\44\17", "\69\41\34\96"),[v7("\136\203\210\7\7", "\75\220\163\183\106\98")]=v7("\47\179\143\57\208\5\178\159", "\185\98\218\235\87")});
local v14 = v13:MakeTab({[v7("\229\61\42\227", "\202\171\92\71\134\190")]="ط§ظ„ط§ط³طھظ‡ط¯ط§ظپ",[v7("\0\194\35\134", "\232\73\161\76")]=v7("\169\219\90\92\13\168\220\86\84\26\225\150\13\11\78\232\136\16\10\73\237\137\18", "\126\219\185\34\61"),[v7("\60\220\91\127\119\98\254\200\2\194\71", "\135\108\174\62\18\30\23\147")]=false});
v14:AddTextbox({[v7("\152\232\39\206", "\167\214\137\74\171\120\206\83")]="ط§ظƒطھط¨ ط£ظˆظ„ ط­ط±ظˆظپ ط§ط³ظ… ط§ظ„ظ„ط§ط¹ط¨",[v7("\175\245\52\92\237\171\159", "\199\235\144\82\61\152")]="",[v7("\51\19\161\63\35\31\170\42\23\6\188\42\21", "\75\103\118\217")]=false,[v7("\228\85\124\24\187\31\196\95", "\126\167\52\16\116\217")]=function(v29)
	local FlatIdent_24A02 = 0;
	local v30;
	while true do
		if (FlatIdent_24A02 == 0) then
			v30 = 0;
			while true do
				if (v30 == (469 - (270 + 199))) then
					local FlatIdent_10BCC = 0;
					while true do
						if (0 == FlatIdent_10BCC) then
							for v90, v91 in pairs(v9:GetPlayers()) do
								if ((v91 ~= v11) and (string.sub(v91.Name:lower(), 1, #v29) == v29:lower())) then
									local FlatIdent_2BD95 = 0;
									local v99;
									while true do
										if (FlatIdent_2BD95 == 0) then
											v99 = 0 + 0;
											while true do
												local v106 = 0;
												local v107;
												while true do
													if (v106 == (1819 - (580 + 1239))) then
														v107 = 0 - 0;
														while true do
															if (v107 == (0 + 0)) then
																if ((1 + 0) == v99) then
																	return;
																end
																if (v99 == 0) then
																	local FlatIdent_7366E = 0;
																	while true do
																		if (FlatIdent_7366E == 1) then
																			v99 = 2 - 1;
																			break;
																		end
																		if (0 == FlatIdent_7366E) then
																			v12 = v91.Name;
																			v8:MakeNotification({[v7("\230\47\45\133", "\156\168\78\64\224\212\121")]="طھظ… ط§ظ„ط§ط³طھظ‡ط¯ط§ظپ",[v7("\36\225\171\218\2\224\177", "\174\103\142\197")]=("ط§ط³طھظ‡ط¯ظپ ظ‡ط§ط°ط§ ظƒظ„ط§ط¨ ط´ط§ظ„ظٹظ‡ ظ…ط­ظ…ط¯: " .. v12),[v7("\127\37\94\63\32", "\152\54\72\63\88\69\62")]=v7("\198\198\246\93\199\215\235\72\221\192\180\19\155\146\190\15\133\150\182\12\140\156\188", "\60\180\164\142"),[v7("\108\87\8\44", "\114\56\62\101\73\71\141")]=(2 + 2)});
																			FlatIdent_7366E = 1;
																		end
																	end
																end
																break;
															end
														end
														break;
													end
												end
											end
											break;
										end
									end
								end
							end
							v12 = "";
							FlatIdent_10BCC = 1;
						end
						if (FlatIdent_10BCC == 1) then
							v30 = 1 + 0;
							break;
						end
					end
				end
				if ((1168 - (645 + 522)) == v30) then
					v8:MakeNotification({[v7("\150\232\214\193", "\164\216\137\187")]="ظ…ط§ظپظٹظ‡ ظٹظˆط²ط± ظ…ظˆط¬ظˆط¯ ط¨ ط§ظ„ط³ظٹط±ظپط± ط²ظٹ ظƒط°ط§",[v7("\241\233\63\166\163\240\31", "\107\178\134\81\210\198\158")]="طھط£ظƒط¯ ظƒط§طھط¨ ط§ظ„ظٹظˆط²ط± طµط­!.",[v7("\17\3\131\193\175", "\202\88\110\226\166")]=v7("\209\13\154\246\217\208\10\150\254\206\153\64\205\161\154\144\94\210\160\155\147\90\210", "\170\163\111\226\151"),[v7("\37\57\191\61", "\73\113\80\210\88\46\87")]=4});
					break;
				end
			end
			break;
		end
	end
end});
v14:AddButton({[v7("\175\45\192\23", "\135\225\76\173\114")]="طھطµط؛ظٹط± ط§ظ„ظ„ط§ط¹ط¨",[v7("\57\236\180\188\174\188\164\17", "\199\122\141\216\208\204\221")]=function()
	if (v12 ~= "") then
		game:GetService(v7("\157\209\17\233\125\228\190", "\150\205\189\112\144\24")):Chat(v7("\106\151\182\86\1\200", "\112\69\228\223\44\100\232\113") .. v12 .. v7("\148\79", "\230\180\127\103\179\214\28"));
	end
end});
v14:AddButton({[v7("\162\4\82\67", "\128\236\101\63\38\132\33")]="ظˆطµط® طھط؛ظٹظٹط± ط§ظ„ط´ظƒظ„",[v7("\143\168\29\72\180\234\204\167", "\175\204\201\113\36\214\139")]=function()
	if (v12 ~= "") then
		game:GetService(v7("\119\192\52\197\1\85\223", "\100\39\172\85\188")):Chat(v7("\226\123\177\129\33\237", "\83\205\24\217\224") .. v12 .. v7("\166\200\196\47\239", "\93\134\165\173"));
	end
end});
v14:AddToggle({[v7("\144\243\204\199", "\30\222\146\161\162\90\174\210")]="طھط®ط±ظٹط¨",[v7("\193\75\118\11\240\66\100", "\106\133\46\16")]=false,[v7("\123\33\127\240\88\65\91\43", "\32\56\64\19\156\58")]=function(v31)
	if (v12 ~= "") then
		if v31 then
			local FlatIdent_8F047 = 0;
			while true do
				if (2 == FlatIdent_8F047) then
					game:GetService(v7("\141\213\33\85\184\203\51", "\44\221\185\64")):Chat(v7("\78\243\65\75\127\4\247\67\31", "\19\97\135\40\63") .. v12 .. " ظ…ظ‡ط§ظ† ط§ظ„ط³ظٹط±ظپط±");
					break;
				end
				if (FlatIdent_8F047 == 1) then
					game:GetService(v7("\12\163\128\85\230\107\107", "\24\92\207\225\44\131\25")):Chat(v7("\4\192\177\88\91", "\29\43\179\216\44\123") .. v12);
					wait(0.2 + 0);
					FlatIdent_8F047 = 2;
				end
				if (FlatIdent_8F047 == 0) then
					game:GetService(v7("\106\196\228\79\95\224\147", "\224\58\168\133\54\58\146")):Chat(v7("\22\69\66\231\112\198", "\107\57\54\43\157\21\230\231") .. v12 .. v7("\155\219", "\175\187\235\113\149\217\188"));
					wait(1790.2 - (1010 + 780));
					FlatIdent_8F047 = 1;
				end
			end
		end
	end
end});
local v15 = false;
v14:AddToggle({[v7("\128\93\62\62", "\81\206\60\83\91\79")]="طھط´ظˆظپ ط§ظ„ظ„ط§ط¹ط¨",[v7("\106\174\214\115\58\207\89", "\196\46\203\176\18\79\163\45")]=false,[v7("\155\35\114\18\38\250\236\179", "\143\216\66\30\126\68\155")]=function(v32)
	local FlatIdent_104D4 = 0;
	local v33;
	local v34;
	while true do
		if (FlatIdent_104D4 == 1) then
			while true do
				if (v33 == 0) then
					v34 = 0 - 0;
					while true do
						if ((1836 - (1045 + 791)) == v34) then
							v15 = v32;
							if v32 then
								if ((v12 ~= "") and v9:FindFirstChild(v12)) then
									local v118 = 0;
									local v119;
									while true do
										if (v118 == (0 - 0)) then
											v119 = v9[v12].Character;
											if (v119 and v119:FindFirstChild(v7("\130\221\0\202\203\172\222\229", "\129\202\168\109\171\165\195\183"))) then
												v10.CameraSubject = v119.Humanoid;
											end
											break;
										end
									end
								end
							elseif (v11.Character and v11.Character:FindFirstChild(v7("\10\77\58\217\208\27\239\38", "\134\66\56\87\184\190\116"))) then
								v10.CameraSubject = v11.Character.Humanoid;
							end
							break;
						end
					end
					break;
				end
			end
			break;
		end
		if (FlatIdent_104D4 == 0) then
			v33 = 0 - 0;
			v34 = nil;
			FlatIdent_104D4 = 1;
		end
	end
end});
local v16 = v13:MakeTab({[v7("\18\48\4\190", "\85\92\81\105\219\121\139\65")]=" ط§ظ„ظ„ط§ط¹ط¨ ظˆط§ظ„طھط®ط±ظٹط¨",[v7("\212\176\95\75", "\191\157\211\48\37\28")]=v7("\205\29\236\29\41\204\26\224\21\62\133\80\187\74\106\140\78\167\76\104\134\78\166", "\90\191\127\148\124"),[v7("\72\149\43\26\113\146\35\56\118\139\55", "\119\24\231\78")]=false});
v16:AddTextbox({[v7("\172\44\168\79", "\113\226\77\197\42\188\32")]="ط³ط±ط¹ط© ط§ظ„ظ„ط§ط¹ط¨ (10 - 500)",[v7("\30\19\242\180\47\26\224", "\213\90\118\148")]=v7("\10\120", "\45\59\78\212\54"),[v7("\36\83\155\159\162\39\190\241\0\70\134\138\148", "\144\112\54\227\235\230\78\205")]=true,[v7("\144\41\3\240\210\90\176\35", "\59\211\72\111\156\176")]=function(v35)
	local v36 = tonumber(v35);
	if (v36 and (v36 >= (15 - 5)) and (v36 <= 500)) then
		v11.Character.Humanoid.WalkSpeed = v36;
	else
		v8:MakeNotification({[v7("\96\134\238\40", "\77\46\231\131")]="ط؛ظ„ط· ط­ط¨ظٹ",[v7("\153\91\184\84\191\90\162", "\32\218\52\214")]="ط§ظƒطھط¨ ط±ظ‚ظ… ط¨ظٹظ† 10 ظˆ 500",[v7("\103\26\48\175\244", "\58\46\119\81\200\145\208\37")]=v7("\57\142\40\173\186\174\51\63\133\52\246\230\242\96\123\223\97\252\254\236\102\126\220", "\86\75\236\80\204\201\221"),[v7("\70\72\122\128", "\235\18\33\23\229\158")]=(508 - (351 + 154))});
	end
end});
v16:AddTextbox({[v7("\126\187\204\190", "\219\48\218\161")]="ظ‚ظˆط© ط§ظ„ظ‚ظپط² (10 - 500)",[v7("\192\116\122\72\206\67\244", "\128\132\17\28\41\187\47")]=v7("\84\98", "\61\97\82\102\90"),[v7("\152\43\179\95\227\94\13\8\188\62\174\74\213", "\105\204\78\203\43\167\55\126")]=true,[v7("\134\171\47\18\17\5\196\90", "\49\197\202\67\126\115\100\167")]=function(v37)
	local v38 = 1574 - (1281 + 293);
	local v39;
	while true do
		if (v38 == (266 - (28 + 238))) then
			v39 = tonumber(v37);
			if (v39 and (v39 >= (22 - 12)) and (v39 <= 500)) then
				v11.Character.Humanoid.JumpPower = v39;
			else
				v8:MakeNotification({[v7("\25\90\210\44", "\62\87\59\191\73\224\54")]="ط­ط· ط§ظ„ط³ط±ط¹ظ‡",[v7("\196\13\244\221\226\12\238", "\169\135\98\154")]="ط§ظƒطھط¨ ط±ظ‚ظ… ط¨ظٹظ† 10 ظˆ 500",[v7("\226\122\37\83\248", "\168\171\23\68\52\157\83")]=v7("\230\115\237\172\54\62\130\224\120\241\247\106\98\209\164\34\164\253\114\124\215\161\33", "\231\148\17\149\205\69\77"),[v7("\180\174\202\254", "\159\224\199\167\155\55")]=3});
			end
			break;
		end
	end
end});
v16:AddButton({[v7("\217\242\49\215", "\178\151\147\92")]="طھط®ط±ظٹط¨ ط§ظ„ظ„ط§ط¹ط¨ظٹظ† ط§ظ„ظ‚ط±ظٹط¨ظٹظ†",[v7("\175\252\64\62\16\77\121\135", "\26\236\157\44\82\114\44")]=function()
	for v53, v54 in ipairs(v9:GetPlayers()) do
		if ((v54 ~= v11) and v54.Character and v54.Character:FindFirstChild(v7("\2\59\216\90\36\33\220\95\24\33\218\79\26\47\199\79", "\59\74\78\181"))) then
			local FlatIdent_40CF = 0;
			local v66;
			local v67;
			while true do
				if (FlatIdent_40CF == 0) then
					v66 = 1559 - (1381 + 178);
					v67 = nil;
					FlatIdent_40CF = 1;
				end
				if (FlatIdent_40CF == 1) then
					while true do
						if (v66 == (0 + 0)) then
							v67 = (v11.Character.HumanoidRootPart.Position - v54.Character.HumanoidRootPart.Position).Magnitude;
							if (v67 <= (33 + 7)) then
								game:GetService(v7("\21\221\91\67\182\55\194", "\211\69\177\58\58")):Chat(v7("\248\246\112\239\236\139", "\171\215\133\25\149\137") .. v54.Name .. v7("\161\152", "\34\129\168\82\154\143\80\156"));
								wait(0.2 + 0);
							end
							break;
						end
					end
					break;
				end
			end
		end
	end
end});
v16:AddButton({[v7("\171\179\62\14", "\233\229\210\83\107\40\46")]="طھط؛ظٹظٹط± ط³ظƒظ†ط§طھ ط§ظ„ظ‚ط±ظٹط¨ظٹظ†  ",[v7("\226\67\62\218\7\192\65\57", "\101\161\34\82\182")]=function()
	for v55, v56 in ipairs(v9:GetPlayers()) do
		if ((v56 ~= v11) and v56.Character and v56.Character:FindFirstChild(v7("\192\24\84\255\213\237\139\42\218\2\86\234\235\227\144\58", "\78\136\109\57\158\187\130\226"))) then
			local FlatIdent_99389 = 0;
			local v68;
			local v69;
			while true do
				if (FlatIdent_99389 == 1) then
					while true do
						if (v68 == 0) then
							v69 = (v11.Character.HumanoidRootPart.Position - v56.Character.HumanoidRootPart.Position).Magnitude;
							if (v69 <= (103 - 73)) then
								local v109 = 0 + 0;
								while true do
									if (v109 == 0) then
										game:GetService(v7("\14\51\248\232\59\45\234", "\145\94\95\153")):Chat(v7("\178\206\28\212\92\247", "\215\157\173\116\181\46") .. v56.Name .. v7("\117\185\152\245\211\39\184", "\186\85\212\235\146"));
										wait(0.2);
										break;
									end
								end
							end
							break;
						end
					end
					break;
				end
				if (FlatIdent_99389 == 0) then
					v68 = 0;
					v69 = nil;
					FlatIdent_99389 = 1;
				end
			end
		end
	end
end});
v16:AddButton({[v7("\236\128\27\251", "\56\162\225\118\158\89\142")]="طھط؛ظٹط± ط§ط³ط§ظ…ظٹظ‡ظ…",[v7("\127\4\204\163\32\217\95\14", "\184\60\101\160\207\66")]=function()
	for v57, v58 in ipairs(v9:GetPlayers()) do
		if ((v58 ~= v11) and v58.Character and v58.Character:FindFirstChild(v7("\25\151\113\189\63\141\117\184\3\141\115\168\1\131\110\168", "\220\81\226\28"))) then
			local FlatIdent_17196 = 0;
			local v70;
			local v71;
			while true do
				if (FlatIdent_17196 == 1) then
					while true do
						if (v70 == (0 + 0)) then
							v71 = (v11.Character.HumanoidRootPart.Position - v58.Character.HumanoidRootPart.Position).Magnitude;
							if (v71 <= (28 + 12)) then
								local FlatIdent_29B3D = 0;
								local v110;
								while true do
									if (FlatIdent_29B3D == 0) then
										v110 = 0 - 0;
										while true do
											if (v110 == (1156 - (1074 + 82))) then
												game:GetService(v7("\35\217\131\226\239\213\0", "\167\115\181\226\155\138")):Chat(v7("\173\54\238\72\119\116\214\233\98", "\166\130\66\135\60\27\17") .. v58.Name .. " ظƒظ„ط§ط¨ ط´ط§ظ„ظٹظ‡ ظ…ط­ظ…ط¯ ");
												wait(0.2 - 0);
												break;
											end
										end
										break;
									end
								end
							end
							break;
						end
					end
					break;
				end
				if (FlatIdent_17196 == 0) then
					v70 = 470 - (381 + 89);
					v71 = nil;
					FlatIdent_17196 = 1;
				end
			end
		end
	end
end});
v16:AddButton({[v7("\106\75\195\112", "\80\36\42\174\21")]="طھط؛ظٹظٹط± ط£ط³ظ…ط§ط¦ظ‡ظ… 2",[v7("\109\17\59\118\76\17\52\113", "\26\46\112\87")]=function()
	for v59, v60 in ipairs(v9:GetPlayers()) do
		if ((v60 ~= v11) and v60.Character and v60.Character:FindFirstChild(v7("\145\54\166\117\177\176\76\176\139\44\164\96\143\190\87\160", "\212\217\67\203\20\223\223\37"))) then
			local FlatIdent_39EBF = 0;
			local v72;
			local v73;
			while true do
				if (FlatIdent_39EBF == 0) then
					v72 = 1784 - (214 + 1570);
					v73 = nil;
					FlatIdent_39EBF = 1;
				end
				if (1 == FlatIdent_39EBF) then
					while true do
						if (v72 == (1455 - (990 + 465))) then
							v73 = (v11.Character.HumanoidRootPart.Position - v60.Character.HumanoidRootPart.Position).Magnitude;
							if (v73 <= (17 + 23)) then
								local FlatIdent_817B0 = 0;
								local v111;
								local v112;
								while true do
									if (FlatIdent_817B0 == 0) then
										v111 = 0 + 0;
										v112 = nil;
										FlatIdent_817B0 = 1;
									end
									if (FlatIdent_817B0 == 1) then
										while true do
											if (v111 == (0 + 0)) then
												v112 = 0 - 0;
												while true do
													if ((1726 - (1668 + 58)) == v112) then
														game:GetService(v7("\138\129\169\203\191\159\187", "\178\218\237\200")):Chat(v7("\249\161\239\196\186\176\246\219\246", "\176\214\213\134") .. v60.Name .. " ط§ظپط¶ظ„ ط³ظƒط±ط¨طھ طھط®ط±ظٹط¨طں ");
														wait(0.2);
														break;
													end
												end
												break;
											end
										end
										break;
									end
								end
							end
							break;
						end
					end
					break;
				end
			end
		end
	end
end});
v16:AddButton({[v7("\218\172\187\209", "\57\148\205\214\180\200\54")]="ط§ظ„ظ‚ط±ظٹط¨ظٹظ† ظ…ظ†ظƒ  (Re)",[v7("\49\252\57\56\116\19\254\62", "\22\114\157\85\84")]=function()
	for v61, v62 in ipairs(v9:GetPlayers()) do
		if ((v62 ~= v11) and v62.Character and v62.Character:FindFirstChild(v7("\236\222\30\197\83\249\161\192\249\28\203\73\198\169\214\223", "\200\164\171\115\164\61\150"))) then
			local v74 = 626 - (512 + 114);
			local v75;
			while true do
				if (v74 == 0) then
					v75 = (v11.Character.HumanoidRootPart.Position - v62.Character.HumanoidRootPart.Position).Magnitude;
					if (v75 <= (78 - 48)) then
						local FlatIdent_287B5 = 0;
						local v113;
						local v114;
						while true do
							if (FlatIdent_287B5 == 0) then
								v113 = 0;
								v114 = nil;
								FlatIdent_287B5 = 1;
							end
							if (FlatIdent_287B5 == 1) then
								while true do
									if (0 == v113) then
										v114 = 0;
										while true do
											if (v114 == (0 - 0)) then
												game:GetService(v7("\142\248\2\92\134\172\231", "\227\222\148\99\37")):Chat(v7("\124\64\87\182", "\153\83\50\50\150") .. v62.Name);
												wait(0.2 - 0);
												break;
											end
										end
										break;
									end
								end
								break;
							end
						end
					end
					break;
				end
			end
		end
	end
end});
v16:AddButton({[v7("\115\119\126\25", "\45\61\22\19\124\19\203")]="طھظƒط¨ظٹط± ظ„ط§ط¹ط¨ظٹظ† ظ‚ط±ظٹط¨ظٹظ†",[v7("\226\19\1\249\0\113\186\202", "\217\161\114\109\149\98\16")]=function()
	local FlatIdent_8B523 = 0;
	local v40;
	local v41;
	while true do
		if (FlatIdent_8B523 == 1) then
			while true do
				if (v40 == 0) then
					v41 = 0 + 0;
					for v92, v93 in ipairs(v9:GetPlayers()) do
						if (v41 >= (2 + 0)) then
							break;
						end
						if ((v93 ~= v11) and v93.Character and v93.Character:FindFirstChild(v7("\58\53\53\125\178\123\27\36\10\115\179\96\34\33\42\104", "\20\114\64\88\28\220"))) then
							local FlatIdent_5B4A8 = 0;
							local v105;
							while true do
								if (FlatIdent_5B4A8 == 0) then
									v105 = (v11.Character.HumanoidRootPart.Position - v93.Character.HumanoidRootPart.Position).Magnitude;
									if (v105 <= (131 - 92)) then
										local v115 = 1994 - (109 + 1885);
										while true do
											if (v115 == 0) then
												local FlatIdent_28F3E = 0;
												while true do
													if (FlatIdent_28F3E == 0) then
														game:GetService(v7("\1\13\211\173\253\194\174", "\221\81\97\178\212\152\176")):Chat(v7("\130\244\20\225\31\141", "\122\173\135\125\155") .. v93.Name .. v7("\196\147", "\168\228\161\96\217\95\81"));
														v41 = v41 + (1470 - (1269 + 200));
														FlatIdent_28F3E = 1;
													end
													if (FlatIdent_28F3E == 1) then
														v115 = 1 - 0;
														break;
													end
												end
											end
											if ((816 - (98 + 717)) == v115) then
												wait(826.2 - (802 + 24));
												break;
											end
										end
									end
									break;
								end
							
