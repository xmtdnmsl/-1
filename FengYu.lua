local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengY4/refs/heads/main/%E6%B1%BD%E6%B0%B4ui.lua"))()     
local win = library:new("JOJO脚本")
--
local UITab1 = win:Tab("『信息』",'16060333448')

local about = UITab1:section("『冷寂』",false)

about:Label("作者1.冷寂")
about:Label("作者2.墨")
about:Label("作者3.风御")

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

about:Button("甩飞别人,"function()

loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()

  end
  
end)

local UITab1 = win:Tab("『绘制』",'16060333448')

local about = UITab1:section("『玩家绘制』",false)