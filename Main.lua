local plr = game:GetService("Players").LocalPlayer

local TableToService = {
	["UserInput"] = game['UserInputService'],
	["TweenService"] = game["TweenService"],
}

local TableToGui = {
	["MainScreen"] = Instance.new("ScreenGui",plr.PlayerGui),
}

local AppData = {
	["Prefix"] = "/",
	["UpTime"] = true,
}

local Commands = {
	["Color"] = "color",
	["Print"] = "print",
	["script"] = "script",
	["bind"] = "bind"
}

local lib = {
	["Aipath"] = false,
}

local BindTo = {
	["BindTo1"] = {
		["bindCommand"] = nil,
		["code"] = nil,
		["state"] = false
	}
}
TableToGui.MainScreen.Name = "MainToScreen"
local folderMain = Instance.new("Folder",TableToGui.MainScreen)
folderMain.Name = "Main"

local InputTo = Instance.new("TextBox",folderMain)
InputTo.Size = UDim2.new(0, 210,0, 30)
InputTo.Position = UDim2.new(0.291, 0,0.668, 0)

InputTo.TextColor3 = Color3.new(1, 1, 1)
InputTo.ClearTextOnFocus = false
InputTo.TextScaled = true
InputTo.RichText = true

InputTo.TextXAlignment = Enum.TextXAlignment.Left
InputTo.BackgroundColor3 = Color3.new(0, 0, 0)
InputTo.BackgroundTransparency = 0.3

InputTo.Draggable = true
InputTo.Selectable = true
InputTo.Name = "ToInput"

