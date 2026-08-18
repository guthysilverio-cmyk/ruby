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
t2.value7 = game:GetService("Lighting")
t2.value8 = game:GetService("HttpService")
t2.value9 = game:GetService("RbxAnalyticsService")
local KeyAuthAppName = "Parker's Application"
local KeyAuthOwnerId = "rmurOrJGpo"
local KeyAuthVersion = "1.1"
t2.value10 = "https://prod.keyauth.com/api/1.1/"
t2.value11 = nil
t2.value12 = "ETERNALHWID.txt"
function t2.value13(p1)
    if isfile and (readfile and isfile(p1)) then
        local ok, result = pcall(function()
            return readfile(p1)
        end)

        if ok and result then
            return tostring(result):gsub("%s+", "")
        end
    end

    return nil
end
function t2.value14(p2, p3)
    if writefile then
        pcall(function()
            local _writefile = writefile
            local v643 = p2
            local t3 = { (tostring(p3 or "")) }

            _writefile(v643, v3(t3))
        end)
    end
end
function t2.value15(p4)
    if delfile and (isfile and isfile(p4)) then
        pcall(function()
            delfile(p4)
        end)
    end
end
local function v4()
    local v156 = t2.value13(t2.value12)
    if v156 and v156 ~= "" then
        return v156
    end
    local ClientId
    pcall(function()
        ClientId = t2.value9:GetClientId()
    end)
    if not ClientId or tostring(ClientId) == "" then
        ClientId = "ETERNAL-" .. tostring(game:GetService("Players").LocalPlayer.UserId)
    end
    ClientId = tostring(ClientId):gsub("%s+", "")
    local value12 = t2.value12
    local v159 = ClientId
    t2.value14(value12, v159)

    return ClientId
end
function t2.value16()
    local _request = request

    if not _request then
        _request = http_request

        if not _request then
            _request = syn and syn.request or fluxus and fluxus.request
        end
    end

    return _request
end
function t2.value17(p5)
    local key = tostring(p5 or ""):gsub("%s+", "")

    if key == "" then
        return false, "INVALID"
    end

    local ok, accepted, status = pcall(function()
        local base = t2.value10
        local app = t2.value8:UrlEncode(KeyAuthAppName)
        local owner = t2.value8:UrlEncode(KeyAuthOwnerId)
        local version = t2.value8:UrlEncode(KeyAuthVersion)
        local function httpGet(url)
            local executorRequest = t2.value16()

            if executorRequest then
                local response = executorRequest({
                    Url = url,
                    Method = "GET"
                })
                local statusCode = tonumber(response and (response.StatusCode or response.status_code))

                if statusCode and statusCode >= 400 then
                    return nil, "HTTP_" .. tostring(statusCode)
                end

                return tostring(response and (response.Body or response.body) or ""), nil
            end

            return game:HttpGet(url), nil
        end

        local initUrl = base .. "?name=" .. app .. "&ownerid=" .. owner .. "&type=init&ver=" .. version
        local initBody, initError = httpGet(initUrl)

        if not initBody or initBody == "" then
            return false, initError or "API_ERROR"
        end

        local initDecodeOk, initData = pcall(function()
            return t2.value8:JSONDecode(initBody)
        end)

        if not initDecodeOk or initBody == "KeyAuth_Invalid" or type(initData) ~= "table" or initData.success ~= true then
            return false, tostring(initData and initData.message or initError or "API_ERROR")
        end

        local licenseUrl = base .. "?name=" .. app .. "&ownerid=" .. owner .. "&type=license&key=" .. t2.value8:UrlEncode(key) .. "&ver=" .. version .. "&sessionid=" .. t2.value8:UrlEncode(tostring(initData.sessionid or ""))
        local licenseBody, licenseError = httpGet(licenseUrl)

        if not licenseBody or licenseBody == "" then
            return false, licenseError or "API_ERROR"
        end

        local licenseDecodeOk, licenseData = pcall(function()
            return t2.value8:JSONDecode(licenseBody)
        end)

        if not licenseDecodeOk then
            return false, licenseError or "API_ERROR"
        end

        if type(licenseData) == "table" and licenseData.success == true then
            return true, "VALID"
        end

        return false, tostring(licenseData and licenseData.message or "INVALID")
    end)

    if not ok then
        return false, "API_ERROR"
    end

    return accepted == true, tostring(status or "INVALID")
end
function t2.value18(p6)
    local raw = tostring(p6 or "ERRO")
    local lower = raw:lower()

    if #raw > 80 or lower:find("<html", 1, true) or lower:find("<div", 1, true) or lower:find("replit", 1, true) then
        return "ERRO NA API"
    end

    local v148 = ({
			VALID = "KEY CORRETA",
			INVALID = "KEY INVALIDA",
			EXPIRED = "KEY EXPIRADA",
			EXPIRED_KEY = "KEY EXPIRADA",
			HWID_MISMATCH = "RESETAR HWID",
			HWID_BANNED = "HWID BANIDO",
			KEY_BANNED = "KEY BANIDA",
			USER_BANNED = "USUARIO BANIDO",
			API_ERROR = "ERRO NA API",
			NO_REQUEST = "EXECUTOR SEM REQUEST",
			HTTP_403 = "API BLOQUEOU A REQUISICAO",
			HTTP_429 = "MUITAS TENTATIVAS, AGUARDE",
			HTTP_500 = "API INDISPONIVEL",
			invalidver = "VERSAO INVALIDA"
		})[raw]

    if not v148 and (lower:find("invalid", 1, true) or lower:find("license", 1, true) or lower:find("key", 1, true)) then
        return "KEY INVALIDA"
    end

    return v148 or raw
end
t2.value19 = false
local v5 = t2.value13("ETERNALKey.txt")

t2.value20 = Instance.new("ScreenGui")
t2.value20.Name = "ETERNALHUBKeySystem"
t2.value20.ResetOnSpawn = false
pcall(function()
    t2.value20.Parent = game:GetService("CoreGui")
end)

if not t2.value20.Parent then
    t2.value20.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end
local Frame = Instance.new("Frame")

Frame.Size = UDim2.new(0, 380, 0, 220)
Frame.Position = UDim2.new(0.5, -190, 0.5, -110)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = t2.value20
local UICorner = Instance.new("UICorner")

UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = Frame
local UIStroke = Instance.new("UIStroke")

UIStroke.Color = Color3.fromRGB(138, 43, 226)
UIStroke.Thickness = 2
UIStroke.Parent = Frame
local TextLabel = Instance.new("TextLabel")

TextLabel.Size = UDim2.new(1, -40, 0, 42)
TextLabel.Position = UDim2.new(0, 20, 0, 12)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "RUBY"
TextLabel.TextColor3 = Color3.fromRGB(190, 110, 255)
TextLabel.TextSize = 24
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextXAlignment = Enum.TextXAlignment.Center
TextLabel.Parent = Frame
t2.value21 = Instance.new("TextBox")
t2.value21.Size = UDim2.new(1, -50, 0, 46)
t2.value21.Position = UDim2.new(0, 25, 0, 68)
t2.value21.PlaceholderText = "Digite sua licença KeyAuth"
t2.value21.Text = ""
t2.value21.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value21.PlaceholderColor3 = Color3.fromRGB(160, 160, 160)
t2.value21.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
t2.value21.BorderSizePixel = 0
t2.value21.ClearTextOnFocus = false
t2.value21.Font = Enum.Font.Gotham
t2.value21.TextSize = 15
t2.value21.Parent = Frame
local UICorner2 = Instance.new("UICorner")

UICorner2.CornerRadius = UDim.new(0, 10)
UICorner2.Parent = t2.value21
t2.value22 = Instance.new("TextButton")
t2.value22.Size = UDim2.new(1, -50, 0, 46)
t2.value22.Position = UDim2.new(0, 25, 0, 126)
t2.value22.Text = "ATIVAR LICENÇA"
t2.value22.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
t2.value22.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value22.BorderSizePixel = 0
t2.value22.Font = Enum.Font.GothamBold
t2.value22.TextSize = 14
t2.value22.TextWrapped = true
t2.value22.Parent = Frame
local UICorner3 = Instance.new("UICorner")

UICorner3.CornerRadius = UDim.new(0, 10)
UICorner3.Parent = t2.value22
local TextLabel2 = Instance.new("TextLabel")

TextLabel2.Size = UDim2.new(1, -50, 0, 28)
TextLabel2.Position = UDim2.new(0, 25, 0, 184)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Text = "A licença é validada com segurança pelo KeyAuth"
TextLabel2.TextColor3 = Color3.fromRGB(170, 170, 170)
TextLabel2.TextSize = 12
TextLabel2.Font = Enum.Font.Gotham
TextLabel2.TextXAlignment = Enum.TextXAlignment.Center
TextLabel2.TextWrapped = true
TextLabel2.Parent = Frame
if v5 and v5 ~= "" then
    t2.value22.Text = "AUTO LOGIN..."
    t1.value2 = { t2.value17(v5) }
    t1.value1 = t1.value2[2]

    if t1.value2[1] then
        t2.value19 = true
        t2.value20:Destroy()
        print("ETERNAL HUB: AUTO LOGIN")
    else
        t2.value15(t2.value11)
        t1.value2 = t2.value22

        local v13 = t2.value18(t1.value1)

        t1.value2.Text = v13
    end
end
t2.value22.MouseButton1Click:Connect(function()
    local v174 = t2.value21.Text:gsub("%s+", "")
    t2.value22.Text = "VERIFICANDO..."
    local t5, v176 = t2.value17(v174)
    if t5 then
        t2.value14(t2.value11, v174)
        t2.value19 = true
        t2.value22.Text = "KEY CORRETA"
        task.wait(0.8)
        t2.value20:Destroy()

        return
    end
    t2.value22.Text = t2.value18(v176)
    t2.value15(t2.value11)
end)

local _ = t2.value19
repeat
    task.wait()
until t2.value19;
(function()
    if getfenv then
        local v177 = getfenv()

        v177.script = nil

        function v177.getfenv()
            return v177
        end
    end

    if hookfunction then
        local IsDescendantOf = game.IsDescendantOf

        hookfunction(game.IsDescendantOf, function(p7, p8)
            if p7 == script and p8 == game:GetService("Workspace") then
                return false
            end

            return IsDescendantOf(p7, p8)
        end)
    end

    if rconsoleprint then
        hookfunction(rconsoleprint, function()
        end)
    end

    local _print = print

    function print(...)
        local t6 = { ... }

        for i, v in ipairs(t6) do
            if type(v) == "string" and v:match("script") or v:match("exploit") then
                t6[i] = "[REDACTED]"
            end
        end

        return _print(table.unpack(t6))
    end
end)()
t2.value23 = t2.value4.LocalPlayer
local PlayerGui = t2.value23:WaitForChild("PlayerGui")

t2.value24 = workspace.CurrentCamera
t2.value25 = t2.value2.TouchEnabled and not t2.value2.KeyboardEnabled
local v16 = if not t2.value25 then not t2.value25 and 60 or 45 else not t2.value25 and 60 or 45
t2.value26 = {}
t2.value26.Enabled = false
t2.value26.HitboxEnabled = false
t2.value26.HitboxSize = 1
t2.value26.HitboxTransparency = 0.3
t2.value26.HitboxKey = "H"
t2.value26.HitboxTouch = false
t2.value26.CameraJump = false
t2.value26.FreezeAir = false
t2.value26.FreezeAirKey = Enum.KeyCode.F
t2.value26.FreezeTouch = false
t2.value26.LeedFeat = false
t2.value26.LeedFeatKey = Enum.KeyCode.G
t2.value26.LeedFeatTouch = false
t2.value26.AutoLong = false
t2.value26.AutoLongKey = Enum.KeyCode.L
t2.value26.AutoLongAngle = 15
t2.value26.AutoLongDir = "DIREITA"
t2.value26.AutoLongTouch = false
t2.value26.RainbowTag = false
t2.value26.CustomTagName = ""
t2.value26.ESPEnabled = false
t2.value26.ESPLineSize = 10
t2.value26.AutoSpinStyle = false
t2.value26.AutoSpinHabi = false
t2.value26.AutoYen = false
t2.value26.InterfaceMode = not t2.value25 and "PC" or "ANTIGA"
t2.value26.JerseyEnabled = false
t2.value26.JerseyAtomicEnabled = false
t2.value26.JerseyDragaoEnabled = false
t2.value26.JerseyDragaoTeam = "PRETA"
t2.value26.JerseyAtomicTeam = "PRETA"
t2.value26.JerseyPijamaEnabled = false
t2.value26.JerseyPijamaTeam = "PRETO"
t2.value26.ESPNeon = false
local value26 = t2.value26
t1.value1 = Color3.fromRGB
t1.value2 = t1.value1(138, 43, 226)
value26.ThemeColor = t1.value2
t2.value26.FPSBoost = false
t2.value26.NightMode = false
t2.value26.GrayFloor = false
t2.value26.NoShadows = false
t2.value26.CrosshairEnabled = false
t2.value26.CrosshairStyle = "CRUZ"
t2.value26.CrosshairY = 50
t2.value27 = {}
t2.value28 = {}
t2.value29 = nil
t2.value30 = nil
t2.value31 = nil
t2.value32 = nil
t2.value33 = nil
t2.value34 = {}
t2.value35 = nil
t2.value36 = nil
t2.value37 = nil
t2.value38 = nil
t2.value39 = nil
t2.value40 = nil
t2.value41 = nil
t2.value42 = nil
t2.value43 = nil
t2.value44 = nil
t2.value45 = false
t2.value46 = false
t2.value47 = nil
t2.value48 = nil
t2.value49 = nil
t2.value50 = nil
t2.value51 = nil
t2.value52 = nil
t2.value53 = nil
t2.value54 = false
t2.value55 = nil
t2.value56 = nil
t2.value57 = nil
t2.value58 = nil
t2.value59 = nil
t2.value60 = {
	"ETERNALHUBConfig_V2.json",
	"ETERNALHUBConfig.json",
	"ETERNALHUBConfig_V2.json"
}
function t2.value61(p9)
    local R = p9.R
    local G = p9.G
    local B = p9.B

    return {
		r = R,
		g = G,
		b = B
	}
end
local function v18(p10)
    if type(p10) == "table" and (p10.r and (p10.g and p10.b)) then
        return Color3.new(p10.r, p10.g, p10.b)
    end

    return Color3.fromRGB(138, 43, 226)
end
function t2.value62(p11)
    if typeof(p11) == "EnumItem" then
        return p11.Name
    end

    local _tostring = tostring

    if not p11 then
        p11 = "F"
    end

    return _tostring(p11)
end
function t2.value63(p12, p13)
    if p12 == nil then
        return p13 == true
    end

    return p12 == true
end
function t2.value64(p14, p15)
    local num = tonumber(p14)

    if num == nil then
        return p15
    end

    return num
end
t2.value65 = nil
function t2.value65(p16)
    if t2.value25 then
        return "ANTIGA"
    end

    if p16 == "PC" or p16 == "ANTIGA" then
        return p16
    end

    return "PC"
end
function t2.value66()
    local HitboxEnabled = t2.value26.HitboxEnabled
    local HitboxSize = t2.value26.HitboxSize
    local HitboxTransparency = t2.value26.HitboxTransparency
    local str = tostring(t2.value26.HitboxKey or "H")
    local HitboxTouch = t2.value26.HitboxTouch
    local FreezeAir = t2.value26.FreezeAir
    local v199 = t2.value62(t2.value26.FreezeAirKey)
    local FreezeTouch = t2.value26.FreezeTouch
    local LeedFeat = t2.value26.LeedFeat
    local v202 = t2.value62(t2.value26.LeedFeatKey)
    local LeedFeatTouch = t2.value26.LeedFeatTouch
    local CameraJump = t2.value26.CameraJump
    local ESPEnabled = t2.value26.ESPEnabled
    local ESPLineSize = t2.value26.ESPLineSize
    local ESPNeon = t2.value26.ESPNeon
    local AutoSpinStyle = t2.value26.AutoSpinStyle
    local AutoSpinHabi = t2.value26.AutoSpinHabi
    local AutoYen = t2.value26.AutoYen
    local JerseyEnabled = t2.value26.JerseyEnabled
    local JerseyAtomicEnabled = t2.value26.JerseyAtomicEnabled
    local str2 = tostring(t2.value26.JerseyAtomicTeam or "PRETA")
    local JerseyDragaoEnabled = t2.value26.JerseyDragaoEnabled
    local str3 = tostring(t2.value26.JerseyDragaoTeam or "PRETA")
    local JerseyPijamaEnabled = t2.value26.JerseyPijamaEnabled
    local str4 = tostring(t2.value26.JerseyPijamaTeam or "PRETO")
    local FPSBoost = t2.value26.FPSBoost
    local NightMode = t2.value26.NightMode
    local GrayFloor = t2.value26.GrayFloor
    local NoShadows = t2.value26.NoShadows
    local CrosshairEnabled = t2.value26.CrosshairEnabled
    local str5 = tostring(t2.value26.CrosshairStyle or "CRUZ")
    local CrosshairY = t2.value26.CrosshairY
    local AutoLong = t2.value26.AutoLong
    local v226 = t2.value62(t2.value26.AutoLongKey)
    local AutoLongAngle = t2.value26.AutoLongAngle
    local str6 = tostring(t2.value26.AutoLongDir or "DIREITA")
    local AutoLongTouch = t2.value26.AutoLongTouch
    local v230 = t2.value65(t2.value26.InterfaceMode)
    local v231 = t2.value61(t2.value26.ThemeColor)

    return {
		Version = 5,
		HitboxEnabled = HitboxEnabled,
		HitboxSize = HitboxSize,
		HitboxTransparency = HitboxTransparency,
		HitboxKey = str,
		HitboxTouch = HitboxTouch,
		FreezeAir = FreezeAir,
		FreezeAirKey = v199,
		FreezeTouch = FreezeTouch,
		LeedFeat = LeedFeat,
		LeedFeatKey = v202,
		LeedFeatTouch = LeedFeatTouch,
		CameraJump = CameraJump,
		ESPEnabled = ESPEnabled,
		ESPLineSize = ESPLineSize,
		ESPNeon = ESPNeon,
		AutoSpinStyle = AutoSpinStyle,
		AutoSpinHabi = AutoSpinHabi,
		AutoYen = AutoYen,
		JerseyEnabled = JerseyEnabled,
		JerseyAtomicEnabled = JerseyAtomicEnabled,
		JerseyAtomicTeam = str2,
		JerseyDragaoEnabled = JerseyDragaoEnabled,
		JerseyDragaoTeam = str3,
		JerseyPijamaEnabled = JerseyPijamaEnabled,
		JerseyPijamaTeam = str4,
		FPSBoost = FPSBoost,
		NightMode = NightMode,
		GrayFloor = GrayFloor,
		NoShadows = NoShadows,
		CrosshairEnabled = CrosshairEnabled,
		CrosshairStyle = str5,
		CrosshairY = CrosshairY,
		AutoLong = AutoLong,
		AutoLongKey = v226,
		AutoLongAngle = AutoLongAngle,
		AutoLongDir = str6,
		AutoLongTouch = AutoLongTouch,
		RainbowTag = false,
		CustomTagName = "",
		InterfaceMode = v230,
		ThemeColor = v231
	}
