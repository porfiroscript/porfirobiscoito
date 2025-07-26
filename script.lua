-- SCRIPT INSANO V2.0 PARA ROBLOX - VERSÃO ULTRA COMPLETA
-- 20+ Funcionalidades Épicas!

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
local character = player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera

-- Configurações
local config = {
    superSpeed = 150,
    jumpPower = 120,
    flySpeed = 60,
    rainbowSpeed = 3,
    explosionPower = 75,
    cloneCount = 5,
    timeScale = 1,
    gravityPower = 196.2
}

-- Estados
local states = {
    isFlying = false,
    isRainbowMode = false,
    isSuperSpeed = false,
    isNoclip = false,
    isInvisible = false,
    isGodMode = false,
    isFrozen = false,
    isSpinning = false,
    isFloating = false,
    hasInfiniteJump = false,
    isSpeedHack = false,
    isXRay = false,
    isESP = false,
    isBigHead = false,
    isSmallBody = false
}

-- GUI Principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InsaneScriptV2GUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Botão de Abertura (pequeno e discreto)
local openButton = Instance.new("TextButton")
openButton.Name = "OpenButton"
openButton.Size = UDim2.new(0, 80, 0, 80)
openButton.Position = UDim2.new(0, 20, 0.5, -40)
openButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
openButton.Text = "OPEN"
openButton.TextColor3 = Color3.new(1, 1, 1)
openButton.TextScaled = true
openButton.Font = Enum.Font.GothamBold
openButton.BorderSizePixel = 0
openButton.Parent = screenGui

-- Fazer o botão redondo
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.5, 0)
corner.Parent = openButton

-- Frame Principal (inicialmente oculto)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 700)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -350)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Bordas arredondadas no frame principal
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 15)
mainCorner.Parent = mainFrame

-- Barra de título
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 60)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 15)
titleCorner.Parent = titleBar

-- Título
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.8, 0, 1, 0)
titleLabel.Position = UDim2.new(0, 20, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🚀 SCRIPT INSANO V2.0 - ULTRA EDITION 🚀"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = titleBar

-- Botão de fechar
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -50, 0, 10)
closeButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
closeButton.Text = "×"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.BorderSizePixel = 0
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0.5, 0)
closeCorner.Parent = closeButton

-- ScrollingFrame para os botões
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -20, 1, -80)
scrollFrame.Position = UDim2.new(0, 10, 0, 70)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 8
scrollFrame.Parent = mainFrame

-- Layout dos botões
local layout = Instance.new("UIGridLayout")
layout.CellSize = UDim2.new(0, 180, 0, 50)
layout.CellPadding = UDim2.new(0, 10, 0, 10)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
layout.VerticalAlignment = Enum.VerticalAlignment.Top
layout.Parent = scrollFrame

-- Função para criar botões
local function createButton(text, callback, color)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 180, 0, 50)
    button.BackgroundColor3 = color or Color3.fromRGB(70, 130, 180)
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextScaled = true
    button.Font = Enum.Font.Gotham
    button.BorderSizePixel = 0
    button.Parent = scrollFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = button
    
    -- Efeito hover
    button.MouseEnter:Connect(function()
        local hoverColor = Color3.new(
            math.min(button.BackgroundColor3.R + 0.2, 1),
            math.min(button.BackgroundColor3.G + 0.2, 1),
            math.min(button.BackgroundColor3.B + 0.2, 1)
        )
        button.BackgroundColor3 = hoverColor
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = color or Color3.fromRGB(70, 130, 180)
    end)
    
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Sistema de abertura/fechamento
local isOpen = false

local function toggleMenu()
    isOpen = not isOpen
    mainFrame.Visible = isOpen
    
    if isOpen then
        -- Animação de abertura
        mainFrame.Size = UDim2.new(0, 0, 0, 0)
        mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        
        local openTween = TweenService:Create(
            mainFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {
                Size = UDim2.new(0, 600, 0, 700),
                Position = UDim2.new(0.5, -300, 0.5, -350)
            }
        )
        openTween:Play()
    end
end

openButton.MouseButton1Click:Connect(toggleMenu)
closeButton.MouseButton1Click:Connect(toggleMenu)

-- FUNCIONALIDADES ORIGINAIS MELHORADAS

