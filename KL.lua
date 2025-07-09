--by 风御 X

repeat wait() until game:IsLoaded()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnnouncementGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Name = "AnnouncementFrame"
frame.Parent = screenGui
frame.BackgroundColor3 = Color3.new(0, 0, 0) 
frame.Size = UDim2.new(0, 400, 0, 200) 
frame.Position = UDim2.new(0.5, -200, 0.5, -100) 


local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Parent = frame
titleLabel.BackgroundColor3 = Color3.new(0, 0, 0) 
titleLabel.BackgroundTransparency = 1
titleLabel.Position = UDim2.new(0, 10, 0, 10)
titleLabel.Size = UDim2.new(0, 380, 0, 30)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Text = "KL卡密系统" -- 写自己给系统做的名字
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextSize = 24

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Parent = frame
closeButton.BackgroundColor3 = Color3.new(1, 0, 0) 
closeButton.Position = UDim2.new(0, 360, 0, 0)
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 24

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local keyInput = Instance.new("TextBox")
keyInput.Name = "KeyInput"
keyInput.Parent = frame
keyInput.BackgroundColor3 = Color3.new(1, 1, 1) 
keyInput.Position = UDim2.new(0.1, 0, 0.4, 0)
keyInput.Size = UDim2.new(0.8, 0, 0.2, 0)
keyInput.PlaceholderText = "输入卡密"
keyInput.Font = Enum.Font.SourceSans
keyInput.TextSize = 18

local submitButton = Instance.new("TextButton")
submitButton.Name = "SubmitButton"
submitButton.Parent = frame
submitButton.BackgroundColor3 = Color3.new(0, 1, 0) 
submitButton.Position = UDim2.new(0.35, 0, 0.7, 0)
submitButton.Size = UDim2.new(0.3, 0, 0.2, 0)
submitButton.Text = "提交"
submitButton.Font = Enum.Font.SourceSansBold
submitButton.TextSize = 18


local function verifyKey(key)
    local validKey = "KL牛逼" -- 自定义卡密
    return key == validKey
end

local function startAnotherScript()
   -- 这里填你的脚本↓
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xmtdnmsl/-1/refs/heads/main/%E5%86%B7%E5%AF%82.lua"))()  
   
    local anotherScriptModule = require(game.ServerScriptService.AnotherScriptModule)
    anotherScriptModule.startFunction()
end


submitButton.MouseButton1Click:Connect(function()
    local inputKey = keyInput.Text
    if verifyKey(inputKey) then
        print("卡密有效")
        screenGui:Destroy()
        startAnotherScript() 
    else
        print("卡密无效")
        game.Players.LocalPlayer:Kick("卡密无效")
    end
end)