end
function t2.value67()
    if not writefile then
        warn("[ETERNAL HUB SAVE] writefile não existe nesse executor")

        return false
    end
    local ok, result = pcall(function()
        local value8 = t2.value8
        local t7 = { t2.value66() }

        return value8:JSONEncode(v3(t7))
    end)
    local v250 = result
    if not ok or not v250 then
        warn("[ETERNAL HUB SAVE] Erro ao gerar JSON:", v250)

        return false
    end
    local v251 = false
    local v252
    for _, v in ipairs(t2.value60) do
        if v and v ~= "" then
            local success, result = pcall(function()
                writefile(v, v250)
            end)
            if success then
                v251 = true
            else
                v252 = result
                warn("[ETERNAL HUB SAVE] Falhou em", v, result)
            end
        end
    end
    if not v251 then
        warn("[ETERNAL HUB SAVE] Nenhum arquivo salvou:", v252)

        return false
    end

    return true
end
function t2.value68()
    if not isfile or not readfile then
        warn("[ETERNAL HUB SAVE] isfile/readfile não existe nesse executor")

        return nil
    end

    for _, v in ipairs(t2.value60) do
        local v234 = v

        if v234 and (v234 ~= "" and isfile(v234)) then
            local ok, result = pcall(function()
                return readfile(v234)
            end)
            local v237 = result

            if ok and (type(v237) == "string" and v237 ~= "") then
                local ok3, result3 = pcall(function()
                    return t2.value8:JSONDecode(v237)
                end)

                if ok3 then
                    ok3 = type(result3) == "table"
                end

                if ok3 then
                    return result3, v234
                end

                warn("[ETERNAL HUB SAVE] Config corrompida em", v234)
            end
        end
    end

    return nil
end
function t2.value69(p17)
    if type(p17) ~= "table" then
        return false
    end

    if p17.ThemeColor then
        t2.value26.ThemeColor = v18(p17.ThemeColor)
    end

    t2.value26.HitboxEnabled = t2.value63(p17.HitboxEnabled, t2.value26.HitboxEnabled)
    t2.value26.HitboxSize = t2.value64(p17.HitboxSize, t2.value26.HitboxSize)
    t2.value26.HitboxTransparency = t2.value64(p17.HitboxTransparency, t2.value26.HitboxTransparency)

    if p17.HitboxKey ~= nil then
        t2.value26.HitboxKey = tostring(p17.HitboxKey)
    end

    t2.value26.HitboxTouch = t2.value63(p17.HitboxTouch, t2.value26.HitboxTouch)
    t2.value26.FreezeAir = t2.value63(p17.FreezeAir, t2.value26.FreezeAir)

    if p17.FreezeAirKey ~= nil then
        t2.value26.FreezeAirKey = Enum.KeyCode[tostring(p17.FreezeAirKey)] or Enum.KeyCode.F
    end

    t2.value26.FreezeTouch = t2.value63(p17.FreezeTouch, t2.value26.FreezeTouch)
    t2.value26.LeedFeat = t2.value63(p17.LeedFeat, t2.value26.LeedFeat)

    if p17.LeedFeatKey ~= nil then
        t2.value26.LeedFeatKey = Enum.KeyCode[tostring(p17.LeedFeatKey)] or Enum.KeyCode.G
    end

    t2.value26.LeedFeatTouch = t2.value63(p17.LeedFeatTouch, t2.value26.LeedFeatTouch)
    t2.value26.CameraJump = t2.value63(p17.CameraJump, t2.value26.CameraJump)
    t2.value26.ESPEnabled = t2.value63(p17.ESPEnabled, t2.value26.ESPEnabled)
    t2.value26.ESPLineSize = t2.value64(p17.ESPLineSize, t2.value26.ESPLineSize)
    t2.value26.ESPNeon = t2.value63(p17.ESPNeon, t2.value26.ESPNeon)
    t2.value26.AutoSpinStyle = t2.value63(p17.AutoSpinStyle, t2.value26.AutoSpinStyle)
    t2.value26.AutoSpinHabi = t2.value63(p17.AutoSpinHabi, t2.value26.AutoSpinHabi)
    t2.value26.AutoYen = t2.value63(p17.AutoYen, t2.value26.AutoYen)
    t2.value26.JerseyEnabled = t2.value63(p17.JerseyEnabled, t2.value26.JerseyEnabled)
    t2.value26.JerseyAtomicEnabled = t2.value63(p17.JerseyAtomicEnabled, t2.value26.JerseyAtomicEnabled)

    if p17.JerseyAtomicTeam ~= nil then
        local str = tostring(p17.JerseyAtomicTeam)
        local v242 = str == "PRETA"

        if not v242 then
            v242 = str == "LARANJA" or (str == "ROXO" or (str == "VERMELHO" or str == "BRANCO"))
        end

        if v242 then
            t2.value26.JerseyAtomicTeam = str
        end
    end

    t2.value26.JerseyDragaoEnabled = t2.value63(p17.JerseyDragaoEnabled, t2.value26.JerseyDragaoEnabled)

    if p17.JerseyDragaoTeam ~= nil then
        local str = tostring(p17.JerseyDragaoTeam)
        local v244 = str == "PRETA"

        if not v244 then
            v244 = str == "LARANJA" or (str == "ROXO" or (str == "VERMELHO" or str == "BRANCO"))
        end

        if v244 then
            t2.value26.JerseyDragaoTeam = str
        end
    end

    t2.value26.JerseyPijamaEnabled = t2.value63(p17.JerseyPijamaEnabled, t2.value26.JerseyPijamaEnabled)

    if p17.JerseyPijamaTeam ~= nil then
        local str = tostring(p17.JerseyPijamaTeam)

        if str == "PRETA" then
            str = "PRETO"
        end

        local v246 = str == "PRETO"

        if not v246 then
            v246 = str == "ORANGE" or (str == "ROXO" or (str == "VERMELHO" or str == "BRANCO"))
        end

        if v246 then
            t2.value26.JerseyPijamaTeam = str
        end
    end

    t2.value26.FPSBoost = t2.value63(p17.FPSBoost, t2.value26.FPSBoost)
    t2.value26.NightMode = t2.value63(p17.NightMode, t2.value26.NightMode)
    t2.value26.GrayFloor = t2.value63(p17.GrayFloor, t2.value26.GrayFloor)
    t2.value26.NoShadows = t2.value63(p17.NoShadows, t2.value26.NoShadows)
    t2.value26.CrosshairEnabled = t2.value63(p17.CrosshairEnabled, t2.value26.CrosshairEnabled)

    if p17.CrosshairStyle ~= nil then
        local str = tostring(p17.CrosshairStyle)

        if str == "CRUZ" or (str == "PONTO" or (str == "CIRCULO" or str == "X")) then
            t2.value26.CrosshairStyle = str
        end
    end

    t2.value26.CrosshairY = math.clamp(t2.value64(p17.CrosshairY, t2.value26.CrosshairY), 0, 50)
    t2.value26.AutoLong = t2.value63(p17.AutoLong, t2.value26.AutoLong)

    if p17.AutoLongKey ~= nil then
        t2.value26.AutoLongKey = Enum.KeyCode[tostring(p17.AutoLongKey)] or Enum.KeyCode.L
    end

    t2.value26.AutoLongAngle = t2.value64(p17.AutoLongAngle, t2.value26.AutoLongAngle)

    if p17.AutoLongDir ~= nil then
        t2.value26.AutoLongDir = tostring(p17.AutoLongDir)
    end

    t2.value26.AutoLongTouch = t2.value63(p17.AutoLongTouch, t2.value26.AutoLongTouch)
    t2.value26.RainbowTag = false
    t2.value26.CustomTagName = ""
    t2.value26.InterfaceMode = t2.value65(p17.InterfaceMode)

    return true
end
function t2.value70()
    if t2.value27.hitboxEn then
        t2.value27.hitboxEn(t2.value26.HitboxEnabled)
    end

    if t2.value27.hitboxScale then
        t2.value27.hitboxScale(t2.value26.HitboxSize)
    end

    if t2.value27.hitboxOpacity then
        t2.value27.hitboxOpacity((math.floor((1 - t2.value26.HitboxTransparency) * 100)))
    end

    if t2.value27.hitboxKeyText then
        t2.value27.hitboxKeyText(t2.value26.HitboxKey)
    end

    if t2.value27.hitboxTouch then
        t2.value27.hitboxTouch(t2.value26.HitboxTouch)
    end

    if t2.value27.freezeAir then
        t2.value27.freezeAir(t2.value26.FreezeAir)
    end

    if t2.value27.freezeAirKeyText then
        t2.value27.freezeAirKeyText(t2.value62(t2.value26.FreezeAirKey))
    end

    if t2.value27.freezeTouch then
        t2.value27.freezeTouch(t2.value26.FreezeTouch)
    end

    if t2.value27.leedFeat then
        t2.value27.leedFeat(t2.value26.LeedFeat)
    end

    if t2.value27.leedFeatKeyText then
        t2.value27.leedFeatKeyText(t2.value62(t2.value26.LeedFeatKey))
    end

    if t2.value27.leedFeatTouch then
        t2.value27.leedFeatTouch(t2.value26.LeedFeatTouch)
    end

    if t2.value27.directionalJump then
        t2.value27.directionalJump(t2.value26.CameraJump)
    end

    if t2.value27.espEnabled then
        t2.value27.espEnabled(t2.value26.ESPEnabled)
    end

    if t2.value27.espNeon then
        t2.value27.espNeon(t2.value26.ESPNeon)
    end

    if t2.value27.espLineSize then
        t2.value27.espLineSize(t2.value26.ESPLineSize)
    end

    if t2.value27.autoSpinStyle then
        t2.value27.autoSpinStyle(t2.value26.AutoSpinStyle)
    end

    if t2.value27.autoSpinHabi then
        t2.value27.autoSpinHabi(t2.value26.AutoSpinHabi)
    end

    if t2.value27.autoYen then
        t2.value27.autoYen(t2.value26.AutoYen)
    end

    if t2.value27.jerseyEnabled then
        t2.value27.jerseyEnabled(t2.value26.JerseyEnabled)
    end

    if t2.value27.jerseyAtomicEnabled then
        t2.value27.jerseyAtomicEnabled(t2.value26.JerseyAtomicEnabled)
    end

    if t2.value27.jerseyAtomicTeam then
        t2.value27.jerseyAtomicTeam(t2.value26.JerseyAtomicTeam)
    end

    if t2.value27.jerseyDragaoEnabled then
        t2.value27.jerseyDragaoEnabled(t2.value26.JerseyDragaoEnabled)
    end

    if t2.value27.jerseyPijamaEnabled then
        t2.value27.jerseyPijamaEnabled(t2.value26.JerseyPijamaEnabled)
    end

    if t2.value27.jerseyPijamaTeam then
        t2.value27.jerseyPijamaTeam(t2.value26.JerseyPijamaTeam)
    end

    if t2.value27.fpsBoost then
        t2.value27.fpsBoost(t2.value26.FPSBoost)
    end

    if t2.value27.nightMode then
        t2.value27.nightMode(t2.value26.NightMode)
    end

    if t2.value27.grayFloor then
        t2.value27.grayFloor(t2.value26.GrayFloor)
    end

    if t2.value27.noShadows then
        t2.value27.noShadows(t2.value26.NoShadows)
    end

    if t2.value27.autoLong then
        t2.value27.autoLong(t2.value26.AutoLong)
    end

    if t2.value27.rainbowTag then
        t2.value27.rainbowTag(t2.value26.RainbowTag)
    end

    if t2.value27.customTagName then
        t2.value27.customTagName(t2.value26.CustomTagName)
    end

    if t2.value27.autoLongAngle then
        t2.value27.autoLongAngle(t2.value26.AutoLongAngle)
    end

    if t2.value27.crosshairEnabled then
        t2.value27.crosshairEnabled(t2.value26.CrosshairEnabled)
    end

    if t2.value27.crosshairStyle then
        t2.value27.crosshairStyle(t2.value26.CrosshairStyle)
    end

    if t2.value27.crosshairY then
        t2.value27.crosshairY(t2.value26.CrosshairY)
    end

    if t2.value53 then
        t2.value53()
    end

    if t2.value27["interface" .. tostring(t2.value26.InterfaceMode)] then
        t2.value27["interface" .. tostring(t2.value26.InterfaceMode)](true)
    elseif ApplyInterfaceMode then
        ApplyInterfaceMode(t2.value26.InterfaceMode)
    end

    if ApplyFPSOptions then
        ApplyFPSOptions()
    end

    if UpdateJersey then
        UpdateJersey()
    end

    if UpdateJerseyAtomic then
        UpdateJerseyAtomic()
    end

    if UpdateJerseyPijama then
        UpdateJerseyPijama()
    end

    if t2.value50 then
        t2.value50()
    end

    if t2.value51 then
        t2.value51()
    end

    if t2.value52 then
        t2.value52()
    end

    if t2.value56 then
        t2.value56()
    end

    if t2.value58 then
        t2.value58()
    end

    if t2.value59 then
        t2.value59()
    end

    if UpdateThemeColor then
        UpdateThemeColor()
    end
end
function t2.value71()
    return false
end
local GlobalShadows = t2.value7.GlobalShadows
local value7Brightness = t2.value7.Brightness
t1.value2 = t2.value7.ClockTime
t1.value1 = t2.value7.FogEnd
local value7Ambient = t2.value7.Ambient
local OutdoorAmbient = t2.value7.OutdoorAmbient
t2.value72 = {
	Lighting = {
		GlobalShadows = GlobalShadows,
		Brightness = value7Brightness,
		ClockTime = t1.value2,
		FogEnd = t1.value1,
		Ambient = value7Ambient,
		OutdoorAmbient = OutdoorAmbient
	},
	Parts = {},
	Effects = {}
}
t2.value73 = nil
function t2.value73(p18)
    if not p18:IsA("BasePart") then
        return false
    end

    local v261 = p18.Name:lower()
    local Anchored = p18.Anchored

    if Anchored then
        Anchored = v261:find("floor")

        if not Anchored then
            Anchored = v261:find("ground")

            if not Anchored then
                Anchored = v261:find("baseplate")

                if not Anchored then
                    Anchored = v261:find("chao")

                    if not Anchored then
                        Anchored = v261:find("chão")

                        if not Anchored then
                            Anchored = p18.Size.X >= 35 and (p18.Size.Z >= 35 and p18.Position.Y < 15)
                        end
                    end
                end
            end
        end
    end

    return Anchored
end
function t2.value74()
    if t2.value26.NightMode then
        t2.value7.ClockTime = 0
        t2.value7.Brightness = 1
        t2.value7.Ambient = Color3.fromRGB(45, 45, 60)
        t2.value7.OutdoorAmbient = Color3.fromRGB(30, 30, 45)
    else
        t2.value7.ClockTime = t2.value72.Lighting.ClockTime
        t2.value7.Brightness = t2.value72.Lighting.Brightness
        t2.value7.Ambient = t2.value72.Lighting.Ambient
        t2.value7.OutdoorAmbient = t2.value72.Lighting.OutdoorAmbient
    end

    t2.value7.GlobalShadows = not (t2.value26.NoShadows or t2.value26.FPSBoost)
    t2.value7.FogEnd = t2.value26.FPSBoost and 100000 or t2.value72.Lighting.FogEnd

    if t2.value26.GrayFloor then
        for _, descendant in ipairs(t2.value6:GetDescendants()) do
            if t2.value73(descendant) then
                if not t2.value72.Parts[descendant] then
                    local Parts = t2.value72.Parts
                    local descendantColor = descendant.Color
                    local descendantMaterial = descendant.Material

                    Parts[descendant] = {
						Color = descendantColor,
						Material = descendantMaterial
					}
                end

                descendant.Color = Color3.fromRGB(95, 95, 95)
                descendant.Material = Enum.Material.SmoothPlastic
            end
        end
    else
        for k, v in pairs(t2.value72.Parts) do
            local v273 = k

            if v273 and v273.Parent then
                v273.Color = v.Color
                v273.Material = v.Material
            end
        end

        t2.value72.Parts = {}
    end

    if t2.value26.FPSBoost then
        for _, descendant in ipairs(t2.value6:GetDescendants()) do
            if descendant:IsA("ParticleEmitter") or (descendant:IsA("Trail") or descendant:IsA("Beam")) then
                if t2.value72.Effects[descendant] == nil then
                    t2.value72.Effects[descendant] = descendant.Enabled
                end

                descendant.Enabled = false
            end
        end

        return
    end

    for k, v in pairs(t2.value72.Effects) do
        local v278 = k

        if v278 and v278.Parent then
            v278.Enabled = v
        end
    end

    t2.value72.Effects = {}
end
function t2.value75()
    if t2.value29 then
        t2.value29:Disconnect()
    end

    local Character = t2.value23.Character

    if Character and t2.value33 then
        local Shirt = Character:FindFirstChildOfClass("Shirt")
        local Pants = Character:FindFirstChildOfClass("Pants")

        if Shirt then
            if t2.value33.ShirtTemplate and t2.value33.ShirtTemplate ~= "" then
                Shirt.ShirtTemplate = t2.value33.ShirtTemplate
            else
                Shirt:Destroy()
            end
        end

        if Pants then
            if t2.value33.PantsTemplate and t2.value33.PantsTemplate ~= "" then
                Pants.PantsTemplate = t2.value33.PantsTemplate

                return
            end

            Pants:Destroy()
        end
    end