TableToService.UserInput.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftAlt then
		if AppData.UpTime == true then
		elseif AppData.UpTime == false then
			return print("UPtime Is Failed!")
		end
		
		local cmd = string.lower(TableToGui.MainScreen.Main.ToInput.Text)
		local split = string.split(cmd, " ")
		
		if split[1] == AppData.Prefix .. Commands.Color then
			if split[2] == "2" then
				TableToGui.MainScreen.Main.ToInput.TextColor3 = Color3.new(0, 1, 0.2)
			elseif split[2] == "3" then
				TableToGui.MainScreen.Main.ToInput.TextColor3 = Color3.new(0, 0.0156863, 1)
			elseif split[2] == "4" then
				TableToGui.MainScreen.Main.ToInput.TextColor3 = Color3.new(0.635294, 0, 1)
			elseif split[2] == "5" then
				TableToGui.MainScreen.Main.ToInput.TextColor3 = Color3.new(1, 0.00392157, 0.0196078)
			elseif split[2] == "default" then
				TableToGui.MainScreen.Main.ToInput.TextColor3 = Color3.new(1, 1, 1)
			end
		end
		
		if split[1] == AppData.Prefix .. Commands.Print then
			print(split[2])
		end
		
		if split[1] == AppData.Prefix .. Commands.bind then
			if split[2] == nil or split[2] == " " then
				return print("err binding!")
			end
			local MainText = TableToGui.MainScreen.Main.ToInput.Text
			local commandName = split[2]
			
			local censored = {split[1],split[2]}
			local commandTo = string.gsub(MainText,censored[1] .. " " .. censored[2],"")
			BindTo.BindTo1.bindCommand = commandName
			BindTo.BindTo1.code = commandTo
			BindTo.BindTo1.state = true
		end
		
		--[[if split[1] == AppData.Prefix .. BindTo.BindTo1.bindCommand then
			if BindTo.BindTo1.bindCommand == nil or BindTo.BindTo1.code == nil then
				return
			end
			TableToGui.MainScreen.Main.ToInput.Text = BindTo.BindTo1.code
		end ]]--
		
		if BindTo.BindTo1.state == true then
			if split[1] == AppData.Prefix .. BindTo.BindTo1.bindCommand then
				if BindTo.BindTo1.bindCommand == nil or BindTo.BindTo1.code == nil then
					return
				end
				TableToGui.MainScreen.Main.ToInput.Text = BindTo.BindTo1.code
			end
		elseif BindTo.BindTo1.state == false then
			
		end
		
		--Librarys
		if lib.Aipath == true then -- AI PATH V.01
			if split[1] == AppData.Prefix .. "aipath" then
				if split[2] == "start" then
					if split[3] == "to" then
						if split[4] == "allplayers" then
							local pfs = game:GetService("PathfindingService")
							for _, v in pairs(game:GetService("Players"):GetPlayers()) do
								if plr ~= v then
									local path = pfs:CreatePath()
									if plr.Character.HumanoidRootPart and v.Character.HumanoidRootPart.Position then
										path:ComputeAsync(plr.Character.HumanoidRootPart.Position,v.Character.HumanoidRootPart.Position)
									end
									
									for _, waypoints in pairs(path:GetWaypoints()) do
										plr.Character:WaitForChild("Humanoid"):MoveTo(waypoints.Position)
										plr.Character:WaitForChild("Humanoid").MoveToFinished:Wait()
										local goal = {}
										goal.Size = Vector3.new(0.3,0.3,0.3)
										
										local onTo = Instance.new("Part")
										onTo.Shape = Enum.PartType.Ball
										onTo.Size = Vector3.new(0,0,0)
										onTo.Parent = game:GetService("Workspace")
										
										onTo.Name = "ToWay"
										onTo.CanCollide = false
										onTo.Anchored = true
										onTo.BrickColor = BrickColor.new("White")
										onTo.Material = Enum.Material.Neon
										onTo.Position = waypoints.Position
										local tween = TableToService.TweenService:Create(onTo,TweenInfo.new(0.8),goal)
										tween:Play()
									end
								end
							end
						end
					end
				end
			end
		end
		
		if split[1] == AppData.Prefix .. Commands.script then
			--Hooks
			if split[2] == "placeversion" then
				split[2] = tonumber(game.PlaceVersion)
			elseif split[2] == "placeid" then
				split[2] = tonumber(game.PlaceId)
			elseif split[2] == "aboutlocal" then
				split[2] = "About: ".. plr.Name .. " Regions: " .. game["LocalizationService"]:GetCountryRegionForPlayerAsync(plr) .. " AccountAge: " .. tonumber(plr.AccountAge)
			elseif split[2] == "game" then
				if split[3] == ":loadasett" then
					local asetts = game:GetDescendants()
					local MaxAsetts = #asetts
					
					for i, v in pairs(game:GetDescendants()) do
						task.wait(0.01)
						TableToGui.MainScreen.Main.ToInput.Text = i .. " | " .. MaxAsetts
					end
				end
				if split[3] == ":getplayers" then
					if split[4] == "{fromcharacter}" then
						for _,v in pairs(game:GetService("Players"):GetPlayers()) do
							if split[5] == "filter:" then
								if split[6] == "isn't-me-teamcolor" then
									if plr ~= v and v.Character and plr.TeamColor ~= v.TeamColor then
										if split[7] == "instance" then
											if split[8] == "highlight" then
												local high = Instance.new("Highlight",v.Character)
												high.FillColor = v.TeamColor.Color
											elseif split[8] == "prxprompt" then
												local prompt = Instance.new("ProximityPrompt",v.Character)
												prompt.ActionText = split[9]
											elseif split[8] == "sound" then
												local sound = Instance.new("Sound",v.Character.PrimaryPart)
												sound.SoundId = split[9]
												sound.Volume = split[10]
												
												if split[11] == "play" then
													sound:Play()
												elseif split[11] == "stop" then
													sound:Stop()
												end
											elseif split[8] == "part" then
												local part = Instance.new("Part",v.Character)
												if split[9] == "onprimarycframe" then
													part.CFrame = v.Character.PrimaryPart.CFrame
												end
											end
										end
									end
								elseif split[6] == "isn't-me" then
									if plr ~= v and v.Character then
										if split[7] == "instance" then
											if split[8] == "highlight" then
												local high = Instance.new("Highlight",v.Character)
												high.FillColor = Color3.new(1, 1, 1)
											elseif split[8] == "prxprompt" then
												local prompt = Instance.new("ProximityPrompt",v.Character)
												prompt.ActionText = split[9]
												
												if split[9] == "plr.name" then
													prompt.ActionText = v.Name
												end
											elseif split[8] == "sound" then
												local sound = Instance.new("Sound",v.Character.PrimaryPart)
												sound.SoundId = split[9]
												sound.Volume = split[10]

												if split[11] == "play" then
													sound:Play()
												elseif split[11] == "stop" then
													sound:Stop()
												end
											elseif split[8] == "part" then
												local part = Instance.new("Part",v.Character)
												if split[9] == "onprimarycframe" then
													part.CFrame = v.Character.PrimaryPart.CFrame
												end
											end
										end
									end
								elseif split[6] == "findtool:" then
									if plr ~= v and v.Character then
										if v.Backpack:FindFirstChild(split[7]) or v.Character:FindFirstChild(split[7]) then
											if split[8] == "instance" then
												if split[9] == "highlight" then
													local high = Instance.new("Highlight",v.Character)
													high.FillColor = Color3.new(1, 1, 1)
												elseif split[9] == "prxprompt" then
													local prompt = Instance.new("ProximityPrompt",v.Character)
													prompt.ActionText = split[9]
												elseif split[9] == "sound" then
													local sound = Instance.new("Sound",v.Character.PrimaryPart)
													sound.SoundId = split[10]
													sound.Volume = split[11]

													if split[12] == "play" then
														sound:Play()
													elseif split[12] == "stop" then
														sound:Stop()
													end
												elseif split[9] == "part" then
													local part = Instance.new("Part",v.Character)
													if split[10] == "onprimarycframe" then
														part.CFrame = v.Character.PrimaryPart.CFrame
													end
												end
											end
										end
									end
								end
							end
						end
					elseif split[4] == "{fromplayer}" then
						for _, v in pairs(game:GetService("Players"):GetPlayers()) do
							if split[5] == "filter:" then
								if split[6] == "isn't-me-teamcolor" then
									
									if plr ~= v and v.Character and plr.TeamColor ~= v.TeamColor then
										if split[7] == "getid" then
											if split[8] == "printable" then
												print(v.UserId)
											elseif split[8] == "value" then
												local a = v.UserId
											end
										elseif split[7] == "getaccountage" then
											
											if split[8] == "printable" then
												print(v.AccountAge)
											elseif split[8] == "value" then
												local a = v.AccountAge
											end
										end
									end
								elseif split[6] == "isn't-me" then
									
									if plr ~= v and v.Character then
										if split[7] == "getid" then
											if split[8] == "printable" then
												print(v.UserId)
											elseif split[8] == "value" then
												local a = v.UserId
											end
										elseif split[7] == "getaccountage" then

											if split[8] == "printable" then
												print(v.AccountAge)
											elseif split[8] == "value" then
												local a = v.AccountAge
											end
										end
										
									end
								end
							end
						end
					elseif split[4] == "{fromplayername}" then
						for _, v in pairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == split[5] then
								if split[6] == "isn't-me-teamcolor" then
									if split[7] == "instance" then
										if split[8] == "highlight" then
											local high = Instance.new("Highlight",v.Character)
											high.FillColor = v.TeamColor.Color
										elseif split[8] == "prxprompt" then
											local prompt = Instance.new("ProximityPrompt",v.Character)
											prompt.ActionText = split[9]
										elseif split[8] == "sound" then
											local sound = Instance.new("Sound",v.Character.PrimaryPart)
											sound.SoundId = split[9]
											sound.Volume = split[10]

											if split[11] == "play" then
												sound:Play()
											elseif split[11] == "stop" then
												sound:Stop()
											end
										elseif split[8] == "part" then
											local part = Instance.new("Part",v.Character)
											if split[9] == "onprimarycframe" then
												part.CFrame = v.Character.PrimaryPart.CFrame
											end
										end
									end
									
								elseif split[6] == "isn't-me" then
									
									if split[7] == "instance" then
										if split[8] == "highlight" then
											local high = Instance.new("Highlight",v.Character)
											high.FillColor = v.TeamColor.Color
										elseif split[8] == "prxprompt" then
											local prompt = Instance.new("ProximityPrompt",v.Character)
											prompt.ActionText = split[9]
										elseif split[8] == "sound" then
											local sound = Instance.new("Sound",v.Character.PrimaryPart)
											sound.SoundId = split[9]
											sound.Volume = split[10]

											if split[11] == "play" then
												sound:Play()
											elseif split[11] == "stop" then
												sound:Stop()
											end
										elseif split[8] == "part" then
											local part = Instance.new("Part",v.Character)
											if split[9] == "onprimarycframe" then
												part.CFrame = v.Character.PrimaryPart.CFrame
											end
										end
									end
								end
							end
						end
					end
				elseif split[3] == ":getstuctures" then
					if split[4] == "filter:" then
						if split[5] == "allparts" then
							for _, v in pairs(game:GetDescendants()) do
								if v:IsA("Part") and v.Name ~= "HumanoidRootPart" then
									if split[6] == nil or split[6] == " " then
										split[6] = 0
									end
									v.Transparency = split[6]
								end
							end
						end
						
						if split[5] == "allmesh" then
							for _, v in pairs(game:GetDescendants()) do
								if v:IsA("MeshPart") and v.Name ~= "HumanoidRootPart" then
									if split[6] == nil or split[6] == " " then
										split[6] = 0
									end
									if split[7] == nil or split[7] == " " then
										split[7] = "false"
									end
									
									v.Transparency = split[6]
									v.Anchored = split[7]
								end
							end
						end
					end
				elseif split[3] == ":spawn" then
					if split[4] == "part" then
						local part = Instance.new("Part",game:GetService("Workspace"))
						part.CFrame = plr.Character.PrimaryPart.CFrame * CFrame.new(0,0,10)
					end
				end
			elseif split[2] == "importlibrary" then
				if split[3] == "aipath" then
					if split[4] == "true" then
						for load = 0, 100, 1 do
							task.wait(0.1)
							TableToGui.MainScreen.Main.ToInput.Text = load .. "%" .. " | " .. "100%"
							if load == 100 then
								lib.Aipath = true
							end
						end
					end
					if split[4] == "false" then
						lib.Aipath = false
					end
				end
			end
		end
		
		if split[2] == ">" then
			local a = tonumber(split[1])
			local b =tonumber(split[3])

			if a == nil or b == nil then
				return print("Math Err")
			end
			if a < 0 or b < 0 then
				return print("Math Err")
			end
			print(a > b)
		end
		
		if split[2] == "<" then
			local a = tonumber(split[1])
			local b =tonumber(split[3])
			
			if a == nil or b == nil then
				return print("Math Err")
			end
			if a < 0 or b < 0 then
				return print("Math Err")
			end
			print(a < b)
		end
		
		if split[2] == "+" then
			local a = tonumber(split[1])
			local b =tonumber(split[3])

			if a == nil or b == nil then
				return print("Math Err")
			end
			if a < 0 or b < 0 then
				return print("Math Err")
			end
			print(a + b)
		end
		
		if split[2] == "-" then
			local a = tonumber(split[1])
			local b =tonumber(split[3])

			if a == nil or b == nil then
				return print("Math Err")
			end
			if a < 0 or b < 0 then
				return print("Math Err")
			end
			print(a - b)
		end
		
		if split[2] == "*" then
			local a = tonumber(split[1])
			local b =tonumber(split[3])

			if a == nil or b == nil then
				return print("Math Err")
			end
			if a < 0 or b < 0 then
				return print("Math Err")
			end
			print(a * b)
		end
		
		if split[2] == "/" then
			local a = tonumber(split[1])
			local b =tonumber(split[3])

			if a == nil or b == nil then
				return print("Math Err")
			end
			if a < 0 or b < 0 then
				return print("Math Err")
			end
			print(a / b)
		end
	end
end)
