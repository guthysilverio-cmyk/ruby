-- This file was generated at discord.gg/syncrypt

local t1 = {}
local t2 = {}
local v3 = unpack or table.unpack
t2.value1 = game:GetService("TweenService")
t2.value2 = game:GetService("UserInputService")
t2.value3 = game:GetService("RunService")
t2.value4 = game:GetService("Players")
t2.value5 = game:GetService("ReplicatedStorage")
t2.value6 = game:GetService("Workspace")
t2.value7 = game:GetService("HttpService");
(function()
    if getfenv then
        local v76 = getfenv()

        v76.script = nil

        function v76.getfenv()
            return v76
        end
    end

    if hookfunction then
        local IsDescendantOf = game.IsDescendantOf

        hookfunction(game.IsDescendantOf, function(p1, p2)
            local v301 = p1 == script

            if v301 then
                v301 = p2 == game:GetService("Workspace")
            end

            if v301 then
                return false
            end

            return IsDescendantOf(p1, p2)
        end)
    end

    local _print = print

    function print(...)
        local t3 = { ... }

        for i, v in ipairs(t3) do
            local v305 = type(v) == "string"

            if v305 then
                v305 = v:match("script")

                if not v305 then
                    v305 = v:match("exploit")
                end
            end

            if v305 then
                t3[i] = "[REDACTED]"
            end
        end

        return _print(table.unpack(t3))
    end
end)()
t2.value8 = t2.value4.LocalPlayer
local PlayerGui = t2.value8:WaitForChild("PlayerGui")

t2.value9 = workspace.CurrentCamera
local TouchEnabled = t2.value2.TouchEnabled
if TouchEnabled then
    TouchEnabled = not t2.value2.KeyboardEnabled
end
t2.value10 = TouchEnabled
local v6 = not t2.value10 and 60 or 45
t2.value11 = "CHETERNALConfig.json"
t2.value12 = {}
t2.value12.Enabled = false
t2.value12.HitboxEnabled = false
t2.value12.HitboxSize = 1
t2.value12.HitboxTransparency = 0.3
t2.value12.HitboxKey = "H"
t2.value12.HitboxTouch = false
t2.value12.CameraJump = false
t2.value12.ESPEnabled = false
t2.value12.ESPLineSize = 10
t2.value12.ESPNeon = false
t2.value12.AutoSpinStyle = false
t2.value12.AutoSpinHabi = false
t2.value12.AutoYen = false
t2.value12.JerseyEnabled = false
t2.value12.JerseyDragaoEnabled = false
t2.value12.JerseyPijamaEnabled = false
t2.value12.JerseyDragaoTeam = "PRETA"
t2.value12.JerseyPijamaTeam = "PRETO"
t2.value12.ThemeColor = Color3.fromRGB(138, 43, 226)
t2.value13 = {}
t2.value14 = {}
t2.value15 = nil
t2.value16 = nil
t2.value17 = nil
t2.value18 = nil
t2.value19 = nil
t2.value20 = nil
t2.value21 = nil
t2.value22 = nil
function t2.value23(p3)
    local R = p3.R
    local G = p3.G
    local B = p3.B

    return {
		r = R,
		g = G,
		b = B
	}
end
function t2.value24(p4)
    local v85 = type(p4) == "table"

    if v85 then
        v85 = p4.r

        if v85 then
            v85 = p4.g and p4.b
        end
    end

    if v85 then
        return Color3.new(p4.r, p4.g, p4.b)
    end

    return Color3.fromRGB(138, 43, 226)
end
function t2.value25(p5, p6)
    if p5 == nil then
        return p6 == true
    end

    return p5 == true
end
function t2.value26(p7, p8)
    local num = tonumber(p7)

    if num == nil then
        return p8
    end

    return num
end
function t2.value27()
    local HitboxEnabled = t2.value12.HitboxEnabled
    local HitboxSize = t2.value12.HitboxSize
    local HitboxTransparency = t2.value12.HitboxTransparency
    local str = tostring(t2.value12.HitboxKey or "H")
    local HitboxTouch = t2.value12.HitboxTouch
    local CameraJump = t2.value12.CameraJump
    local ESPEnabled = t2.value12.ESPEnabled
    local ESPLineSize = t2.value12.ESPLineSize
    local ESPNeon = t2.value12.ESPNeon
    local AutoSpinStyle = t2.value12.AutoSpinStyle
    local AutoSpinHabi = t2.value12.AutoSpinHabi
    local AutoYen = t2.value12.AutoYen
    local JerseyEnabled = t2.value12.JerseyEnabled
    local JerseyDragaoEnabled = t2.value12.JerseyDragaoEnabled
    local JerseyPijamaEnabled = t2.value12.JerseyPijamaEnabled
    local str2 = tostring(t2.value12.JerseyDragaoTeam or "PRETA")
    local str3 = tostring(t2.value12.JerseyPijamaTeam or "PRETO")
    local v107 = t2.value23(t2.value12.ThemeColor)

    return {
		Version = 1,
		HitboxEnabled = HitboxEnabled,
		HitboxSize = HitboxSize,
		HitboxTransparency = HitboxTransparency,
		HitboxKey = str,
		HitboxTouch = HitboxTouch,
		CameraJump = CameraJump,
		ESPEnabled = ESPEnabled,
		ESPLineSize = ESPLineSize,
		ESPNeon = ESPNeon,
		AutoSpinStyle = AutoSpinStyle,
		AutoSpinHabi = AutoSpinHabi,
		AutoYen = AutoYen,
		JerseyEnabled = JerseyEnabled,
		JerseyDragaoEnabled = JerseyDragaoEnabled,
		JerseyPijamaEnabled = JerseyPijamaEnabled,
		JerseyDragaoTeam = str2,
		JerseyPijamaTeam = str3,
		ThemeColor = v107
	}
end
local function v7()
    if not writefile then
        return false
    end

    local ok, result = pcall(function()
        local value7 = t2.value7
        local t4 = { t2.value27() }

        return value7:JSONEncode(v3(t4))
    end)
    local v110 = result

    if not ok or not v110 then
        return false
    end

    return (pcall(function()
        writefile(t2.value11, v110)
    end))
end
local t5 = {
	Shirt = "rbxassetid://96110031810524",
	Pants = "rbxassetid://104102200186439"
}
local t6 = {
	Shirt = "rbxassetid://132973270253302",
	Pants = "rbxassetid://85172161335350"
}
local t7 = {
	Shirt = "rbxassetid://116808129640162",
	Pants = "rbxassetid://139666428760490"
}
local t8 = {
	Shirt = "rbxassetid://80954367566093",
	Pants = "rbxassetid://123817816516456"
}
t2.value28 = {
	PRETA = t5,
	LARANJA = t6,
	ROXO = t7,
	VERMELHO = t8,
	BRANCO = {
		Shirt = "rbxassetid://111076753133496",
		Pants = "rbxassetid://118418667305258"
	}
}
local t9 = {
	Shirt = "rbxassetid://73515737995241",
	Pants = "rbxassetid://115411367769806"
}
local t10 = {
	Shirt = "rbxassetid://73515737995241",
	Pants = "rbxassetid://98261789486915"
}
local t11 = {
	Shirt = "rbxassetid://73515737995241",
	Pants = "rbxassetid://84134229912519"
}
local t12 = {
	Shirt = "rbxassetid://73515737995241",
	Pants = "rbxassetid://81837535879996"
}
t2.value29 = {
	PRETO = t9,
	ORANGE = t10,
	ROXO = t11,
	VERMELHO = t12,
	BRANCO = {
		Shirt = "rbxassetid://73515737995241",
		Pants = "rbxassetid://118575272229757"
	}
}
function t2.value30(p9)
    if t2.value16 then
        return
    end

    local v118 = p9

    if p9 then
        v118 = p9:FindFirstChildOfClass("Shirt")
    end

    if p9 then
        p9 = p9:FindFirstChildOfClass("Pants")
    end

    local v119 = v118 and v118.ShirtTemplate or ""
    local v120 = p9 and p9.PantsTemplate or ""

    t2.value16 = {
		ShirtTemplate = v119,
		PantsTemplate = v120
	}