end
function t2.value76()
    local Character = t2.value23.Character

    if not Character then
        return
    end

    local ok, result = pcall(function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local ShirtTemplate = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Jersey"):WaitForChild("TuxedoJersey"):WaitForChild("White Team"):WaitForChild("Shirt").ShirtTemplate
        local PantsTemplate = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Jersey"):WaitForChild("PajamasJersey"):WaitForChild("White Team"):WaitForChild("Pants").PantsTemplate
        local Shirt = Character:FindFirstChildOfClass("Shirt")
        local Pants = Character:FindFirstChildOfClass("Pants")

        if not t2.value33 then
            local v660 = Shirt and Shirt.ShirtTemplate or ""
            local v661 = Pants and Pants.PantsTemplate or ""

            t2.value33 = {
				ShirtTemplate = v660,
				PantsTemplate = v661
			}
        end;

        (Shirt or Instance.new("Shirt", Character)).ShirtTemplate = ShirtTemplate;
        (Pants or Instance.new("Pants", Character)).PantsTemplate = PantsTemplate
    end)

    if not ok then
        warn("[ETERNAL HUB JERSEY] Erro ao aplicar roupa:", result)
    end
end
local function v23()
    t2.value75()

    if not t2.value26.JerseyEnabled then
        return
    end

    t2.value26.JerseyAtomicEnabled = false
    t2.value26.JerseyDragaoEnabled = false
    t2.value26.JerseyPijamaEnabled = false

    if t2.value27.jerseyAtomicEnabled then
        t2.value27.jerseyAtomicEnabled(false)
    end

    if t2.value27.jerseyDragaoEnabled then
        t2.value27.jerseyDragaoEnabled(false)
    end

    if t2.value27.jerseyPijamaEnabled then
        t2.value27.jerseyPijamaEnabled(false)
    end

    if UpdateJerseyAtomic then
        UpdateJerseyAtomic()
    end

    if UpdateJerseyDragao then
        UpdateJerseyDragao()
    end

    if UpdateJerseyPijama then
        UpdateJerseyPijama()
    end

    if t2.value50 then
        t2.value50()
    end

    if t2.value51 then
        t2.value51()
    end

    if t2.value52 then
        t2.value52()
    end

    if t2.value26.JerseyAtomicEnabled then
        t2.value26.JerseyAtomicEnabled = false
        t2.value26.JerseyDragaoEnabled = false

        if t2.value27.jerseyAtomicEnabled then
            t2.value27.jerseyAtomicEnabled(false)
        end

        if UpdateJerseyAtomic then
            UpdateJerseyAtomic()
        end
    end

    t2.value76()
    t2.value3.Heartbeat:Connect(function()
        if not t2.value26.JerseyEnabled then
            t2.value75()

            return
        end

        t2.value76()
    end)
end
local CharacterAdded = t2.value23.CharacterAdded
function t1.value2()
    task.wait(1)
    v23()
end
CharacterAdded:Connect(t1.value2)
t1.value2 = {
	Shirt = "rbxassetid://79419126444394",
	Short = "rbxassetid://123015621765016"
}
t1.value1 = {
	Shirt = "rbxassetid://90814817391229",
	Short = "rbxassetid://78131972193601"
}
local t9 = {
	Shirt = "rbxassetid://119109444404595",
	Short = "rbxassetid://137727739269710"
}
local t10 = {
	Shirt = "rbxassetid://88492680333870",
	Short = "rbxassetid://122028137354835"
}
t2.value77 = {
	PRETA = t1.value2,
	LARANJA = t1.value1,
	ROXO = t9,
	VERMELHO = t10,
	BRANCO = {
		Shirt = "rbxassetid://101878166391387",
		Short = "rbxassetid://98723112188566"
	}
}
function t2.value78()
    local str = tostring(t2.value26.JerseyAtomicTeam or "PRETA")
    local v283 = t2.value77[str] or t2.value77.PRETA

    return v283.Shirt, v283.Short
end
t2.value79 = nil
function t2.value80(p19)
    local _tostring = tostring

    if not p19 then
        p19 = "PRETA"
    end

    local v286 = _tostring(p19)

    if not t2.value77[v286] then
        v286 = "PRETA"
    end

    t2.value26.JerseyAtomicTeam = v286

    if t2.value27.jerseyAtomicTeam then
        t2.value27.jerseyAtomicTeam(v286)
    end

    if t2.value26.JerseyAtomicEnabled then
        pcall(t2.value79)
    end
end
function t2.value81()
    if t2.value30 then
        t2.value30:Disconnect()
    end
end
function t2.value79()
    local Character = t2.value23.Character

    if not Character then
        return
    end

    local v290, v291 = t2.value78()
    local Shirt = Character:FindFirstChildOfClass("Shirt")
    local Pants = Character:FindFirstChildOfClass("Pants")

    for _, child in ipairs(Character:GetChildren()) do
        if child:IsA("Shirt") and child ~= Shirt then
            child:Destroy()
        elseif child:IsA("Pants") and child ~= Pants then
            child:Destroy()
        elseif child:IsA("ShirtGraphic") then
            child:Destroy()
        end
    end

    local v296 = Shirt or Instance.new("Shirt")

    v296.Name = "ETERNALHUBAtomicShirt"
    v296.Parent = Character
    v296.ShirtTemplate = v290

    local v297 = Pants or Instance.new("Pants")

    v297.Name = "ETERNALHUBAtomicShort"
    v297.Parent = Character
    v297.PantsTemplate = v291
end
function t2.value82()
    t2.value81()

    if not t2.value26.JerseyAtomicEnabled then
        return
    end

    for _, v in ipairs({
		"jerseyEnabled",
		"jerseyDragaoEnabled",
		"jerseyPijamaEnabled"
	}) do
        if t2.value27[v] then
            t2.value27[v](false)
        end
    end

    t2.value26.JerseyEnabled = false
    t2.value26.JerseyDragaoEnabled = false
    t2.value26.JerseyPijamaEnabled = false

    if t2.value50 then
        t2.value50()
    end

    if t2.value51 then
        t2.value51()
    end

    if t2.value52 then
        t2.value52()
    end

    pcall(t2.value79)
    t2.value3.Heartbeat:Connect(function()
        if not t2.value26.JerseyAtomicEnabled then
            t2.value81()

            return
        end
    end)
    task.spawn(function()
        while t2.value26.JerseyAtomicEnabled do
            pcall(t2.value79)
            task.wait(3)
        end
    end)
end
t2.value23.CharacterAdded:Connect(function()
    task.wait(1)
    t2.value82()
end)

local t11 = {
	Shirt = "rbxassetid://96110031810524",
	Short = "rbxassetid://104102200186439"
}
local t12 = {
	Shirt = "rbxassetid://132973270253302",
	Short = "rbxassetid://85172161335350"
}
local t13 = {
	Shirt = "rbxassetid://116808129640162",
	Short = "rbxassetid://139666428760490"
}
t1.value2 = {
	Shirt = "rbxassetid://80954367566093",
	Short = "rbxassetid://123817816516456"
}
t2.value83 = {
	PRETA = t11,
	LARANJA = t12,
	ROXO = t13,
	VERMELHO = t1.value2,
	BRANCO = {
		Shirt = "rbxassetid://111076753133496",
		Short = "rbxassetid://118418667305258"
	}
}
function t2.value84()
    local str = tostring(t2.value26.JerseyDragaoTeam or "PRETA")
    local v299 = t2.value83[str] or t2.value83.PRETA

    return v299.Shirt, v299.Short
end
t2.value85 = nil
local function v30(p20)
    local _tostring = tostring

    if not p20 then
        p20 = "PRETA"
    end

    local v302 = _tostring(p20)

    if not t2.value83[v302] then
        v302 = "PRETA"
    end

    t2.value26.JerseyDragaoTeam = v302

    if t2.value27.jerseyDragaoTeam then
        t2.value27.jerseyDragaoTeam(v302)
    end

    if t2.value26.JerseyDragaoEnabled then
        pcall(t2.value85)
    end
end
function t2.value85()
    local Character = t2.value23.Character

    if not Character then
        return
    end

    local v304, v305 = t2.value84()
    local v306 = Character:FindFirstChildOfClass("Shirt") or Instance.new("Shirt", Character)
    local v307 = Character:FindFirstChildOfClass("Pants") or Instance.new("Pants", Character)

    v306.ShirtTemplate = v304
    v307.PantsTemplate = v305
end
function t2.value86()
    if t2.value31 then
        t2.value31:Disconnect()
    end
end
t2.value87 = {}
t2.value88 = nil
function t2.value88(p21)

    for v311, v312 in ipairs(t2.value87) do

        local v313 = v312

        pcall(function()
            v313:Disconnect()
        end)
    end
    t2.value87 = {}
    if not p21 then
        return
    end
    local GetChildren = p21.GetChildren
    local function v315(p22)
        if p22:IsA("Shirt") or p22:IsA("Pants") then
            local connection = p22:GetPropertyChangedSignal(not p22:IsA("Shirt") and "PantsTemplate" or "ShirtTemplate"):Connect(function()
                if t2.value26.JerseyDragaoEnabled then
                    task.defer(t2.value85)
                end
            end)

            table.insert(t2.value87, connection)
        end
    end
    for _, v in ipairs(GetChildren(p21)) do
        v315(v)
    end
    local connection = p21.ChildAdded:Connect(function(child)
        v315(child)

        if t2.value26.JerseyDragaoEnabled then
            task.defer(t2.value85)
        end
    end)
    table.insert(t2.value87, connection)
end
function t2.value89()
    t2.value86()
    for v321, v322 in ipairs(t2.value87) do

        local v323 = v322

        pcall(function()
            v323:Disconnect()
        end)
    end
    if not t2.value26.JerseyDragaoEnabled then
        return
    end
    for _, v in ipairs({
		"jerseyEnabled",
		"jerseyAtomicEnabled",
		"jerseyPijamaEnabled"
	}) do
        if t2.value27[v] then
            t2.value27[v](false)
        end
    end
    t2.value26.JerseyEnabled = false
    t2.value26.JerseyAtomicEnabled = false
    t2.value26.JerseyPijamaEnabled = false
    if t2.value50 then
        t2.value50()
    end
    if t2.value51 then
        t2.value51()
    end
    if t2.value52 then
        t2.value52()
    end
    pcall(t2.value85)
    t2.value88(t2.value23.Character)
    t2.value3.Heartbeat:Connect(function()
        if not t2.value26.JerseyDragaoEnabled then
            t2.value86()

            return
        end
    end)
    task.spawn(function()
        while t2.value26.JerseyDragaoEnabled do
            pcall(t2.value85)
            task.wait(2)
        end
    end)
end
t2.value23.CharacterAdded:Connect(function(character)
    task.wait(0.8)

    if t2.value26.JerseyDragaoEnabled then
        pcall(t2.value85)
        t2.value88(character)
    end
end)

local t14 = {
	Shirt = "rbxassetid://73515737995241",
	Short = "rbxassetid://115411367769806"
}
t1.value1 = {
	Shirt = "rbxassetid://73515737995241",
	Short = "rbxassetid://98261789486915"
}
local t15 = {
	Shirt = "rbxassetid://73515737995241",
	Short = "rbxassetid://84134229912519"
}
t1.value2 = {
	Shirt = "rbxassetid://73515737995241",
	Short = "rbxassetid://81837535879996"
}
t2.value90 = {
	PRETO = t14,
	ORANGE = t1.value1,
	ROXO = t15,
	VERMELHO = t1.value2,
	BRANCO = {
		Shirt = "rbxassetid://73515737995241",
		Short = "rbxassetid://118575272229757"
	}
}
t2.value91 = nil
function t2.value92()
    local str = tostring(t2.value26.JerseyPijamaTeam or "PRETO")

    if str == "PRETA" then
        str = "PRETO"
    end

    local v328 = t2.value90[str] or t2.value90.PRETO

    return v328.Shirt, v328.Short
end
function t1.value2(p23)
    local _tostring = tostring

    if not p23 then
        p23 = "PRETO"
    end

    local v331 = _tostring(p23)

    if v331 == "PRETA" then
        v331 = "PRETO"
    end

    if not t2.value90[v331] then
        v331 = "PRETO"
    end

    t2.value26.JerseyPijamaTeam = v331

    if t2.value27.jerseyPijamaTeam then
        t2.value27.jerseyPijamaTeam(v331)
    end

    if t2.value26.JerseyPijamaEnabled then
        pcall(t2.value91)
    end
end
t2.value93 = t1.value2
function t2.value94()
    if t2.value32 then
        t2.value32:Disconnect()
    end
end
function t2.value91()
    local Character = t2.value23.Character

    if not Character then
        return
    end

    local v333, v334 = t2.value92()
    local v335 = Character:FindFirstChildOfClass("Shirt") or Instance.new("Shirt", Character)
    local v336 = Character:FindFirstChildOfClass("Pants") or Instance.new("Pants", Character)

    v335.ShirtTemplate = v333
    v336.PantsTemplate = v334
end
function UpdateJerseyPijama()
    t2.value94()

    if not t2.value26.JerseyPijamaEnabled then
        if t2.value52 then
            t2.value52()
        end

        return
    end

    for _, v in ipairs({
		"jerseyEnabled",
		"jerseyDragaoEnabled",
		"jerseyAtomicEnabled"
	}) do
        if t2.value27[v] then
            t2.value27[v](false)
        end
    end

    t2.value26.JerseyEnabled = false
    t2.value26.JerseyDragaoEnabled = false
    t2.value26.JerseyAtomicEnabled = false

    if t2.value50 then
        t2.value50()
    end

    if t2.value51 then
        t2.value51()
    end

    if t2.value52 then
        t2.value52()
    end

    pcall(t2.value91)
    t2.value3.Heartbeat:Connect(function()
        if not t2.value26.JerseyPijamaEnabled then
            t2.value94()

            if t2.value52 then
                t2.value52()
            end

            return
        end
    end)
    task.spawn(function()
        while t2.value26.JerseyPijamaEnabled do
            pcall(t2.value91)
            task.wait(2.5)
        end
    end)
end
t2.value23.CharacterAdded:Connect(function()
    task.wait(1)

    if t2.value26.JerseyPijamaEnabled then
        pcall(t2.value91)
        UpdateJerseyPijama()
    end
end)

function t1.value2(p24)
    table.insert(t2.value34, p24)

    return p24
end
function t2.value95()
    for _, v in ipairs(t2.value34) do
        if v and v.Parent then
            v:Destroy()
        end
    end

    t2.value34 = {}
end
t2.value96 = t1.value2
t2.value97 = nil
function t2.value97(p25, p26, p27)
    p25.Anchored = false
    p25.CanCollide = false
    p25.CanTouch = false
    p25.CanQuery = false
    p25.Massless = true
    p25.CastShadow = false

    local p26CFrame = p26.CFrame

    if not p27 then
        p27 = CFrame.new()
    end

    p25.CFrame = p26CFrame * p27
    p25.Parent = p26.Parent

    local WeldConstraint = Instance.new("WeldConstraint")

    WeldConstraint.Part0 = p26
    WeldConstraint.Part1 = p25
    WeldConstraint.Parent = p25
    t2.value96(p25)

    return p25
end
function t2.value98(p28, p29, p30)
    if not p28 or not p28:IsA("BasePart") then
        return
    end

    local Part = Instance.new("Part")

    Part.Name = "ETERNALHUBJerseyOutfit"

    local p28Size = p28.Size

    if not p30 then
        p30 = Vector3.new(0.07, 0.07, 0.07)
    end

    Part.Size = p28Size + p30
    Part.Color = p29
    Part.Material = Enum.Material.SmoothPlastic
    Part.Transparency = 0
    t2.value97(Part, p28, CFrame.new())

    return Part
end
t2.value99 = nil
function t2.value99(p31, p32, p33, p34)
    local v374 = not p31

    if not v374 then
        v374 = not p31:IsA("BasePart")
    end

    if v374 then
        return
    end

    local Part = Instance.new("Part")

    Part.Name = "ETERNALHUBJerseyDetail"
    Part.Size = p33
    Part.Color = p34
    Part.Material = Enum.Material.SmoothPlastic
    Part.Transparency = 0

    local value97 = t2.value97

    if not p32 then
        p32 = CFrame.new()
    end

    value97(Part, p31, p32)

    return Part
end
function t2.value100(p35)
    local color3 = Color3.fromRGB(248, 248, 248)
    local color3_2 = Color3.fromRGB(38, 78, 145)
    local color3_3 = Color3.fromRGB(20, 45, 95)
    local color3_4 = Color3.fromRGB(210, 210, 210)
    for v359, v360 in ipairs({
		"Torso",
		"UpperTorso",
		"Left Arm",
		"Right Arm",
		"LeftUpperArm",
		"RightUpperArm",
		"LeftLowerArm",
		"RightLowerArm",
		"LeftHand",
		"RightHand"
	}) do

        local v361 = p35:FindFirstChild(v360)

        if v361 and v361:IsA("BasePart") then
            t2.value98(v361, color3, Vector3.new(0.08, 0.08, 0.08))
        end
    end
    for v364, v365 in ipairs({
		"LowerTorso",
		"Left Leg",
		"Right Leg",
		"LeftUpperLeg",
		"RightUpperLeg",
		"LeftLowerLeg",
		"RightLowerLeg",
		"LeftFoot",
		"RightFoot"
	}) do

        local v366 = p35:FindFirstChild(v365)

        if v366 and v366:IsA("BasePart") then
            t2.value98(v366, color3_2, Vector3.new(0.08, 0.08, 0.08))
        end
    end
    local v367 = p35:FindFirstChild("UpperTorso") or p35:FindFirstChild("Torso")
    if v367 and v367:IsA("BasePart") then
        t2.value99(v367, CFrame.new(0, 0.15, -v367.Size.Z / 2 - 0.055), Vector3.new(v367.Size.X + 0.12, 0.08, 0.045), color3_4)
        t2.value99(v367, CFrame.new(0, -0.2, -v367.Size.Z / 2 - 0.06), Vector3.new(v367.Size.X + 0.08, 0.06, 0.045), color3_3)
    end
    local v368 = p35:FindFirstChild("LeftLowerArm") or p35:FindFirstChild("Left Arm")
    local v369 = p35:FindFirstChild("RightLowerArm") or p35:FindFirstChild("Right Arm")
    if v368 and v368:IsA("BasePart") then
        t2.value99(v368, CFrame.new(0, -v368.Size.Y / 2 + 0.08, -v368.Size.Z / 2 - 0.045), Vector3.new(v368.Size.X + 0.08, 0.08, 0.04), color3_4)
    end
    if v369 and v369:IsA("BasePart") then
        t2.value99(v369, CFrame.new(0, -v369.Size.Y / 2 + 0.08, -v369.Size.Z / 2 - 0.045), Vector3.new(v369.Size.X + 0.08, 0.08, 0.04), color3_4)
    end
end
local function v33()
    t2.value95()

    local Character = t2.value23.Character

    if not Character then
        return
    end

    if t2.value26.JerseyEnabled then
        t2.value100(Character)
    end
