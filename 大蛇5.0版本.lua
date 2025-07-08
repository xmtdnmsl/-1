local Gui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local AgreeButton = Instance.new("TextButton")
local AgreeUICorner = Instance.new("UICorner")
local PhotoLabel = Instance.new("ImageLabel")
local CloseButton = Instance.new("TextButton")
local CloseUICorner = Instance.new("UICorner")
local ScrollingFrame = Instance.new("ScrollingFrame")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")

Gui.Parent = game.CoreGui

Frame.Parent = Gui
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.Position = UDim2.new(0.15, 0, 0, 0)
Frame.Size = UDim2.new(0.72, 0, 0.85, 0)
Frame.ClipsDescendants = true

UICorner.Parent = Frame
UICorner.CornerRadius = UDim.new(0, 10)

PhotoLabel.Parent = Frame
PhotoLabel.Image = "rbxassetid://16060333448"
PhotoLabel.ImageTransparency = 0
PhotoLabel.Position = UDim2.new(0.027, 0, 0.05, 0)
PhotoLabel.Size = UDim2.new(0.47, 0, 0.897, 0)

AgreeButton.Parent = Frame
AgreeButton.BackgroundColor3 = Color3.fromRGB(66, 134, 244) 
AgreeButton.Position = UDim2.new(0.548, 0, 0.83, 0) 
AgreeButton.Size = UDim2.new(0.4, 0, 0.1, 0) 
AgreeButton.Text = "必须同意😋😋😋"
AgreeButton.TextColor3 = Color3.new(0, 0, 0) 
AgreeButton.Font = Enum.Font.SourceSansBold
AgreeButton.TextScaled = true

AgreeUICorner.Parent = AgreeButton
AgreeUICorner.CornerRadius = UDim.new(0, 10) 

CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) 
CloseButton.Position = UDim2.new(0.94, 0, 0, 0) 
CloseButton.Size = UDim2.new(0.06, 0, 0.12, 0) 
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.new(1, 1, 1) 
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextScaled = true

CloseUICorner.Parent = CloseButton
CloseUICorner.CornerRadius = UDim.new(0, 10) 

ScrollingFrame.Parent = Frame
ScrollingFrame.Position = UDim2.new(0.52, 0, 0.13, 0)
ScrollingFrame.Size = UDim2.new(0.477, 0, 0.7, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
ScrollingFrame.ScrollBarThickness = 3
ScrollingFrame.ScrollBarImageColor3 = Color3.new(0.5, 0.5, 0.5)

TextLabel.Parent = ScrollingFrame
TextLabel.Size = UDim2.new(1, -10, 2, 0)
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.Text = [[
1.退圈⭕️了
2.想改什么公告就直接在这改
]]

TextLabel.TextSize = 14
TextLabel.TextWrapped = true
TextLabel.Font = Enum.Font.SourceSans
TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.TextYAlignment = Enum.TextYAlignment.Top

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.6, 0, 0, 0)
TextBox.Size = UDim2.new(0.3, 0, 0.1, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = "公告栏"
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 25
TextBox.ClearTextOnFocus = false

local TextBoxUICorner = Instance.new("UICorner")
TextBoxUICorner.Parent = TextBox
TextBoxUICorner.CornerRadius = UDim.new(0, 5)

local TextBoxUIStroke = Instance.new("UIStroke")
TextBoxUIStroke.Parent = TextBox
TextBoxUIStroke.Thickness = 1
TextBoxUIStroke.Color = Color3.fromRGB(0, 0, 0)
TextBoxUIStroke.Transparency = 0.5

AgreeButton.MouseButton1Click:Connect(function()
    Gui:Destroy()
    runScript()
    
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
  LastIteration = tick()
  for Index = #FrameUpdateTable, 1, -1 do
FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
  end
  FrameUpdateTable[1] = LastIteration
  local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
CurrentFPS = CurrentFPS - CurrentFPS % 1
  FpsLabel.Text = ("大蛇:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/v9Pdp6kx"))()
local Window = OrionLib:MakeWindow({Name = "大蛇脚本", HidePremium = false, SaveConfig = true,IntroText = "大蛇脚本喵~", ConfigFolder = "欢迎泥wow"})

local Tab = Window:MakeTab({
	Name = "告示栏",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddParagraph("更新十分缓慢 谢谢!!!")

Tab:AddParagraph("请勿🈚️喷😭😭😭")

Tab:AddParagraph("更新电脑键盘/Ohio-XA脚本")

Tab:AddParagraph("小小渚叫爸爸")

Tab:AddParagraph("么叽叫爸爸")

Tab:AddParagraph("小小渚🤓🤓🤓")
WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/xmtdnmsl/-1/refs/heads/main/FengYu.lua"))()

function gradient(text, startColor, endColor)
    local result = ""
    local length = #text

    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end

    return result
end

local Confirmed = false

WindUI:Popup({
    Title = "Welcome! Popup Example",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Content = "This is an Example UI for the " .. gradient("WindUI", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")) .. " Lib",
    Buttons = {
        {
            Title = "Cancel",
            Callback = function() end,
            Variant = "Secondary",
        },
        {
            Title = "Continue",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary",
        }
    }
})

repeat wait() until Confirmed

local Window = WindUI:CreateWindow({
    Title = "冷寂",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Author = "冷寂脚本",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = true,
        Callback = function() print("clicked") end,
        Anonymous = true
    },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
    KeySystem = {
        Key = { "1234", "5678" },
        Note = "Example Key System. \n\nThe Key is '1234' or '5678",
        URL = "link-to-linkvertise-or-discord-or-idk",
        SaveKey = true,
    },
})

Window:CreateTopbarButton("MyCustomButton1", "bird", function() print("clicked 1!") end, 990)
Window:CreateTopbarButton("MyCustomButton3", "battery-plus", function() Window:ToggleFullscreen() end, 989)

Window:EditOpenButton({
    Title = "冷寂脚本",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
    Draggable = true,
})

CloseButton.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

AgreeButton.MouseEnter:Connect(function()
    AgreeButton.BackgroundColor3 = Color3.fromRGB(57, 123, 234)
end)

AgreeButton.MouseLeave:Connect(function()
    AgreeButton.BackgroundColor3 = Color3.fromRGB(66, 134, 244)
end)

CloseButton.MouseEnter:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0) 
end)

CloseButton.MouseLeave:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end)

function runScript()
    print("大蛇")
    print("大蛇: " .. TextBox.Text)
end