end
function t2.value31()
    local Character = t2.value8.Character

    if not Character or not t2.value16 then
        return
    end

    local Shirt = Character:FindFirstChildOfClass("Shirt")
    local Pants = Character:FindFirstChildOfClass("Pants")

    if Shirt then
        local ShirtTemplate = t2.value16.ShirtTemplate

        if ShirtTemplate then
            ShirtTemplate = t2.value16.ShirtTemplate ~= ""
        end

        if ShirtTemplate then
            Shirt.ShirtTemplate = t2.value16.ShirtTemplate
        else
            Shirt:Destroy()
        end
    end

    if Pants then
        local PantsTemplate = t2.value16.PantsTemplate

        if PantsTemplate then
            PantsTemplate = t2.value16.PantsTemplate ~= ""
        end

        if PantsTemplate then
            Pants.PantsTemplate = t2.value16.PantsTemplate

            return
        end

        Pants:Destroy()
    end
end
function t2.value32()
    if t2.value15 then
        t2.value15:Disconnect()
    end

    t2.value31()
end
local function v16(p10, p11)
    local Character = t2.value8.Character
    local v132 = not Character

    if not v132 then
        v132 = not p10 or not p11
    end

    if v132 then
        return
    end

    t2.value30(Character)

    local Shirt = Character:FindFirstChildOfClass("Shirt")

    if not Shirt then
        Shirt = Instance.new("Shirt")
    end

    Shirt.Parent = Character
    Shirt.ShirtTemplate = p10

    local Pants = Character:FindFirstChildOfClass("Pants")

    if not Pants then
        Pants = Instance.new("Pants")
    end

    Pants.Parent = Character
    Pants.PantsTemplate = p11
end
t2.value33 = nil
function t2.value33()
    local ok, result, v128 = pcall(function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")

        return ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Jersey"):WaitForChild("TuxedoJersey"):WaitForChild("White Team"):WaitForChild("Shirt").ShirtTemplate, ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Jersey"):WaitForChild("PajamasJersey"):WaitForChild("White Team"):WaitForChild("Pants").PantsTemplate
    end)

    if ok then
        return result, v128
    end

    return nil, nil
end
function t2.value34()
    if t2.value12.JerseyDragaoEnabled then
        local v135 = t2.value28[t2.value12.JerseyDragaoTeam]

        if v135 then
            v135 = t2.value12.JerseyDragaoTeam
        end

        local v136 = v135 or "PRETA"
        local v137 = t2.value28[v136]

        return v137.Shirt, v137.Pants
    end

    if t2.value12.JerseyPijamaEnabled then
        local v138 = t2.value29[t2.value12.JerseyPijamaTeam]

        if v138 then
            v138 = t2.value12.JerseyPijamaTeam
        end

        local v139 = v138 or "PRETO"
        local v140 = t2.value29[v139]

        return v140.Shirt, v140.Pants
    end

    if t2.value12.JerseyEnabled then
        return t2.value33()
    end

    return nil, nil
end
function t2.value35()
    t2.value32()

    local v142, v143 = t2.value34()

    if not v142 or not v143 then
        return
    end

    v16(v142, v143)
    t2.value3.Heartbeat:Connect(function()
        local v309, v310 = t2.value34()

        if not v309 or not v310 then
            t2.value32()

            return
        end

        v16(v309, v310)
    end)
end
function t2.value36()
    if t2.value13.dragaoTeamPanel then
        t2.value13.dragaoTeamPanel(t2.value12.JerseyDragaoEnabled)
    end

    if t2.value13.pijamaTeamPanel then
        t2.value13.pijamaTeamPanel(t2.value12.JerseyPijamaEnabled)
    end
end
function t2.value37(p12)
    if p12 ~= "default" then
        t2.value12.JerseyEnabled = false
    end

    if p12 ~= "dragao" then
        t2.value12.JerseyDragaoEnabled = false
    end

    if p12 ~= "pijama" then
        t2.value12.JerseyPijamaEnabled = false
    end

    if t2.value13.jerseyEnabled and p12 ~= "default" then
        t2.value13.jerseyEnabled(false)
    end

    if t2.value13.jerseyDragaoEnabled and p12 ~= "dragao" then
        t2.value13.jerseyDragaoEnabled(false)
    end

    if t2.value13.jerseyPijamaEnabled and p12 ~= "pijama" then
        t2.value13.jerseyPijamaEnabled(false)
    end
