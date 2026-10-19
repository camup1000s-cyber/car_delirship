local TS = game:GetService("TeleportService")
local plrs = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local plr = plrs.LocalPlayer

local old = game:GetService("CoreGui")
local oldGui = old:FindFirstChild("CDT_Ultimate_Red")
if oldGui then oldGui:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name, Gui.Parent = "CDT_Ultimate_Red", old

local Main = Instance.new("Frame", Gui)
Main.BackgroundColor3 = Color3.fromRGB(20, 15, 15)
Main.Position, Main.Size = UDim2.new(0.5, -115, 0.5, -235), UDim2.new(0, 230, 0, 470)
Main.Active, Main.Draggable = true, true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness, Stroke.Color = 2, Color3.fromRGB(180, 30, 30)

local Title = Instance.new("TextLabel", Main)
Title.BackgroundTransparency, Title.Size = 1, UDim2.new(1, -40, 0, 35)
Title.Position, Title.Font = UDim2.new(0, 12, 0, 0), Enum.Font.GothamBold
Title.Text, Title.TextColor3 = "CDT ULTIMATE CHEAT", Color3.fromRGB(255, 100, 100)
Title.TextSize, Title.TextXAlignment = 13, Enum.TextXAlignment.Left

local MinBtn = Instance.new("TextButton", Main)
MinBtn.BackgroundTransparency, MinBtn.Position = 1, UDim2.new(1, -35, 0, 5)
MinBtn.Size, MinBtn.Font, MinBtn.Text = UDim2.new(0, 30, 0, 25), Enum.Font.GothamBold, "−"
MinBtn.TextColor3, MinBtn.TextSize = Color3.fromRGB(180, 100, 100), 18

local Circle = Instance.new("TextButton", Gui)
Circle.BackgroundColor3 = Color3.fromRGB(20, 15, 15)
Circle.Position, Circle.Size = UDim2.new(0.02, 0, 0.45, 0), UDim2.new(0, 45, 0, 45)
Circle.Font, Circle.Text, Circle.TextColor3 = Enum.Font.GothamBold, "CDT", Color3.fromRGB(255, 50, 50)
Circle.TextSize, Circle.Visible, Circle.Active, Circle.Draggable = 12, false, true, true
Instance.new("UICorner", Circle).CornerRadius = UDim.new(1, 0)

local CStroke = Instance.new("UIStroke", Circle)
CStroke.Thickness, CStroke.Color = 2, Color3.fromRGB(180, 30, 30)

local function MakeLabel(txt, y)
    local l = Instance.new("TextLabel", Main)
    l.BackgroundTransparency, l.Position = 1, UDim2.new(0, 12, 0, y)
    l.Size, l.Font, l.Text = UDim2.new(1, -24, 0, 15), Enum.Font.GothamSemibold, txt
    l.TextColor3, l.TextSize, l.TextXAlignment = Color3.fromRGB(160, 120, 120), 10, Enum.TextXAlignment.Left
end

local function MakeBox(txt, y)
    local b = Instance.new("TextBox", Main)
    b.BackgroundColor3, b.Position = Color3.fromRGB(35, 20, 20), UDim2.new(0, 12, 0, y)
    b.Size, b.Font, b.Text = UDim2.new(1, -24, 0, 26), Enum.Font.GothamBold, txt
    b.TextColor3, b.TextSize = Color3.fromRGB(255, 255, 255), 12
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    return b
end

local function MakeBtn(txt, clr, y, h)
    local btn = Instance.new("TextButton", Main)
    btn.BackgroundColor3, btn.Position = clr, UDim2.new(0, 12, 0, y)
    btn.Size, btn.Font, btn.Text = UDim2.new(1, -24, 0, h or 28), Enum.Font.GothamBold, txt
    btn.TextColor3, btn.TextSize = Color3.fromRGB(230, 230, 230), 11
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

