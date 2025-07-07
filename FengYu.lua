local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengY4/refs/heads/main/%E6%B1%BD%E6%B0%B4ui.lua"))()     
local win = library:new("JOJO脚本")
--
local UITab1 = win:Tab("『信息』",'16060333448')

local about = UITab1:section("『冷寂』",false)

about:Label("1.冷寂")
about:Label("2.墨")
about:Label("3.房主")
about:Label("你的账号年龄:"..player.AccountAge.."天")
about:Label("你的注入器:"..identifyexecutor())
about:Label("你的用户名:"..game.Players.LocalPlayer.Character.Name)
about:Label("你现在的服务器名称:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
about:Label("你现在的服务器id:"..game.GameId)
about:Label("你的用户ID:"..game.Players.LocalPlayer.UserId)
about:Label("获取客户端ID:"..

about:Button("3912831893",function()
    setclipboard("哦")
end)

local UITab1 = win:Tab("『通用』",'16060333448')

local about = UITab1:section("『通用』",false)

about:Button("自杀",function()
    game.Players.LocalPlayer.Character.Humanoid.Health=0
HumanDied = true
end)

about:Toggle("夜视","Toggle",false,function(Value)
if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end
end)

local UITab1 = win:Tab("『绘制』",'16060333448')

local about = UITab1:section("『玩家绘制』",false)