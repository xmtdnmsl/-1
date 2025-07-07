local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengY4/refs/heads/main/%E6%B1%BD%E6%B0%B4ui.lua", true))()
----------------------------------------------------------------------------------------------------------------------------------------
local window = library:new("风御")--V1
----------------------------------------------------------------------------------------------------------------------------------------

local creds = window:Tab("哦",'6031097229')

local credits = creds:section("是你😡",true)

credits:Button("自己打自己",function()
    game.Players.LocalPlayer.Character.Humanoid.Health=0
HumanDied = true
end)