MinBtn.MouseButton1Click:Connect(function() Main.Visible, Circle.Visible = false, true end)
Circle.MouseButton1Click:Connect(function() Circle.Visible, Main.Visible = false, true end)

MakeLabel("Множитель Pagani (на W):", 40)
local CarBox = MakeBox("5", 58)
local CarBtn = MakeBtn("ВКЛЮЧИТЬ СКОРОСТЬ АВТО", Color3.fromRGB(55, 25, 25), 88)
local FlipBtn = MakeBtn("АВТО-ПЕРЕВОРОТ: ВЫКЛ", Color3.fromRGB(55, 30, 30), 122)

MakeLabel("Спидхак бега пешком:", 156)
local PlrBox = MakeBox("100", 174)
local PlrBtn = MakeBtn("ВКЛЮЧИТЬ БЕГ ИГРОКА", Color3.fromRGB(30, 50, 40), 204)
local InvisBtn = MakeBtn("НЕВИДИМОСТЬ ИГРОКА: ВЫКЛ", Color3.fromRGB(60, 30, 50), 238)

MakeLabel("Перемещение:", 272)
local TpClickBtn = MakeBtn("ТП ПО КЛИКУ (ПРЕДМЕТ)", Color3.fromRGB(110, 0, 0), 290)

MakeLabel("Телепорт к игроку (ник):", 324)
local TargetBox = MakeBox("НикИгрока", 342)
local TpPlrBtn = MakeBtn("ТП К ИГРОКУ", Color3.fromRGB(110, 30, 0), 374)

MakeLabel("Управление сервером:", 406)
local RejoinBtn = MakeBtn("ПЕРЕЗАЙТИ НА СЕРВЕР", Color3.fromRGB(45, 25, 35), 424)
local CloseBtn = MakeBtn("ЗАКРЫТЬ МЕНЮ", Color3.fromRGB(150, 35, 35), 458) -- Скорректировано по высоте

local pRun, cRun, flipRun, invisRun = false, false, false, false

CloseBtn.MouseButton1Click:Connect(function()
    pRun, cRun, flipRun, invisRun = false, false, false, false
    Gui:Destroy()
end)

-- Логика ТП к игроку
TpPlrBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local query = TargetBox.Text:lower()
        for _, p in ipairs(plrs:GetPlayers()) do
            if p ~= plr and (p.Name:lower():match(query) or p.DisplayName:lower():match(query)) then
                local targetChar = p.Character
                local myChar = plr.Character
                if targetChar and myChar then
                    local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
                    local myHum = myChar:FindFirstChildOfClass("Humanoid")
                    if targetRoot then
                        if myHum and myHum.SeatPart and myHum.SeatPart.Parent then
                            myHum.SeatPart.Parent:PivotTo(targetRoot.CFrame + Vector3.new(0, 3, 0))
                        else
                            myChar:PivotTo(targetRoot.CFrame + Vector3.new(0, 3, 0))
                        end
                    end
                end
                break
            end
        end
    end)
end)

task.spawn(function()
    while true do
        if pRun then
            pcall(function()
                local c = plr.Character
                local h = c and c:FindFirstChildOfClass("Humanoid")
                if h and not h.SeatPart then h.WalkSpeed = tonumber(PlrBox.Text) or 100 end
            end)
        end
        task.wait(0.1)
    end
end)

PlrBtn.MouseButton1Click:Connect(function()
    pRun = not pRun
    PlrBtn.BackgroundColor3 = pRun and Color3.fromRGB(120, 20, 20) or Color3.fromRGB(30, 50, 40)
    PlrBtn.Text = pRun and "ОТКЛЮЧИТЬ БЕГ" or "ВКЛЮЧИТЬ БЕГ ИГРОКА"
    if not pRun then pcall(function() plr.Character.Humanoid.WalkSpeed = 16 end) end
end)

local function SetInvisibility(state)
    pcall(function()
        local char = plr.Character
        if not char then return end
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then part.Transparency = state and 1 or 0 end
        end
    end)
end