end
local CharacterAdded2 = t2.value23.CharacterAdded
function t1.value2()
    task.wait(1)
    v33()
end
CharacterAdded2:Connect(t1.value2)
t2.value3.RenderStepped:Connect(function()
    if t2.value26.HitboxEnabled then
        for _, child in ipairs(t2.value6:GetChildren()) do
            if child.Name:match("^CLIENT_BALL_") then
                local BasePart = child:FindFirstChildWhichIsA("BasePart", true)

                if BasePart then
                    local v381 = child:FindFirstChild("Ball.001") or Instance.new("Part", child)

                    v381.Name = "Ball.001"
                    v381.Shape = Enum.PartType.Ball
                    v381.Anchored = true
                    v381.CanCollide = false
                    v381.Material = Enum.Material.ForceField
                    v381.Transparency = t2.value26.HitboxTransparency
                    v381.Size = Vector3.new(2, 2, 2) * t2.value26.HitboxSize
                    v381.Color = t2.value26.ThemeColor
                    v381.CFrame = BasePart.CFrame
                end
            end
        end
    end

    if t2.value26.ESPEnabled then
        for _, player in pairs(t2.value4:GetPlayers()) do
            if player ~= t2.value23 and player.Character then
                local Head = player.Character:FindFirstChild("Head")
                local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

                if Head and HumanoidRootPart then
                    if not t2.value28[player] or not t2.value28[player].Parent then
                        local Part = Instance.new("Part")

                        Part.Name = "ETERNALHUBESPLine"
                        Part.Anchored = true
                        Part.CanCollide = false
                        Part.CanTouch = false
                        Part.CastShadow = false
                        Part.Material = Enum.Material.SmoothPlastic
                        Part.Shape = Enum.PartType.Cylinder
                        Part.Parent = workspace
                        t2.value28[player] = Part
                    end

                    local v387 = t2.value28[player]
                    local ESPLineSize = t2.value26.ESPLineSize

                    v387.Material = t2.value26.ESPNeon and Enum.Material.Neon or Enum.Material.SmoothPlastic

                    local Unit = Vector3.new(HumanoidRootPart.CFrame.LookVector.X, 0, HumanoidRootPart.CFrame.LookVector.Z).Unit
                    local v390 = HumanoidRootPart.Position + Vector3.new(0, 1.6, 0) + Unit * 0.65
                    local v391 = v390 + Unit * ESPLineSize
                    local v392 = v390 + Unit * (ESPLineSize / 2)

                    v387.Color = t2.value26.ThemeColor
                    v387.Size = Vector3.new(ESPLineSize, 0.35, 0.35)
                    v387.CFrame = CFrame.lookAt(v392, v391) * CFrame.Angles(0, math.rad(90), 0)
                end
            end
        end
    else
        for k, v in pairs(t2.value28) do
            if v and v.Parent then
                v:Destroy()
            end

            t2.value28[k] = nil
        end
    end

    for k, v in pairs(t2.value28) do
        local v397 = k

        if not v397.Parent or not v397.Character then
            if v then
                v:Destroy()
            end

            t2.value28[v397] = nil
        end
    end
end)
t2.value101 = nil
local function v35()
    t2.value46 = false

    if t2.value101 then
        t2.value101:Disconnect()
    end

    local Character = t2.value23.Character

    if Character then
        local LowerTorso = Character:FindFirstChild("LowerTorso")
        local v413 = LowerTorso and LowerTorso:FindFirstChild("Root")

        if not (v413 and v413:GetAttribute("EHUB_StartC0")) then
        end

        if v413 then
            pcall(function()
                v413.C0 = CFrame.new(v413.C0.Position) * CFrame.fromEulerAnglesYXZ(0, 0, 0)
            end)
        end
    end
end
function t2.value102()
    if not t2.value26.AutoLong then
        return
    end

    local Character = t2.value23.Character

    if not Character then
        return
    end

    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    local LowerTorso = Character:FindFirstChild("LowerTorso")
    local v401 = LowerTorso and LowerTorso:FindFirstChild("Root")

    if not HumanoidRootPart or not v401 then
        return
    end

    if t2.value46 then
        return
    end

    t2.value46 = true

    local v402 = math.rad((math.clamp(t2.value26.AutoLongAngle, 0, 30)))
    local v403 = t2.value26.AutoLongDir ~= "DIREITA" and 1 or -1
    local _, v405, _ = t2.value24.CFrame:ToEulerAnglesYXZ()
    local v407 = v405 + v403 * v402
    local u408 = v405
    local C0 = v401.C0
    local C0_2 = v401.C0

    if t2.value101 then
        t2.value101:Disconnect()
    end

    t2.value101 = t2.value3.RenderStepped:Connect(function(dt)
        if not t2.value46 then
            t2.value101:Disconnect()
            t2.value101 = nil

            return
        end

        u408 += (v407 - u408) * math.min(1, 7 * dt)

        local v666, _, v668 = t2.value24.CFrame:ToEulerAnglesYXZ()

        t2.value24.CFrame = CFrame.new(t2.value24.CFrame.Position) * CFrame.fromEulerAnglesYXZ(v666, u408, v668)

        local LookVector = t2.value24.CFrame.LookVector
        local vector3 = Vector3.new(-LookVector.X, 0, -LookVector.Z)

        if vector3.Magnitude < 0.01 then
            return
        end

        local Unit = vector3.Unit

        if not pcall(function()
            local v708 = HumanoidRootPart.CFrame.RightVector:Dot(Unit)
            local v709 = HumanoidRootPart.CFrame.LookVector:Dot(Unit)

            if v709 > 0 then
                v709 *= 2
            end

            local v710 = C0 * CFrame.Angles(math.rad(-v709 * 25), 0, (math.rad(-v708 * 25)))

            C0_2 = C0_2:Lerp(v710, (math.min(1, dt * 15)))
            v401.C0 = C0_2
        end) then
            t2.value46 = false
            t2.value101:Disconnect()
            t2.value101 = nil
        end
    end)
end
local function v36()
    t2.value26.AutoLong = not t2.value26.AutoLong

    if not t2.value26.AutoLong then
        v35()
    end

    if t2.value27.autoLong then
        t2.value27.autoLong(t2.value26.AutoLong)
    end

    if t2.value49 then
        t2.value49()
    end

    t2.value38(not ("AUTO LONG: " .. t2.value26.AutoLong) and "OFF ❌" or "ON ✅")
end
local InputBegan = t2.value2.InputBegan
function t1.value2(p36, p37)
    if p37 then
        return
    end

    if t2.value2:GetFocusedTextBox() then
        return
    end

    if p36.UserInputType ~= Enum.UserInputType.Keyboard then
        return
    end

    if p36.KeyCode == t2.value26.AutoLongKey then
        v36()

        return
    end

    if p36.KeyCode == Enum.KeyCode.S and t2.value26.AutoLong then
        local Character = t2.value23.Character
        local v417 = Character and Character:FindFirstChildOfClass("Humanoid")

        if v417 and v417.FloorMaterial == Enum.Material.Air then
            t2.value102()
        end
    end
end
InputBegan:Connect(t1.value2)

local InputEnded = t2.value2.InputEnded
function t1.value2(p38)
    if p38.UserInputType == Enum.UserInputType.Keyboard and (p38.KeyCode == Enum.KeyCode.S and t2.value46) then
        v35()
    end
end
InputEnded:Connect(t1.value2)

function t1.value2()
    local Character = t2.value23.Character

    if not Character then
        return
    end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    if not Humanoid then
        return
    end

    Humanoid.StateChanged:Connect(function(_, newState)
        if (newState == Enum.HumanoidStateType.Landed or newState == Enum.HumanoidStateType.Running) and t2.value46 then
            v35()
        end
    end)
end
t2.value103 = t1.value2
t2.value103()
t1.value2 = t2.value23.CharacterAdded
t1.value2:Connect(function()
    task.wait(0.5)
    t2.value103()
end)
t1.value2 = Instance.new("ScreenGui")
t2.value104 = t1.value2
t1.value2 = t2.value104
t1.value2.Name = "ETERNALHUBPremiumUI"
t1.value2 = t2.value104
t1.value2.ResetOnSpawn = false
t1.value2 = t2.value104
t1.value2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
t1.value2 = t2.value104
t1.value2.Parent = PlayerGui
t2.value105 = Instance.new("Frame")
t2.value105.Name = "E4CrosshairLayer"
t2.value105.Size = UDim2.new(1, 0, 1, 0)
t2.value105.BackgroundTransparency = 1
t2.value105.BorderSizePixel = 0
t2.value105.Visible = false
t2.value105.ZIndex = 999
t2.value105.Parent = t2.value104
t2.value106 = Instance.new("Frame")
t2.value106.Name = "E4CrosshairHolder"
t2.value106.AnchorPoint = Vector2.new(0.5, 0.5)
t2.value106.Size = UDim2.new(0, 44, 0, 44)
t2.value106.Position = UDim2.new(0.5, 0, 0.5, 0)
t2.value106.BackgroundTransparency = 1
t2.value106.BorderSizePixel = 0
t2.value106.ZIndex = 1000
t2.value106.Parent = t2.value105
local function v39()
    for _, child in ipairs(t2.value106:GetChildren()) do
        child:Destroy()
    end
end
local function v40(p40, p41, p42, p43)
    local Frame2 = Instance.new("Frame")

    Frame2.Name = p40
    Frame2.Position = p41
    Frame2.Size = p42
    Frame2.Rotation = p43 or 0
    Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame2.BackgroundColor3 = t2.value26.ThemeColor
    Frame2.BorderSizePixel = 0
    Frame2.ZIndex = 1001
    Frame2.Parent = t2.value106
    Instance.new("UICorner", Frame2).CornerRadius = UDim.new(1, 0)

    return Frame2
end
function t2.value53()
    if not t2.value105 or not t2.value106 then
        return
    end

    t2.value105.Visible = t2.value26.CrosshairEnabled == true
    t2.value106.Position = UDim2.new(0.5, 0, math.clamp(tonumber(t2.value26.CrosshairY) or 50, 0, 50) / 100, 0)
    v39()

    if not t2.value26.CrosshairEnabled then
        return
    end

    local str = tostring(t2.value26.CrosshairStyle or "CRUZ")
    local ThemeColor = t2.value26.ThemeColor

    if str == "PONTO" then
        local Frame3 = Instance.new("Frame")

        Frame3.Name = "Dot"
        Frame3.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame3.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame3.Size = UDim2.new(0, 7, 0, 7)
        Frame3.BackgroundColor3 = ThemeColor
        Frame3.BorderSizePixel = 0
        Frame3.ZIndex = 1001
        Frame3.Parent = t2.value106
        Instance.new("UICorner", Frame3).CornerRadius = UDim.new(1, 0)

        return
    end

    if str == "CIRCULO" then
        local Frame4 = Instance.new("Frame")

        Frame4.Name = "Circle"
        Frame4.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame4.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame4.Size = UDim2.new(0, 28, 0, 28)
        Frame4.BackgroundTransparency = 1
        Frame4.BorderSizePixel = 0
        Frame4.ZIndex = 1001
        Frame4.Parent = t2.value106
        Instance.new("UICorner", Frame4).CornerRadius = UDim.new(1, 0)

        local UIStroke2 = Instance.new("UIStroke")

        UIStroke2.Color = ThemeColor
        UIStroke2.Thickness = 2
        UIStroke2.Transparency = 0.05
        UIStroke2.Parent = Frame4
        v40("CircleDot", UDim2.new(0.5, 0, 0.5, 0), UDim2.new(0, 4, 0, 4), 0)

        return
    end

    if str == "X" then
        v40("X1", UDim2.new(0.5, 0, 0.5, 0), UDim2.new(0, 34, 0, 3), 45)
        v40("X2", UDim2.new(0.5, 0, 0.5, 0), UDim2.new(0, 34, 0, 3), -45)

        return
    end

    v40("Top", UDim2.new(0.5, 0, 0.18, 0), UDim2.new(0, 3, 0, 13), 0)
    v40("Bottom", UDim2.new(0.5, 0, 0.82, 0), UDim2.new(0, 3, 0, 13), 0)
    v40("Left", UDim2.new(0.18, 0, 0.5, 0), UDim2.new(0, 13, 0, 3), 0)
    v40("Right", UDim2.new(0.82, 0, 0.5, 0), UDim2.new(0, 13, 0, 3), 0)
    v40("Center", UDim2.new(0.5, 0, 0.5, 0), UDim2.new(0, 4, 0, 4), 0)
end
t2.value107 = Instance.new("TextButton")
t2.value107.Name = "RBFloatingButton"
t2.value107.Size = UDim2.new(0, v16, 0, v16)
t2.value107.Position = UDim2.new(0.5, -(v16 / 2), 0, 70)
t2.value107.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
t2.value107.BorderSizePixel = 0
t2.value107.Text = "RB"
t2.value107.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value107.TextSize = not t2.value25 and 24 or 18
t2.value107.Font = Enum.Font.GothamBold
t2.value107.TextStrokeTransparency = 0.5
t2.value107.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
t2.value107.AutoButtonColor = false
t2.value107.ZIndex = 2
t2.value107.Parent = t2.value104
t2.value107.ClipsDescendants = false
local UICorner4 = Instance.new("UICorner")

UICorner4.CornerRadius = UDim.new(1, 0)
UICorner4.Parent = t2.value107
local UIStroke3 = Instance.new("UIStroke")

UIStroke3.Name = "RBRainbowLight"
UIStroke3.Thickness = 3
UIStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke3.Transparency = 0
UIStroke3.Parent = t2.value107
t2.value108 = Instance.new("UIGradient")

local value108 = t2.value108
t1.value2 = "Color"
local new = ColorSequence.new
t1.value1 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 70))

local colorSequenceKeypoint = ColorSequenceKeypoint.new(0.15, Color3.fromRGB(255, 120, 0))
local colorSequenceKeypoint2 = ColorSequenceKeypoint.new(0.32, Color3.fromRGB(255, 255, 0))
local colorSequenceKeypoint3 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 120))
local colorSequenceKeypoint4 = ColorSequenceKeypoint.new(0.68, Color3.fromRGB(0, 180, 255))
local colorSequenceKeypoint5 = ColorSequenceKeypoint.new(0.84, Color3.fromRGB(170, 0, 255))

value108[t1.value2] = new({
	t1.value1,
	colorSequenceKeypoint,
	colorSequenceKeypoint2,
	colorSequenceKeypoint3,
	colorSequenceKeypoint4,
	colorSequenceKeypoint5,
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 120))
})

local value108_2 = t2.value108
t1.value2 = "Transparency"
local new2 = NumberSequence.new
t1.value1 = NumberSequenceKeypoint.new(0, 0.25)

local numberSequenceKeypoint = NumberSequenceKeypoint.new(0.42, 0.55)
local numberSequenceKeypoint2 = NumberSequenceKeypoint.new(0.52, 0)
local numberSequenceKeypoint3 = NumberSequenceKeypoint.new(0.62, 0.55)

value108_2[t1.value2] = new2({
	t1.value1,
	numberSequenceKeypoint,
	numberSequenceKeypoint2,
	numberSequenceKeypoint3,
	NumberSequenceKeypoint.new(1, 0.25)
})

local value108_3 = t2.value108
t1.value2 = "Parent"
value108_3[t1.value2] = UIStroke3
task.spawn(function()
    while t2.value107 and t2.value107.Parent do
        t2.value108.Rotation = (t2.value108.Rotation + 5) % 360
        task.wait(0.03)
    end
end)
t2.value109 = false
t2.value110 = nil
t2.value111 = nil
t2.value112 = nil
local function v56(p44)
    local v434 = p44.Position - t2.value111

    t2.value107.Position = UDim2.new(t2.value112.X.Scale, t2.value112.X.Offset + v434.X, t2.value112.Y.Scale, t2.value112.Y.Offset + v434.Y)
end
t2.value107.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        t2.value109 = true

        t2.value111 = input.Position
        t2.value112 = t2.value107.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                t2.value109 = false
                t2.value110 = nil
                t2.value111 = nil
                t2.value112 = nil
            end
        end)
    end
end)
t2.value107.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        t2.value110 = input
    end
end)
t2.value2.InputChanged:Connect(function(input)
    if input == t2.value110 and t2.value109 then
        v56(input)
    end
end)
t2.value107.MouseButton1Click:Connect(function()
    ToggleUI()
end)

local function v57(p45)
    if not p45 or p45:GetAttribute("ETERNALHUBDraggable") then
        return
    end
    p45:SetAttribute("ETERNALHUBDraggable", true)
    local u441 = false
    local inputPosition
    local p45Position
    p45.InputBegan:Connect(function(input)
        if t2.value54 then
            return
        end

        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            u441 = true
            inputPosition = input.Position
            p45Position = p45.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    u441 = false
                end
            end)
        end
    end)
    t2.value2.InputChanged:Connect(function(input)
        if u441 and input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
            local v676 = input.Position - inputPosition

            if not (math.abs(v676.X) > 4 or math.abs(v676.Y) > 4) then
            end

            p45.Position = UDim2.new(p45Position.X.Scale, p45Position.X.Offset + v676.X, p45Position.Y.Scale, p45Position.Y.Offset + v676.Y)
        end
    end)
end
t2.value113 = nil
t1.value2 = Instance.new("Frame")
t2.value114 = t1.value2
t1.value2 = t2.value114
t1.value2.Name = "MainFrame"
t1.value2 = t2.value114
t1.value2.Size = t2.value25 and UDim2.new(0, 340, 0, 280) or UDim2.new(0, 450, 0, 350)
t1.value2 = t2.value114
t1.value2.Position = t2.value25 and UDim2.new(0.5, -170, 0.5, -140) or UDim2.new(0.5, -225, 0.5, -175)
t1.value2 = t2.value114
t1.value2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
t1.value2 = t2.value114
t1.value2.BorderSizePixel = 0
t1.value2 = t2.value114
t1.value2.Visible = false
t1.value2 = t2.value114
t1.value2.Active = true
t1.value2 = t2.value114
t1.value2.Parent = t2.value104
t2.value115 = Instance.new("UICorner")
t2.value115.CornerRadius = UDim.new(0, 12)
t2.value115.Parent = t2.value114
t2.value116 = Instance.new("UIStroke")
t2.value116.Color = t2.value26.ThemeColor
t2.value116.Thickness = 2
t2.value116.Parent = t2.value114
t2.value117 = Instance.new("UIGradient")

local value117 = t2.value117
t1.value1 = ColorSequence.new
local colorSequenceKeypoint6 = ColorSequenceKeypoint.new(0, Color3.fromRGB(13, 13, 18))

