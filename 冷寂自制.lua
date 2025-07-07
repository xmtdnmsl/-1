local OrionLib = loadstring(game:HttpGet('https://pastebin.com/raw/xLRUSiKx'))()
local Window = OrionLib:MakeWindow({Name = "KL脚本", HidePremium = false, SaveConfig = true,IntroText = "欢迎使用冷寂脚本", ConfigFolder = "冷寂脚本"})

local about = Window:MakeTab({
    Name = "作者信息",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

about:AddParagraph("作者: 冷寂")
about:AddParagraph("作者qq: 3912831893")
about:AddParagraph("qq群: 398990034")

local Tab = Window:MakeTab({
    Name = "通用",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "飞行",
	Callback = function()
loadstring(game:HttpGet('https://rentry.co/shadiao_yazifly/raw'))()
end
})