InvisBtn.MouseButton1Click:Connect(function()
    invisRun = not invisRun
    InvisBtn.BackgroundColor3 = invisRun and Color3.fromRGB(140, 30, 80) or Color3.fromRGB(60, 30, 50)
    InvisBtn.Text = invisRun and "НЕВИДИМОСТЬ ИГРОКА: ВКЛ" or "НЕВИДИМОСТЬ ИГРОКА: ВЫКЛ"
    SetInvisibility(invisRun)
end)

plr.CharacterAdded:Connect(function()
    task.wait(1)
    if invisRun then SetInvisibility(true) end
end)

local function GiveTpTool()
    local bp = plr:FindFirstChildOfClass("Backpack")
    if not bp then return end
    local char = plr.Character
    if bp:FindFirstChild("Teleport Tool") or (char and char:FindFirstChild("Teleport Tool")) then return end
    
    local tool = Instance.new("Tool")
    tool.Name, tool.RequiresHandle = "Teleport Tool", false
    tool.Activated:Connect(function()
        pcall(function()
            local targetPos = plr:GetMouse().Hit.Position + Vector3.new(0, 3, 0)
            local char = plr.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                local seat = hum and hum.SeatPart
                if seat and seat.Parent then seat.Parent:PivotTo(CFrame.new(targetPos)) else char:PivotTo(CFrame.new(targetPos)) end
            end
        end)
    end)
    tool.Parent = bp
end
TpClickBtn.MouseButton1Click:Connect(GiveTpTool)

FlipBtn.MouseButton1Click:Connect(function()
    flipRun = not flipRun
    FlipBtn.BackgroundColor3 = flipRun and Color3.fromRGB(140, 40, 40) or Color3.fromRGB(55, 30, 30)
    FlipBtn.Text = flipRun and "АВТО-ПЕРЕВОРОТ: ВКЛ" or "АВТО-ПЕРЕВОРОТ: ВЫКЛ"
end)

task.spawn(function()
    while true do
        pcall(function()
            local c = plr.Character
            local h = c and c:FindFirstChildOfClass("Humanoid")
            if h and h.SeatPart and (h.SeatPart:IsA("VehicleSeat") or h.SeatPart:IsA("DriveSeat")) then
                local seat = h.SeatPart
                local root = seat.Parent:FindFirstChild("HumanoidRootPart") or seat
                
                if flipRun and root.CFrame.UpVector.Y < 0.3 then
                    root.CFrame = CFrame.new(root.Position + Vector3.new(0, 3, 0)) * CFrame.Angles(0, root.CFrame:ToEulerAnglesYXZ())
                    root.AssemblyLinearVelocity, root.AssemblyAngularVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
                end
                
                if UIS:IsKeyDown(Enum.KeyCode.P) then
                    root.AssemblyLinearVelocity, seat.Velocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
                elseif cRun and (UIS:IsKeyDown(Enum.KeyCode.W) or UIS:IsKeyDown(Enum.KeyCode.Up)) then
                    local boost = tonumber(CarBox.Text) or 5
                    local rawV = seat.CFrame.LookVector * (boost / 2)
                    root.AssemblyLinearVelocity = root.AssemblyLinearVelocity + Vector3.new(rawV.X, 0, rawV.Z)
                end
            end
        end)
        task.wait(0.02)
    end
end)

CarBtn.MouseButton1Click:Connect(function()
    cRun = not cRun
    CarBtn.BackgroundColor3 = cRun and Color3.fromRGB(180, 50, 0) or Color3.fromRGB(55, 25, 25)
    CarBtn.Text = cRun and "ОТКЛЮЧИТЬ СКОРОСТЬ" or "ВКЛЮЧИТЬ СКОРОСТЬ АВТО"
end)

RejoinBtn.MouseButton1Click:Connect(function()
    if #plrs:GetPlayers() <= 1 then TS:Teleport(game.PlaceId, plr) else TS:TeleportToPlaceInstance(game.PlaceId, game.JobId, plr) end
end)