value117.Color = t1.value1({
	colorSequenceKeypoint6,
	ColorSequenceKeypoint.new(1, Color3.fromRGB(22, 18, 32))
})
t2.value117.Rotation = 90
t2.value117.Parent = t2.value114
t2.value118 = Instance.new("Frame")

local value118 = t2.value118
t1.value1 = "Size"
value118[t1.value1] = UDim2.new(1, 0, 0, 50)

local value118_2 = t2.value118
t1.value1 = "BackgroundColor3"
value118_2[t1.value1] = Color3.fromRGB(20, 20, 20)

local value118_3 = t2.value118
t1.value1 = "BorderSizePixel"
value118_3[t1.value1] = 0
local value118_4 = t2.value118
t1.value1 = "Active"
value118_4[t1.value1] = true
local value118_5 = t2.value118
t1.value1 = "Parent"
value118_5[t1.value1] = t2.value114
t1.value1 = Instance.new("UICorner")
t2.value119 = t1.value1
t1.value1 = t2.value119
t1.value1.CornerRadius = UDim.new(0, 12)
t1.value1 = t2.value119
t1.value1.Parent = t2.value118
t2.value120 = Instance.new("UIGradient")
t2.value120.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 28)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 12, 18))
})
t2.value120.Rotation = 0
t2.value120.Parent = t2.value118
t2.value121 = false
t2.value122 = nil
t2.value123 = nil
t2.value118.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        t2.value121 = true
        t2.value122 = input.Position
        t2.value123 = t2.value114.Position
    end
end)
t2.value118.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        t2.value121 = false
    end
end)
t2.value2.InputChanged:Connect(function(input)
    if t2.value121 and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        local v447 = input.Position - t2.value122

        t2.value114.Position = UDim2.new(t2.value123.X.Scale, t2.value123.X.Offset + v447.X, t2.value123.Y.Scale, t2.value123.Y.Offset + v447.Y)
        t2.value113 = t2.value114.Position
    end
end)
t2.value124 = Instance.new("TextLabel")
t2.value124.Size = UDim2.new(0.7, 0, 1, 0)
t2.value124.Position = UDim2.new(0.05, 0, 0, 0)
t2.value124.BackgroundTransparency = 1
t2.value124.Text = "RUBY"
t2.value124.TextColor3 = t2.value26.ThemeColor
t2.value124.TextSize = 20
t2.value124.Font = Enum.Font.GothamBold
t2.value124.TextXAlignment = Enum.TextXAlignment.Left
t2.value124.Parent = t2.value118
t2.value125 = Instance.new("ScrollingFrame")
t2.value125.Size = UDim2.new(1, -20, 0, 40)
t2.value125.Position = UDim2.new(0, 10, 0, 60)
t2.value125.BackgroundTransparency = 1
t2.value125.BorderSizePixel = 0
t2.value125.ScrollBarThickness = 0
t2.value125.CanvasSize = UDim2.new(0, 0, 0, 0)
t2.value125.ScrollingDirection = Enum.ScrollingDirection.X
t2.value125.Parent = t2.value114
t2.value126 = Instance.new("UIListLayout")
t2.value126.FillDirection = Enum.FillDirection.Horizontal
t2.value126.HorizontalAlignment = Enum.HorizontalAlignment.Left
t2.value126.Padding = UDim.new(0, 10)
t2.value126.Parent = t2.value125
t2.value126:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    if t2.value126.FillDirection == Enum.FillDirection.Vertical then
        t2.value125.CanvasSize = UDim2.new(0, 0, 0, t2.value126.AbsoluteContentSize.Y + 10)

        return
    end

    t2.value125.CanvasSize = UDim2.new(0, t2.value126.AbsoluteContentSize.X + 10, 0, 0)
end)
t2.value127 = Instance.new("Frame")
t2.value127.Size = UDim2.new(1, -20, 1, -120)
t2.value127.Position = UDim2.new(0, 10, 0, 110)
t2.value127.BackgroundTransparency = 1
t2.value127.Parent = t2.value114
t2.value128 = Instance.new("Frame")
t2.value128.Name = "ETERNALHUBSkinPreviewPanel"
t2.value128.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
t2.value128.BackgroundTransparency = 0.08
t2.value128.BorderSizePixel = 0
t2.value128.Visible = false
t2.value128.Parent = t2.value114
Instance.new("UICorner", t2.value128).CornerRadius = UDim.new(0, 12)
t2.value129 = Instance.new("UIStroke")
t2.value129.Color = t2.value26.ThemeColor
t2.value129.Thickness = 1.5
t2.value129.Transparency = 0.15
t2.value129.Parent = t2.value128
t2.value130 = Instance.new("TextLabel")
t2.value130.Size = UDim2.new(1, -20, 0, 28)
t2.value130.Position = UDim2.new(0, 10, 0, 10)
t2.value130.BackgroundTransparency = 1
t2.value130.Text = "SUA SKIN"
t2.value130.TextColor3 = t2.value26.ThemeColor
t2.value130.TextSize = 16
t2.value130.Font = Enum.Font.GothamBold
t2.value130.TextXAlignment = Enum.TextXAlignment.Left
t2.value130.Parent = t2.value128
local Frame5 = Instance.new("Frame")

Frame5.Name = "ETERNALHUBAvatarFrame"
Frame5.Size = UDim2.new(1, -30, 0, 300)
Frame5.Position = UDim2.new(0, 15, 0, 50)
Frame5.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
Frame5.BorderSizePixel = 0
Frame5.Parent = t2.value128
Instance.new("UICorner", Frame5).CornerRadius = UDim.new(0, 12)
t2.value131 = Instance.new("UIStroke")
t2.value131.Color = t2.value26.ThemeColor
t2.value131.Thickness = 1.5
t2.value131.Transparency = 0.25
t2.value131.Parent = Frame5
t2.value132 = Instance.new("ImageLabel")
t2.value132.Name = "ETERNALHUBPlayerSkin"
t2.value132.Size = UDim2.new(1, -20, 1, -20)
t2.value132.Position = UDim2.new(0, 10, 0, 10)
t2.value132.BackgroundTransparency = 1
t2.value132.ScaleType = Enum.ScaleType.Fit
t2.value132.Parent = Frame5
pcall(function()
    local UserThumbnailAsync = t2.value4:GetUserThumbnailAsync(t2.value23.UserId, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size420x420)

    t2.value132.Image = UserThumbnailAsync
end)

local TextLabel3 = Instance.new("TextLabel")

TextLabel3.Size = UDim2.new(1, -20, 0, 80)
TextLabel3.Position = UDim2.new(0, 10, 0, 365)
TextLabel3.BackgroundTransparency = 1
TextLabel3.Text = "Preview usando sua própria skin"
TextLabel3.TextColor3 = Color3.fromRGB(220, 220, 220)
TextLabel3.TextSize = 13
TextLabel3.Font = Enum.Font.Gotham
TextLabel3.TextWrapped = true
TextLabel3.TextYAlignment = Enum.TextYAlignment.Top
local function v67(p46, p47, p48, p49)
    local Frame6 = Instance.new("Frame")

    Frame6.Size = UDim2.new(1, 0, 0, 50)
    Frame6.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame6.BorderSizePixel = 0
    Frame6.Parent = p46

    local UICorner5 = Instance.new("UICorner")

    UICorner5.CornerRadius = UDim.new(0, 8)
    UICorner5.Parent = Frame6

    local TextLabel4 = Instance.new("TextLabel")

    TextLabel4.Size = UDim2.new(1, -60, 0, 25)
    TextLabel4.Position = UDim2.new(0, 10, 0, 5)
    TextLabel4.BackgroundTransparency = 1
    TextLabel4.Text = p47
    TextLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel4.TextSize = 14
    TextLabel4.Font = Enum.Font.GothamBold
    TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel4.Parent = Frame6

    local TextButton = Instance.new("TextButton")

    TextButton.Size = UDim2.new(0, 40, 0, 20)
    TextButton.Position = UDim2.new(1, -50, 0, 10)
    TextButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TextButton.Text = ""
    TextButton.Parent = Frame6
    TextButton.BorderSizePixel = 0

    local UICorner6 = Instance.new("UICorner")

    UICorner6.CornerRadius = UDim.new(1, 0)
    UICorner6.Parent = TextButton

    local Frame7 = Instance.new("Frame")

    Frame7.Size = UDim2.new(0, 16, 0, 16)
    Frame7.Position = UDim2.new(0, 2, 0.5, -8)
    Frame7.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Frame7.BorderSizePixel = 0
    Frame7.Parent = TextButton

    local UICorner7 = Instance.new("UICorner")

    UICorner7.CornerRadius = UDim.new(1, 0)
    UICorner7.Parent = Frame7

    local u460 = false

    local function v461(p50)
        u460 = p50
        t2.value1:Create(TextButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
			BackgroundColor3 = u460 and t2.value26.ThemeColor or Color3.fromRGB(40, 40, 40)
		}):Play()
        t2.value1:Create(Frame7, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
			Position = u460 and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
		}):Play()
        p49(u460)

        if t2.value71 then
            t2.value71()
        end
    end

    if p48 then
        t2.value27[p48] = v461
    end

    TextButton.MouseButton1Click:Connect(function()
        v461(not u460)
    end)

    return Frame6
end
TextLabel3.Parent = t2.value128
function t1.value2(p51, p52, p53, p54, p55, p56, p57)
    local Frame8 = Instance.new("Frame")

    Frame8.Size = UDim2.new(1, 0, 0, 60)
    Frame8.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame8.BorderSizePixel = 0
    Frame8.Parent = p51

    local UICorner8 = Instance.new("UICorner")

    UICorner8.CornerRadius = UDim.new(0, 8)
    UICorner8.Parent = Frame8

    local TextLabel5 = Instance.new("TextLabel")

    TextLabel5.Size = UDim2.new(1, -20, 0, 20)
    TextLabel5.Position = UDim2.new(0, 10, 0, 5)
    TextLabel5.BackgroundTransparency = 1
    TextLabel5.Text = p52 .. ": " .. p55
    TextLabel5.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel5.TextSize = 13
    TextLabel5.Font = Enum.Font.Gotham
    TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel5.Parent = Frame8

    local Frame9 = Instance.new("Frame")

    Frame9.Size = UDim2.new(1, -20, 0, 6)
    Frame9.Position = UDim2.new(0, 10, 0, 35)
    Frame9.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame9.BorderSizePixel = 0
    Frame9.Parent = Frame8

    local UICorner9 = Instance.new("UICorner")

    UICorner9.CornerRadius = UDim.new(1, 0)
    UICorner9.Parent = Frame9

    local Frame10 = Instance.new("Frame")

    Frame10.Size = UDim2.new((p55 - p53) / (p54 - p53), 0, 1, 0)
    Frame10.BackgroundColor3 = t2.value26.ThemeColor
    Frame10.Name = "SliderFill"
    Frame10.BorderSizePixel = 0
    Frame10.Parent = Frame9

    local UICorner10 = Instance.new("UICorner")

    UICorner10.CornerRadius = UDim.new(1, 0)
    UICorner10.Parent = Frame10

    local TextButton = Instance.new("TextButton")

    TextButton.Size = UDim2.new(1, 0, 1, 0)
    TextButton.BackgroundTransparency = 1
    TextButton.Text = ""
    TextButton.Parent = Frame9
    TextButton.BorderSizePixel = 0

    local u477 = false

    local function v478(p58)
        local v679 = math.clamp(p58, p53, p54)
        local v680 = (v679 - p53) / (p54 - p53)

        Frame10.Size = UDim2.new(v680, 0, 1, 0)
        TextLabel5.Text = p52 .. ": " .. v679
        p57(v679)

        if t2.value71 then
            t2.value71()
        end
    end

    if p56 then
        t2.value27[p56] = v478
    end

    TextButton.MouseButton1Down:Connect(function()
        u477 = true
    end)
    t2.value2.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            u477 = false
        end
    end)
    t2.value2.InputChanged:Connect(function(input)
        if u477 and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            local v683 = math.clamp((input.Position.X - Frame9.AbsolutePosition.X) / Frame9.AbsoluteSize.X, 0, 1)

            v478((math.floor(p53 + (p54 - p53) * v683)))
        end
    end)

    return Frame8
end
local function v68(p59)
    local TextButton = Instance.new("TextButton")

    TextButton.Size = t2.value25 and UDim2.new(0, 90, 1, 0) or UDim2.new(0, 110, 1, 0)
    TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TextButton.Text = p59
    TextButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    TextButton.TextSize = not t2.value25 and 12 or 10
    TextButton.Font = Enum.Font.GothamBold
    TextButton.Parent = t2.value125
    TextButton.BorderSizePixel = 0

    local UICorner11 = Instance.new("UICorner")

    UICorner11.CornerRadius = UDim.new(0, 8)
    UICorner11.Parent = TextButton

    local ScrollingFrame = Instance.new("ScrollingFrame")

    ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.ScrollBarThickness = 4
    ScrollingFrame.ScrollBarImageColor3 = t2.value26.ThemeColor
    ScrollingFrame.Visible = false
    ScrollingFrame.Parent = t2.value127

    local UIListLayout = Instance.new("UIListLayout")

    UIListLayout.Padding = UDim.new(0, 10)
    UIListLayout.Parent = ScrollingFrame
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
    end)

    return TextButton, ScrollingFrame
end
local function v69(p60, p61, p62, p63, p64)
    local Frame11 = Instance.new("Frame")
    Frame11.Size = UDim2.new(1, 0, 0, not t2.value25 and 100 or 118)
    Frame11.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
    Frame11.BorderSizePixel = 0
    Frame11.Parent = p60
    local UICorner12 = Instance.new("UICorner")
    UICorner12.CornerRadius = UDim.new(0, 10)
    UICorner12.Parent = Frame11
    local UIStroke4 = Instance.new("UIStroke")
    UIStroke4.Color = t2.value26.ThemeColor
    UIStroke4.Thickness = 1
    UIStroke4.Transparency = 0.55
    UIStroke4.Parent = Frame11
    local TextLabel6 = Instance.new("TextLabel")
    TextLabel6.Size = UDim2.new(1, -20, 0, 24)
    TextLabel6.Position = UDim2.new(0, 10, 0, 7)
    TextLabel6.BackgroundTransparency = 1
    TextLabel6.Text = p61 .. ": " .. tostring(p62[1] or "")
    TextLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel6.TextSize = not t2.value25 and 13 or 12
    TextLabel6.Font = Enum.Font.GothamBold
    TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel6.Parent = Frame11
    local Frame12 = Instance.new("Frame")
    Frame12.Size = UDim2.new(1, -20, 1, -38)
    Frame12.Position = UDim2.new(0, 10, 0, 34)
    Frame12.BackgroundTransparency = 1
    Frame12.Parent = Frame11
    local UIGridLayout = Instance.new("UIGridLayout")
    UIGridLayout.CellPadding = UDim2.new(0, 6, 0, 6)
    UIGridLayout.CellSize = t2.value25 and UDim2.new(0.32, -4, 0, 30) or UDim2.new(0.19, -5, 0, 32)
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.Parent = Frame12
    local t16 = {}
    local str = tostring(p62[1] or "")
    local function v497(p65)
        local _tostring = tostring

        if not p65 then
            p65 = str
        end

        str = _tostring(p65)
        TextLabel6.Text = p61 .. ": " .. str

        for k, v in pairs(t16) do
            local v688 = k == str

            v.BackgroundColor3 = v688 and t2.value26.ThemeColor or Color3.fromRGB(35, 35, 40)
            v.TextColor3 = v688 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(210, 210, 210)
        end
    end
    for v500, v501 in ipairs(p62) do

        local v502 = v501
        local TextButton = Instance.new("TextButton")

        TextButton.Name = "Option_" .. tostring(v502)
        TextButton.LayoutOrder = v500
        TextButton.Text = tostring(v502)
        TextButton.TextSize = not t2.value25 and 11 or 10
        TextButton.Font = Enum.Font.GothamBold
        TextButton.AutoButtonColor = true
        TextButton.BorderSizePixel = 0
        TextButton.Parent = Frame12

        local UICorner13 = Instance.new("UICorner")

        UICorner13.CornerRadius = UDim.new(0, 8)
        UICorner13.Parent = TextButton
        t16[tostring(v502)] = TextButton
        TextButton.MouseButton1Click:Connect(function()
            v497(v502)
            p64(v502)

            if t2.value71 then
                t2.value71()
            end
        end)
    end
    if p63 then
        t2.value27[p63] = function(p66)
            v497(p66)
        end
    end
    v497(str)

    return Frame11
end
local v70, v71 = v68("COMBATE")

t1.value1 = v70
t2.value133 = t1.value1
t2.value134 = v71
local v72, v73 = v68("LEGIT")

t1.value1 = v72
t2.value135 = t1.value1
t2.value136 = v73
local v74, v75 = v68("SPIN")

t1.value1 = v75
t2.value137 = v74
t2.value138 = t1.value1
local v76, v77 = v68("MOVIMENTAÇÃO")

t1.value1 = v76
t2.value139 = t1.value1
t2.value140 = v77
local v78, v79 = v68("EQUIPAMENTOS")

t1.value1 = v78
t2.value141 = t1.value1
t2.value142 = v79
local v80, v81 = v68("FPS")

t1.value1 = v80
t2.value143 = t1.value1
t2.value144 = v81
local v82, v83 = v68("INTERFACE")

t1.value1 = v82
t2.value145 = t1.value1
t2.value146 = v83
local v84, v85 = v68("CONFIG")

t1.value1 = v84
t2.value147 = nil
t2.value148 = t1.value1
t2.value149 = v85
function t2.value150()
    for _, child in ipairs(t2.value6:GetChildren()) do
        if child.Name:match("^CLIENT_BALL_") then
            local v507 = child:FindFirstChild("Ball.001")

            if v507 then
                v507:Destroy()
            end
        end
    end
end
t2.value147 = false
function t2.value151()
    if not t2.value26.LeedFeat then
        return
    end

    local Character = t2.value23.Character

    if not Character then
        return
    end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

    if not Humanoid or not HumanoidRootPart then
        return
    end

    HumanoidRootPart.Anchored = false
    HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(HumanoidRootPart.AssemblyLinearVelocity.X, -260, HumanoidRootPart.AssemblyLinearVelocity.Z)

    if t2.value147 then
        return
    end

    t2.value147 = true
    task.spawn(function()
        local timestamp = tick()

        if Character.Parent and Humanoid.FloorMaterial == Enum.Material.Air then
            if not (tick() - timestamp > 2.5) then
            end
        end

        repeat
            task.wait(0.03)
        until not Character.Parent or (Humanoid.FloorMaterial ~= Enum.Material.Air or tick() - timestamp > 2.5)

        if not (Character.Parent and (Humanoid.FloorMaterial ~= Enum.Material.Air and HumanoidRootPart.Parent)) then
        end

        t2.value147 = false
    end)