end
t2.value8.CharacterAdded:Connect(function()
    task.wait(1)
    t2.value35()
end)
t2.value3.RenderStepped:Connect(function()
    if t2.value12.HitboxEnabled then
        for _, child in ipairs(t2.value6:GetChildren()) do
            if child.Name:match("^CLIENT_BALL_") then
                local BasePart = child:FindFirstChildWhichIsA("BasePart", true)

                if BasePart then
                    local v147 = child:FindFirstChild("Ball.001")

                    if not v147 then
                        v147 = Instance.new("Part", child)
                    end

                    v147.Name = "Ball.001"
                    v147.Shape = Enum.PartType.Ball
                    v147.Anchored = true
                    v147.CanCollide = false
                    v147.Material = Enum.Material.ForceField
                    v147.Transparency = t2.value12.HitboxTransparency
                    v147.Size = Vector3.new(2, 2, 2) * t2.value12.HitboxSize
                    v147.Color = t2.value12.ThemeColor
                    v147.CFrame = BasePart.CFrame
                end
            end
        end
    end

    if t2.value12.ESPEnabled then
        for _, player in pairs(t2.value4:GetPlayers()) do
            if player ~= t2.value8 and player.Character then
                local Head = player.Character:FindFirstChild("Head")
                local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

                if Head and HumanoidRootPart then
                    local v152 = not t2.value14[player]

                    if not v152 then
                        v152 = not t2.value14[player].Parent
                    end

                    if v152 then
                        local Part = Instance.new("Part")

                        Part.Name = "ETERNALFREEESPLine"
                        Part.Anchored = true
                        Part.CanCollide = false
                        Part.CanTouch = false
                        Part.CastShadow = false
                        Part.Shape = Enum.PartType.Cylinder
                        Part.Parent = workspace
                        t2.value14[player] = Part
                    end

                    local v154 = t2.value14[player]
                    local ESPLineSize = t2.value12.ESPLineSize
                    local ESPNeon = t2.value12.ESPNeon

                    if ESPNeon then
                        ESPNeon = Enum.Material.Neon
                    end

                    if not ESPNeon then
                        ESPNeon = Enum.Material.SmoothPlastic
                    end

                    v154.Material = ESPNeon

                    local Unit = Vector3.new(HumanoidRootPart.CFrame.LookVector.X, 0, HumanoidRootPart.CFrame.LookVector.Z).Unit
                    local v158 = HumanoidRootPart.Position + Vector3.new(0, 1.6, 0) + Unit * 0.65
                    local v159 = v158 + Unit * ESPLineSize
                    local v160 = v158 + Unit * (ESPLineSize / 2)

                    v154.Color = t2.value12.ThemeColor
                    v154.Size = Vector3.new(ESPLineSize, 0.35, 0.35)
                    v154.CFrame = CFrame.lookAt(v160, v159) * CFrame.Angles(0, math.rad(90), 0)
                end
            end
        end
    else
        for k, v in pairs(t2.value14) do
            if v and v.Parent then
                v:Destroy()
            end

            t2.value14[k] = nil
        end
    end

    for k, v in pairs(t2.value14) do
        local v165 = k

        if not v165.Parent or not v165.Character then
            if v then
                v:Destroy()
            end

            t2.value14[v165] = nil
        end
    end
end)
t2.value2.JumpRequest:Connect(function()
    local Character = t2.value8.Character
    local v167 = Character and Character:FindFirstChild("Humanoid")

    if Character then
        Character = Character:FindFirstChild("HumanoidRootPart")
    end

    local v168 = Character
    local CameraJump = t2.value12.CameraJump

    if CameraJump then
        CameraJump = v167

        if CameraJump then
            CameraJump = v168 and t2.value9
        end
    end

    if CameraJump then
        task.defer(function()
            task.wait(0.03)

            local vector3 = Vector3.new(t2.value9.CFrame.LookVector.X, 0, t2.value9.CFrame.LookVector.Z)

            if vector3.Magnitude > 0 then
                v168.CFrame = CFrame.lookAt(v168.Position, v168.Position + vector3.Unit)
                v167.AutoRotate = false
            end
        end)
    end
end)
t2.value38 = Instance.new("ScreenGui")
t2.value38.Name = "CHETERNALHub"
t2.value38.ResetOnSpawn = false
t2.value38.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
t2.value38.Parent = PlayerGui
t2.value39 = Instance.new("TextButton")
t2.value39.Name = "FloatingButton"
t2.value39.Size = UDim2.new(0, v6, 0, v6)
t2.value39.Position = UDim2.new(0, 15, 0, 80)
t2.value39.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
t2.value39.BorderSizePixel = 0
t2.value39.Text = "CS"
t2.value39.TextColor3 = Color3.fromRGB(20, 20, 20)
t2.value39.TextSize = not t2.value10 and 22 or 18
t2.value39.Font = Enum.Font.GothamBold
t2.value39.TextStrokeTransparency = 0
t2.value39.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
t2.value39.AutoButtonColor = false
t2.value39.Parent = t2.value38
local UIGradient = Instance.new("UIGradient")

UIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 0, 0)),
	ColorSequenceKeypoint.new(0.499, Color3.fromRGB(200, 0, 0)),
	ColorSequenceKeypoint.new(0.501, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
})
UIGradient.Rotation = 0
UIGradient.Parent = t2.value39
local UICorner = Instance.new("UICorner")

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = t2.value39
t2.value40 = Instance.new("UIStroke")
t2.value40.Color = t2.value12.ThemeColor
t2.value40.Thickness = 3
t2.value40.Parent = t2.value39
task.spawn(function()
    local n1 = 0

    while true do
        local value39 = t2.value39

        if value39 then
            value39 = t2.value39.Parent
        end

        if not value39 then
            break
        end

        n1 = (n1 + 1) % 360
        t2.value40.Color = Color3.fromHSV(n1 / 360, 1, 1)
        task.wait(0.03)
    end
end)
t2.value41 = false
t2.value42 = nil
t2.value43 = nil
t2.value44 = nil
t2.value44 = nil
function t2.value45(p13)
    local v173 = p13.Position - t2.value43

    t2.value39.Position = UDim2.new(t2.value44.X.Scale, t2.value44.X.Offset + v173.X, t2.value44.Y.Scale, t2.value44.Y.Offset + v173.Y)
end
t2.value39.InputBegan:Connect(function(input)
    local v175 = input.UserInputType == Enum.UserInputType.MouseButton1

    if not v175 then
        v175 = input.UserInputType == Enum.UserInputType.Touch
    end

    if v175 then
        t2.value41 = true

        local _ = input.Position
        local _ = t2.value39.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                t2.value41 = false
            end
        end)
    end
end)
t2.value39.InputChanged:Connect(function(input)
    local v179 = input.UserInputType == Enum.UserInputType.MouseMovement

    if not v179 then
        v179 = input.UserInputType == Enum.UserInputType.Touch
    end

    if v179 then
        t2.value42 = input
    end
end)
t2.value2.InputChanged:Connect(function(input)
    if input == t2.value42 and t2.value41 then
        t2.value45(input)
    end
end)
t2.value46 = Instance.new("Frame")

local value46 = t2.value46
local value10 = t2.value10
if value10 then
    value10 = UDim2.new(0, 340, 0, 280)
end
if not value10 then
    value10 = UDim2.new(0, 450, 0, 350)
end
value46.Size = value10
local value46_2 = t2.value46
local value10_2 = t2.value10
if value10_2 then
    value10_2 = UDim2.new(0.5, -170, 0.5, -140)
end
if not value10_2 then
    value10_2 = UDim2.new(0.5, -225, 0.5, -175)
end
value46_2.Position = value10_2
t2.value46.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
t2.value46.BorderSizePixel = 0
t2.value46.Visible = false
t2.value46.Active = true
t2.value46.Parent = t2.value38
Instance.new("UICorner", t2.value46).CornerRadius = UDim.new(0, 12)
t2.value47 = Instance.new("UIStroke")
t2.value47.Color = t2.value12.ThemeColor
t2.value47.Thickness = 2
t2.value47.Parent = t2.value46
local Frame = Instance.new("Frame")

