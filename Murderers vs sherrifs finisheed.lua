--Kavos
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local colors = {
    SchemeColor = Color3.fromRGB(50,50,50),
    Background = Color3.fromRGB(17, 17, 17),
    Header = Color3.fromRGB(10, 10, 10),
    TextColor = Color3.fromRGB(0,255,0),
    ElementColor = Color3.fromRGB(25, 25, 25)
}
local Window = Library.CreateLib("Murderers vs. Sherrifs GUI", colors)


--Main
local MainTab = Window:NewTab("Teams")
local MainSection = MainTab:NewSection("Sheriff")
local MurdSection = MainTab:NewSection("Murderer")
local MiscTab = Window:NewTab("Misc")
local MiscSection = MiscTab:NewSection("Misc")
MainSection:NewButton("Kill all Murderers", "GO TO HELP TAB FOR ME TO EXPLAIN", function()
    for i, player in ipairs(game:GetService("Players"):GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
        local character = player.Character
        while not character do
            character = player.Character
            wait()
        end
        local pos1 = character.HumanoidRootPart.Position
        local pos2 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        local gun = game.Players.LocalPlayer.Character:FindFirstChild("Gun")
        local damage = gun and gun:FindFirstChild("Damage")
        if damage then
            local args = {
                character.Head,
                Vector3.new(pos1),
                Vector3.new(pos2)
            }
            damage:FireServer(unpack(args))
            wait()
        end
    end
end
end)
MiscSection:NewButton("Disable Enemy Spawn Damage", "does what it says it does-", function()
    local BlockedRemotes = { "SpawnProtection", } local Events = { Fire = true, Invoke = true, FireServer = true, InvokeServer = true, } local gameMeta = getrawmetatable(game) local psuedoEnv = { ["__index"] = gameMeta.__index, ["__namecall"] = gameMeta.__namecall; } setreadonly(gameMeta, false) gameMeta.__index, gameMeta.__namecall = newcclosure(function(self, index, ...) if Events[index] then for i,v in pairs(BlockedRemotes) do if v == self.Name then return nil end end end return psuedoEnv.__index(self, index, ...) end) setreadonly(gameMeta, true)
end)

local HelpTab = Window:NewTab("Help")
local HelpSection = HelpTab:NewSection("only kills Murderers that arent moving")
HelpSection:NewButton("Explanation/copy to Clipboard", "e", function()
    setclipboard("https://pastebin.com/JtB5Nphk")
    toclipboard("https://pastebin.com/JtB5Nphk")
end)
MurdSection:NewButton("Kill all Sheriffs", "Kills all Sheriffs", function()
    local args = {
    [1] = nil,
    [2] = "Throw"
}

for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
    if player ~= game:GetService("Players").LocalPlayer then
        args[1] = player.Character.Head
        if args[1] then
            game:GetService("Players").LocalPlayer.Character.Knife.Damage:FireServer(unpack(args))
        end
        wait(0.5)
    end
end
end)