end
t1.value1 = t2.value134
v67(t1.value1, "Ativar Hitbox", "hitboxEn", function(p67)
    t2.value26.HitboxEnabled = p67

    if not p67 then
        t2.value150()
    end

    if t2.value56 then
        t2.value56()
    end
end)
t1.value2(t2.value134, "Tamanho Hitbox", 1, 80, 1, "hitboxScale", function(p68)
    t2.value26.HitboxSize = p68
end)
t1.value2(t2.value134, "Opacidade Hitbox (%)", 0, 100, 30, "hitboxOpacity", function(p69)
    t2.value26.HitboxTransparency = 1 - p69 / 100
end)
t1.value1 = Instance.new("Frame")
t1.value1.Size = UDim2.new(1, 0, 0, 54)
t1.value1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
t1.value1.BorderSizePixel = 0
t1.value1.Parent = t2.value134
Instance.new("UICorner", t1.value1).CornerRadius = UDim.new(0, 8)

local TextLabel7 = Instance.new("TextLabel")

TextLabel7.Size = UDim2.new(1, -95, 1, 0)
TextLabel7.Position = UDim2.new(0, 10, 0, 0)
TextLabel7.BackgroundTransparency = 1
TextLabel7.Text = "Tecla Hitbox"
TextLabel7.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel7.TextSize = 14
TextLabel7.Font = Enum.Font.GothamBold
TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
TextLabel7.Parent = t1.value1
t2.value152 = Instance.new("TextButton")
t2.value152.Size = UDim2.new(0, 70, 0, 28)
t2.value152.Position = UDim2.new(1, -82, 0.5, -14)
t2.value152.BackgroundColor3 = t2.value26.ThemeColor
t2.value152.Text = t2.value26.HitboxKey
t2.value152.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value152.TextSize = 13
t2.value152.Font = Enum.Font.GothamBold
t2.value152.BorderSizePixel = 0
t2.value152.Parent = t1.value1
t2.value152.Name = "ETERNALHUBThemeButton"
Instance.new("UICorner", t2.value152).CornerRadius = UDim.new(0, 8)
t2.value153 = false
t2.value152.MouseButton1Click:Connect(function()
    t2.value153 = true
    t2.value152.Text = "..."
end)
t2.value2.InputBegan:Connect(function(input, _)
    if not t2.value153 then
        return
    end

    if input.UserInputType == Enum.UserInputType.Keyboard then
        t2.value26.HitboxKey = input.KeyCode.Name
        t2.value152.Text = t2.value26.HitboxKey

        if t2.value71 then
            t2.value71()
        end
    end
end)

function t2.value27.hitboxKeyText(p71)
    local value26_2 = t2.value26
    local _tostring = tostring

    if not p71 then
        p71 = "H"
    end

    value26_2.HitboxKey = _tostring(p71)
    t2.value152.Text = t2.value26.HitboxKey
end
v67(t2.value134, "Hitbox TOUCH (Mobile)", "hitboxTouch", function(p72)
    t2.value26.HitboxTouch = p72
    t2.value56()
end)
v67(t2.value134, "Freeze Air", "freezeAir", function(p73)
    t2.value26.FreezeAir = p73

    if not p73 and t2.value45 then
        t2.value45 = false

        local Character = t2.value23.Character
        local v525 = Character and Character:FindFirstChild("HumanoidRootPart")

        if v525 then
            v525.Anchored = false
        end
    end

    if t2.value58 then
        t2.value58()
    end
end)
v67(t2.value134, "Freeze TOUCH (Mobile)", "freezeTouch", function(p74)
    t2.value26.FreezeTouch = p74

    if t2.value58 then
        t2.value58()
    end
end)
v67(t2.value134, "Leed feat", "leedFeat", function(p75)
    t2.value26.LeedFeat = p75

    if t2.value59 then
        t2.value59()
    end
end)
v67(t2.value134, "Leed feat TOUCH (Mobile)", "leedFeatTouch", function(p76)
    t2.value26.LeedFeatTouch = p76

    if t2.value59 then
        t2.value59()
    end
end)
t1.value1 = Instance.new("Frame")
t1.value1.Size = UDim2.new(1, 0, 0, 54)
t1.value1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
t1.value1.BorderSizePixel = 0
t1.value1.Parent = t2.value134
Instance.new("UICorner", t1.value1).CornerRadius = UDim.new(0, 8)

local TextLabel8 = Instance.new("TextLabel")

TextLabel8.Size = UDim2.new(1, -95, 1, 0)
TextLabel8.Position = UDim2.new(0, 10, 0, 0)
TextLabel8.BackgroundTransparency = 1
TextLabel8.Text = "Tecla Freeze Air"
TextLabel8.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel8.TextSize = 14
TextLabel8.Font = Enum.Font.GothamBold
TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
TextLabel8.Parent = t1.value1
t2.value154 = Instance.new("TextButton")
t2.value154.Size = UDim2.new(0, 70, 0, 28)
t2.value154.Position = UDim2.new(1, -82, 0.5, -14)
t2.value154.BackgroundColor3 = t2.value26.ThemeColor
t2.value154.Text = t2.value26.FreezeAirKey.Name
t2.value154.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value154.TextSize = 13
t2.value154.Font = Enum.Font.GothamBold
t2.value154.BorderSizePixel = 0
t2.value154.Parent = t1.value1
t2.value154.Name = "ETERNALHUBThemeButton"
Instance.new("UICorner", t2.value154).CornerRadius = UDim.new(0, 8)
t2.value155 = false
t2.value154.MouseButton1Click:Connect(function()
    t2.value155 = true
    t2.value154.Text = "..."
end)

local InputBegan2 = t2.value2.InputBegan
function t1.value1(p77, p78)
    if t2.value155 then
        if p77.UserInputType == Enum.UserInputType.Keyboard then
            t2.value26.FreezeAirKey = p77.KeyCode
            t2.value154.Text = p77.KeyCode.Name

            if t2.value71 then
                t2.value71()
            end
        end

        return
    end

    if p78 then
        return
    end

    if not t2.value26.FreezeAir then
        return
    end

    if p77.KeyCode == t2.value26.FreezeAirKey then
        local Character = t2.value23.Character
        local v532 = Character and Character:FindFirstChild("HumanoidRootPart")

        if v532 then
            if t2.value57 then
                t2.value57(not t2.value45)
            else
                t2.value45 = not t2.value45
                v532.Anchored = t2.value45
            end

            if t2.value58 then
                t2.value58()
            end
        end
    end
end
InputBegan2:Connect(t1.value1)

function t2.value27.freezeAirKeyText(p79)
    t2.value26.FreezeAirKey = Enum.KeyCode[tostring(p79)] or Enum.KeyCode.F

    local value154 = t2.value154
    local _tostring = tostring

    if not p79 then
        p79 = "F"
    end

    value154.Text = _tostring(p79)
end
t1.value1 = Instance.new("Frame")
t1.value1.Size = UDim2.new(1, 0, 0, 54)
t1.value1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
t1.value1.BorderSizePixel = 0
t1.value1.Parent = t2.value134
Instance.new("UICorner", t1.value1).CornerRadius = UDim.new(0, 8)

local TextLabel9 = Instance.new("TextLabel")

TextLabel9.Size = UDim2.new(1, -95, 1, 0)
TextLabel9.Position = UDim2.new(0, 10, 0, 0)
TextLabel9.BackgroundTransparency = 1
TextLabel9.Text = "Tecla Leed feat"
TextLabel9.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel9.TextSize = 14
TextLabel9.Font = Enum.Font.GothamBold
TextLabel9.TextXAlignment = Enum.TextXAlignment.Left
TextLabel9.Parent = t1.value1
t2.value156 = Instance.new("TextButton")
t2.value156.Size = UDim2.new(0, 70, 0, 28)
t2.value156.Position = UDim2.new(1, -82, 0.5, -14)
t2.value156.BackgroundColor3 = t2.value26.ThemeColor
t2.value156.Text = t2.value26.LeedFeatKey.Name
t2.value156.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value156.TextSize = 13
t2.value156.Font = Enum.Font.GothamBold
t2.value156.BorderSizePixel = 0
t2.value156.Parent = t1.value1
t2.value156.Name = "ETERNALHUBThemeButton"
Instance.new("UICorner", t2.value156).CornerRadius = UDim.new(0, 8)
t2.value157 = false
t2.value156.MouseButton1Click:Connect(function()
    t2.value157 = true
    t2.value156.Text = "..."
end)

local InputBegan3 = t2.value2.InputBegan
function t1.value1(p80, p81)
    if t2.value157 then
        if p80.UserInputType == Enum.UserInputType.Keyboard then
            t2.value26.LeedFeatKey = p80.KeyCode
            t2.value156.Text = p80.KeyCode.Name

            if t2.value71 then
                t2.value71()
            end
        end

        return
    end

    if p81 then
        return
    end

    if t2.value2:GetFocusedTextBox() then
        return
    end

    if not t2.value26.LeedFeat then
        return
    end

    if p80.UserInputType == Enum.UserInputType.Keyboard and p80.KeyCode == t2.value26.LeedFeatKey then
        t2.value151()
    end
end
InputBegan3:Connect(t1.value1)

function t2.value27.leedFeatKeyText(p82)
    t2.value26.LeedFeatKey = Enum.KeyCode[tostring(p82)] or Enum.KeyCode.G

    local value156 = t2.value156
    local _tostring = tostring

    if not p82 then
        p82 = "G"
    end

    value156.Text = _tostring(p82)
end
v67(t2.value136, "Auto Long", "autoLong", function(p83)
    t2.value26.AutoLong = p83

    if not p83 then
        v35()
    end

    if t2.value49 then
        t2.value49()
    end

    t2.value38(not ("AUTO LONG: " .. p83) and "OFF ❌" or "ON ✅")
end)
v67(t2.value136, "Auto Long TOUCH (Mobile)", "autoLongTouch", function(p84)
    t2.value26.AutoLongTouch = p84

    if t2.value49 then
        t2.value49()
    end
end)
t1.value2(t2.value136, "Ângulo Long (graus)", 0, 30, 15, "autoLongAngle", function(p85)
    t2.value26.AutoLongAngle = p85
end)
t1.value1 = Instance.new("Frame")
t1.value1.Size = UDim2.new(1, 0, 0, 54)
t1.value1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
t1.value1.BorderSizePixel = 0
t1.value1.Parent = t2.value136
Instance.new("UICorner", t1.value1).CornerRadius = UDim.new(0, 8)

local TextLabel10 = Instance.new("TextLabel")

TextLabel10.Size = UDim2.new(0.5, -10, 1, 0)
TextLabel10.Position = UDim2.new(0, 10, 0, 0)
TextLabel10.BackgroundTransparency = 1
TextLabel10.Text = "Direção Long"
TextLabel10.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel10.TextSize = 14
TextLabel10.Font = Enum.Font.GothamBold
TextLabel10.TextXAlignment = Enum.TextXAlignment.Left
TextLabel10.Parent = t1.value1
t2.value158 = Instance.new("TextButton")
t2.value158.Size = UDim2.new(0, 80, 0, 28)
t2.value158.Position = UDim2.new(1, -172, 0.5, -14)
t2.value158.Text = "ESQUERDA"
t2.value158.TextSize = 10
t2.value158.Font = Enum.Font.GothamBold
t2.value158.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value158.BorderSizePixel = 0
t2.value158.Parent = t1.value1
Instance.new("UICorner", t2.value158).CornerRadius = UDim.new(0, 8)
t2.value159 = Instance.new("TextButton")
t2.value159.Size = UDim2.new(0, 80, 0, 28)
t2.value159.Position = UDim2.new(1, -86, 0.5, -14)
t2.value159.Text = "DIREITA"
t2.value159.TextSize = 11
t2.value159.Font = Enum.Font.GothamBold
t2.value159.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value159.BorderSizePixel = 0
t2.value159.Parent = t1.value1
Instance.new("UICorner", t2.value159).CornerRadius = UDim.new(0, 8)

local function v92()
    t2.value158.BackgroundColor3 = t2.value26.AutoLongDir == "ESQUERDA" and t2.value26.ThemeColor or Color3.fromRGB(40, 40, 40)
    t2.value159.BackgroundColor3 = t2.value26.AutoLongDir == "DIREITA" and t2.value26.ThemeColor or Color3.fromRGB(40, 40, 40)
end
v92()
t2.value158.MouseButton1Click:Connect(function()
    t2.value26.AutoLongDir = "ESQUERDA"
    v92()

    if t2.value71 then
        t2.value71()
    end
end)
t2.value159.MouseButton1Click:Connect(function()
    t2.value26.AutoLongDir = "DIREITA"
    v92()

    if t2.value71 then
        t2.value71()
    end
end)
t1.value1 = Instance.new("Frame")
t1.value1.Size = UDim2.new(1, 0, 0, 54)
t1.value1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
t1.value1.BorderSizePixel = 0
t1.value1.Parent = t2.value136
Instance.new("UICorner", t1.value1).CornerRadius = UDim.new(0, 8)

local TextLabel11 = Instance.new("TextLabel")

TextLabel11.Size = UDim2.new(1, -95, 1, 0)
TextLabel11.Position = UDim2.new(0, 10, 0, 0)
TextLabel11.BackgroundTransparency = 1
TextLabel11.Text = "Tecla Auto Long (PC)"
TextLabel11.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel11.TextSize = 14
TextLabel11.Font = Enum.Font.GothamBold
TextLabel11.TextXAlignment = Enum.TextXAlignment.Left
TextLabel11.Parent = t1.value1
t2.value160 = Instance.new("TextButton")
t2.value160.Size = UDim2.new(0, 70, 0, 28)
t2.value160.Position = UDim2.new(1, -82, 0.5, -14)
t2.value160.BackgroundColor3 = t2.value26.ThemeColor
t2.value160.Text = t2.value26.AutoLongKey.Name
t2.value160.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value160.TextSize = 13
t2.value160.Font = Enum.Font.GothamBold
t2.value160.BorderSizePixel = 0
t2.value160.Name = "ETERNALHUBThemeButton"
t2.value160.Parent = t1.value1
Instance.new("UICorner", t2.value160).CornerRadius = UDim.new(0, 8)
t2.value161 = false
t2.value160.MouseButton1Click:Connect(function()
    t2.value161 = true
    t2.value160.Text = "..."
end)
t2.value2.InputBegan:Connect(function(input, _)
    if t2.value161 then
        if input.UserInputType == Enum.UserInputType.Keyboard then
            t2.value26.AutoLongKey = input.KeyCode
            t2.value160.Text = input.KeyCode.Name

            if t2.value71 then
                t2.value71()
            end
        end

        return
    end
end)

local value27 = t2.value27
t1.value1 = "autoLongKeyText"
value27[t1.value1] = function(p87)
    t2.value26.AutoLongKey = Enum.KeyCode[tostring(p87)] or Enum.KeyCode.L

    local value160 = t2.value160
    local _tostring = tostring

    if not p87 then
        p87 = "L"
    end

    value160.Text = _tostring(p87)
end
v67(t2.value138, "STYLE SPIN", "autoSpinStyle", function(p88)
    t2.value26.AutoSpinStyle = p88
end)
v67(t2.value138, "HAB SPIN", "autoSpinHabi", function(p89)
    t2.value26.AutoSpinHabi = p89
end)
v67(t2.value138, "YEN", "autoYen", function(p90)
    t2.value26.AutoYen = p90
end)

function t2.value56()
    if t2.value39 then
        t2.value39.Visible = t2.value26.HitboxTouch == true
        t2.value39.BackgroundColor3 = t2.value26.HitboxEnabled and t2.value26.ThemeColor or Color3.fromRGB(20, 20, 20)
        t2.value39.Text = not t2.value26.HitboxEnabled and "HIT OFF" or "HIT ON"

        if t2.value40 then
            t2.value40.Color = t2.value26.ThemeColor
        end
    end
end
t2.value39 = Instance.new("TextButton")
t2.value39.Name = "ETERNALHUBHitboxTouchButton"
t2.value39.Size = UDim2.new(0, 82, 0, 34)
t2.value39.Position = UDim2.new(1, -96, 0.62, 0)
t2.value39.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
t2.value39.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value39.TextSize = 11
t2.value39.Font = Enum.Font.GothamBold
t2.value39.Text = "HIT OFF"
t2.value39.Visible = false
t2.value39.BorderSizePixel = 0
t2.value39.Parent = t2.value104
if v57 then
    v57(t2.value39)
end
Instance.new("UICorner", t2.value39).CornerRadius = UDim.new(0, 10)
t2.value40 = Instance.new("UIStroke")
t2.value40.Thickness = 2
t2.value40.Color = t2.value26.ThemeColor
t2.value40.Parent = t2.value39
t2.value39.MouseButton1Click:Connect(function()
    t2.value26.HitboxEnabled = not t2.value26.HitboxEnabled

    if not t2.value26.HitboxEnabled then
        t2.value150()
    end

    if t2.value27.hitboxEn then
        t2.value27.hitboxEn(t2.value26.HitboxEnabled)
    end

    t2.value56()

    if t2.value71 then
        t2.value71()
    end
end)

function t2.value57(p91)
    t2.value45 = p91

    local Character = t2.value23.Character
    local v554 = Character and Character:FindFirstChild("HumanoidRootPart")

    if v554 then
        v554.Anchored = t2.value45
    end
end
function t2.value58()
    if t2.value41 then
        t2.value41.Visible = t2.value26.FreezeTouch == true and t2.value25 == true

        local value41 = t2.value41
        local value45 = t2.value45

        if value45 then
            value45 = t2.value26.ThemeColor
        end

        value41.BackgroundColor3 = value45 or Color3.fromRGB(20, 20, 20)
        t2.value41.Text = not t2.value45 and "FREEZE OFF" or "FREEZE ON"

        if t2.value42 then
            t2.value42.Color = t2.value26.ThemeColor
        end
    end
end
t2.value41 = Instance.new("TextButton")
t2.value41.Name = "ETERNALHUBFreezeTouchButton"
t2.value41.Size = UDim2.new(0, 96, 0, 34)
t2.value41.Position = UDim2.new(1, -110, 0.7, 0)
t2.value41.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
t2.value41.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value41.TextSize = 11
t2.value41.Font = Enum.Font.GothamBold
t2.value41.Text = "FREEZE OFF"
t2.value41.Visible = false
t2.value41.BorderSizePixel = 0
t2.value41.Parent = t2.value104
if v57 then
    v57(t2.value41)