Frame.Size = UDim2.new(1, 0, 0, 50)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Parent = t2.value46
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)
t2.value48 = false
t2.value49 = nil
t2.value50 = nil
Frame.InputBegan:Connect(function(input)
    local v182 = input.UserInputType == Enum.UserInputType.MouseButton1

    if not v182 then
        v182 = input.UserInputType == Enum.UserInputType.Touch
    end

    if v182 then
        t2.value48 = true
        t2.value49 = input.Position
        t2.value50 = t2.value46.Position
    end
end)
Frame.InputEnded:Connect(function(input)
    local v184 = input.UserInputType == Enum.UserInputType.MouseButton1

    if not v184 then
        v184 = input.UserInputType == Enum.UserInputType.Touch
    end

    if v184 then
        t2.value48 = false
    end
end)
t2.value2.InputChanged:Connect(function(input)
    local value48 = t2.value48

    if value48 then
        value48 = input.UserInputType == Enum.UserInputType.MouseMovement

        if not value48 then
            value48 = input.UserInputType == Enum.UserInputType.Touch
        end
    end

    if value48 then
        local v187 = input.Position - t2.value49

        t2.value46.Position = UDim2.new(t2.value50.X.Scale, t2.value50.X.Offset + v187.X, t2.value50.Y.Scale, t2.value50.Y.Offset + v187.Y)
    end
end)
t2.value51 = Instance.new("TextLabel")
t2.value51.Size = UDim2.new(0.75, 0, 1, 0)
t2.value51.Position = UDim2.new(0.05, 0, 0, 0)
t2.value51.BackgroundTransparency = 1
t2.value51.Text = "CH | ETERNAL"
t2.value51.TextColor3 = t2.value12.ThemeColor
t2.value51.TextSize = 20
t2.value51.Font = Enum.Font.GothamBold
t2.value51.TextXAlignment = Enum.TextXAlignment.Left
t2.value51.Parent = Frame
t2.value52 = Instance.new("ScrollingFrame")
t2.value52.Size = UDim2.new(1, -20, 0, 40)
t2.value52.Position = UDim2.new(0, 10, 0, 60)
t2.value52.BackgroundTransparency = 1
t2.value52.BorderSizePixel = 0
t2.value52.ScrollBarThickness = 0
t2.value52.CanvasSize = UDim2.new(0, 0, 0, 0)
t2.value52.ScrollingDirection = Enum.ScrollingDirection.X
t2.value52.Parent = t2.value46
t2.value53 = Instance.new("UIListLayout")
t2.value53.FillDirection = Enum.FillDirection.Horizontal
t2.value53.HorizontalAlignment = Enum.HorizontalAlignment.Left
t2.value53.Padding = UDim.new(0, 10)
t2.value53.Parent = t2.value52
t2.value53:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    t2.value52.CanvasSize = UDim2.new(0, t2.value53.AbsoluteContentSize.X + 10, 0, 0)
end)
t2.value54 = Instance.new("Frame")
t2.value54.Size = UDim2.new(1, -20, 1, -120)
t2.value54.Position = UDim2.new(0, 10, 0, 110)
t2.value54.BackgroundTransparency = 1
t2.value54.Parent = t2.value46
local function v24(p14, p15, p16, p17, p18, p19)
    local Frame2 = Instance.new("Frame")
    Frame2.Size = UDim2.new(1, 0, 0, 92)
    Frame2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame2.BorderSizePixel = 0
    Frame2.Visible = false
    Frame2.Parent = p14
    Instance.new("UICorner", Frame2).CornerRadius = UDim.new(0, 8)
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(1, -20, 0, 24)
    TextLabel.Position = UDim2.new(0, 10, 0, 6)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = p15
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Parent = Frame2
    local Frame3 = Instance.new("Frame")
    Frame3.Size = UDim2.new(1, -20, 0, 48)
    Frame3.Position = UDim2.new(0, 10, 0, 35)
    Frame3.BackgroundTransparency = 1
    Frame3.Parent = Frame2
    local UIGridLayout = Instance.new("UIGridLayout")
    UIGridLayout.CellSize = UDim2.new(0, 72, 0, 22)
    UIGridLayout.CellPadding = UDim2.new(0, 7, 0, 7)
    UIGridLayout.Parent = Frame3
    local t13 = {}
    local function v199()
        local v312 = p17()

        for k, v in pairs(t13) do
            local v315 = k == v312

            if v315 then
                v315 = t2.value12.ThemeColor
            end

            if not v315 then
                v315 = Color3.fromRGB(35, 35, 35)
            end

            v.BackgroundColor3 = v315
        end
    end
    for v202, v203 in ipairs(p16) do

        local v204 = v203
        local TextButton = Instance.new("TextButton")

        TextButton.Text = v204
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.TextSize = 10
        TextButton.Font = Enum.Font.GothamBold
        TextButton.BorderSizePixel = 0
        TextButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TextButton.Parent = Frame3
        Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 6)
        t13[v204] = TextButton
        TextButton.MouseButton1Click:Connect(function()
            p18(v204)
            v199()
        end)
    end
    if p19 then
        t2.value13[p19] = function(p20)
            Frame2.Visible = p20 == true
        end
    end
    v199()

    return Frame2, v199
end
local function v25(p21)
    local TextButton = Instance.new("TextButton")
    local value10_3 = t2.value10

    if value10_3 then
        value10_3 = UDim2.new(0, 90, 1, 0)
    end

    if not value10_3 then
        value10_3 = UDim2.new(0, 110, 1, 0)
    end

    TextButton.Size = value10_3
    TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TextButton.Text = p21
    TextButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    TextButton.TextSize = not t2.value10 and 12 or 10
    TextButton.Font = Enum.Font.GothamBold
    TextButton.BorderSizePixel = 0
    TextButton.Parent = t2.value52
    Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 8)

    local ScrollingFrame = Instance.new("ScrollingFrame")

    ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.ScrollBarThickness = 4
    ScrollingFrame.ScrollBarImageColor3 = t2.value12.ThemeColor
    ScrollingFrame.Visible = false
    ScrollingFrame.Parent = t2.value54

    local UIListLayout = Instance.new("UIListLayout")

    UIListLayout.Padding = UDim.new(0, 10)
    UIListLayout.Parent = ScrollingFrame
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
    end)

    return TextButton, ScrollingFrame
end
local function v26(p22, p23, p24, p25, p26, p27, p28)
    local Frame4 = Instance.new("Frame")

    Frame4.Size = UDim2.new(1, 0, 0, 60)
    Frame4.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame4.BorderSizePixel = 0
    Frame4.Parent = p22
    Instance.new("UICorner", Frame4).CornerRadius = UDim.new(0, 8)

    local TextLabel = Instance.new("TextLabel")

    TextLabel.Size = UDim2.new(1, -20, 0, 20)
    TextLabel.Position = UDim2.new(0, 10, 0, 5)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = p23 .. ": " .. p26
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 13
    TextLabel.Font = Enum.Font.Gotham
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Parent = Frame4

    local Frame5 = Instance.new("Frame")

    Frame5.Size = UDim2.new(1, -20, 0, 6)
    Frame5.Position = UDim2.new(0, 10, 0, 35)
    Frame5.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame5.BorderSizePixel = 0
    Frame5.Parent = Frame4
    Instance.new("UICorner", Frame5).CornerRadius = UDim.new(1, 0)

    local Frame6 = Instance.new("Frame")

    Frame6.Size = UDim2.new((p26 - p24) / (p25 - p24), 0, 1, 0)
    Frame6.BackgroundColor3 = t2.value12.ThemeColor
    Frame6.Name = "SliderFill"
    Frame6.BorderSizePixel = 0
    Frame6.Parent = Frame5
    Instance.new("UICorner", Frame6).CornerRadius = UDim.new(1, 0)

    local TextButton = Instance.new("TextButton")

    TextButton.Size = UDim2.new(1, 0, 1, 0)
    TextButton.BackgroundTransparency = 1
    TextButton.Text = ""
    TextButton.Parent = Frame5
    TextButton.BorderSizePixel = 0

    local u223 = false

    local function v224(p29)
        local v318 = math.clamp(p29, p24, p25)

        Frame6.Size = UDim2.new((v318 - p24) / (p25 - p24), 0, 1, 0)
        TextLabel.Text = p23 .. ": " .. v318
        p28(v318)
    end

    if p27 then
        t2.value13[p27] = v224
    end

    TextButton.MouseButton1Down:Connect(function()
        u223 = true
    end)
    t2.value2.InputEnded:Connect(function(input)
        local v320 = input.UserInputType == Enum.UserInputType.MouseButton1

        if not v320 then
            v320 = input.UserInputType == Enum.UserInputType.Touch
        end

        if v320 then
            u223 = false
        end
    end)
    t2.value2.InputChanged:Connect(function(input)
        local v322 = u223

        if v322 then
            v322 = input.UserInputType == Enum.UserInputType.MouseMovement

            if not v322 then
                v322 = input.UserInputType == Enum.UserInputType.Touch
            end
        end

        if v322 then
            local v323 = math.clamp((input.Position.X - Frame5.AbsolutePosition.X) / Frame5.AbsoluteSize.X, 0, 1)

            v224((math.floor(p24 + (p25 - p24) * v323)))
        end
    end)

    return Frame4
