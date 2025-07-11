local Luminosity = loadstring(game:HttpGet("https://raw.githubusercontent.com/iHavoc101/Genesis-Studios/main/UserInterface/Luminosity.lua", true))()

local Window = Luminosity.new("Luminosity UI", "v1.0.0", 4370345701)

local Tab1 = Window.Tab("Tab 1", 6026568198)
local Folder = Tab1.Folder("Options", "A bunch of options you can use")
Folder.Button("Button", "Click", function()
    print("Button Clicked")
end)
Folder.Switch("Switch", function(Status)
    print("Switch Triggered: " .. tostring(Status))
end)
Folder.Toggle("Toggle", function(Status)
    print("Toggle Triggered: " .. tostring(Status))
end)
Folder.Toggle("Toggle", function(Status)
    print("Toggle Triggered: " .. tostring(Status))
end)
Folder.TextBox("Textbox", "Placeholder", function(Text)
    print("TextBox Triggered: " .. Text)
end)[/align]
[align=center]Folder.Slider("Slider", {Precise = true, Default = 18, Min = 10, Max = 125}, function(Status)
    print("Slider Triggered" .. tostring(Status))
end)
Tab1.Folder("Lipsum Expanded", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eu mollis urna, quis feugiat tellus. Integer ut ligula sodales, sodales ipsum ut, imperdiet ipsum. In aliquet quam et venenatis pulvinar. Nullam fermentum porta felis sit amet interdum. Sed tristique fringilla mollis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam quis tempus mauris, nec ultrices metus. Suspendisse mi urna, accumsan at nisi a, tristique porta libero. Integer lobortis elementum lacus cursus consectetur. Morbi mauris ante, posuere at malesuada et, tristique non ipsum. Proin vitae purus pretium, convallis est vitae, dignissim leo. Praesent nec felis vitae.")

local Cheat = Tab1.Cheat("Options", "A bunch of options you can use", function(Status)
    print("Cheat Triggered: " .. tostring(Status))
end)
Cheat.Button("Button", "Click", function()
    print("Button Clicked")
end)
Cheat.Switch("Switch", function(Status)
    print("Switch Triggered: " .. tostring(Status))
end)
Cheat.Toggle("Toggle", function(Status)
    print("Toggle Triggered: " .. tostring(Status))
end)
Cheat.Toggle("Toggle", function(Status)
    print("Toggle Triggered: " .. tostring(Status))
end)
Cheat.TextBox("Textbox", "Placeholder", function(Text)
    print("TextBox Triggered: " .. Text)
end)

Tab1.Cheat("Lipsum Expanded", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eu mollis urna, quis feugiat tellus. Integer ut ligula sodales, sodales ipsum ut, imperdiet ipsum. In aliquet quam et venenatis pulvinar. Nullam fermentum porta felis sit amet interdum. Sed tristique fringilla mollis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam quis tempus mauris, nec ultrices metus. Suspendisse mi urna, accumsan at nisi a, tristique porta libero. Integer lobortis elementum lacus cursus consectetur. Morbi mauris ante, posuere at malesuada et, tristique non ipsum. Proin vitae purus pretium, convallis est vitae, dignissim leo. Praesent nec felis vitae.", function(Status)
    print("Cheat Triggered: " .. tostring(Status))
end)

-- Tab 2 --
local Tab2 = Window.Tab("Tab 2", 6022668945)
local Folder = Tab2.Folder("Options", "A bunch of options you can use")
Folder.Button("Button", "Click", function()
    print("Button Clicked")
end)
Folder.Switch("Switch", function(Status)
    print("Switch Triggered: " .. tostring(Status))
end)
Folder.Toggle("Toggle", function(Status)
    print("Toggle Triggered: " .. tostring(Status))
end)
Folder.Toggle("Toggle", function(Status)
    print("Toggle Triggered: " .. tostring(Status))
end)
Folder.TextBox("Textbox", "Placeholder", function(Text)
    print("TextBox Triggered: " .. Text)
end)
Tab2.Folder("Lipsum Expanded", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eu mollis urna, quis feugiat tellus. Integer ut ligula sodales, sodales ipsum ut, imperdiet ipsum. In aliquet quam et venenatis pulvinar. Nullam fermentum porta felis sit amet interdum. Sed tristique fringilla mollis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam quis tempus mauris, nec ultrices metus. Suspendisse mi urna, accumsan at nisi a, tristique porta libero. Integer lobortis elementum lacus cursus consectetur. Morbi mauris ante, posuere at malesuada et, tristique non ipsum. Proin vitae purus pretium, convallis est vitae, dignissim leo. Praesent nec felis vitae.")

local Cheat = Tab2.Cheat("Options", "A bunch of options you can use", function(Status)
    print("Cheat Triggered: " .. tostring(Status))
end)
Cheat.Button("Button", "Click" function()
    print("Button Clicked")
end)
Cheat.Switch("Switch", function(Status)
    print("Switch Triggered: " .. tostring(Status))
end)
Cheat.Toggle("Toggle", function(Status)
    print("Toggle Triggered: " .. tostring(Status))
end)
Cheat.Toggle("Toggle", function(Status)
    print("Toggle Triggered: " .. tostring(Status))
end)
Cheat.TextBox("Textbox", "Placeholder", function(Text)
print("TextBox Triggered: " .. Text)
end)

Tab2.Cheat("Lipsum Expanded", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eu mollis urna, quis feugiat tellus. Integer ut ligula sodales, sodales ipsum ut, imperdiet ipsum. In aliquet quam et venenatis pulvinar. Nullam fermentum porta felis sit amet interdum. Sed tristique fringilla mollis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam quis tempus mauris, nec ultrices metus. Suspendisse mi urna, accumsan at nisi a, tristique porta libero. Integer lobortis elementum lacus cursus consectetur. Morbi mauris ante, posuere at malesuada et, tristique non ipsum. Proin vitae purus pretium, convallis est vitae, dignissim leo. Praesent nec felis vitae.", function(Status)
print("Cheat Triggered: " .. tostring(Status))
end)

game:GetService("UserInputService").InputBegan:Connect(function(Input)
if Input.KeyCode == Enum.KeyCode.F then
        Window:Toggle()
    end
end)

local Tabs = {}

do
    Tabs.MainTab = Window:Section({Title = "通用脚本", Opened = true})
    Tabs.SpeedTab = Tabs.MainTab:Tab({ Title = "通用", Icon = "zap" })
end

Window:SelectTab(1)

Tabs.SpeedTab:Button({
    Title = "飞行",
    Desc = "飞行",
    Callback = function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
    end
})

Tabs.SpeedTab:Button({
    Title = "连跳",
    Desc = "连跳",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
    end
})

Tabs.SpeedTab:Button({
    Title = "踏空",
    Desc = "踏空",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()        
    end
})

Tabs.SpeedTab:Button({
    Title = "爬墙",
    Desc = "爬墙",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()        
    end
})

Tabs.SpeedTab:Button({
    Title = "光影",
    Desc = "光影",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()        
    end
})

Tabs.SpeedTab:Button({
    Title = "键盘",
    Desc = "键盘",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()        
    end
})

Tabs.SpeedTab:Button({
    Title = "自瞄",
    Desc = "自瞄",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))() 
    end
})

Tabs.SpeedTab:Button({
    Title = "变流畅",
    Desc = "变流畅",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/FPS-X-GUI/main/FPS_X.lua"))()        
    end
})

local Tabs = {}

do
    Tabs.MainTab = Window:Section({Title = "力量传奇", Opened = true})
    Tabs.SpeedTab = Tabs.MainTab:Tab({ Title = "力量传奇脚本", Icon = "zap" })
end

Tabs.SpeedTab:Button({
    Title = "力量",
    Desc = "力量脚本",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xmtdnmsl/-1/refs/heads/main/KL(1).lua"))()        
    end
})