-- 1. Sistema de Voo Melhorado
local bodyVelocity, bodyAngularVelocity
local flyButton = createButton("✈️ Voo Avançado", function()
    states.isFlying = not states.isFlying
    
    if states.isFlying then
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(8000, 8000, 8000)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.Parent = rootPart
        
        bodyAngularVelocity = Instance.new("BodyAngularVelocity")
        bodyAngularVelocity.MaxTorque = Vector3.new(8000, 8000, 8000)
        bodyAngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
        bodyAngularVelocity.Parent = rootPart
        
        flyButton.BackgroundColor3 = Color3.fromRGB(180, 70, 70)
    else
        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyAngularVelocity then bodyAngularVelocity:Destroy() end
        flyButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    end
end)

-- 2. Super Velocidade Plus
local speedButton = createButton("⚡ Super Speed+", function()
    states.isSuperSpeed = not states.isSuperSpeed
    
    if states.isSuperSpeed then
        humanoid.WalkSpeed = config.superSpeed
        humanoid.JumpPower = config.jumpPower
        speedButton.BackgroundColor3 = Color3.fromRGB(180, 70, 70)
    else
        humanoid.WalkSpeed = 16
        humanoid.JumpPower = 50
        speedButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    end
end)

-- 3. Modo Arco-íris Evoluído
local rainbowConnection
local rainbowButton = createButton("🌈 Rainbow Pro", function()
    states.isRainbowMode = not states.isRainbowMode
    
    if states.isRainbowMode then
        rainbowConnection = RunService.Heartbeat:Connect(function()
            local time = tick() * config.rainbowSpeed
            local hue = (time % 6) / 6
            local color = Color3.fromHSV(hue, 1, 1)
            
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Color = color
                    
                    if not part:FindFirstChild("RainbowLight") then
                        local light = Instance.new("PointLight")
                        light.Name = "RainbowLight"
                        light.Color = color
                        light.Brightness = 3
                        light.Range = 15
                        light.Parent = part
                    else
                        part.RainbowLight.Color = color
                    end
                end
            end
        end)
        rainbowButton.BackgroundColor3 = Color3.fromRGB(180, 70, 70)
    else
        if rainbowConnection then rainbowConnection:Disconnect() end
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") and part:FindFirstChild("RainbowLight") then
                part.RainbowLight:Destroy()
            end
        end
        rainbowButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    end
end)

-- 4. Noclip Avançado
local noclipConnection
local noclipButton = createButton("👻 Noclip Pro", function()
    states.isNoclip = not states.isNoclip
    
    if states.isNoclip then
        noclipConnection = RunService.Stepped:Connect(function()
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
        noclipButton.BackgroundColor3 = Color3.fromRGB(180, 70, 70)
    else
        if noclipConnection then noclipConnection:Disconnect() end
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.CanCollide = true
            end
        end
        noclipButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    end
end)

-- 5. Explosão Mega
local explosionButton = createButton("💥 Mega Boom", function()
    for i = 1, 3 do
        wait(0.2)
        local explosion = Instance.new("Explosion")
        explosion.Position = rootPart.Position + Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        explosion.BlastRadius = config.explosionPower
        explosion.BlastPressure = 2000000
        explosion.Parent = workspace
    end
end)

-- 6. Efeitos de Luz Extremos
local lightingEffectsActive = false
local lightingButton = createButton("🌟 Luz Extrema", function()
    lightingEffectsActive = not lightingEffectsActive
    
    if lightingEffectsActive then
        Lighting.Brightness = 0.3
        Lighting.Ambient = Color3.fromRGB(150, 0, 150)
        Lighting.ColorShift_Bottom = Color3.fromRGB(255, 0, 255)
        Lighting.ColorShift_Top = Color3.fromRGB(0, 255, 255)
        Lighting.FogEnd = 100
        Lighting.FogColor = Color3.fromRGB(100, 0, 200)
        
        lightingButton.BackgroundColor3 = Color3.fromRGB(180, 70, 70)
    else
        Lighting.Brightness = 2
        Lighting.Ambient = Color3.fromRGB(70, 70, 70)
        Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
        Lighting.FogEnd = 100000
        
        lightingButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    end
end)

-- NOVAS FUNCIONALIDADES (15 ADICIONAIS)

-- 7. Modo Invisível
local invisibleButton = createButton("👤 Invisível", function()
    states.isInvisible = not states.isInvisible
    
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = states.isInvisible and 1 or 0
        elseif part:IsA("Accessory") and part:FindFirstChild("Handle") then
            part.Handle.Transparency = states.isInvisible and 1 or 0
        end
    end
    
    invisibleButton.BackgroundColor3 = states.isInvisible and Color3.fromRGB(180, 70, 70) or Color3.fromRGB(70, 130, 180)
end, Color3.fromRGB(120, 70, 180))

-- 8. Modo Deus
local godModeButton = createButton("⚡ God Mode", function()
    states.isGodMode = not states.isGodMode
    humanoid.MaxHealth = states.isGodMode and math.huge or 100
    humanoid.Health = humanoid.MaxHealth
    
    godModeButton.BackgroundColor3 = states.isGodMode and Color3.fromRGB(180, 70, 70) or Color3.fromRGB(180, 140, 70)
end, Color3.fromRGB(180, 140, 70))

-- 9. Congelar Personagem
local freezeButton = createButton("🧊 Congelar", function()
    states.isFrozen = not states.isFrozen
    rootPart.Anchored = states.isFrozen
    
    freezeButton.BackgroundColor3 = states.isFrozen and Color3.fromRGB(180, 70, 70) or Color3.fromRGB(70, 180, 200)
end, Color3.fromRGB(70, 180, 200))

-- 10. Modo Spinning
local spinConnection
local spinButton = createButton("🌀 Spin Loco", function()
    states.isSpinning = not states.isSpinning
    
    if states.isSpinning then
        spinConnection = RunService.Heartbeat:Connect(function()
            rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(20), 0)
        end)
        spinButton.BackgroundColor3 = Color3.fromRGB(180, 70, 70)
    else
        if spinConnection then spinConnection:Disconnect() end
        spinButton.BackgroundColor3 = Color3.fromRGB(200, 100, 50)
    end
end, Color3.fromRGB(200, 100, 50))