end
local function v27(p30, p31, p32, p33)
    local Frame7 = Instance.new("Frame")

    Frame7.Size = UDim2.new(1, 0, 0, 50)
    Frame7.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame7.BorderSizePixel = 0
    Frame7.Parent = p30
    Instance.new("UICorner", Frame7).CornerRadius = UDim.new(0, 8)

    local TextLabel = Instance.new("TextLabel")

    TextLabel.Size = UDim2.new(1, -60, 0, 25)
    TextLabel.Position = UDim2.new(0, 10, 0, 5)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = p31
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Parent = Frame7

    local TextButton = Instance.new("TextButton")

    TextButton.Size = UDim2.new(0, 40, 0, 20)
    TextButton.Position = UDim2.new(1, -50, 0, 10)
    TextButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TextButton.Text = ""
    TextButton.BorderSizePixel = 0
    TextButton.Parent = Frame7
    Instance.new("UICorner", TextButton).CornerRadius = UDim.new(1, 0)

    local Frame8 = Instance.new("Frame")

    Frame8.Size = UDim2.new(0, 16, 0, 16)
    Frame8.Position = UDim2.new(0, 2, 0.5, -8)
    Frame8.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Frame8.BorderSizePixel = 0
    Frame8.Parent = TextButton
    Instance.new("UICorner", Frame8).CornerRadius = UDim.new(1, 0)

    local u233 = false

    local function v234(p34)
        u233 = p34

        local value1 = t2.value1
        local v326 = TextButton
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad)
        local v328 = u233

        if v328 then
            v328 = t2.value12.ThemeColor
        end

        if not v328 then
            v328 = Color3.fromRGB(40, 40, 40)
        end

        value1:Create(v326, tweenInfo, {
			BackgroundColor3 = v328
		}):Play()

        local value1_2 = t2.value1
        local v330 = Frame8
        local tweenInfo2 = TweenInfo.new(0.3, Enum.EasingStyle.Quad)
        local v332 = u233

        if v332 then
            v332 = UDim2.new(1, -18, 0.5, -8)
        end

        if not v332 then
            v332 = UDim2.new(0, 2, 0.5, -8)
        end

        value1_2:Create(v330, tweenInfo2, {
			Position = v332
		}):Play()
        p33(u233)
    end

    if p32 then
        t2.value13[p32] = v234
    end

    TextButton.MouseButton1Click:Connect(function()
        v234(not u233)
    end)

    return Frame7
end
local v28, v29 = v25("COMBATE")

t1.value1 = v28
t1.value2 = v29
t2.value55 = t1.value1
t2.value56 = t1.value2
local v30, v31 = v25("SPIN")

t1.value3 = v30
t1.value4 = v31
t2.value57 = t1.value3
t2.value58 = t1.value4
local v32, v33 = v25("MOVIMENTAÇÃO")

t1.value5 = v32
t1.value6 = v33
t2.value59 = t1.value5
t2.value60 = t1.value6
local v34, v35 = v25("EQUIPAMENTOS")

t1.value7 = v34
t1.value8 = v35
t2.value61 = t1.value7
t2.value62 = t1.value8
local v36, v37 = v25("CONFIG")

t1.value9 = v36
t1.value10 = v37
t2.value63 = t1.value9
t2.value64 = t1.value10
function t2.value65()
    for _, child in ipairs(t2.value6:GetChildren()) do
        if child.Name:match("^CLIENT_BALL_") then
            local v237 = child:FindFirstChild("Ball.001")

            if v237 then
                v237:Destroy()
            end
        end
    end
end
v27(t2.value56, "Hitbox", "hitboxEn", function(p35)
    t2.value12.HitboxEnabled = p35

    if not p35 then
        t2.value65()
    end
end)
v26(t2.value56, "Tamanho Hitbox", 1, 80, 1, "hitboxScale", function(p36)
    t2.value12.HitboxSize = p36
end)
v26(t2.value56, "Opacidade Hitbox (%)", 0, 100, 70, "hitboxOpacity", function(p37)
    t2.value12.HitboxTransparency = 1 - p37 / 100
end)

local Frame9 = Instance.new("Frame")

Frame9.Size = UDim2.new(1, 0, 0, 54)
Frame9.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame9.BorderSizePixel = 0
Frame9.Parent = t2.value56
Instance.new("UICorner", Frame9).CornerRadius = UDim.new(0, 8)

local TextLabel = Instance.new("TextLabel")

