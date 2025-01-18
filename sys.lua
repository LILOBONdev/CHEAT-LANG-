local plr = game:GetService("Players").LocalPlayer
local TableToService = {
	["UserInput"] = game['UserInputService'],
	["TweenService"] = game["TweenService"],
	["MarketPlaceS"] = game:GetService("MarketplaceService"),
}

local TableToGui = {
	["MainScreen"] = Instance.new("ScreenGui",plr.PlayerGui),
}

local AppData = {
	["Prefix"] = "/",
	["UpTime"] = true,
	["UptimeServerReason"] = "Correct Work: " .. os.date(),
	["LocalReasonUpTime"] = "",
	["Loadmultiplier"] = 10,
	['BindKey'] = 'LeftAlt',
}

local Commands = {
	["Color"] = "color",
	["Print"] = "print",
	["script"] = "script",
	["bind"] = "bind",
	['BindKey'] = 'BindKey'
}

local lib = {
	["Aipath"] = false,
	["transferobject"] = false,
	["megafling"] = false,
	['Atom'] = false,
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
InputTo.Text = "CHEAT LANG: Basic Edition V.1.13 🔥"

InputTo.TextXAlignment = Enum.TextXAlignment.Left
InputTo.BackgroundColor3 = Color3.new(0, 0, 0)
InputTo.BackgroundTransparency = 0.3

InputTo.Draggable = true
InputTo.Selectable = true
InputTo.Name = "ToInput"

local ClearButton = Instance.new("TextButton",InputTo)
ClearButton.Size = UDim2.new(0, 30,0, 30)
ClearButton.Position = UDim2.new(0, -75,0, 0)
ClearButton.BackgroundColor3 = Color3.new(0, 0, 0)
ClearButton.BackgroundTransparency = 0.3
ClearButton.TextColor3 = Color3.new(1, 1, 1)
ClearButton.Text = "X"

local ResizeButton = Instance.new("TextButton",InputTo)
ResizeButton.Size = UDim2.new(0, 30,0, 30)
ResizeButton.Position = UDim2.new(0, -40,0, 0)
ResizeButton.BackgroundColor3 = Color3.new(0, 0, 0)
ResizeButton.BackgroundTransparency = 0.3
ResizeButton.TextColor3 = Color3.new(1, 1, 1)
ResizeButton.Text = "R"

ClearButton.MouseButton1Click:Connect(function()
	InputTo.Text = ""
end)
local state = 0
local function ReSize(x,x2,y,y2)
	local goal = {}
	goal.Size = UDim2.new(x,x2,y,y2)

	local tween = TableToService.TweenService:Create(InputTo,TweenInfo.new(1.5),goal)
	tween:Play()
end
ResizeButton.MouseButton1Click:Connect(function()
	state += 1
	if state == 1 then
		ReSize(0, 300,0, 30)
	elseif state == 2 then
		ReSize(0, 350,0, 60)
	elseif state == 3 then
		ReSize(0, 400,0, 90)
	elseif state == 4 then
		ReSize(0, 500,0, 90)
	elseif state == 5 then
		ReSize(0, 700,0, 120)
	elseif state == 6 then
		ReSize(0, 210,0, 30)
		state = 0
	end
end)
local TableToId = {
	'6001782755',
	'493269723',
	'4826272905',
}
local function OnCheckPremium(Premium)
	Premium = false
	local ToId = tonumber(plr.UserId)
	for _, v in pairs(TableToId) do
		local To = tonumber(v)
		if To == ToId then
			Premium = true
			AppData.Loadmultiplier = 10
			InputTo.Text = "CHEAT LANG: Premium Edition V.1.13 🔥"
			local InGui = {
				ClearButton,
				ResizeButton,
				InputTo
			}
			for i, v in pairs(InGui) do
				local goal = {}
				goal.BorderColor3 = Color3.new(0.576471, 0.501961, 0.0745098)

				local tween = TableToService.TweenService:Create(v,TweenInfo.new(10),goal)
				tween:Play()
			end
		end
	end
	return Premium
end

local function DevOnCheckPremium(Premium)
	Premium = false
	local ToId = tonumber(plr.UserId)
	for _, v in pairs(TableToId) do
		local To = tonumber(v)
		if To == ToId then
			Premium = true
		end
	end
	return Premium
end

local EspDebounce,JumpHackDebounce = true,true
local function EspMain(Color)
	if EspDebounce == true then
		for i,v in pairs(game:GetService('Players'):GetPlayers()) do
			if v.Character and plr ~= v then
				local InHgigh = Instance.new('Highlight',v.Character)
				InHgigh.Name = 'HighTo'
				InHgigh.FillColor = Color3.fromHex(Color)
			end
		end
		EspDebounce = false
	elseif EspDebounce == false then
		for i,v in pairs(game:GetService('Players'):GetPlayers()) do
			if v.Character and plr ~= v then
				if v.Character:FindFirstChild('HighTo') then
					v.Character:FindFirstChild('HighTo'):Destroy()
				end
			end
		end
		EspDebounce = true
	end
end



OnCheckPremium()

TableToService.UserInput.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode[AppData.BindKey] then
		for i,v in pairs(folderMain:GetDescendants()) do
			if v:IsA('TextBox') then
				

		if AppData.UpTime == true then
		elseif AppData.UpTime == false then
			return print("System Reason: " ..AppData.LocalReasonUpTime .. " Server Reason: " .. AppData.UptimeServerReason)
		end
		local MainText = TableToGui.MainScreen.Main.ToInput.Text
		local cmd = TableToGui.MainScreen.Main.ToInput.Text
		local split = string.split(cmd, " ")
		
		if split[1] == AppData.Prefix .. Commands.BindKey then
			AppData.BindKey = split[2]
		end
		
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
									if plr.Character:WaitForChild("HumanoidRootPart").Position and v.Character:WaitForChild("HumanoidRootPart").Position then
										path:ComputeAsync(plr.Character:WaitForChild("HumanoidRootPart").Position,v.Character:WaitForChild("HumanoidRootPart").Position)
									else

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


		if lib.transferobject == true then --TRANSFER OBJECT V.01
			local obj1
			local obj2
			if split[1] == AppData.Prefix .. "transferobject" then
				if split[2] == "lowerall" then
					for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
						if v:IsA("Part") and v ~= plr.Character.HumanoidRootPart then
							v.Name = string.lower(v.Name)
						end
					end
					if split[3] then
						for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
							if v:IsA("Part") then
								obj1 = game:GetService("Workspace"):WaitForChild(split[3])
							end
						end
						if split[3] == "plrprimarypart" then
							obj1 = plr.Character.PrimaryPart
						end
					end

					if split[4] then
						for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
							if v:IsA("Part") then
								obj2 = game:GetService("Workspace"):WaitForChild(split[4])
							end
						end
						if split[4] == "plrprimarypart" then
							obj1 = plr.Character.PrimaryPart
						end
					end

					if split[5] == nil or split[5] == "" or split[5] == " " then
						obj1.CFrame = obj2.CFrame
					elseif split[5] == "classpro" then
						local x,y,z = tonumber(split[6]),tonumber(split[7]),tonumber(split[8])
						if split[9] == "cframebasic" then
							obj1.CFrame = obj2.CFrame * CFrame.new(x,y,z)
						elseif split[9] == "cframeangles" then
							obj1.CFrame = obj2.CFrame * CFrame.Angles(x,y,z)
						end

						if split[10] == "true" then
							obj1.Anchored = true
						elseif split[10] == "false" then
							obj1.Anchored = false
						end
					end
				end
			end
		end
		--MEGA FLING V1.05
		if lib.megafling == true then
			if split[1] == AppData.Prefix .. "megafling" then

				local killf = Instance.new("BodyVelocity")
				killf.Velocity = Vector3.new(0, 0, 0,01)
				killf.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
				killf.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				local killp = Instance.new("BodyThrust")
				killp.Force = Vector3.new(tonumber(split[2]), tonumber(split[2]), tonumber(split[2]))
				killp.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				killp.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
				plr = game:GetService("Players").LocalPlayer
				while split[3] do wait(1)
					local function OnKill()
						for _, v in pairs(game:GetService("Players"):GetPlayers()) do 
							if plr ~= v and v.Character and v.Character.Humanoid.Health >0 then 
								task.wait(0.1)
								plr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame 
							end
						end
					end
					OnKill()
				end
			end
		end
		
		--ATOM LIBRARY V.1
		if lib.Atom == true then
			local ReturnPremium = DevOnCheckPremium()
			if ReturnPremium == true then
			elseif ReturnPremium == false then
				return InputTo.Text == 'Купите премиум здесь: https://www.tinkoff.ru/rm/kravets.nikita45/OVN7325942 (Комментрий к платежу: ваш роблокс ID)'
			end
			if split[1] == AppData.Prefix .. 'atomScript' then
				for i,v in pairs(split) do
					
				end
			end
		end

		if split[1] == AppData.Prefix .. 'import' then
			if split[2] == 'library' then
				local function Load(count,text)
					local aipath,transferobject,fling,atom = 'aipath','transferobject','fling','atom'
					for load = 0, 100, 1 * AppData.Loadmultiplier do
						task.wait(0.1)
						TableToGui.MainScreen.Main.ToInput.Text = load .. "%" .. " | " .. "100%"
						if load == 100 then
							if split[3] == aipath then
								TableToGui.MainScreen.Main.ToInput.Text = '/aipath start to allplayers'
								lib.Aipath = true
							elseif split[3] == transferobject then
								TableToGui.MainScreen.Main.ToInput.Text = '/transferobject lowerall part1 part2'
								lib.transferobject = true
							elseif split[3] == fling then
								TableToGui.MainScreen.Main.ToInput.Text = '/megafling 6000 true'
								lib.megafling = true
							elseif split[3] == atom then
								lib.Atom = true
							end
						end
					end
				end
				if split[3] then
					local aipath,transferobject,fling,atom = 'aipath','transferobject','fling','atom'
					Load()
				end
			end
		end
		
		if split[1] == AppData.Prefix .. 'createprogress' then
			local ProgressType = nil
			local Repating = nil
			if split[2] == 'While' then
				if split[3] == 'true' then
					ProgressType = 'While'
					Repating = true
				end
			elseif split[2] == 'for' then
				ProgressType = 'for'
				Repating = tonumber(split[3])
			elseif split[2] == 'run' then
				ProgressType = 'run'
			end
			
			local function ReturnResult(Permissions)
				Permissions = true
				if ProgressType == 'while' then
					while split[3] do
						--
					end
				elseif ProgressType == 'for' then
					local ForCount = 0
					for a = 0,Repating,1 do
						task.wait(split[4])
						if split[5] == '@printablemethod' then
							print(tostring(split[6]))
						elseif split[5] == '@getpart' then
							for _, v in pairs(game:GetService('Workspace'):GetDescendants()) do
								if split[6] == 'attachme' then
									if v:IsA('Part') and v.Name == split[7] then
										v.CFrame = plr.Character.PrimaryPart.CFrame
									end
								end
							end
						end
					end
				elseif ProgressType == 'run' then
					game:GetService('RunService').Heartbeat:Connect(function()
						if split[3] == '@editattribute' then
							if split[4] == 'mehandler' then
								for _, v in pairs(plr.Character:GetDescendants()) do
									if v:IsA('Humanoid') then
										v:SetAttribute(split[5],split[6])
									end
								end
							elseif split[4] == 'memodelhandler' then
								if plr.Character then
									plr.Character:SetAttribute(split[5],split[6])
								else
									return
								end
							end
						elseif split[3] == '@colission' then
							if split[4] == 'false' then
								for _, v in pairs(plr.Character:GetDescendants()) do
									if v:IsA('BasePart') then
										v.CanCollide = false
									end
								end
							elseif split[4] == 'true' then
								for _, v in pairs(plr.Character:GetDescendants()) do
									if v:IsA('BasePart') then
										v.CanCollide = true
									end
								end
							end
						end
					end)
				end
			end
			ReturnResult()
		end
		
		if split[1] == AppData.Prefix .. 'createEmbed' then
			if split[2] == 'plr.player.gui' then
				local Embed = Instance.new('ScreenGui',plr.PlayerGui)
				Embed.Name = split[3]
				
				local Buttons,Labels,images,Frames = Instance.new('Folder',Embed),Instance.new('Folder',Embed),Instance.new('Folder',Embed),Instance.new('Folder',Embed)
				Buttons.Name = 'Buttons'
				Labels.Name = 'Labels'
				images.Name = 'Images'
				Frames.Name = 'Frames'

				for i, v in pairs(split) do
					if v == 'CreateFrame' then
						local Frame = Instance.new('Frame',Frames)
						local x,x2,y,y2,name = split[i+1],split[i+2],split[i+3],split[i+4],split[i + 5]
						Frame.Size = UDim2.new(x,x2,y,y2)
						Frame.Name = name
					end
					
					if v == 'CreateButton' then
						local Btn = Instance.new('TextButton')
						local x,x2,y,y2,name,text,parent = split[i+1],split[i+2],split[i+3],split[i+4],split[i + 5],split[i + 6],split[i + 7]
						Btn.Size = UDim2.new(x,x2,y,y2)
						Btn.Name = name
						Btn.Text = text
						
						for _, v in pairs(Frames:GetDescendants()) do
							if v.Name == parent then
								Btn.Parent = v
							end
						end
					end
					
					if v == 'Dragble' then
						if split[i + 1] == 'frame' then
							for _, frmTo in pairs(Frames:GetDescendants()) do
								if frmTo:IsA('Frame') and frmTo.Name == split[i+2] then
									frmTo.Active = true
									frmTo.Selectable = true
									frmTo.Draggable = true
								else
									return print(split[i + 2], 'Is Not.')
								end
							end
						end
					end
					if v == 'SetColor' then
						if split[i + 1] == 'frame' then
							if split[i + 2] == 'bg' then
								for _, frmTo in pairs(Frames:GetDescendants()) do
									if frmTo:IsA('Frame') and frmTo.Name == split[i+3] then
										frmTo.BackgroundColor3 = Color3.fromHex(split[i + 4])
									else
										return print(split[i + 3], 'Is Not.')
									end
								end
							end
						elseif split[i + 1] == 'button' then
							if split[i + 2] == 'bg' then
								for _, button in pairs(Embed:GetDescendants()) do
									if button:IsA('TextButton') and button.Name == split[i + 3] then
										button.BackgroundColor3 = Color3.fromHex(split[i + 4])
									end
								end
							end
						end
					end
					
					if v == 'SetPosition' then
						for _, To in pairs(Embed:GetDescendants()) do
							if To.Name == split[i + 1] then
								To.Position = UDim2.new(split[i + 2],split[i + 3],split[i + 4],split[i + 5])
							end
						end
					end
					
					if v == 'OnClick' then
						for _, button in pairs(Embed:GetDescendants()) do
							if button.Name == split[i + 1] and button:IsA('TextButton') then
								button.MouseButton1Click:Connect(function()
									if split[i + 2] == 'print' then
										print(split[i + 3])
									end
									
									if split[i + 2] == 'launch' then
										if split[i + 3] == 'esp' then
											EspMain(true)
										end
									end
								end)
							end
						end
					end
					
					
					local function AddElement(Path,element,sys)
						for i,v in pairs(Embed:GetDescendants()) do
							if v.Name == Path then
								if element == 'UiStroke' then
									local Ustr = Instance.new('UIStroke',v)
									Ustr.Color = Color3.fromHex(sys)
									Ustr.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
								end
								
								if element == 'UiCorner' then
									local Corner = Instance.new('UICorner',v)
									Corner.CornerRadius = UDim.new(sys)
								end
							end
						end
					end
					local function SetProperty(Path,property,sys)
						for i,v in pairs(Embed:GetDescendants()) do
							if v.Name == Path then
								if property == 'BGTransparency' then
									v.BackgroundTransparency = sys
								end
								
								if property == 'BGcolor' then
									v.BackgroundColor3 = Color3.fromHex(sys)
								end
								
								if property == 'TextColor' then
									v.TextColor3 = Color3.fromHex(sys)
								end
								
								
							end
						end
					end
					
					local function ButtonsClickedEvent(Event,sys)
						for i,v in pairs(Embed:GetDescendants()) do
							if v:IsA('TextButton') then
								if Event == 'ChoiceSound' then
									local sound = Instance.new('Sound',Embed)
									sound.Name = 'ButtonChoice' .. v.Name
									sound.SoundId = sys
									v.MouseEnter:Connect(function()
										sound:Play()
									end)
								end
								
								if Event == 'SetBg' then
									local oldestColor = v.BackgroundColor3
									v.MouseButton1Click:Connect(function()
										v.BackgroundColor3 = Color3.fromHex(sys)
										local twn = TableToService.TweenService:Create(v,TweenInfo.new(0.4),{BackgroundColor3 = oldestColor})
										twn:Play()
									end)
								end
								
								if Event == 'Rotate' then
									v.MouseButton1Click:Connect(function()
										v.Rotation = sys
										local twn = TableToService.TweenService:Create(v,TweenInfo.new(0.4),{Rotation = 0})
										twn:Play()
									end)
								end
							end
						end
					end
					
					
					if v == 'add' then
						if split[i+1] and split[i+2] and split[i+3] then
							AddElement(split[i+1],split[i+2],split[i+3])
						end
					end
					
					if v == 'dev' then
						if split[i+1] == '$hide' then
							TableToGui.MainScreen.Enabled = false
						end
					end
					
					if v == 'global' then
						if split[i+1] == 'ButtonsClicked' then
							ButtonsClickedEvent(split[i+2],split[i+3])
						end
					end
					
					if v == 'SetProperty' then
						SetProperty(split[i+1],split[i+2],split[i+3])
					end
				end
			end
		end
		
		if split[1] == AppData.Prefix .. Commands.script then
			for i, v in pairs(split) do
				if v == 'len' then
					if split[i + 1] == 'players' then
						for i, players in pairs(game:GetService('Players'):GetPlayers()) do
							print(i,players.Name)
						end
					elseif split[i + 1] == 'game' then
						for i, obj in pairs(game:GetDescendants()) do
							print(i,obj.Name)
						end
					end
				end
				
				if v == 'placeversion' then
					print(game.PlaceVersion)
				elseif v == 'placeid' then
					print(game.PlaceId)
				elseif v == 'aboutlocal' then
					print(plr.Name,plr.AccountAge,plr,plr.UserId)
				elseif v == 'commands' then
					for i in Commands do
						print(i)
					end
				end
				
				if v == 'instance' then
					if split[i + 1] == 'highlight' and split[i + 2] then
						local hg = Instance.new('Highlight')
						if split[i + 2] ~= 'players' or split[i + 2] ~= 'players.tool' then
							for _, v in pairs(game:GetService('Workspace'):GetDescendants()) do
								if v.Name == split[i + 2] then
									hg.Parent = v
								end
							end
						end
						if split[i + 3] then
							hg.FillColor = Color3.fromHex(split[i + 3])
						end
						if split[i + 2] == 'players' then
							for _, v in pairs(game:GetService('Players'):GetPlayers()) do
								if v ~= plr and v.Character.Humanoid.Health > 0 then
									local Main = Instance.new('Highlight',v.Character)
									Main.FillColor = Color3.fromHex(split[i + 3])
								end
							end
						end
						
						if split[i + 2] == 'enymyTeam' then
							for _, v in pairs(game:GetService('Players'):GetPlayers()) do
								if v ~= plr and v.Character.Humanoid.Health > 0 and v.TeamColor ~= plr.TeamColor then
									local Main = Instance.new('Highlight',v.Character)
									Main.FillColor = v.TeamColor.Color
								end
							end
						end
						
						if split[i + 2] == 'players.tool' then
							for _, v in pairs(game:GetService('Players'):GetPlayers()) do
								if v ~= plr and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild(split[i + 4]) or v.Backpack:FindFirstChild(split[i + 4]) then
									hg.Parent = v.Character
								end
							end
						end
						
						if split[i+2] == 'players.Health' and split[i+3] and split[i+4] then
							for _, v in pairs(game:GetService('Players'):GetPlayers()) do
								if v ~= plr then
									if split[i+4] == '>' then
										if v.Character.Humanoid.Health > tonumber(split[i+3]) then
											hg.Parent = v.Character
										end
									end
									
									if split[i+4] == '<' then
										if v.Character.Humanoid.Health < tonumber(split[i+3]) then
											hg.Parent = v.Character
										end
									end
								end
							end
						end
					end
					
					if split[i+1] == 'sound' and split[i+2] and split[i+3] and split[i+4] then
						local BasicSound = Instance.new('Sound')
						for _, v in pairs(game:GetService('Workspace'):GetDescendants()) do
							if v.Name == split[i + 2] then
								BasicSound.Parent = v
								BasicSound.SoundId = split[i+3]
								BasicSound.Volume = split[i+4]
								BasicSound:Play()
							end
						end
					end
				end
				
				if v == 'destroy' then
					if split[i + 1] then
						for _, v in pairs(game:GetService('Workspace'):GetDescendants()) do
							if v.Name == split[i + 1] then
								v:Destroy()
							end
						end
					end
				end
				
				if v == 'RemoteEvents' then
					if split[i+1] == 'LaunchAll' and split[i+2] then
						for i,v in pairs(game:GetDescendants()) do
							if v:IsA('RemoteEvent') then
								task.wait(tonumber(split[i+2]))
								v:FireServer()
							end
						end
					elseif split[i+1] == 'Parser' then
						for i,v in pairs(game:GetDescendants()) do
							if v:IsA('RemoteEvent') then
								print(v.Name,'- Remote Event Name')
							end
						end
					end
				end	
				
				if v == 'CreateWindow' then
					for i,v in pairs(folderMain:GetDescendants()) do
						if v:IsA('TextBox') then
							local inp = v:Clone()
							inp.Parent = folderMain
						end
					end
				end
				
				if v == 'importV2' then
					if split[i+1] == 'getOnePlayer' and split[i+2] and split[i+3] then
						for i,v in pairs(game.Players:GetPlayers()) do
							if v.Name == split[i+2] then
								if split[i+3] == 'editColor' then
									if split[i+4] == 'allBody' then
										for i,body in pairs(v.Character:GetDescendants()) do
											if v:IsA('BasePart') or v:IsA('MeshPart') then
												v.Color = Color3.fromHex(split[i+4])
											end
										end
									end
								end
							end
						end
					end
				end
				
				if v == 'i++' then
					if split[i+1] == 'plr' then
						for i,v in game:GetService('Players'):GetPlayers() do
							print(i,v)
						end
					elseif split[i+1] == 'choice:' then
						if not split[i+2] then return print('Please Set Arg2') end
						for i,v in game do
							if v.Name == split[i+2] then
								print(i,v)
							end
						end
					end
				end
				
				
				if v == 'whiteList' then
					local perm,WhiteListed = false,{}
					if split[i+1] == 'On' then
						if perm == false then
							perm = true
						end
					elseif split[i+1] == 'Off' then
						if perm == true then
							perm = false
							WhiteListed = {}
						end
					end
					
					if split[i+1] == 'Add' then
						if perm == true then
							table.insert(WhiteListed,split[i+2])
							print(WhiteListed)
						end
					end
					
					for i,v in WhiteListed do
						if v == split[i+2] then
							print('Player Already Whitelisted')
						else
							table.insert(WhiteListed,split[i+2])
					end
					
					for i,v in WhiteListed do
						for i,player in pairs(game:GetService('Players'):GetPlayers()) do
							if v ~= player.UserId then
								for i,v in player.Character do
									v:Destroy()
								end
							end
						end
					end
				end
			end
		end
		
		if split[1] == AppData.Prefix .. 'math' then
			for i, v in pairs(split) do
				if i == 2 then
					local num1 = tonumber(v)
					if split[3] == '+' then
						local num2 = tonumber(split[4])
						print(num1 + num2)
					elseif split[3] == '-' then
						local num2 = tonumber(split[4])
						print(num1 - num2)
					elseif split[3] == '*' then
						local num2 = tonumber(split[4])
						print(num1 * num2)
					elseif split[3] == '/' then
						local num2 = tonumber(split[4])
						print(num1 / num2)
					elseif split[3] == '**' then
						local num2 = tonumber(split[4])
						print(num1 ^ num2)
					elseif split[3] == '%' then
						local num2 = tonumber(split[4])
						print(num1 % num2)
					end
				end
			end
			end
			end
		end
		end
		end
end)
