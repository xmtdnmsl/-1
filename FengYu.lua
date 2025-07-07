local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/djdu894/ui/refs/heads/main/ui.lua"))()
local win = library:new("JOJO脚本")
--
local UITab1 = win:Tab("『信息』",'16060333448')

local about = UITab1:section("『冷寂』",false)

about:Label("1.冷寂")
about:Label("2.墨")
about:Label("3.风御")

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

about:Toggle("自动互动", "Auto Interact", false, function(state)
        if state then
            autoInteract = true
            while autoInteract do
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        fireproximityprompt(descendant)
                    end
                end
                task.wait(0.25) -- Adjust the wait time as needed
            end
        else
            autoInteract = false
        end
end)

about:Toggle("无限跳","Toggle",false,function(Value)
        Jump = Value
        game.UserInputService.JumpRequest:Connect(function()
            if Jump then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
end)

about:Button("透视",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
end)

about:Button("飞行",function()
    loadstring(game:HttpGet'https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt')()
end)    

local UITab1 = win:Tab("『绘制』",'16060333448')

local about = UITab1:section("『玩家绘制』",false)