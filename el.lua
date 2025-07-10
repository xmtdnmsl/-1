local  = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "冷寂 " .. Fluent.Version,
    SubTitle = "由 dawid 制作",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- 模糊效果可能被检测到，设置为 false 将完全禁用模糊
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- 当没有设置 MinimizeKeybind 时使用
})

-- Fluent 提供 Lucide 图标 https://lucide.dev/icons/ 用于选项卡，图标是可选的
local Tabs = {
    Main = Window:AddTab({ Title = "主界面", Icon = "" }),
    Settings = Window:AddTab({ Title = "设置", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "通知",
        Content = "这是一个通知",
        SubContent = "子内容", -- 可选
        Duration = 5 -- 设置为 nil 使通知不消失
    })



    Tabs.Main:AddParagraph({
        Title = "段落",
        Content = "这是一个段落。\n第二行！"
    })



    Tabs.Main:AddButton({
        Title = "按钮",
        Description = "非常重要的按钮",
        Callback = function()
            Window:Dialog({
                Title = "标题",
                Content = "这是一个对话框",
                Buttons = {
                    {
                        Title = "确认",
                        Callback = function()
                            print("确认了对话框。")
                        end
                    },
                    {
                        Title = "取消",
                        Callback = function()
                            print("取消了对话框。")
                        end
                    }
                }
            })
        end
    })



    local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "开关", Default = false })

    Toggle:OnChanged(function()
        print("开关改变：", Options.MyToggle.Value)
    end)

    Options.MyToggle:SetValue(false)


    
    local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "滑动",
        Description = "这是一个滑块",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            print("滑块被改变：", Value)
        end
    })

    Slider:OnChanged(function(Value)
        print("滑块改变：", Value)
    end)

    Slider:SetValue(3)



    local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "下拉菜单",
        Values = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"},
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("4")

    Dropdown:OnChanged(function(Value)
        print("下拉菜单改变：", Value)
    end)


    
    local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
        Title = "下拉菜单",
        Description = "你可以选择多个值。",
        Values = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"},
        Multi = true,
        Default = {"7", "12"},
    })

    MultiDropdown:SetValue({
        ["3"] = true,
        ["5"] = true,
        ["7"] = false
    })

    MultiDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("多选下拉菜单改变：", table.concat(Values, ", "))
    end)



    local Colorpicker = Tabs.Main:AddColorpicker("Colorpicker", {
        Title = "颜色选择器",
        Default = Color3.fromRGB(96, 205, 255)
    })

    Colorpicker:OnChanged(function()
        print("颜色选择器 utilis：", Colorpicker.Value)
    end)
    
    Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))



    local TColorpicker = Tabs.Main:AddColorpicker("TransparencyColorpicker", {
        Title = "颜色选择器",
        Description = "但你可以调整透明度。",
        Transparency = 0,
        Default = Color3.fromRGB(96, 205, 255)
    })

    TColorpicker:OnChanged(function()
        print(
            "透明度颜色选择器改变：", TColorpicker.Value,
            "透明度：", TColorpicker.Transparency
        )
    end)



    local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "快捷键",
        Mode = "Toggle", -- 总是，切换，按住
        Default = "LeftControl", -- 快捷键名称的字符串（MB1、MB2 为鼠标按键）

        -- 当快捷键被点击时触发，Value 为 _

        Callback = function(Value)
            print("快捷键被点击！", Value)
        end,

        -- 当快捷键本身被更改时触发，`New` 是一个 KeyCode 枚举或 UserInputType 枚举
        ChangedCallback = function(New)
            print("快捷键改变！", New)
        end
    })

    -- OnClick 仅在按下快捷键且模式为 Toggle 时触发
    -- 否则，你需要使用 Keybind:GetState()
    Keybind:OnClick(function()
        print("快捷键点击：", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("快捷键改变：", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            -- 检查快捷键是否被按下的示例
            local state = Keybind:GetState()
            if state then
                print("快捷键正在被按住")
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle") -- 将快捷键设置为 MB2，模式为按住


    local Input = Tabs.Main:AddInput("Input", {
        Title = "输入框",
        Default = "默认",
        Placeholder = "占位符",
        Numeric = false, -- 仅允许输入数字
        Finished = false, -- 仅在按下回车时调用回调
        Callback = function(Value)
            print("输入框改变：", Value)
        end
    })

    Input:OnChanged(function()
        print("输入框更新：", Input.Value)
    end)
end


-- 插件：
-- SaveManager（允许你拥有一个配置系统）
-- InterfaceManager（允许你拥有一个界面管理系统）

-- 将库交给我们的管理器
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- 忽略 ThemeManager 使用的键。
--（我们不希望配置保存主题，对吧？）
SaveManager:IgnoreThemeSettings()

-- 你可以添加 SaveManager 应该忽略的元素索引
SaveManager:SetIgnoreIndexes({})

-- 这样做的用例：
-- 一个脚本中心可以在全局文件夹中拥有主题
-- 并且在每个游戏的单独文件夹中拥有游戏配置
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "脚本已加载。",
    Duration = 8
})

-- 你可以使用 SaveManager:LoadAutoloadConfig() 加载
-- 被标记为自动加载的配置！
SaveManager:LoadAutoloadConfig()

local Tab = Window:MakeTab({
	Name = "玩家通用设置",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "电脑键盘",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})

Tab:AddButton({
  Name = "HUA 光影",
  Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/arzRCgwS"))()
  end
})

Tab:AddButton({
  Name = "光影_2",
  Default = false,
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
  end
})

Tab:AddButton({
	Name = "超高画质",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end
})    

Tab:AddButton({
	Name = "FPS",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/FPS-X-GUI/main/FPS_X.lua"))()
  	end    
})

Tab:AddButton({
  Name = "旋转哦",
  Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
  end
})

Tab:AddButton({
	Name = "旋转转转起来～",
	Callback = function()
      	loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
  	end
})

Tab:AddToggle({
	Name = "夜视功能👍",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})

Tab:AddButton({
    Name = "好玩的动作",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
    end
})

Tab:AddButton({
	Name = "踏空走路",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
	end
})

Tab:AddButton({
	Name = "点击传送工具(推荐!!!)",
	Callback = function()
mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "[FE] TELEPORT TOOL" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
	end
})

Tab:AddTextbox({
	Name = "跳跃高度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})

Tab:AddTextbox({
	Name = "移动速度设置(小心调太高了会飞出去哦)",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})

Tab:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

Tab:AddToggle({
	Name = "穿墙",
	Default = false,
	Callback = function(Value)
		if Value then
		    Noclip = true
		    Stepped = game.RunService.Stepped:Connect(function()
			    if Noclip == true then
				    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
			    else
				    Stepped:Disconnect()
			    end
		    end)
	    else
		    Noclip = false
	    end
	end
})

Tab:AddButton({
	Name = "飞行",
	Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
  	end
})