end
Instance.new("UICorner", t2.value41).CornerRadius = UDim.new(0, 10)
t2.value42 = Instance.new("UIStroke")
t2.value42.Thickness = 2
t2.value42.Color = t2.value26.ThemeColor
t2.value42.Parent = t2.value41
local MouseButton1Click = t2.value41.MouseButton1Click
function t1.value1()
    if not t2.value26.FreezeAir then
        t2.value26.FreezeAir = true

        if t2.value27.freezeAir then
            t2.value27.freezeAir(true)
        end
    end

    local value45 = t2.value45

    t2.value57(not value45)
    t2.value58()

    if t2.value71 then
        t2.value71()
    end
end
MouseButton1Click:Connect(t1.value1)

function t2.value59()
    if t2.value43 then
        t2.value43.Visible = t2.value26.LeedFeatTouch == true and t2.value25 == true
        t2.value43.BackgroundColor3 = t2.value26.LeedFeat and t2.value26.ThemeColor or Color3.fromRGB(20, 20, 20)
        t2.value43.Text = not t2.value26.LeedFeat and "LEED OFF" or "LEED"

        if t2.value44 then
            t2.value44.Color = t2.value26.ThemeColor
        end
    end
end
t2.value43 = Instance.new("TextButton")

local value43 = t2.value43
t1.value1 = "Name"
value43[t1.value1] = "ETERNALHUBLeedFeatTouchButton"
local value43_2 = t2.value43
t1.value1 = "Size"
value43_2[t1.value1] = UDim2.new(0, 96, 0, 34)

local value43_3 = t2.value43
t1.value1 = "Position"
value43_3[t1.value1] = UDim2.new(1, -110, 0.78, 0)

local value43_4 = t2.value43
t1.value1 = "BackgroundColor3"
value43_4[t1.value1] = Color3.fromRGB(20, 20, 20)

local value43_5 = t2.value43
t1.value1 = "TextColor3"
value43_5[t1.value1] = Color3.fromRGB(255, 255, 255)

local value43_6 = t2.value43
t1.value1 = "TextSize"
value43_6[t1.value1] = 11
local value43_7 = t2.value43
t1.value1 = "Font"
value43_7[t1.value1] = Enum.Font.GothamBold
local value43_8 = t2.value43
t1.value1 = "Text"
value43_8[t1.value1] = "LEED OFF"
local value43_9 = t2.value43
t1.value1 = "Visible"
value43_9[t1.value1] = false
local value43_10 = t2.value43
t1.value1 = "BorderSizePixel"
value43_10[t1.value1] = 0
local value43_11 = t2.value43
t1.value1 = "Parent"
value43_11[t1.value1] = t2.value104
if v57 then
    v57(t2.value43)
end
t1.value1 = Instance.new("UICorner", t2.value43)
t1.value1.CornerRadius = UDim.new(0, 10)
t2.value44 = Instance.new("UIStroke")
t2.value44.Thickness = 2
t2.value44.Color = t2.value26.ThemeColor
t2.value44.Parent = t2.value43
t2.value43.MouseButton1Click:Connect(function()
    if not t2.value26.LeedFeat then
        t2.value26.LeedFeat = true

        if t2.value27.leedFeat then
            t2.value27.leedFeat(true)
        end
    end

    t2.value151()
    t2.value59()

    if t2.value71 then
        t2.value71()
    end
end)

function t2.value49()
    if t2.value47 then
        t2.value47.Visible = t2.value26.AutoLongTouch == true
        t2.value47.BackgroundColor3 = t2.value26.AutoLong and t2.value26.ThemeColor or Color3.fromRGB(20, 20, 20)
        t2.value47.Text = not t2.value26.AutoLong and "LONG OFF" or "LONG ON"

        if t2.value48 then
            t2.value48.Color = t2.value26.ThemeColor
        end
    end

    if t2.value55 then
        local value55 = t2.value55
        local AutoLongTouch = t2.value26.AutoLongTouch

        if not AutoLongTouch then
            AutoLongTouch = t2.value26.HitboxTouch or (t2.value26.FreezeTouch or t2.value26.LeedFeatTouch)
        end

        value55.Visible = AutoLongTouch
        t2.value55.Text = "RB"
        t2.value55.BackgroundColor3 = t2.value54 and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(210, 0, 0)
    end
end
t2.value47 = Instance.new("TextButton")
t2.value47.Name = "ETERNALHUBAutoLongTouchButton"
t2.value47.Size = UDim2.new(0, 96, 0, 34)
t2.value47.Position = UDim2.new(1, -110, 0.86, 0)
t2.value47.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
t2.value47.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value47.TextSize = 11
t2.value47.Font = Enum.Font.GothamBold
t2.value47.Text = "LONG OFF"
t2.value47.Visible = false
t2.value47.BorderSizePixel = 0
t2.value47.Parent = t2.value104
if v57 then
    v57(t2.value47)
end
Instance.new("UICorner", t2.value47).CornerRadius = UDim.new(0, 10)
t2.value48 = Instance.new("UIStroke")
t2.value48.Thickness = 2
t2.value48.Color = t2.value26.ThemeColor
t2.value48.Parent = t2.value47
local MouseButton1Click2 = t2.value47.MouseButton1Click
function t1.value1()
    t2.value26.AutoLong = not t2.value26.AutoLong

    if not t2.value26.AutoLong then
        v35()
    end

    if t2.value27.autoLong then
        t2.value27.autoLong(t2.value26.AutoLong)
    end

    t2.value49()
    t2.value38(not ("AUTO LONG: " .. t2.value26.AutoLong) and "OFF ❌" or "ON ✅")
end
MouseButton1Click2:Connect(t1.value1)

function t2.value162()
    local Character = t2.value23.Character

    if not Character then
        return
    end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    if not Humanoid then
        return
    end

    Humanoid.StateChanged:Connect(function(_, newState)
        if (newState == Enum.HumanoidStateType.Freefall or newState == Enum.HumanoidStateType.Jumping) and (t2.value26.AutoLong and t2.value25) then
            t2.value102()
            t2.value49()
        end
    end)
end
t2.value162()
t2.value23.CharacterAdded:Connect(function()
    task.wait(0.5)
    t2.value162()
end)
t2.value55 = Instance.new("TextButton")
t2.value55.Name = "ETERNALHUBLockButton"
t2.value55.Size = UDim2.new(0, 40, 0, 34)
t2.value55.Position = UDim2.new(0.5, -20, 0.35, -17)
t2.value55.BackgroundColor3 = Color3.fromRGB(210, 0, 0)
t2.value55.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value55.TextSize = 18
t2.value55.Font = Enum.Font.GothamBold
t2.value55.Text = "RB"
t2.value55.Visible = false
t2.value55.BorderSizePixel = 0
t2.value55.Parent = t2.value104
Instance.new("UICorner", t2.value55).CornerRadius = UDim.new(0, 10)

local UIStroke5 = Instance.new("UIStroke")

UIStroke5.Thickness = 2
UIStroke5.Color = t2.value26.ThemeColor
UIStroke5.Parent = t2.value55
t2.value55.MouseButton1Click:Connect(function()
    t2.value54 = not t2.value54
    t2.value49()
end)
t2.value2.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end

    if t2.value2:GetFocusedTextBox() then
        return
    end

    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode.Name == t2.value26.HitboxKey then
        t2.value26.HitboxEnabled = not t2.value26.HitboxEnabled

        if not t2.value26.HitboxEnabled then
            t2.value150()
        end

        if t2.value27.hitboxEn then
            t2.value27.hitboxEn(t2.value26.HitboxEnabled)
        end

        t2.value56()

        if t2.value71 then
            t2.value71()
        end
    end
end)
v67(t2.value140, "Pulo Direcional", "directionalJump", function(p93)
    t2.value26.CameraJump = p93
end)
v67(t2.value140, "ESP (Head Line)", "espEnabled", function(p94)
    t2.value26.ESPEnabled = p94
end)
v67(t2.value140, "ESP Neon", "espNeon", function(p95)
    t2.value26.ESPNeon = p95
end)
t1.value2(t2.value140, "Tamanho Linha ESP", 1, 115, 10, "espLineSize", function(p96)
    t2.value26.ESPLineSize = p96
end)
v67(t2.value140, "MIRA VISUAL", "crosshairEnabled", function(p97)
    t2.value26.CrosshairEnabled = p97

    if t2.value53 then
        t2.value53()
    end
end)
v69(t2.value140, "TIPO MIRA", {
	"CRUZ",
	"PONTO",
	"CIRCULO",
	"X"
}, "crosshairStyle", function(p98)
    local value26_3 = t2.value26
    local _tostring = tostring

    if not p98 then
        p98 = "CRUZ"
    end

    value26_3.CrosshairStyle = _tostring(p98)

    if t2.value53 then
        t2.value53()
    end
end)
t1.value2(t2.value140, "ALTURA MIRA 0 TOPO / 50 MEIO", 0, 50, 50, "crosshairY", function(p99)
    t2.value26.CrosshairY = math.clamp(tonumber(p99) or 50, 0, 50)

    if t2.value53 then
        t2.value53()
    end
end)
t2.value163 = nil
function t1.value1()
    t2.value50()
    t2.value51()
    t2.value52()
end
t2.value164 = nil
t2.value165 = nil
t2.value166 = nil
t2.value167 = nil
function t1.value2()
    if not t2.value164 then
        return
    end

    local v573 = t2.value26.JerseyPijamaEnabled == true

    t2.value164.Visible = v573
    t2.value164.Size = v573 and t2.value167 or UDim2.new(1, 0, 0, 0)
end
t2.value168 = nil
t2.value164 = nil
t2.value167 = nil
function t2.value50()
    if not t2.value163 then
        return
    end

    local v575 = t2.value26.JerseyDragaoEnabled == true

    t2.value163.Visible = v575
    t2.value163.Size = v575 and t2.value165 or UDim2.new(1, 0, 0, 0)
end
function t2.value51()
    if not t2.value166 then
        return
    end

    local v574 = t2.value26.JerseyAtomicEnabled == true

    t2.value166.Visible = v574
    t2.value166.Size = v574 and t2.value168 or UDim2.new(1, 0, 0, 0)
end
t2.value52 = t1.value2
t2.value169 = t1.value1
v67(t2.value142, "JERSEY", "jerseyEnabled", function(p100)
    t2.value26.JerseyEnabled = p100
    v23()
    t2.value169()
end)
v67(t2.value142, "JERSEY PIJAMA", "jerseyPijamaEnabled", function(p101)
    t2.value26.JerseyPijamaEnabled = p101
    UpdateJerseyPijama()
    t2.value169()
end)
t2.value167 = v69(t2.value142, "TIME PIJAMA", {
	"PRETO",
	"ORANGE",
	"ROXO",
	"VERMELHO",
	"BRANCO"
}, "jerseyPijamaTeam", function(p102)
    t2.value93(p102)
end).Size
v67(t2.value142, "JERSEY DRAGÃO 🐉", "jerseyDragaoEnabled", function(p103)
    t2.value26.JerseyDragaoEnabled = p103
    t2.value89()
    t2.value169()
end)
t2.value165 = v69(t2.value142, "TIME DRAGÃO", {
	"PRETA",
	"LARANJA",
	"ROXO",
	"VERMELHO",
	"BRANCO"
}, "jerseyDragaoTeam", function(p104)
    v30(p104)
end).Size
v67(t2.value142, "JERSEY ATOMIC ⚛\239\184\143", "jerseyAtomicEnabled", function(p105)
    t2.value26.JerseyAtomicEnabled = p105
    t2.value82()
    t2.value169()
end)
t2.value168 = v69(t2.value142, "TIME ATOMIC", {
	"PRETA",
	"LARANJA",
	"ROXO",
	"VERMELHO",
	"BRANCO"
}, "jerseyAtomicTeam", function(p106)
    t2.value80(p106)
end).Size
t2.value169()
v67(t2.value144, "FPS Boost / Otimização", "fpsBoost", function(p107)
    t2.value26.FPSBoost = p107
    t2.value74()
end)
v67(t2.value144, "Modo Noite", "nightMode", function(p108)
    t2.value26.NightMode = p108
    t2.value74()
end)
v67(t2.value144, "Chão Cinza", "grayFloor", function(p109)
    t2.value26.GrayFloor = p109
    t2.value74()
end)
v67(t2.value144, "Remover Sombras", "noShadows", function(p110)
    t2.value26.NoShadows = p110
    t2.value74()
end)
t2.value170 = 0
t2.value171 = nil
t2.value172 = nil
function t2.value172(p111)
    for _, v in ipairs({
		"Head",
		"HumanoidRootPart"
	}) do
        local v2 = p111:FindFirstChild(v)

        if v2 then
            for _, child in ipairs(v2:GetChildren()) do
                if not child:IsA("BillboardGui") then
                    continue
                end
                for v595, v596 in ipairs(child:GetDescendants()) do

                    local v597 = v596:IsA("TextLabel")

                    if v597 then
                        v597 = v596.Name:lower():find("name")

                        if not v597 then
                            v597 = v596.Name:lower():find("tag") or (v596.Name:lower():find("title") or v596.Name:lower():find("text"))
                        end
                    end

                    if v597 then
                        return v596
                    end
                end
                for _, descendant in ipairs(child:GetDescendants()) do
                    if descendant:IsA("TextLabel") then
                        return descendant
                    end
                end
            end
        end
    end

    return nil
end
function t2.value173()
    if t2.value171 then
        t2.value171:Disconnect()
        t2.value171 = nil
    end

    if not t2.value26.RainbowTag then
        return
    end

    t2.value171 = t2.value3.RenderStepped:Connect(function()
        local Character = t2.value23.Character

        if not Character then
            return
        end

        local v694 = t2.value172(Character)

        if not v694 then
            return
        end

        local v695 = t2.value26.CustomTagName ~= "" and t2.value26.CustomTagName or t2.value23.DisplayName

        if v695 ~= v694.Text then
            v694.Text = v695
        end

        t2.value170 = (t2.value170 + 0.5) % 360
        v694.TextColor3 = Color3.fromHSV(t2.value170 / 360, 1, 1)
        v694.TextStrokeTransparency = 0.5
        v694.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        v694.RichText = false
    end)
end
t2.value23.CharacterAdded:Connect(function()
    task.wait(1)

    if t2.value26.RainbowTag then
        t2.value173()
    end
end)

local function v109(p112)
    t2.value26.InterfaceMode = p112

    if p112 == "PC" and not t2.value25 then
        t2.value114.Size = UDim2.new(0, 1040, 0, 620)
        t2.value114.Position = t2.value113 or UDim2.new(0.5, -520, 0.5, -310)
        t2.value114.BackgroundTransparency = 0.04
        t2.value115.CornerRadius = UDim.new(0, 18)
        t2.value116.Thickness = 2.5
        t2.value114.BackgroundColor3 = Color3.fromRGB(11, 11, 16)
        t2.value118.Size = UDim2.new(1, 0, 0, 72)
        t2.value118.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
        t2.value119.CornerRadius = UDim.new(0, 18)

        if t2.value117 then
            t2.value117.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(11, 11, 16)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(24, 20, 35))
			})
        end

        if t2.value120 then
            t2.value120.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 24, 42)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(11, 11, 18))
			})
        end

        t2.value124.Size = UDim2.new(1, -40, 1, 0)
        t2.value124.Position = UDim2.new(0, 24, 0, 0)
        t2.value124.Text = "RUBY"
        t2.value124.TextSize = 24
        t2.value125.Size = UDim2.new(0, 162, 1, -100)
        t2.value125.Position = UDim2.new(0, 18, 0, 86)
        t2.value125.ScrollingDirection = Enum.ScrollingDirection.Y
        t2.value126.FillDirection = Enum.FillDirection.Vertical
        t2.value126.HorizontalAlignment = Enum.HorizontalAlignment.Left
        t2.value126.VerticalAlignment = Enum.VerticalAlignment.Top
        t2.value126.Padding = UDim.new(0, 8)
        t2.value127.Size = UDim2.new(1, -498, 1, -104)
        t2.value127.Position = UDim2.new(0, 196, 0, 86)

        if t2.value128 then
            t2.value128.Visible = true
            t2.value128.Size = UDim2.new(0, 280, 1, -104)
            t2.value128.Position = UDim2.new(1, -298, 0, 86)
            t2.value128.BackgroundTransparency = 0.06
            t2.value128.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
        end

        for _, child in ipairs(t2.value125:GetChildren()) do
            if child:IsA("TextButton") then
                child.Size = UDim2.new(1, -4, 0, 42)
                child.BackgroundTransparency = 0.04
                child.TextSize = 12
                child.TextXAlignment = Enum.TextXAlignment.Center
            end
        end
    else
        t2.value114.Size = t2.value25 and UDim2.new(0, 382, 0, 336) or UDim2.new(0, 500, 0, 380)
        t2.value114.BackgroundTransparency = 0.02
        t2.value114.Position = t2.value113 or (t2.value25 and UDim2.new(0.5, -191, 0.5, -168) or UDim2.new(0.5, -250, 0.5, -190))
        t2.value114.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
        t2.value115.CornerRadius = UDim.new(0, not t2.value25 and 14 or 16)
        t2.value116.Thickness = not t2.value25 and 2.2 or 2
        t2.value118.Size = UDim2.new(1, 0, 0, not t2.value25 and 56 or 54)
        t2.value118.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
        t2.value119.CornerRadius = UDim.new(0, not t2.value25 and 14 or 16)

        if t2.value117 then
            t2.value117.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 12, 18)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(24, 20, 34))
			})
        end

        if t2.value120 then
            t2.value120.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(29, 24, 42)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 22))
			})
        end

        t2.value124.Size = UDim2.new(1, -24, 1, 0)
        t2.value124.Position = UDim2.new(0, 16, 0, 0)
        t2.value124.Text = "RUBY"
        t2.value124.TextSize = not t2.value25 and 20 or 18
        t2.value125.Size = UDim2.new(1, -20, 0, not t2.value25 and 42 or 40)
        t2.value125.Position = UDim2.new(0, 10, 0, not t2.value25 and 66 or 64)
        t2.value125.ScrollingDirection = Enum.ScrollingDirection.X
        t2.value126.FillDirection = Enum.FillDirection.Horizontal
        t2.value126.HorizontalAlignment = Enum.HorizontalAlignment.Left
        t2.value126.VerticalAlignment = Enum.VerticalAlignment.Top
        t2.value126.Padding = UDim.new(0, not t2.value25 and 9 or 7)
        t2.value127.Size = UDim2.new(1, -20, 1, not t2.value25 and -126 or -116)
        t2.value127.Position = UDim2.new(0, 10, 0, not t2.value25 and 118 or 110)

        if t2.value128 then
            t2.value128.Visible = false
        end

        for _, child in ipairs(t2.value125:GetChildren()) do
            if child:IsA("TextButton") then
                child.Size = t2.value25 and UDim2.new(0, 104, 1, 0) or UDim2.new(0, 122, 1, 0)
                child.BackgroundTransparency = 0.04
                child.TextSize = not t2.value25 and 12 or 10
                child.TextXAlignment = Enum.TextXAlignment.Center
            end
        end
    end

    if t2.value126.FillDirection == Enum.FillDirection.Vertical then
        t2.value125.CanvasSize = UDim2.new(0, 0, 0, t2.value126.AbsoluteContentSize.Y + 10)
    else
        t2.value125.CanvasSize = UDim2.new(0, t2.value126.AbsoluteContentSize.X + 10, 0, 0)
    end

    if t2.value71 then
        t2.value71()
    end