TextLabel.Size = UDim2.new(1, -95, 1, 0)
TextLabel.Position = UDim2.new(0, 10, 0, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "Tecla Hitbox"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.Parent = Frame9
t2.value66 = Instance.new("TextButton")
t2.value66.Size = UDim2.new(0, 70, 0, 28)
t2.value66.Position = UDim2.new(1, -82, 0.5, -14)
t2.value66.BackgroundColor3 = t2.value12.ThemeColor
t2.value66.Text = t2.value12.HitboxKey
t2.value66.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value66.TextSize = 13
t2.value66.Font = Enum.Font.GothamBold
t2.value66.BorderSizePixel = 0
t2.value66.Name = "ETERNALFREEThemeButton"
t2.value66.Parent = Frame9
Instance.new("UICorner", t2.value66).CornerRadius = UDim.new(0, 8)
t2.value67 = false
t2.value66.MouseButton1Click:Connect(function()
    t2.value67 = true
    t2.value66.Text = "..."
end)
t2.value2.InputBegan:Connect(function(input, _)
    if not t2.value67 then
        return
    end

    if input.UserInputType == Enum.UserInputType.Keyboard then
        t2.value12.HitboxKey = input.KeyCode.Name
        t2.value66.Text = t2.value12.HitboxKey
    end
end)

function t2.value13.hitboxKeyText(p39)
    local value12 = t2.value12
    local _tostring = tostring

    if not p39 then
        p39 = "H"
    end

    value12.HitboxKey = _tostring(p39)
    t2.value66.Text = t2.value12.HitboxKey
end
v27(t2.value56, "Hitbox TOUCH (Mobile)", "hitboxTouch", function(p40)
    t2.value12.HitboxTouch = p40

    if t2.value22 then
        t2.value22()
    end
end)
v27(t2.value58, "Auto Spin Style", "autoSpinStyle", function(p41)
    t2.value12.AutoSpinStyle = p41
end)
v27(t2.value58, "Auto Spin Habi", "autoSpinHabi", function(p42)
    t2.value12.AutoSpinHabi = p42
end)
v27(t2.value58, "YEN", "autoYen", function(p43)
    t2.value12.AutoYen = p43
end)
v27(t2.value60, "Pulo Direcional", "directionalJump", function(p44)
    t2.value12.CameraJump = p44
end)
v27(t2.value60, "ESP (Head Line)", "espEnabled", function(p45)
    t2.value12.ESPEnabled = p45
end)
v27(t2.value60, "ESP Neon", "espNeon", function(p46)
    t2.value12.ESPNeon = p46
end)
v26(t2.value60, "Tamanho Linha ESP", 1, 115, 10, "espLineSize", function(p47)
    t2.value12.ESPLineSize = p47
end)
v27(t2.value62, "JERSEY PADRÃO", "jerseyEnabled", function(p48)
    t2.value12.JerseyEnabled = p48

    if p48 then
        t2.value37("default")
    end

    t2.value36()
    t2.value35()
end)
v27(t2.value62, "JERSEY DRAGÃO", "jerseyDragaoEnabled", function(p49)
    t2.value12.JerseyDragaoEnabled = p49

    if p49 then
        t2.value37("dragao")
    end

    t2.value36()
    t2.value35()
end)

local v40, v41 = v24(t2.value62, "TIME DRAGÃO", {
	"PRETA",
	"LARANJA",
	"ROXO",
	"VERMELHO",
	"BRANCO"
}, function()
    return t2.value12.JerseyDragaoTeam
end, function(p50)
    t2.value12.JerseyDragaoTeam = p50
    t2.value35()
end, "dragaoTeamPanel")

t1.value11 = v40
t1.value12 = v41
t2.value68 = t1.value12
v27(t2.value62, "JERSEY PIJAMA", "jerseyPijamaEnabled", function(p51)
    t2.value12.JerseyPijamaEnabled = p51

    if p51 then
        t2.value37("pijama")
    end

    t2.value36()
    t2.value35()
end)

local _, v43 = v24(t2.value62, "TIME PIJAMA", {
	"PRETO",
	"ORANGE",
	"ROXO",
	"VERMELHO",
	"BRANCO"
}, function()
    return t2.value12.JerseyPijamaTeam
end, function(p52)
    t2.value12.JerseyPijamaTeam = p52
    t2.value35()
end, "pijamaTeamPanel")

t2.value69 = v43
t2.value36()
function t2.value22()
    if t2.value19 then
        t2.value19.Visible = t2.value12.HitboxTouch == true

        local value19 = t2.value19
        local HitboxEnabled = t2.value12.HitboxEnabled

        if HitboxEnabled then
            HitboxEnabled = t2.value12.ThemeColor
        end

        if not HitboxEnabled then
            HitboxEnabled = Color3.fromRGB(20, 20, 20)
        end

        value19.BackgroundColor3 = HitboxEnabled
        t2.value19.Text = not t2.value12.HitboxEnabled and "HIT OFF" or "HIT ON"

        if t2.value20 then
            t2.value20.Color = t2.value12.ThemeColor
        end
    end
end
t2.value19 = Instance.new("TextButton")
t2.value19.Name = "ETERNALFREEHitboxTouchBtn"
t2.value19.Size = UDim2.new(0, 82, 0, 34)
t2.value19.Position = UDim2.new(1, -96, 0.62, 0)
t2.value19.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
t2.value19.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value19.TextSize = 11
t2.value19.Font = Enum.Font.GothamBold
t2.value19.Text = "HIT OFF"
t2.value19.Visible = false
t2.value19.BorderSizePixel = 0
t2.value19.Parent = t2.value38
Instance.new("UICorner", t2.value19).CornerRadius = UDim.new(0, 10)
t2.value20 = Instance.new("UIStroke")
t2.value20.Thickness = 2
t2.value20.Color = t2.value12.ThemeColor
t2.value20.Parent = t2.value19
t2.value19.MouseButton1Click:Connect(function()
    t2.value12.HitboxEnabled = not t2.value12.HitboxEnabled

    if not t2.value12.HitboxEnabled then
        t2.value65()
    end

    if t2.value13.hitboxEn then
        t2.value13.hitboxEn(t2.value12.HitboxEnabled)
    end

    t2.value22()
end)

local Frame10 = Instance.new("Frame")

Frame10.Size = UDim2.new(1, 0, 0, 130)
Frame10.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame10.BorderSizePixel = 0
Frame10.Parent = t2.value64
Instance.new("UICorner", Frame10).CornerRadius = UDim.new(0, 8)

local TextLabel2 = Instance.new("TextLabel")

TextLabel2.Size = UDim2.new(1, -20, 0, 25)
TextLabel2.Position = UDim2.new(0, 10, 0, 5)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Text = "Cor da Interface"
TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel2.TextSize = 14
TextLabel2.Font = Enum.Font.GothamBold
TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
TextLabel2.Parent = Frame10
local color3 = Color3.fromRGB(138, 43, 226)
local t14 = {
	name = "Roxo",
	color = color3
}
local color3_2 = Color3.fromRGB(0, 150, 255)
local t15 = {
	name = "Azul",
	color = color3_2
}
local color3_3 = Color3.fromRGB(0, 255, 100)
local t16 = {
	name = "Verde",
	color = color3_3
}
local color3_4 = Color3.fromRGB(255, 50, 50)
local t17 = {
	name = "Vermelho",
	color = color3_4
}
local color3_5 = Color3.fromRGB(255, 105, 180)
local t18 = {
	name = "Rosa",
	color = color3_5
}
local color3_6 = Color3.fromRGB(255, 140, 0)
local t19 = {
	name = "Laranja",
	color = color3_6
}
local color3_7 = Color3.fromRGB(0, 255, 255)
local t20 = {
	name = "Ciano",
	color = color3_7
}
local color3_8 = Color3.fromRGB(255, 255, 0)
local t21 = {
	name = "Amarelo",
	color = color3_8
}
local color3_9 = Color3.fromRGB(30, 30, 30)
local t22 = {
	name = "Preto",
	color = color3_9
}
local color3_10 = Color3.fromRGB(255, 255, 255)
local t23 = {
	name = "Branco",
	color = color3_10
}
local Frame11 = Instance.new("Frame")

Frame11.Size = UDim2.new(1, -20, 0, 80)
Frame11.Position = UDim2.new(0, 10, 0, 35)
Frame11.BackgroundTransparency = 1
Frame11.Parent = Frame10
local UIGridLayout = Instance.new("UIGridLayout")

UIGridLayout.CellSize = UDim2.new(0, 95, 0, 30)
UIGridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
UIGridLayout.Parent = Frame11
local function v68()
    t2.value47.Color = t2.value12.ThemeColor
    t2.value51.TextColor3 = t2.value12.ThemeColor
    if t2.value40 then
        t2.value40.Color = t2.value12.ThemeColor
    end
    if t2.value17 then
        t2.value17.BackgroundColor3 = t2.value12.ThemeColor
    end
    if t2.value18 then
        t2.value18.Color = t2.value12.ThemeColor
    end
    if t2.value20 then
        t2.value20.Color = t2.value12.ThemeColor
    end
    for v263, v264 in ipairs(t2.value38:GetDescendants()) do

        if v264:IsA("ScrollingFrame") then
            v264.ScrollBarImageColor3 = t2.value12.ThemeColor
        end

        local v265 = v264.Name == "ETERNALFREEThemeButton"

        if v265 then
            v265 = v264:IsA("TextButton")
        end

        if v265 then
            v264.BackgroundColor3 = t2.value12.ThemeColor
        end
    end
    for v268, v269 in pairs(t2.value54:GetChildren()) do

        local GetChildren = v269.GetChildren

        for _, v in pairs(GetChildren(v269)) do

            for v275, v276 in pairs(v:GetDescendants()) do

                local v277 = v276.Name == "SliderFill"

                if v277 then
                    v277 = v276:IsA("Frame")
                end

                if v277 then
                    v276.BackgroundColor3 = t2.value12.ThemeColor
                end
            end
            local ToggleButton = v:FindFirstChild("ToggleButton")
            local v279 = ToggleButton
            if ToggleButton then
                v279 = ToggleButton:IsA("TextButton")

                if v279 then
                    v279 = ToggleButton.BackgroundColor3 ~= Color3.fromRGB(40, 40, 40)
                end
            end
            if v279 then
                ToggleButton.BackgroundColor3 = t2.value12.ThemeColor
            end
        end
    end
    if t2.value56.Visible then
        t2.value55.BackgroundColor3 = t2.value12.ThemeColor
    end
    if t2.value58.Visible then
        t2.value57.BackgroundColor3 = t2.value12.ThemeColor
    end
    if t2.value60.Visible then
        t2.value59.BackgroundColor3 = t2.value12.ThemeColor
    end
    if t2.value62.Visible then
        t2.value61.BackgroundColor3 = t2.value12.ThemeColor
    end
    if t2.value64.Visible then
        t2.value63.BackgroundColor3 = t2.value12.ThemeColor
    end
end
for _, v in pairs({
	t14,
	t15,
	t16,
	t17,
	t18,
	t19,
	t20,
	t21,
	t22,
	t23
}) do
    local v71 = v
    local TextButton = Instance.new("TextButton")

    TextButton.BackgroundColor3 = v71.color
    TextButton.Text = v71.name
    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.TextSize = 12
    TextButton.Font = Enum.Font.GothamBold
    TextButton.BorderSizePixel = 0
    TextButton.Parent = Frame11
    Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 6)
    TextButton.MouseButton1Click:Connect(function()
        t2.value12.ThemeColor = v71.color
        v68()
    end)
