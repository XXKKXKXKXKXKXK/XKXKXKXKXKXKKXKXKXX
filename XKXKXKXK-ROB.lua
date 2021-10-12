if not hookmetamethod or not getrenv then 
    game.Players.LocalPlayer:Kick("You'll get banned if you try to execute this with that executor muchacho")
end
local NoNos = {
    "CHECKER_1",
    "TeleportDetect",
    "OneMoreTime"
}
Table ={
WalkSpeed,JumpPower
}

local OldNameCall
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    local Args = {...}
    if (getnamecallmethod() == "FireServer" and Args[1] == game:GetService("ReplicatedStorage").MainEvent and table.find(NoNos, Args[2])) then
        return
    end
     if getnamecallmethod()=="IsStudio"  then -- bad
        return true
    end
    if (not checkcaller() and getfenv(2).crash) then
        hookfunction(getfenv(2).crash, function() -- Crash
            return nil
        end)
    end
    return OldNameCall(...)
end)

local OldNameCall
OldNameCall = hookmetamethod(game, "__newindex", function(A, B, C)
    if (not checkcaller() and A.ClassName == "Humanoid" and (B == "WalkSpeed" or B == "JumpPower")) then
        Table[B] = C
        return
    end
    return OldNameCall(A, B, C)
end)
Player = game.Players.LocalPlayer
game:GetService('RunService').Stepped:connect(function()
if getgenv().Start then
Player.Character.Humanoid:ChangeState(11)
end
end)
while getgenv().Start and wait() do
pcall(function()
for i,v in pairs(game:GetService("Workspace").Ignored.Drop:GetChildren()) do
if v.ClassName == "MeshPart" and v:FindFirstChild("ClickDetector") then
Player.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,-2,0)
wait(1)
fireclickdetector(v.ClickDetector)
wait(1)
fireclickdetector(game:GetService("Workspace").Ignored["Clean the shoes on the floor and come to me for cash"].ClickDetector)
end 
end 
end)
end 