end
t2.value26.RainbowTag = false
t2.value26.CustomTagName = ""
if t2.value171 then
    t2.value171:Disconnect()
end
v67(t2.value146, "Interface Mobile", "interfaceANTIGA", function(p113)
    if p113 then
        v109("ANTIGA")

        if t2.value27.interfacePC then
            t2.value27.interfacePC(false)
        end
    end
end)
v67(t2.value146, "Interface PC", "interfacePC", function(p114)
    if p114 then
        v109("PC")

        if t2.value27.interfaceANTIGA then
            t2.value27.interfaceANTIGA(false)
        end
    end
end)

local Frame13 = Instance.new("Frame")

Frame13.Size = UDim2.new(1, 0, 0, 165)
Frame13.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame13.BorderSizePixel = 0
Frame13.Parent = t2.value149
local UICorner14 = Instance.new("UICorner")

UICorner14.CornerRadius = UDim.new(0, 8)
UICorner14.Parent = Frame13
local TextLabel12 = Instance.new("TextLabel")

TextLabel12.Size = UDim2.new(1, -20, 0, 25)
TextLabel12.Position = UDim2.new(0, 10, 0, 5)
TextLabel12.BackgroundTransparency = 1
TextLabel12.Text = "Cor da Interface"
TextLabel12.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel12.TextSize = 14
TextLabel12.Font = Enum.Font.GothamBold
TextLabel12.TextXAlignment = Enum.TextXAlignment.Left
TextLabel12.Parent = Frame13
t1.value2 = Color3.fromRGB(138, 43, 226)

local t17 = {
	name = "Roxo",
	color = t1.value2
}
local color3 = Color3.fromRGB(0, 150, 255)
local t18 = {
	name = "Azul",
	color = color3
}
local color3_5 = Color3.fromRGB(0, 255, 100)
local t19 = {
	name = "Verde",
	color = color3_5
}
local color3_6 = Color3.fromRGB(255, 50, 50)
local t20 = {
	name = "Vermelho",
	color = color3_6
}
local color3_7 = Color3.fromRGB(255, 105, 180)
local t21 = {
	name = "Rosa",
	color = color3_7
}
t1.value2 = Color3.fromRGB(255, 140, 0)
t1.value2 = {
	name = "Laranja",
	color = t1.value2
}
t1.value1 = Color3.fromRGB(0, 255, 255)

local t22 = {
	name = "Ciano",
	color = t1.value1
}
local color3_8 = Color3.fromRGB(255, 255, 0)
local t23 = {
	name = "Amarelo",
	color = color3_8
}
t1.value1 = Color3.fromRGB(0, 0, 0)

local t24 = {
	name = "Preto",
	color = t1.value1
}
t1.value1 = "Branco"
local color3_9 = Color3.fromRGB(255, 255, 255)
local t25 = {
	name = t1.value1,
	color = color3_9
}
local t26 = {
	t17,
	t18,
	t19,
	t20,
	t21,
	t1.value2,
	t22,
	t23,
	t24,
	t25
}
local Frame14 = Instance.new("Frame")

Frame14.Name = "PresetsContainer"
Frame14.Size = UDim2.new(1, -20, 0, 115)
Frame14.Position = UDim2.new(0, 10, 0, 35)
Frame14.BackgroundTransparency = 1
Frame14.Parent = Frame13
local UIGridLayout = Instance.new("UIGridLayout")

UIGridLayout.CellSize = UDim2.new(0, 95, 0, 30)
UIGridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
UIGridLayout.Parent = Frame14
function t2.value174()
    t2.value116.Color = t2.value26.ThemeColor
    if t2.value26.ThemeColor == Color3.fromRGB(255, 255, 255) then
        t2.value114.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
        t2.value118.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    else
        t2.value114.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        t2.value118.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    end
    if t2.value26.ThemeColor == Color3.fromRGB(255, 255, 255) then
        t2.value124.TextColor3 = Color3.fromRGB(220, 220, 220)
    else
        t2.value124.TextColor3 = t2.value26.ThemeColor
    end
    if t2.value134.Visible then
        t2.value133.BackgroundColor3 = t2.value26.ThemeColor
    end
    if t2.value136.Visible then
        t2.value135.BackgroundColor3 = t2.value26.ThemeColor
    end
    if t2.value138.Visible then
        t2.value137.BackgroundColor3 = t2.value26.ThemeColor
    end
    if t2.value140.Visible then
        t2.value139.BackgroundColor3 = t2.value26.ThemeColor
    end
    if t2.value142.Visible then
        t2.value141.BackgroundColor3 = t2.value26.ThemeColor
    end
    if t2.value144.Visible then
        t2.value143.BackgroundColor3 = t2.value26.ThemeColor
    end
    if t2.value146.Visible then
        t2.value145.BackgroundColor3 = t2.value26.ThemeColor
    end
    if t2.value149.Visible then
        t2.value148.BackgroundColor3 = t2.value26.ThemeColor
    end
    for v609, v610 in pairs(t2.value127:GetChildren()) do

        for _, child in pairs(v610:GetChildren()) do
            for _, descendant in pairs(child:GetDescendants()) do
                if descendant.Name == "SliderFill" and descendant:IsA("Frame") then
                    descendant.BackgroundColor3 = t2.value26.ThemeColor
                end
            end

            local ToggleButton = child:FindFirstChild("ToggleButton")

            if ToggleButton and ToggleButton:IsA("TextButton") and ToggleButton.BackgroundColor3 ~= Color3.fromRGB(40, 40, 40) then
                ToggleButton.BackgroundColor3 = t2.value26.ThemeColor
            end
        end
    end
    for v618, v619 in ipairs(t2.value104:GetDescendants()) do

        if v619:IsA("ScrollingFrame") then
            v619.ScrollBarImageColor3 = t2.value26.ThemeColor
        end

        if v619.Name == "ETERNALHUBThemeButton" and v619:IsA("TextButton") then
            v619.BackgroundColor3 = t2.value26.ThemeColor
        end
    end
    if t2.value35 then
        t2.value35.BackgroundColor3 = t2.value26.ThemeColor
    end
    if t2.value36 then
        t2.value36.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
    end
    if t2.value37 then
        t2.value37.Color = t2.value26.ThemeColor
    end
    if t2.value129 then
        t2.value129.Color = t2.value26.ThemeColor
    end
    if t2.value131 then
        t2.value131.Color = t2.value26.ThemeColor
    end
    if t2.value130 then
        t2.value130.TextColor3 = t2.value26.ThemeColor
    end
    if t2.value56 then
        t2.value56()
    end
    if t2.value58 then
        t2.value58()
    end
end
for _, v in pairs(t26) do
    local v133 = v
    local TextButton = Instance.new("TextButton")

    t1.value2 = "BackgroundColor3"
    t1.value1 = v133.color
    TextButton[t1.value2] = t1.value1
    t1.value2 = "Text"
    t1.value1 = v133.name
    TextButton[t1.value2] = t1.value1
    t1.value2 = "TextColor3"

    local color3_10 = Color3.fromRGB(255, 255, 255)

    TextButton[t1.value2] = color3_10
    t1.value2 = "TextSize"
    TextButton[t1.value2] = 12
    t1.value2 = "Font"
    t1.value1 = Enum.Font.GothamBold
    TextButton[t1.value2] = t1.value1
    t1.value2 = "Parent"
    TextButton[t1.value2] = Frame14
    t1.value2 = "BorderSizePixel"
    TextButton[t1.value2] = 0
    t1.value2 = Instance.new("UICorner", TextButton)

    local uDim = UDim.new(0, 6)

    t1.value2.CornerRadius = uDim
    TextButton.MouseButton1Click:Connect(function()
        t2.value26.ThemeColor = v133.color
        t2.value174()

        if t2.value71 then
            t2.value71()
        end

        if v133.color == Color3.fromRGB(0, 0, 0) then
            TextButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
    end)
end
local Frame15 = Instance.new("Frame")

Frame15.Size = UDim2.new(1, 0, 0, 48)
Frame15.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame15.BorderSizePixel = 0
Frame15.Parent = t2.value149
t1.value2 = Instance.new("UICorner", Frame15)
t1.value2.CornerRadius = UDim.new(0, 8)
t2.value35 = Instance.new("TextButton")
t2.value35.Size = UDim2.new(1, -20, 0, 32)
t2.value35.Position = UDim2.new(0, 10, 0, 8)
t2.value35.BackgroundColor3 = t2.value26.ThemeColor
t2.value35.Text = "💾  Salvar Configurações"
t2.value35.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value35.TextSize = 13
t2.value35.Font = Enum.Font.GothamBold
t2.value35.BorderSizePixel = 0
t2.value35.Parent = Frame15
Instance.new("UICorner", t2.value35).CornerRadius = UDim.new(0, 8)
t2.value35.MouseButton1Click:Connect(function()
    local v620 = t2.value67()

    if t2.value35 then
        t2.value35.Text = not v620 and "ERRO ❌" or "SALVO ✅"
        task.delay(1.2, function()
            if t2.value35 and t2.value35.Parent then
                t2.value35.Text = "SAVE"
            end
        end)
    end

    if t2.value38 then
        local value38 = t2.value38

        if v620 then
            v620 = "✅ Configurações salvas!"
        end

        value38(v620 or "❌ Erro ao salvar configurações!")
    end
end)
t2.value175 = nil
local Frame16 = Instance.new("Frame")

Frame16.Name = "ETERNALHUBDiscordLinkFrame"
Frame16.Size = UDim2.new(1, 0, 0, 42)
Frame16.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame16.BorderSizePixel = 0
Frame16.Parent = t2.value149
Instance.new("UICorner", Frame16).CornerRadius = UDim.new(0, 8)
t2.value36 = Instance.new("TextButton")
t2.value36.Name = "ETERNALHUBDiscordLinkButton"
t2.value36.Size = UDim2.new(1, -20, 0, 28)
t2.value36.Position = UDim2.new(0, 10, 0.5, -14)
t2.value36.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
t2.value36.Text = "🔗 https://discord.gg/FFzXFVqT54"
t2.value36.TextColor3 = Color3.fromRGB(255, 255, 255)
t2.value36.TextSize = 12
t2.value36.Font = Enum.Font.GothamBold
t2.value36.TextXAlignment = Enum.TextXAlignment.Center
t2.value36.BorderSizePixel = 0
t2.value36.Parent = Frame16
Instance.new("UICorner", t2.value36).CornerRadius = UDim.new(0, 8)
t2.value37 = Instance.new("UIStroke")

local value37 = t2.value37
t1.value2 = "Name"
value37[t1.value2] = "ETERNALHUBDiscordStroke"
local value37_2 = t2.value37
t1.value2 = "Thickness"
value37_2[t1.value2] = 2
local value37_3 = t2.value37
t1.value2 = "Color"
value37_3[t1.value2] = t2.value26.ThemeColor
local value37_4 = t2.value37
t1.value2 = "Transparency"
value37_4[t1.value2] = 0
local value37_5 = t2.value37
t1.value2 = "Parent"
value37_5[t1.value2] = t2.value36
t2.value36.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(t2.value175)

        if t2.value38 then
            t2.value38("✅ Link do Discord copiado!")

            return
        end
    elseif t2.value38 then
        t2.value38("⚠\239\184\143 Seu executor não tem setclipboard")
    end
end)

local function v144(p115, p116)

    for v626, v627 in pairs(t2.value125:GetChildren()) do

        if v627:IsA("TextButton") then
            v627.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        end
    end
    for _, child in pairs(t2.value127:GetChildren()) do
        if child:IsA("ScrollingFrame") then
            child.Visible = false
        end
    end
    p115.BackgroundColor3 = t2.value26.ThemeColor
    p116.Visible = true
    t2.value174()
end
t2.value133.MouseButton1Click:Connect(function()
    v144(t2.value133, t2.value134)
end)
t1.value2 = t2.value135.MouseButton1Click
t1.value2:Connect(function()
    v144(t2.value135, t2.value136)
end)
t1.value2 = t2.value137.MouseButton1Click
t1.value2:Connect(function()
    v144(t2.value137, t2.value138)
end)
t1.value2 = t2.value139.MouseButton1Click
t1.value2:Connect(function()
    v144(t2.value139, t2.value140)
end)
t2.value141.MouseButton1Click:Connect(function()
    v144(t2.value141, t2.value142)
end)
t1.value2 = t2.value143.MouseButton1Click
t1.value2:Connect(function()
    v144(t2.value143, t2.value144)
end)
t2.value145.MouseButton1Click:Connect(function()
    v144(t2.value145, t2.value146)
end)
t1.value2 = t2.value148.MouseButton1Click
t1.value2:Connect(function()
    v144(t2.value148, t2.value149)
end)
t1.value2 = t2.value134
t1.value1 = "Visible"
t1.value2[t1.value1] = true
t1.value2 = t2.value133
t1.value1 = "BackgroundColor3"
t1.value2[t1.value1] = t2.value26.ThemeColor
local function v145()
    if t2.value26.InterfaceMode == "PC" and not t2.value25 then
        return UDim2.new(0, 1040, 0, 620)
    end

    return t2.value25 and UDim2.new(0, 382, 0, 336) or UDim2.new(0, 500, 0, 380)
end
function ToggleUI()
    t2.value26.Enabled = not t2.value26.Enabled

    if t2.value26.Enabled then
        t2.value114.Visible = true

        local v630 = t2.value113 or t2.value114.Position

        v109(t2.value26.InterfaceMode or "ANTIGA")
        t2.value114.Position = v630

        local v631 = v145()

        t2.value114.Size = UDim2.new(0, 0, 0, 0)
        t2.value1:Create(t2.value114, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Size = v631
		}):Play()

        return
    end

    local _ = t2.value114.Position
    local v633 = t2.value1:Create(t2.value114, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		Size = UDim2.new(0, 0, 0, 0)
	})

    v633:Play()
    v633.Completed:Wait()
    t2.value114.Visible = false
end
task.spawn(function()
    while task.wait(0.5) do
        if t2.value26.AutoSpinStyle or (t2.value26.AutoSpinHabi or t2.value26.AutoYen) then
            pcall(function()
                local t27 = {}

                if t2.value26.AutoSpinStyle then
                    table.insert(t27, 1)
                end

                if t2.value26.AutoSpinHabi then
                    table.insert(t27, 4)
                end

                if t2.value26.AutoYen then
                    table.insert(t27, 2)
                end

                for _, v in pairs(t27) do
                    local Packages = t2.value5:FindFirstChild("Packages")

                    if Packages then
                        local _Index = Packages:FindFirstChild("_Index")

                        if _Index then
                            local v701 = _Index:FindFirstChild("sleitnick_knit@1.7.0")

                            if v701 then
                                local knit = v701:FindFirstChild("knit")

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
t2.value2.JumpRequest:Connect(function()
    local Character = t2.value23.Character
    local v635 = Character and Character:FindFirstChild("Humanoid")
    local v636 = Character and Character:FindFirstChild("HumanoidRootPart")

    if t2.value26.CameraJump and (v635 and (v636 and t2.value24)) then
        task.defer(function()
            task.wait(0.03)

            local vector3 = Vector3.new(t2.value24.CFrame.LookVector.X, 0, t2.value24.CFrame.LookVector.Z)

            if vector3.Magnitude > 0 then
                v636.CFrame = CFrame.lookAt(v636.Position, v636.Position + vector3.Unit)
                v635.AutoRotate = false
            end
        end)
    end
end)

function t2.value38(p117)
    local Frame17 = Instance.new("Frame")

    Frame17.Name = "NotifFrame"
    Frame17.Size = UDim2.new(0, 300, 0, 60)
    Frame17.Position = UDim2.new(0.5, -150, 0, -80)
    Frame17.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame17.BorderSizePixel = 0
    Frame17.Parent = t2.value104
    Instance.new("UICorner", Frame17).CornerRadius = UDim.new(0, 10)

    local UIStroke6 = Instance.new("UIStroke")

    UIStroke6.Color = t2.value26.ThemeColor
    UIStroke6.Thickness = 2
    UIStroke6.Parent = Frame17

    local TextLabel13 = Instance.new("TextLabel")

    TextLabel13.Size = UDim2.new(1, -20, 1, 0)
    TextLabel13.Position = UDim2.new(0, 10, 0, 0)
    TextLabel13.BackgroundTransparency = 1
    TextLabel13.Text = p117
    TextLabel13.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel13.TextSize = 14
    TextLabel13.Font = Enum.Font.Gotham
    TextLabel13.Parent = Frame17
    t2.value1:Create(Frame17, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, -150, 0, 20)
	}):Play()
    task.wait(3)

    local v641 = t2.value1:Create(Frame17, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		Position = UDim2.new(0.5, -150, 0, -80)
	})

    v641:Play()
    v641.Completed:Wait()
    Frame17:Destroy()
end
task.wait(1)
task.spawn(function()
    while task.wait(1) do
        if v57 then
            if t2.value39 then
                v57(t2.value39)
            end

            if t2.value41 then
                v57(t2.value41)
            end

            if t2.value43 then
                v57(t2.value43)
            end

            if t2.value47 then
                v57(t2.value47)
            end
        end
    end
end);
(function()
    local v257, v258 = t2.value68()
    local v259 = t2.value69(v257)

    t2.value70()

    if v259 then
        print("[ETERNAL HUB SAVE] Config carregada:", v258)

        return v259
    end

    print("[ETERNAL HUB SAVE] Nenhuma config encontrada, usando padrão")

    return v259
end)()
t2.value38("✅ RUBY Loaded!")
print("✅ RUBY UI - Carregado com sucesso.")