end
local Frame12 = Instance.new("Frame")

Frame12.Size = UDim2.new(1, 0, 0, 48)
Frame12.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame12.BorderSizePixel = 0
Frame12.Parent = t2.value64
Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 8)
t2.value17 = Instance.new("TextButton")
t2.value17.Size = UDim2.new(1, -20, 0, 32)
t2.value17.Position = UDim2.new(0, 10, 0, 8)
t2.value17.BackgroundColor3 = t2.value12.ThemeColor
t2.value17.Text = "💾  Salvar Configurações"
t2.value17.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value17.TextSize = 13
t2.value17.Font = Enum.Font.GothamBold
t2.value17.BorderSizePixel = 0
t2.value17.Parent = Frame12
Instance.new("UICorner", t2.value17).CornerRadius = UDim.new(0, 8)
t2.value17.MouseButton1Click:Connect(function()
    local v280 = v7()

    t2.value17.Text = not v280 and "ERRO ❌" or "SALVO ✅"
    task.delay(1.2, function()
        local value17 = t2.value17

        if value17 then
            value17 = t2.value17.Parent
        end

        if value17 then
            t2.value17.Text = "💾  Salvar Configurações"
        end
    end)

    if t2.value21 then
        t2.value21(not v280 and "❌ Erro ao salvar!" or "✅ Config salva!")
    end
end)
t2.value70 = "https://discord.gg/FFzXFVqT54"
local Frame13 = Instance.new("Frame")

Frame13.Size = UDim2.new(1, 0, 0, 42)
Frame13.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame13.BorderSizePixel = 0
Frame13.Parent = t2.value64
Instance.new("UICorner", Frame13).CornerRadius = UDim.new(0, 8)

local TextButton = Instance.new("TextButton")

TextButton.Size = UDim2.new(1, -20, 0, 28)
TextButton.Position = UDim2.new(0, 10, 0.5, -14)
TextButton.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
TextButton.Text = "🔗 " .. t2.value70
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 12
TextButton.Font = Enum.Font.GothamBold
TextButton.TextXAlignment = Enum.TextXAlignment.Center
TextButton.BorderSizePixel = 0
TextButton.Parent = Frame13
Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 8)
t2.value18 = Instance.new("UIStroke")
t2.value18.Thickness = 2
t2.value18.Color = t2.value12.ThemeColor
t2.value18.Parent = TextButton
TextButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(t2.value70)

        if t2.value21 then
            t2.value21("✅ Link do Discord copiado!")

            return
        end
    elseif t2.value21 then
        t2.value21("⚠\239\184\143 Executor sem setclipboard")
    end
end)

function t2.value71(p53, p54)

    for v285, v286 in pairs(t2.value52:GetChildren()) do

        if v286:IsA("TextButton") then
            v286.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        end
    end
    for _, child in pairs(t2.value54:GetChildren()) do
        if child:IsA("ScrollingFrame") then
            child.Visible = false
        end
    end
    p53.BackgroundColor3 = t2.value12.ThemeColor
    p54.Visible = true
end
t2.value55.MouseButton1Click:Connect(function()
    t2.value71(t2.value55, t2.value56)
end)
t2.value57.MouseButton1Click:Connect(function()
    t2.value71(t2.value57, t2.value58)
end)
t2.value59.MouseButton1Click:Connect(function()
    t2.value71(t2.value59, t2.value60)
end)
t2.value61.MouseButton1Click:Connect(function()
    t2.value71(t2.value61, t2.value62)
end)
t2.value63.MouseButton1Click:Connect(function()
    t2.value71(t2.value63, t2.value64)
end)
t2.value56.Visible = true
t2.value55.BackgroundColor3 = t2.value12.ThemeColor
function ToggleUI()
    t2.value12.Enabled = not t2.value12.Enabled

    if t2.value12.Enabled then
        t2.value46.Visible = true

        local value10_4 = t2.value10

        if value10_4 then
            value10_4 = UDim2.new(0, 340, 0, 280)
        end

        if not value10_4 then
            value10_4 = UDim2.new(0, 450, 0, 350)
        end

        t2.value46.Size = UDim2.new(0, 0, 0, 0)
        t2.value1:Create(t2.value46, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Size = value10_4
		}):Play()

        return
    end

    local v290 = t2.value1:Create(t2.value46, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		Size = UDim2.new(0, 0, 0, 0)
	})

    v290:Play()
    v290.Completed:Wait()
    t2.value46.Visible = false