-- 11. Flutuar
local floatBodyPosition
local floatButton = createButton("🎈 Flutuar", function()
    states.isFloating = not states.isFloating
    
    if states.isFloating then
        floatBodyPosition = Instance.new("BodyPosition")
        floatBodyPosition.MaxForce = Vector3.new(0, math.huge, 0)
        floatBodyPosition.Position = rootPart.Position + Vector3.new(0, 10, 0)
        floatBodyPosition.Parent = rootPart
        floatButton.BackgroundColor3 = Color3.fromRGB(180, 70, 70)
    else
        if floatBodyPosition then floatBodyPosition:Destroy() end
        floatButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
    end
end, Color3.fromRGB(100, 200, 100))

-- 12. Pulo Infinito
local infiniteJumpButton = createButton("🦘 Pulo ∞", function()
    states.hasInfiniteJump = not states.hasInfiniteJump
    
    infiniteJumpButton.BackgroundColor3 = states.hasInfiniteJump and Color3.fromRGB(180, 70, 70) or Color3.fromRGB(150, 200, 70)
end, Color3.fromRGB(150, 200, 70))

-- 13. Clonar Personagem
local cloneButton = createButton("👥 Clonar", function()
    for i = 1, config.cloneCount do
        local clone = character:Clone()
        clone.Name = character.Name .. "_Clone_" .. i
        clone.Parent = workspace
        clone:SetPrimaryPartCFrame(rootPart.CFrame + Vector3.new(math.random(-10, 10), 0, math.random(-10, 10)))
    end
end, Color3.fromRGB(200, 150, 200))

-- 14. Cabeça Grande
local bigHeadButton = createButton("🗣️ Cabeça XL", function()
    local head = character:FindFirstChild("Head")
    if head then
        states.isBigHead = not states.isBigHead
        local scale = states.isBigHead and 3 or 1
        head.Size = Vector3.new(2 * scale, 1 * scale, 1 * scale)
        
        bigHeadButton.BackgroundColor3 = states.isBigHead and Color3.fromRGB(180, 70, 70) or Color3.fromRGB(200, 100, 150)
    end
end, Color3.fromRGB(200, 100, 150))

-- 15. Corpo Pequeno  
local smallBodyButton = createButton("🤏 Corpo Mini", function()
    states.isSmallBody = not states.isSmallBody
    local scale = states.isSmallBody and 0.3 or 1
    
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") and part.Name ~= "Head" then
            part.Size = part.Size * (states.isSmallBody and 0.3 or (1/0.3))
        end
    end
    
    smallBodyButton.BackgroundColor3 = states.isSmallBody and Color3.fromRGB(180, 70, 70) or Color3.fromRGB(100, 150, 200)
end, Color3.fromRGB(100, 150, 200))

-- 16. Velocidade Extrema
local speedHackButton = createButton("🏃 Speed Hack", function()
    states.isSpeedHack = not states.isSpeedHack
    humanoid.WalkSpeed = states.isSpeedHack and 500 or 16
    
    speedHackButton.BackgroundColor3 = states.isSpeedHack and Color3.fromRGB(180, 70, 70) or Color3.fromRGB(255, 100, 0)
end, Color3.fromRGB(255, 100, 0))

