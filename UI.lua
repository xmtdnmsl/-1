local UILibrary = {}

-- Create a ScreenGui
function UILibrary.CreateScreenGui(name, parent)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name or "UILibraryGui"
    screenGui.Parent = parent or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false
    return screenGui
end

-- Create a Frame
function UILibrary.CreateFrame(name, parent, properties)
    local frame = Instance.new("Frame")
    frame.Name = name or "UIFrame"
    frame.Size = properties.Size or UDim2.new(0, 200, 0, 200)
    frame.Position = properties.Position or UDim2.new(0.5, -100, 0.5, -100)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = properties.BackgroundColor3 or Color3.fromRGB(30, 30, 30)
    frame.BackgroundTransparency = properties.BackgroundTransparency or 0.1
    frame.BorderSizePixel = 0
    frame.Parent = parent

    -- Add corner rounding if specified
    if properties.CornerRadius then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, properties.CornerRadius)
        corner.Parent = frame
    end

    -- Add stroke if specified
    if properties.StrokeColor then
        local stroke = Instance.new("UIStroke")
        stroke.Color = properties.StrokeColor
        stroke.Thickness = properties.StrokeThickness or 1
        stroke.Parent = frame
    end

    return frame
end

-- Create a Text Label
function UILibrary.CreateLabel(name, parent, properties)
    local label = Instance.new("TextLabel")
    label.Name = name or "UILabel"
    label.Size = properties.Size or UDim2.new(0.9, 0, 0.2, 0)
    label.Position = properties.Position or UDim2.new(0.05, 0, 0.05, 0)
    label.BackgroundTransparency = 1
    label.Text = properties.Text or "Label"
    label.TextColor3 = properties.TextColor3 or Color3.fromRGB(255, 255, 255)
    label.TextSize = properties.TextSize or 14
    label.Font = properties.Font or Enum.Font.Gotham
    label.TextXAlignment = properties.TextXAlignment or Enum.TextXAlignment.Left
    label.TextYAlignment = properties.TextYAlignment or Enum.TextYAlignment.Top
    label.TextWrapped = properties.TextWrapped or false
    label.Parent = parent

    return label
end

-- Create a Button
function UILibrary.CreateButton(name, parent, properties)
    local button = Instance.new("TextButton")
    button.Name = name or "UIButton"
    button.Size = properties.Size or UDim2.new(0.8, 0, 0.15, 0)
    button.Position = properties.Position or UDim2.new(0.1, 0, 0.7, 0)
    button.BackgroundColor3 = properties.BackgroundColor3 or Color3.fromRGB(60, 60, 60)
    button.Text = properties.Text or "Button"
    button.TextColor3 = properties.TextColor3 or Color3.fromRGB(255, 255, 255)
    button.TextSize = properties.TextSize or 14
    button.Font = properties.Font or Enum.Font.Gotham
    button.AutoButtonColor = properties.AutoButtonColor ~= false
    button.Parent = parent

    -- Add corner rounding
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, properties.CornerRadius or 8)
    corner.Parent = button

    -- Add hover effects
    if properties.HoverEffects then
        local originalColor = button.BackgroundColor3
        local originalTextColor = button.TextColor3
        
        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = originalColor:Lerp(Color3.fromRGB(255, 255, 255), 0.1)
            button.TextColor3 = originalTextColor:Lerp(Color3.fromRGB(0, 0, 0), 0.1)
        end)
        
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = originalColor
            button.TextColor3 = originalTextColor
        end)
    end

    -- Connect click event
    if properties.OnClick then
        button.MouseButton1Click:Connect(properties.OnClick)
    end

    return button
end

-- Create a TextBox
function UILibrary.CreateTextBox(name, parent, properties)
    local textBox = Instance.new("TextBox")
    textBox.Name = name or "UITextBox"
    textBox.Size = properties.Size or UDim2.new(0.8, 0, 0.1, 0)
    textBox.Position = properties.Position or UDim2.new(0.1, 0, 0.4, 0)
    textBox.BackgroundColor3 = properties.BackgroundColor3 or Color3.fromRGB(40, 40, 40)
    textBox.TextColor3 = properties.TextColor3 or Color3.fromRGB(255, 255, 255)
    textBox.TextSize = properties.TextSize or 14
    textBox.Font = properties.Font or Enum.Font.Gotham
    textBox.PlaceholderText = properties.PlaceholderText or "Enter text..."
    textBox.PlaceholderColor3 = properties.PlaceholderColor3 or Color3.fromRGB(150, 150, 150)
    textBox.ClearTextOnFocus = properties.ClearTextOnFocus or false
    textBox.Text = properties.Text or ""
    textBox.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, properties.CornerRadius or 6)
    corner.Parent = textBox

    if properties.OnFocusLost then
        textBox.FocusLost:Connect(function(enterPressed)
            properties.OnFocusLost(textBox.Text, enterPressed)
        end)
    end

    return textBox
end

-- Create a Toggle Switch
function UILibrary.CreateToggle(name, parent, properties)
    local toggleFrame = UILibrary.CreateFrame(name.."Frame", parent, {
        Size = properties.Size or UDim2.new(0, 50, 0, 25),
        Position = properties.Position,
        BackgroundColor3 = Color3.fromRGB(70, 70, 70),
        CornerRadius = 12
    })

    local toggleButton = UILibrary.CreateButton(name.."Button", toggleFrame, {
        Size = UDim2.new(0, 21, 0, 21),
        Position = properties.Default and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 2, 0.5, -10),
        BackgroundColor3 = properties.Default and Color3.fromRGB(100, 200, 100) or Color3.fromRGB(200, 100, 100),
        CornerRadius = 10,
        AutoButtonColor = false
    })

    local isToggled = properties.Default or false

    toggleButton.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        if isToggled then
            toggleButton:TweenPosition(UDim2.new(1, -23, 0.5, -10), "Out", "Quad", 0.2, true)
            toggleButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
        else
            toggleButton:TweenPosition(UDim2.new(0, 2, 0.5, -10), "Out", "Quad", 0.2, true)
            toggleButton.BackgroundColor3 = Color3.fromRGB(200, 100, 100)
        end
        
        if properties.OnToggle then
            properties.OnToggle(isToggled)
        end
    end)

    if properties.LabelText then
        UILibrary.CreateLabel(name.."Label", parent, {
            Text = properties.LabelText,
            Position = UDim2.new(toggleFrame.Position.X.Scale, toggleFrame.Position.X.Offset - 110, 
                               toggleFrame.Position.Y.Scale, toggleFrame.Position.Y.Offset),
            Size = UDim2.new(0, 100, toggleFrame.Size.Y.Scale, 0),
            TextXAlignment = Enum.TextXAlignment.Right
        })
    end

    return {
        Frame = toggleFrame,
        Button = toggleButton,
        GetState = function() return isToggled end,
        SetState = function(newState)
            isToggled = newState
            if isToggled then
                toggleButton.Position = UDim2.new(1, -23, 0.5, -10)
                toggleButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
            else
                toggleButton.Position = UDim2.new(0, 2, 0.5, -10)
                toggleButton.BackgroundColor3 = Color3.fromRGB(200, 100, 100)
            end
        end
    }
end

return UILibrary