end
t2.value39.MouseButton1Click:Connect(function()
    ToggleUI()
end)
task.spawn(function()
    while task.wait(0.5) do
        local AutoSpinStyle = t2.value12.AutoSpinStyle

        if not AutoSpinStyle then
            AutoSpinStyle = t2.value12.AutoSpinHabi

            if not AutoSpinStyle then
                AutoSpinStyle = t2.value12.AutoYen
            end
        end

        if AutoSpinStyle then
            pcall(function()
                local t24 = {}

                if t2.value12.AutoSpinStyle then
                    table.insert(t24, 1)
                end

                if t2.value12.AutoSpinHabi then
                    table.insert(t24, 4)
                end

                if t2.value12.AutoYen then
                    table.insert(t24, 2)
                end

                for _, v in pairs(t24) do
                    local Packages = t2.value5:FindFirstChild("Packages")

                    if Packages then
                        local _Index = Packages:FindFirstChild("_Index")

                        if _Index then
                            local v339 = _Index:FindFirstChild("sleitnick_knit@1.7.0")

                            if v339 then
                                local knit = v339:FindFirstChild("knit")

                                if knit then
                                    local Services = knit:FindFirstChild("Services")

                                    if Services then
                                        local SeasonService = Services:FindFirstChild("SeasonService")

                                        if SeasonService then
                                            local RF = SeasonService:FindFirstChild("RF")

                                            if RF then
                                                local RequestRankedReward = RF:FindFirstChild("RequestRankedReward")

                                                if RequestRankedReward then
                                                    RequestRankedReward:InvokeServer(v)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
t2.value2.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end

    if t2.value2:GetFocusedTextBox() then
        return
    end

    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode.Name == t2.value12.HitboxKey then
        t2.value12.HitboxEnabled = not t2.value12.HitboxEnabled

        if not t2.value12.HitboxEnabled then
            t2.value65()
        end

        if t2.value13.hitboxEn then
            t2.value13.hitboxEn(t2.value12.HitboxEnabled)
        end

        t2.value22()
    end
end)

function t2.value21(p55)
    local Frame14 = Instance.new("Frame")

    Frame14.Size = UDim2.new(0, 300, 0, 60)
    Frame14.Position = UDim2.new(0.5, -150, 0, -80)
    Frame14.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame14.BorderSizePixel = 0
    Frame14.Parent = t2.value38
    Instance.new("UICorner", Frame14).CornerRadius = UDim.new(0, 10)

    local UIStroke = Instance.new("UIStroke")

    UIStroke.Color = t2.value12.ThemeColor
    UIStroke.Thickness = 2
    UIStroke.Parent = Frame14

    local TextLabel3 = Instance.new("TextLabel")

    TextLabel3.Size = UDim2.new(1, -20, 1, 0)
    TextLabel3.Position = UDim2.new(0, 10, 0, 0)
    TextLabel3.BackgroundTransparency = 1
    TextLabel3.Text = p55
    TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel3.TextSize = 14
    TextLabel3.Font = Enum.Font.Gotham
    TextLabel3.Parent = Frame14
    t2.value1:Create(Frame14, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, -150, 0, 20)
	}):Play()
    task.wait(3)

    local v298 = t2.value1:Create(Frame14, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		Position = UDim2.new(0.5, -150, 0, -80)
	})

    v298:Play()
    v298.Completed:Wait()
    Frame14:Destroy()
end
task.wait(1);
(function()
    local _isfile = isfile

    if _isfile then
        _isfile = readfile and isfile(t2.value11)
    end

    if _isfile then
        local ok, result = pcall(function()
            return readfile(t2.value11)
        end)
        local v114 = result

        if ok then
            ok = v114

            if ok then
                ok = v114 ~= ""
            end
        end

        if ok then
            local ok2, result2 = pcall(function()
                return t2.value7:JSONDecode(v114)
            end)

            if ok2 then
                ok2 = type(result2) == "table"
            end

            if ok2 then
                if result2.ThemeColor then
                    t2.value12.ThemeColor = t2.value24(result2.ThemeColor)
                end

                t2.value12.HitboxEnabled = t2.value25(result2.HitboxEnabled, t2.value12.HitboxEnabled)
                t2.value12.HitboxSize = t2.value26(result2.HitboxSize, t2.value12.HitboxSize)
                t2.value12.HitboxTransparency = t2.value26(result2.HitboxTransparency, t2.value12.HitboxTransparency)

                if result2.HitboxKey ~= nil then
                    t2.value12.HitboxKey = tostring(result2.HitboxKey)
                end

                t2.value12.HitboxTouch = t2.value25(result2.HitboxTouch, t2.value12.HitboxTouch)
                t2.value12.CameraJump = t2.value25(result2.CameraJump, t2.value12.CameraJump)
                t2.value12.ESPEnabled = t2.value25(result2.ESPEnabled, t2.value12.ESPEnabled)
                t2.value12.ESPLineSize = t2.value26(result2.ESPLineSize, t2.value12.ESPLineSize)
                t2.value12.ESPNeon = t2.value25(result2.ESPNeon, t2.value12.ESPNeon)
                t2.value12.AutoSpinStyle = t2.value25(result2.AutoSpinStyle, t2.value12.AutoSpinStyle)
                t2.value12.AutoSpinHabi = t2.value25(result2.AutoSpinHabi, t2.value12.AutoSpinHabi)
                t2.value12.AutoYen = t2.value25(result2.AutoYen, t2.value12.AutoYen)
                t2.value12.JerseyEnabled = t2.value25(result2.JerseyEnabled, t2.value12.JerseyEnabled)
                t2.value12.JerseyDragaoEnabled = t2.value25(result2.JerseyDragaoEnabled, t2.value12.JerseyDragaoEnabled)
                t2.value12.JerseyPijamaEnabled = t2.value25(result2.JerseyPijamaEnabled, t2.value12.JerseyPijamaEnabled)

                if result2.JerseyDragaoTeam ~= nil then
                    t2.value12.JerseyDragaoTeam = tostring(result2.JerseyDragaoTeam)
                end

                if result2.JerseyPijamaTeam ~= nil then
                    t2.value12.JerseyPijamaTeam = tostring(result2.JerseyPijamaTeam)
                end
            end
        end
    end
end)();
(function()
    if t2.value13.hitboxEn then
        t2.value13.hitboxEn(t2.value12.HitboxEnabled)
    end

    if t2.value13.hitboxScale then
        t2.value13.hitboxScale(t2.value12.HitboxSize)
    end

    if t2.value13.hitboxOpacity then
        t2.value13.hitboxOpacity((math.floor((1 - t2.value12.HitboxTransparency) * 100)))
    end

    if t2.value13.hitboxKeyText then
        t2.value13.hitboxKeyText(t2.value12.HitboxKey)
    end

    if t2.value13.hitboxTouch then
        t2.value13.hitboxTouch(t2.value12.HitboxTouch)
    end

    if t2.value13.directionalJump then
        t2.value13.directionalJump(t2.value12.CameraJump)
    end

    if t2.value13.espEnabled then
        t2.value13.espEnabled(t2.value12.ESPEnabled)
    end

    if t2.value13.espNeon then
        t2.value13.espNeon(t2.value12.ESPNeon)
    end

    if t2.value13.espLineSize then
        t2.value13.espLineSize(t2.value12.ESPLineSize)
    end

    if t2.value13.autoSpinStyle then
        t2.value13.autoSpinStyle(t2.value12.AutoSpinStyle)
    end

    if t2.value13.autoSpinHabi then
        t2.value13.autoSpinHabi(t2.value12.AutoSpinHabi)
    end

    if t2.value13.autoYen then
        t2.value13.autoYen(t2.value12.AutoYen)
    end

    if t2.value13.jerseyEnabled then
        t2.value13.jerseyEnabled(t2.value12.JerseyEnabled)
    end

    if t2.value13.jerseyDragaoEnabled then
        t2.value13.jerseyDragaoEnabled(t2.value12.JerseyDragaoEnabled)
    end

    if t2.value13.jerseyPijamaEnabled then
        t2.value13.jerseyPijamaEnabled(t2.value12.JerseyPijamaEnabled)
    end

    if t2.value68 then
        t2.value68()
    end

    if t2.value69 then
        t2.value69()
    end

    if t2.value36 then
        t2.value36()
    end

    if t2.value22 then
        t2.value22()
    end

    if t2.value35 then
        t2.value35()
    end
end)()
t2.value21("✅ CH | ETERNAL | BY: Damon")
print("✅ CH | ETERNAL HUB - Carregado com sucesso.")