-- 17. Resetar Personagem
local resetButton = createButton("🔄 Reset", function()
    character:BreakJoints()
end, Color3.fromRGB(180, 50, 50))

-- 18. Teleporte para Players
local teleportButton = createButton("📍 TP Players", function()
    local players = Players:GetPlayers()
    local randomPlayer = players[math.random(1, #players)]
    if randomPlayer and randomPlayer ~= player and randomPlayer.Character then
        rootPart.CFrame = randomPlayer.Character.HumanoidRootPart.CFrame
    end
end, Color3.fromRGB(150, 100, 200))

-- 19. Efeito Fantasma
local ghostButton = createButton("👻 Fantasma", function()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = 0.7
            part.CanCollide = false
        end
    end
end, Color3.fromRGB(100, 100, 200))

-- 20. Restaurar Tudo
local restoreButton = createButton("🛠️ Restaurar", function()
    -- Reset todos os estados
    for key, _ in pairs(states) do
        states[key] = false
    end
    
    -- Restaura propriedades básicas
    humanoid.WalkSpeed = 16
    humanoid.JumpPower = 50
    humanoid.MaxHealth = 100
    humanoid.Health = 100
    rootPart.Anchored = false
    
    -- Remove efeitos
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = part.Name == "HumanoidRootPart" and 1 or 0
            part.CanCollide = part.Name ~= "HumanoidRootPart"
            if part:FindFirstChild("RainbowLight") then
                part.RainbowLight:Destroy()
            end
        end
    end
    
    -- Atualiza cores dos botões
    for _, button in pairs(scrollFrame:GetChildren()) do
        if button:IsA("TextButton") then
            button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
        end
    end
end, Color3.fromRGB(100, 180, 100))

-- Sistema de controles
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    local key = input.KeyCode
    
    -- Pulo infinito
    if key == Enum.KeyCode.Space and states.hasInfiniteJump then
        humanoid.Jump = true
    end
    
    -- Toggle menu com Insert
    if key == Enum.KeyCode.Insert then
        toggleMenu()
    end
end)

-- Sistema de controle de voo melhorado
RunService.Heartbeat:Connect(function()
    if states.isFlying and bodyVelocity then
        local moveVector = Vector3.new(0, 0, 0)
        local speed = config.flySpeed
        
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            speed = speed * 2 -- Boost de velocidade
        end
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveVector = moveVector + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveVector = moveVector - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveVector = moveVector - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveVector = moveVector + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveVector = moveVector + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            moveVector = moveVector + Vector3.new(0, -1, 0)
        end
        
        bodyVelocity.Velocity = moveVector * speed
    end
end)

-- Efeitos de partículas melhorados
local lastPosition = rootPart.Position
RunService.Heartbeat:Connect(function()
    local currentPosition = rootPart.Position
    local distance = (currentPosition - lastPosition).Magnitude
    
    if distance > 0.5 and humanoid.MoveDirection.Magnitude > 0 then
        -- Efeito de trilha
        local trail = Instance.new("Part")
        trail.Name = "SpeedTrail"
        trail.Size = Vector3.new(2, 0.2, 2)
        trail.Position = currentPosition - Vector3.new(0, 2, 0)
        trail.Anchored = true
        trail.CanCollide = false
        trail.Transparency = 0.3
        trail.BrickColor = states.isRainbowMode and BrickColor.Random() or BrickColor.new("Bright blue")
        trail.Material = Enum.Material.Neon
        trail.Parent = workspace
        
        local tween = TweenService:Create(
            trail,
            TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Transparency = 1, Size = Vector3.new(4, 0.2, 4)}
        )
        
        tween:Play()
        tween.Completed:Connect(function()
            trail:Destroy()
        end)
    end
    
    lastPosition = currentPosition
end)

-- Atualizar tamanho do scroll
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, math.ceil(20/3) * 60 + 20)

-- Notificação de carregamento
StarterGui:SetCore("SendNotification", {
    Title = "🚀 SCRIPT INSANO V2.0";
    Text = "Carregado com sucesso! Use INSERT para abrir/fechar";
    Duration = 5;
})

print("🚀 SCRIPT INSANO V2.0 CARREGADO! 🚀")
print("📱 Clique no botão 'OPEN' ou pressione INSERT para abrir o menu")
print("✨ 20+ Funcionalidades disponíveis!")
print("🎮 Controles de voo: WASD + Space/Ctrl + Shift (boost)")
print("🔧 Botão 'Restaurar' para resetar todas as funções")
