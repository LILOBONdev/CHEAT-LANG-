local TargetUserId = {
	'6001782755',
}
local plr = game:GetService("Players").LocalPlayer
local ToId = tonumber(plr.UserId)
local Out = plr.AccountAge + 1
local function KickLive()
	plr:Kick("CHEAT LANG™")
end

for _, v in pairs(TargetUserId) do
	local To = tonumber(v)
	if To == ToId and plr.AccountAge < Out then
		KickLive()
	elseif plr.AccountAge > Out then
		print("CHEAT LANG™ - The lockout time has expired, continue playing!")
	end
end
