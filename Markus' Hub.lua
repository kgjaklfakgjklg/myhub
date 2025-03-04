local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local reality = false
local darksav = false

local function isPlayerOrPartNearby(radius)
    local char = Players.LocalPlayer.Character
    if not char then return nil end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end

    local pos = hrp.Position
    local closestObject = nil
    local closestDist = math.huge

    -- Use FindPartsInRegion3 to detect parts
    local region = Region3.new(pos - Vector3.new(radius, radius, radius), pos + Vector3.new(radius, radius, radius))
    local partsInRegion = Workspace:FindPartsInRegion3(region, nil, math.huge)

    -- Loop through detected parts
    for _, obj in pairs(partsInRegion) do
        if obj:IsA("BasePart") --[[and obj.CanCollide]] and not obj:IsDescendantOf(char) --[[and obj:IsDescendantOf(game.Workspace.Thrown)]] then
            local dist = (obj.Position - pos).magnitude

            -- Ignore floor-like objects and only check within the radius
            if dist <= radius and obj.Position.Y > pos.Y - 3 then
                if dist < closestDist then
                    closestDist = dist
                    closestObject = obj
                end
            end
        end
    end

    -- Now, check for attachments in the workspace
   --[[ for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Attachment") then
            local parentPart = obj.Parent
            if parentPart and parentPart:IsA("BasePart") and not parentPart:IsDescendantOf(char) then
                local dist = (obj.WorldPosition - pos).magnitude

                if dist <= radius then
                    if dist < closestDist then
                        closestDist = dist
                        closestObject = parentPart  -- Treat the attachment's parent part as the teleport target
                    end
                end
            end
        end
    end]]

    return closestObject  -- Return the closest part or attachment's parent part
end

local function teleportToObject()
    local closestObject = isPlayerOrPartNearby(12.5)
    local distance = 0
    local distance2 = 0
    if math.random(1,2) == 1 then
    distance = 20
    elseif math.random(1,2) == 2 then
    distance = -20
    end
    if math.random(1,2) == 1 then
    distance2 = 20
    elseif math.random(1,2) == 2 then
    distance2 = -20
    end
    if closestObject then
        local char = Players.LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                -- Teleport near the detected object
                hrp.CFrame = hrp.CFrame + Vector3.new(distance,0,distance2)
            end
        end
    end
end
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   

   Name = "The Main Gui",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Markus' Hub",
   LoadingSubtitle = "by Markus",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Password Required Idiot",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "markus1230theepichub", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"markus-1307975523-12302009"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }

})
Window.ModifyTheme({
    TextColor = Color3.fromRGB(240, 200, 200),

    Background = Color3.fromRGB(35, 10, 10),
    Topbar = Color3.fromRGB(50, 15, 15),
    Shadow = Color3.fromRGB(25, 5, 5),

    NotificationBackground = Color3.fromRGB(30, 10, 10),
    NotificationActionsBackground = Color3.fromRGB(255, 180, 180),

    TabBackground = Color3.fromRGB(120, 30, 30),
    TabStroke = Color3.fromRGB(130, 40, 40),
    TabBackgroundSelected = Color3.fromRGB(220, 120, 120),
    TabTextColor = Color3.fromRGB(240, 200, 200),
    SelectedTabTextColor = Color3.fromRGB(80, 20, 20),

    ElementBackground = Color3.fromRGB(60, 20, 20),
    ElementBackgroundHover = Color3.fromRGB(75, 25, 25),
    SecondaryElementBackground = Color3.fromRGB(45, 15, 15),
    ElementStroke = Color3.fromRGB(90, 30, 30),
    SecondaryElementStroke = Color3.fromRGB(70, 20, 20),
            
    SliderBackground = Color3.fromRGB(200, 50, 50),
    SliderProgress = Color3.fromRGB(200, 50, 50),
    SliderStroke = Color3.fromRGB(255, 80, 80),

    ToggleBackground = Color3.fromRGB(45, 15, 15),
    ToggleEnabled = Color3.fromRGB(200, 0, 0),
    ToggleDisabled = Color3.fromRGB(150, 50, 50),
    ToggleEnabledStroke = Color3.fromRGB(255, 0, 0),
    ToggleDisabledStroke = Color3.fromRGB(125, 40, 40),
    ToggleEnabledOuterStroke = Color3.fromRGB(180, 80, 80),
    ToggleDisabledOuterStroke = Color3.fromRGB(100, 50, 50),

    DropdownSelected = Color3.fromRGB(75, 25, 25),
    DropdownUnselected = Color3.fromRGB(50, 15, 15),

    InputBackground = Color3.fromRGB(50, 15, 15),
    InputStroke = Color3.fromRGB(90, 30, 30),
    PlaceholderColor = Color3.fromRGB(200, 140, 140)
})
local Tab = Window:CreateTab("Characters", 0) -- Title, Image
--local Section = Tab:CreateSection("TSB")
local Button = Tab:CreateButton({
   Name = "Reality Breaker",
   Callback = function()
   local CharacterName = "Reality Breaker"
local CharacterIcon = 16475337241
local function Script()
reality = true
game.Players.LocalPlayer.Character.Humanoid.Health = -5
end


local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local topbarPlus = playerGui:WaitForChild("TopbarPlus")
local topbarContainer = topbarPlus:WaitForChild("TopbarContainer")
local unnamedIcon = topbarContainer:WaitForChild("UnnamedIcon")
local dropdownContainer = unnamedIcon:WaitForChild("DropdownContainer")
local dropdownFrame = dropdownContainer:WaitForChild("DropdownFrame")
local KJ = dropdownFrame.KJ
KJ.Visible = false

if dropdownFrame:FindFirstChild("Char") then
dropdownFrame:FindFirstChild("Char"):Destroy()
end

local charFrame = Instance.new("Frame")
charFrame.Name = "Char"
charFrame.Parent = dropdownFrame
charFrame.BackgroundTransparency = 1
charFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
charFrame.BorderSizePixel = 1
charFrame.LayoutOrder = 14
charFrame.Size = UDim2.new(1, 0, 0, 32)
charFrame.SizeConstraint = Enum.SizeConstraint.RelativeXY
charFrame.ZIndex = 1

local iconButton = Instance.new("TextButton")
iconButton.Name = "IconButton"
iconButton.Parent = charFrame
iconButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
iconButton.BackgroundTransparency = 0.5
iconButton.BorderSizePixel = 0
iconButton.Text = ""
iconButton.TextScaled = false
iconButton.TextSize = 8
iconButton.TextTransparency = 1
iconButton.TextWrapped = false
iconButton.Position = UDim2.new(0, 0, 0, 0)
iconButton.Size = UDim2.new(1, 0, 1, 0)
iconButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
iconButton.Font = Enum.Font.Legacy
iconButton.LayoutOrder = 0

local iconImage = Instance.new("ImageLabel")
iconImage.Name = "IconImage"
iconImage.Parent = iconButton
iconImage.AnchorPoint = Vector2.new(0, 0.5)
iconImage.BackgroundTransparency = 1
iconImage.BorderColor3 = Color3.fromRGB(27, 42, 53)
iconImage.BorderSizePixel = 1
iconImage.Image = "rbxassetid://" .. CharacterIcon
iconImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
iconImage.ImageRectOffset = Vector2.new(0, 0)
iconImage.ImageRectSize = Vector2.new(0, 0)
iconImage.ImageTransparency = 0
iconImage.LayoutOrder = 0
iconImage.Position = UDim2.new(0, 12, 0, 15)
iconImage.Size = UDim2.new(0, 24, 0, 24)
iconImage.SizeConstraint = Enum.SizeConstraint.RelativeXY
iconImage.TileSize = UDim2.new(1, 0, 1, 0)
iconImage.SliceScale = 1
iconImage.ZIndex = 11

local iconLabel = Instance.new("TextLabel")
iconLabel.Name = "IconLabel"
iconLabel.Parent = iconButton
iconLabel.AnchorPoint = Vector2.new(0, 0.5)
iconLabel.BackgroundTransparency = 1
iconLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
iconLabel.BorderSizePixel = 1
iconLabel.Font = Enum.Font.GothamMedium
iconLabel.LayoutOrder = 0
iconLabel.Text = CharacterName
iconLabel.TextColor3 = Color3.fromRGB(255, 216, 19)
iconLabel.TextSize = 14
iconLabel.TextScaled = false
iconLabel.TextTransparency = 0
iconLabel.TextWrapped = false
iconLabel.TextXAlignment = Enum.TextXAlignment.Left
iconLabel.TextYAlignment = Enum.TextYAlignment.Center
iconLabel.Position = UDim2.new(0, 44, 0, 15)
iconLabel.Size = UDim2.new(1, -56, 0, 7)
iconLabel.TextStrokeTransparency = 1
iconLabel.ZIndex = 11

local function onErrorNotification()
    game.StarterGui:SetCore("SendNotification", {
        Title = "NOTIFICATION";
        Text = "YOU'RE ALREADY PLAYING AS THIS CHARACTER.";
        Icon = "";
        Duration = 5;
    })
end
local function notice()
    game.StarterGui:SetCore("SendNotification", {
        Title = "NOTIFICATION";
        Text = "YOU ARE NOT USING THE STRONGEST HERO.";
        Icon = "";
        Duration = 5;
    })
end

local function handleIconButtonClick()
    
    local character = player.Character
    if not character then
        return
    end

    local scriptHasRun = character:FindFirstChild("ScriptHasRun")
    if scriptHasRun and scriptHasRun.Value then
        onErrorNotification()
        return
    end

    if not scriptHasRun then
    if game.Players.LocalPlayer.Name == "guestcoolguypro2" and game.Players.LocalPlayer.Backpack:FindFirstChild("Normal Punch") and game.Players.LocalPlayer.Backpack:FindFirstChild("Consecutive Punches") and game.Players.LocalPlayer.Backpack:FindFirstChild("Shove") and game.Players.LocalPlayer.Backpack:FindFirstChild("Uppercut") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Truly Pitiful") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Speeding Dash") then
        scriptHasRun = Instance.new("BoolValue")
        scriptHasRun.Name = "ScriptHasRun"
        scriptHasRun.Value = true
        scriptHasRun.Parent = character
        Script()
        else
        notice()
    end
    else
        scriptHasRun.Value = true
    end
end

iconButton.MouseButton1Click:Connect(handleIconButtonClick)

print("Script Loaded 0 cap")  -- Debug print to confirm script initialization

player.CharacterAdded:Connect(function(character)
local KJ = dropdownFrame.KJ
KJ.Visible = false
    local scriptHasRun = character:FindFirstChild("ScriptHasRun")
    if scriptHasRun then
        scriptHasRun.Value = false
    end
end)

if player.Character then
    local scriptHasRun = player.Character:FindFirstChild("ScriptHasRun")
    if scriptHasRun then
        scriptHasRun.Value = false
    end
end

   end,
})
local Button = Tab:CreateButton({
   Name = "Dark Savior",
   Callback = function()
   --Find Lua scripts online and paste them here!
--rbxassetid://12296113986
local CharacterName = "Dark Savior"
local CharacterIcon = 16475337241
local function Script()
darksav = true
game.Players.LocalPlayer.Character.Humanoid.Health = -5
end


local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local topbarPlus = playerGui:WaitForChild("TopbarPlus")
local topbarContainer = topbarPlus:WaitForChild("TopbarContainer")
local unnamedIcon = topbarContainer:WaitForChild("UnnamedIcon")
local dropdownContainer = unnamedIcon:WaitForChild("DropdownContainer")
local dropdownFrame = dropdownContainer:WaitForChild("DropdownFrame")
local KJ = dropdownFrame.KJ
KJ.Visible = false

if dropdownFrame:FindFirstChild("Char") then
dropdownFrame:FindFirstChild("Char"):Destroy()
end

local charFrame = Instance.new("Frame")
charFrame.Name = "Char"
charFrame.Parent = dropdownFrame
charFrame.BackgroundTransparency = 1
charFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
charFrame.BorderSizePixel = 1
charFrame.LayoutOrder = 14
charFrame.Size = UDim2.new(1, 0, 0, 32)
charFrame.SizeConstraint = Enum.SizeConstraint.RelativeXY
charFrame.ZIndex = 1

local iconButton = Instance.new("TextButton")
iconButton.Name = "IconButton"
iconButton.Parent = charFrame
iconButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
iconButton.BackgroundTransparency = 0.5
iconButton.BorderSizePixel = 0
iconButton.Text = ""
iconButton.TextScaled = false
iconButton.TextSize = 8
iconButton.TextTransparency = 1
iconButton.TextWrapped = false
iconButton.Position = UDim2.new(0, 0, 0, 0)
iconButton.Size = UDim2.new(1, 0, 1, 0)
iconButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
iconButton.Font = Enum.Font.Legacy
iconButton.LayoutOrder = 0

local iconImage = Instance.new("ImageLabel")
iconImage.Name = "IconImage"
iconImage.Parent = iconButton
iconImage.AnchorPoint = Vector2.new(0, 0.5)
iconImage.BackgroundTransparency = 1
iconImage.BorderColor3 = Color3.fromRGB(27, 42, 53)
iconImage.BorderSizePixel = 1
iconImage.Image = "rbxassetid://" .. CharacterIcon
iconImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
iconImage.ImageRectOffset = Vector2.new(0, 0)
iconImage.ImageRectSize = Vector2.new(0, 0)
iconImage.ImageTransparency = 0
iconImage.LayoutOrder = 0
iconImage.Position = UDim2.new(0, 12, 0, 15)
iconImage.Size = UDim2.new(0, 24, 0, 24)
iconImage.SizeConstraint = Enum.SizeConstraint.RelativeXY
iconImage.TileSize = UDim2.new(1, 0, 1, 0)
iconImage.SliceScale = 1
iconImage.ZIndex = 11

local iconLabel = Instance.new("TextLabel")
iconLabel.Name = "IconLabel"
iconLabel.Parent = iconButton
iconLabel.AnchorPoint = Vector2.new(0, 0.5)
iconLabel.BackgroundTransparency = 1
iconLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
iconLabel.BorderSizePixel = 1
iconLabel.Font = Enum.Font.GothamMedium
iconLabel.LayoutOrder = 0
iconLabel.Text = CharacterName
iconLabel.TextColor3 = Color3.fromRGB(255, 216, 19)
iconLabel.TextSize = 14
iconLabel.TextScaled = false
iconLabel.TextTransparency = 0
iconLabel.TextWrapped = false
iconLabel.TextXAlignment = Enum.TextXAlignment.Left
iconLabel.TextYAlignment = Enum.TextYAlignment.Center
iconLabel.Position = UDim2.new(0, 44, 0, 15)
iconLabel.Size = UDim2.new(1, -56, 0, 7)
iconLabel.TextStrokeTransparency = 1
iconLabel.ZIndex = 11

local function onErrorNotification()
    game.StarterGui:SetCore("SendNotification", {
        Title = "NOTIFICATION";
        Text = "YOU'RE ALREADY PLAYING AS THIS CHARACTER.";
        Icon = "";
        Duration = 5;
    })
end
local function notice()
    game.StarterGui:SetCore("SendNotification", {
        Title = "NOTIFICATION";
        Text = "YOU ARE NOT USING HERO HUNTER.";
        Icon = "";
        Duration = 5;
    })
end

local function handleIconButtonClick()
    
    local character = player.Character
    if not character then
        return
    end

    local scriptHasRun = character:FindFirstChild("ScriptHasRun")
    if scriptHasRun and scriptHasRun.Value then
        onErrorNotification()
        return
    end

    if not scriptHasRun then
    if game.Players.LocalPlayer.Name == "guestcoolguypro2" and game.Players.LocalPlayer.Backpack:FindFirstChild("Flowing Water") and game.Players.LocalPlayer.Backpack:FindFirstChild("Lethal Whirlwind Stream") and game.Players.LocalPlayer.Backpack:FindFirstChild("Hunter's Grasp") and game.Players.LocalPlayer.Backpack:FindFirstChild("Prey's Peril") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Surprise Attack") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Vengeful Counter Attack") then
        scriptHasRun = Instance.new("BoolValue")
        scriptHasRun.Name = "ScriptHasRun"
        scriptHasRun.Value = true
        scriptHasRun.Parent = character
        Script()
        else
        notice()
    end
    else
        scriptHasRun.Value = true
    end
end

iconButton.MouseButton1Click:Connect(handleIconButtonClick)

print("Script Loaded 0 cap")  -- Debug print to confirm script initialization

player.CharacterAdded:Connect(function(character)
local KJ = dropdownFrame.KJ
KJ.Visible = false
    local scriptHasRun = character:FindFirstChild("ScriptHasRun")
    if scriptHasRun then
        scriptHasRun.Value = false
    end
end)

if player.Character then
    local scriptHasRun = player.Character:FindFirstChild("ScriptHasRun")
    if scriptHasRun then
        scriptHasRun.Value = false
    end
end
   end,
})
local Button = Tab:CreateButton({
   Name = "Zen Sue",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "Gojo Revamp",
   Callback = function()
   local CharacterName = "Strongest Of Today"
local CharacterIcon = 16475337241
local function Script()
 if game.Players.LocalPlayer.Name == "guestcoolguypro2" and game.Players.LocalPlayer.Backpack:FindFirstChild("Infinity") and game.Players.LocalPlayer.Backpack:FindFirstChild("Repulse") and game.Players.LocalPlayer.Backpack:FindFirstChild("Erase") and game.Players.LocalPlayer.Backpack:FindFirstChild("Attract") then
local p = game.Players.LocalPlayer
local character = p.Character
--18440389930
local er = Instance.new("Attachment")
task.spawn(function()
local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local function findGuiAndSetText()

    local screenGui = playerGui:FindFirstChild("ScreenGui")

    if screenGui then

        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")

        if magicHealthFrame then

            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")

            if textLabel then

                textLabel.Text = "Strongest of Today" --[[Yup Change Me]]

            end

        end

    end

end
local function setnamesformoves()
while true do
local baseButton1 = hotbarFrame:FindFirstChild("1").Base.ToolName
local baseButton2 = hotbarFrame:FindFirstChild("2").Base.ToolName
local baseButton3 = hotbarFrame:FindFirstChild("3").Base.ToolName
local baseButton4 = hotbarFrame:FindFirstChild("4").Base.ToolName
task.wait()
if baseButton1.Text == "Infinity" then

else

end
if baseButton2.Text == "Repulse" and character:FindFirstChild("AbsoluteImmortal") then
baseButton2.Parent.Reuse.Visible = true
baseButton2.Parent.Reuse.Text = "VARIANT"
baseButton2.Parent.Reuse.Reuse.Text = "VARIANT"
elseif baseButton2.Text == "Repulse" and not character:FindFirstChild("AbsoluteImmortal") then
baseButton2.Parent.Reuse.Visible = true
baseButton2.Parent.Reuse.Text = "DISABLED"
baseButton2.Parent.Reuse.Reuse.Text = "DISABLED"
end
if baseButton3.Text == "Erase" and character:FindFirstChild("AbsoluteImmortal") then
baseButton3.Parent.Reuse.Visible = true
baseButton3.Parent.Reuse.Text = "VARIANT"
baseButton3.Parent.Reuse.Reuse.Text = "VARIANT"
elseif baseButton3.Text == "Erase" and not character:FindFirstChild("AbsoluteImmortal") then
baseButton3.Parent.Reuse.Visible = true
baseButton3.Parent.Reuse.Text = "DISABLED"
baseButton3.Parent.Reuse.Reuse.Text = "DISABLED"
end
if baseButton4.Text == "Attract" then
baseButton4.Parent.Reuse.Visible = true
baseButton4.Parent.Reuse.Text = "VARIANT"
baseButton4.Parent.Reuse.Reuse.Text = "VARIANT"
else
end
end
end
findGuiAndSetText()
setnamesformoves()
end)
er.Name = "test"
er.Parent = character.Torso
--character.Torso.GreenAura.Real.Enabled = true
--character.Torso.GreenAura.Real2.Enabled = true
character.HumanoidRootPart.RootAttachment.Locked.Enabled = true
local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= p and otherPlayer.Character then
            local otherRoot = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if otherRoot then
                local distance = (character.HumanoidRootPart.Position - otherRoot.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = otherRoot
                end
            end
        end
    end
    return closestPlayer
end
function replaceAndPlayAnimation3()
    local humanoid = character:WaitForChild("Humanoid")

    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID

        if animationTrack.Animation.AnimationId == "rbxassetid://15121659862" then --12273188754
        local floor = character.Humanoid.FloorMaterial
        if floor == Enum.Material.Air then
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://116753755471636"
            
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
animationTrack:Stop()
local soundeffect = Instance.new("Sound")
                soundeffect.SoundId = "rbxassetid://90302907790797"
                soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
                soundeffect:Play()
                soundeffect.Volume = 2
                --soundeffect.TimePosition = 1.9
local p = false

task.spawn(function()
humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    if humanoid.WalkSpeed ~= 0 and p == false then
        humanoid.WalkSpeed = 0
    end
end)

    while p == false do
    task.wait()
    humanoid.AutoRotate = false
    character.HumanoidRootPart.Anchored = false
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(3), 0) -- Adjust the "10" for spin speed
    end
    end)
wait(1)
anim:AdjustSpeed(0)
wait(6.5)
anim:Stop()
p = true
humanoid.WalkSpeed = 16
elseif floor ~= Enum.Material.Air then
local soundeffect = Instance.new("Sound")
                soundeffect.SoundId = "rbxassetid://118940582718933"
                soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
                soundeffect:Play()
                soundeffect.Volume = 2
character.HumanoidRootPart.Anchored = true
wait(7.5)
character.HumanoidRootPart.Anchored = false
end

end
end)
end
replaceAndPlayAnimation3()
function replaceAndPlayAnimation()
    local humanoid = character:WaitForChild("Humanoid")
local amount = 0

    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID

        if animationTrack.Animation.AnimationId == "rbxassetid://13071982935" then
        local floor = character.Humanoid.FloorMaterial
          if floor == Enum.Material.Air then
            local animAnim = Instance.new("Animation")
            amount = 0
            animAnim.AnimationId = "rbxassetid://15507137974"
            
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
animationTrack:Stop()
game.Workspace.Gravity = 0
wait(3)

while amount < 20 do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame += Vector3.new(0,1.5,0)
amount += 2
    task.wait(0.1) -- Simulating 60 FPS movement
end
--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame += Vector3.new(0,20,0)
    --game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    wait(2)
    game.Workspace.Gravity = 172
    ---game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end
end
end)
end

replaceAndPlayAnimation()

function replaceAndPlayAnimation2()
    local humanoid = character:WaitForChild("Humanoid")
local amount = 0

    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID

        if animationTrack.Animation.AnimationId == "rbxassetid://17799224866" then
       
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://71060716968719"
            
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
            --anim:AdjustSpeed(1.35)
end
end)
end
replaceAndPlayAnimation2()

function replaceAndPlayAnimation1()
    local humanoid = character:WaitForChild("Humanoid")
local amount = 0

    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID

        if animationTrack.Animation.AnimationId == "rbxassetid://13073745835" then --12273188754
        local floor = character.Humanoid.FloorMaterial
        if floor == Enum.Material.Air then
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://13801083337"
            
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
animationTrack:Stop()

wait(0.37)
local p = false
character.HumanoidRootPart.Anchored = true
task.spawn(function()
humanoid:GetPropertyChangedSignal("AutoRotate"):Connect(function()
    if humanoid.AutoRotate ~= false and p == false then
        humanoid.AutoRotate = false
    end
end)
end)
    local target = getClosestPlayer()
    if target then
        local rootPos = character.HumanoidRootPart.Position
        local targetPos = target.Position

        -- Get direction to target while ignoring Y difference
        local direction = (targetPos - rootPos).Unit
        local angleY = math.atan2(-direction.X, -direction.Z) -- Flip direction to face properly

        -- Set new rotation while keeping current position
        character.HumanoidRootPart.CFrame = CFrame.new(rootPos) * CFrame.Angles(0, angleY, 0)
    end

anim:AdjustSpeed(0)
--wait(0.4) -- 0.7
local soundeffect = Instance.new("Sound")
                soundeffect.SoundId = "rbxassetid://6650592166"
                soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
                soundeffect:Play()
                soundeffect.Volume = 5
                soundeffect.TimePosition = 0.75
                --soundeffect.PlaybackSpeed = 1.1
--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame += Vector3.new(1000,1000,1000)
wait(0.24) -- 0.4
local soundeffect2 = Instance.new("Sound")
                soundeffect2.SoundId = "rbxassetid://6650592166"
                soundeffect2.Parent = game.Players.LocalPlayer.Character.Torso
                soundeffect2:Play()
                soundeffect2.Volume = 5
                soundeffect2.TimePosition = 2.25
--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame += Vector3.new(-1000,-1000,-1000)
wait(0.2)
soundeffect:Stop()
p = true
humanoid.AutoRotate = true
character.HumanoidRootPart.Anchored = false
anim:Stop()
wait(0.25)
character.HumanoidRootPart.Anchored = false
else

local soundeffect = Instance.new("Sound")
                soundeffect.SoundId = "rbxassetid://114219438298857"
                soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
                soundeffect:Play()
                soundeffect.Volume = 2
                soundeffect.TimePosition = 0.25
end
end
end)
end
replaceAndPlayAnimation1()


function replaceAndPlayAnimation4()
    local humanoid = character:WaitForChild("Humanoid")
local amount = 0

    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID

        if animationTrack.Animation.AnimationId == "rbxassetid://13560306510" then
        local floor = character.Humanoid.FloorMaterial
        if floor == Enum.Material.Air then
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://140164642047188"
            
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
           anim:AdjustSpeed(0)
 character.HumanoidRootPart.CFrame += Vector3.new(0,-5,0)
anim.TimePosition = 6

anim:AdjustSpeed(0.55)
for i, v in pairs(game.ReplicatedStorage.Emotes.cursedEnergy:GetChildren()) do
    local v1 = v:Clone()
    v1.Parent = character["Right Arm"].RightGripAttachment

    -- If the cloned object contains ParticleEmitters, enable them
    for _, emitter in pairs(v1:GetChildren()) do
        if emitter:IsA("ParticleEmitter") then
            emitter.Enabled = true
        end
    end

    -- Delayed disabling of particles
    task.spawn(function()
        wait(2)
if v1:IsA("ParticleEmitter") then
v1.Enabled = false
v1.Rate = 0
task.spawn(function()
                    wait(1.5)
                    v1:Destroy()
                    end)
end
        -- Disable effects inside Right Arm's attachment
        if v1:IsA("Attachment") then
            for _, effect in pairs(v1:GetChildren()) do
                if effect:IsA("ParticleEmitter") then
                    effect.Enabled = false
                    effect.Rate = 0
                    task.spawn(function()
                    wait(1.5)
                    v1:Destroy()
                    end)
                    elseif effect:IsA("PointLight") then
                    effect.Enabled = false
                    task.spawn(function()
                    wait(1.5)
                    v1:Destroy()
                    end)
                end
            end
        end

        -- Disable effects inside Left Arm's attachment
    
    end)


end
           wait(2)
           for i, v in pairs(game.ReplicatedStorage.Emotes.redEnergy:GetChildren()) do
    local v1 = v:Clone()
    v1.Parent = character["Right Arm"].RightGripAttachment

    -- If the cloned object contains ParticleEmitters, enable them
    for _, emitter in pairs(v1:GetChildren()) do
        if emitter:IsA("ParticleEmitter") then
            emitter.Enabled = true
        end
    end

    -- Delayed disabling of particles
    task.spawn(function()
        wait(2.35)
if v1:IsA("ParticleEmitter") then
v1.Enabled = false
v1.Rate = 0
task.spawn(function()
                    wait(1.5)
                    v1:Destroy()
                    end)
end
        -- Disable effects inside Right Arm's attachment
        if v1:IsA("Attachment") then
            for _, effect in pairs(v1:GetChildren()) do
                if effect:IsA("ParticleEmitter") then
                    effect.Enabled = false
                    effect.Rate = 0
                    task.spawn(function()
                    wait(1.5)
                    v1:Destroy()
                    end)
                    elseif effect:IsA("PointLight") then
                    effect.Enabled = false
                    task.spawn(function()
                    wait(1.5)
                    v1:Destroy()
                    end)
                end
            end
        end

        -- Disable effects inside Left Arm's attachment
    
    end)


end
           wait(1)
          for i, v in pairs(game.ReplicatedStorage.Resources.KJEffects.KJWallCombo.FinalImpact:GetChildren()) do
if v.Name ~= "Origin" then
value = true
    local v1 = v:Clone()
    v1.Parent = character.HumanoidRootPart.Forward

    -- If the cloned object contains ParticleEmitters, enable them
        if v1:IsA("ParticleEmitter") then
            v1.Enabled = true
        end
  if v1:IsA("Attachment") then
            for _, effect in pairs(v1:GetChildren()) do
                if effect:IsA("ParticleEmitter") then
                effect.LockedToPart = false
                    effect:Emit(15)
                    
                    elseif effect:IsA("PointLight") then
                    effect.Enabled = false
                 
                    
                end
            end
        end
    -- Delayed disabling of particles
    end
    end
           local soundeffect = Instance.new("Sound")
                soundeffect.SoundId = "rbxassetid://17873732848"
                soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
                soundeffect:Play()
                soundeffect.Volume = 2
           local soundeffect = Instance.new("Sound")
                soundeffect.SoundId = "rbxassetid://17556294144"
                soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
                soundeffect:Play()
                soundeffect.Volume = 3
                else
for i, v in pairs(game.ReplicatedStorage.Emotes.cursedEnergy:GetChildren()) do
    local v1 = v:Clone()
    v1.Parent = character["Right Arm"].RightGripAttachment
    
    local v2 = v:Clone()
    v2.Parent = character["Left Arm"].LeftGripAttachment

    -- If the cloned object contains ParticleEmitters, enable them
    for _, emitter in pairs(v1:GetChildren()) do
        if emitter:IsA("ParticleEmitter") then
            emitter.Enabled = true
        end
    end

    for _, emitter in pairs(v2:GetChildren()) do
        if emitter:IsA("ParticleEmitter") then
            emitter.Enabled = true
        end
    end

    -- Delayed disabling of particles
    task.spawn(function()
        wait(3.5)
if v1:IsA("ParticleEmitter") then
v1.Enabled = false
v1.Rate = 0
task.spawn(function()
                    wait(4.5)
                    v1:Destroy()
                    end)
end
if v2:IsA("ParticleEmitter") then
v2.Enabled = false
v2.Rate = 0
task.spawn(function()
                    wait(4.5)
                    v2:Destroy()
                    end)
end
        -- Disable effects inside Right Arm's attachment
        if v1:IsA("Attachment") then
            for _, effect in pairs(v1:GetChildren()) do
                if effect:IsA("ParticleEmitter") then
                    effect.Enabled = false
                    effect.Rate = 0
                    task.spawn(function()
                    wait(4.5)
                    v1:Destroy()
                    end)
                    elseif effect:IsA("PointLight") then
                    effect.Enabled = false
                    task.spawn(function()
                    wait(4.5)
                    v1:Destroy()
                    end)
                end
            end
        end

        -- Disable effects inside Left Arm's attachment
        if v2:IsA("Attachment") then
            for _, effect in pairs(v2:GetChildren()) do
                if effect:IsA("ParticleEmitter") then
                    effect.Enabled = false
                    effect.Rate = 0
                    task.spawn(function()
                    wait(4.5)
                    v1:Destroy()
                    end)
                    elseif effect:IsA("PointLight") then
                    effect.Enabled = false
                    task.spawn(function()
                    wait(4.5)
                    v1:Destroy()
                    end)
                    
                end
            end
        end
    end)


end
end
end
end)
end
replaceAndPlayAnimation4()

--[[for i, v in pairs(game.ReplicatedStorage.Emotes.cursedEnergy:GetChildren()) do
    local v1 = v:Clone()
    v1.Parent = character["Right Arm"].RightGripAttachment
    
    local v2 = v:Clone()
    v2.Parent = character["Left Arm"].LeftGripAttachment

    -- If the cloned object contains ParticleEmitters, enable them
    for _, emitter in pairs(v1:GetChildren()) do
        if emitter:IsA("ParticleEmitter") then
            emitter.Enabled = true
        end
    end

    for _, emitter in pairs(v2:GetChildren()) do
        if emitter:IsA("ParticleEmitter") then
            emitter.Enabled = true
        end
    end

    -- Delayed disabling of particles
    task.spawn(function()
        wait(3.5)

        -- Disable effects inside Right Arm's attachment
        if v1:IsA("Attachment") then
            for _, effect in pairs(v1:GetChildren()) do
                if effect:IsA("ParticleEmitter") then
                    effect.Enabled = false
                    effect.Rate = 0
                end
            end
        end

        -- Disable effects inside Left Arm's attachment
        if v2:IsA("Attachment") then
            for _, effect in pairs(v2:GetChildren()) do
                if effect:IsA("ParticleEmitter") then
                    effect.Enabled = false
                    effect.Rate = 0
                end
            end
        end
    end)
end]]
function replaceAndPlayAnimation5()
    local humanoid = character:WaitForChild("Humanoid")
local amount = 0

    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID

        if animationTrack.Animation.AnimationId == "rbxassetid://18903642853" then
       
             local soundeffect = Instance.new("Sound")
                soundeffect.SoundId = "rbxassetid://115214890263100"
                soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
                soundeffect:Play()
                soundeffect.Volume = 2
                soundeffect.TimePosition = 1.9
               -- soundeffect.PlaybackSpeed = 1.2
            --anim:AdjustSpeed(1.35)
end
end)
end
replaceAndPlayAnimation5()

function replaceAndPlayAnimation6()
    local humanoid = character:WaitForChild("Humanoid")
local amount = 0

    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID

        if animationTrack.Animation.AnimationId == "rbxassetid://13071982935" then
       
             local soundeffect = Instance.new("Sound")
                soundeffect.SoundId = "rbxassetid://118940582718933"
                soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
                soundeffect:Play()
                soundeffect.Volume = 2
               -- soundeffect:PlaybackSpeed(1.1)
                soundeffect.PlaybackSpeed = 1.1
            --anim:AdjustSpeed(1.35)
            wait(1.5)
            local soundeffect = Instance.new("Sound")
                soundeffect.SoundId = "rbxassetid://136240782932429"
                soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
                soundeffect:Play()
                soundeffect.Volume = 4
                soundeffect.PlaybackSpeed = 1.1
            --anim:AdjustSpeed(1.35)

end
end)
end
replaceAndPlayAnimation6()

local value = false
while true do
task.wait()
if character:FindFirstChild("AbsoluteImmortal") and value == false then
value = true
for i, v in pairs(game.ReplicatedStorage.Resources.Sorcerer.LimitlessBarrier.Core.BarrierFX:GetChildren()) do

value = true
    local v1 = v:Clone()
    v1.Parent = er

    -- If the cloned object contains ParticleEmitters, enable them
        if v1:IsA("ParticleEmitter") then
            v1.Enabled = true
        end
  if v1:IsA("Attachment") then
            for _, effect in pairs(v1:GetChildren()) do
                if effect:IsA("ParticleEmitter") then
                    effect.Enabled = false
                    effect.Rate = 0
                    
                    elseif effect:IsA("PointLight") then
                    effect.Enabled = false
                 
                    
                end
            end
        end
    -- Delayed disabling of particles
    end
elseif not character:FindFirstChild("AbsoluteImmortal") and value == true then --3, 1,
value = false
    -- If the cloned object contains ParticleEmitters, enable them
    
for i, v in pairs(character.Torso.test:GetChildren()) do
if v:IsA("ParticleEmitter") then
v.Enabled = false
v.Rate = 0
task.spawn(function()
                    wait(1.5)
                    v:Destroy()
                    end)
end
if v:IsA("Attachment") then
            for _, effect in pairs(v:GetChildren()) do
                if effect:IsA("ParticleEmitter") then
                   effect.Enabled = false
                    task.spawn(function()
                    wait(1.5)
                    v:Destroy()
                    end)
                    elseif effect:IsA("PointLight") then
                    effect.Enabled = false
                    task.spawn(function()
                    wait(1.5)
                    v:Destroy()
                    end)
                end
            end
        end
        -- Disable effects inside Right Arm's attachment
end
    -- Delayed disabling of particles





end
end

--[[for i, v in pairs(character.Torso.infinityeffect:GetChildren()) do
if v:IsA("ParticleEmitter") then
v.Enabled = false
v.Rate = 0
task.spawn(function()
                    wait(1.5)
                    v:Destroy()
                    end)
end
        -- Disable effects inside Right Arm's attachment
end]]

end
end


local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local topbarPlus = playerGui:WaitForChild("TopbarPlus")
local topbarContainer = topbarPlus:WaitForChild("TopbarContainer")
local unnamedIcon = topbarContainer:WaitForChild("UnnamedIcon")
local dropdownContainer = unnamedIcon:WaitForChild("DropdownContainer")
local dropdownFrame = dropdownContainer:WaitForChild("DropdownFrame")
local KJ = dropdownFrame.KJ
KJ.Visible = false

if dropdownFrame:FindFirstChild("Char") then
dropdownFrame:FindFirstChild("Char"):Destroy()
end

local charFrame = Instance.new("Frame")
charFrame.Name = "Char"
charFrame.Parent = dropdownFrame
charFrame.BackgroundTransparency = 1
charFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
charFrame.BorderSizePixel = 1
charFrame.LayoutOrder = 14
charFrame.Size = UDim2.new(1, 0, 0, 32)
charFrame.SizeConstraint = Enum.SizeConstraint.RelativeXY
charFrame.ZIndex = 1

local iconButton = Instance.new("TextButton")
iconButton.Name = "IconButton"
iconButton.Parent = charFrame
iconButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
iconButton.BackgroundTransparency = 0.5
iconButton.BorderSizePixel = 0
iconButton.Text = ""
iconButton.TextScaled = false
iconButton.TextSize = 8
iconButton.TextTransparency = 1
iconButton.TextWrapped = false
iconButton.Position = UDim2.new(0, 0, 0, 0)
iconButton.Size = UDim2.new(1, 0, 1, 0)
iconButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
iconButton.Font = Enum.Font.Legacy
iconButton.LayoutOrder = 0

local iconImage = Instance.new("ImageLabel")
iconImage.Name = "IconImage"
iconImage.Parent = iconButton
iconImage.AnchorPoint = Vector2.new(0, 0.5)
iconImage.BackgroundTransparency = 1
iconImage.BorderColor3 = Color3.fromRGB(27, 42, 53)
iconImage.BorderSizePixel = 1
iconImage.Image = "rbxassetid://" .. CharacterIcon
iconImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
iconImage.ImageRectOffset = Vector2.new(0, 0)
iconImage.ImageRectSize = Vector2.new(0, 0)
iconImage.ImageTransparency = 0
iconImage.LayoutOrder = 0
iconImage.Position = UDim2.new(0, 12, 0, 15)
iconImage.Size = UDim2.new(0, 24, 0, 24)
iconImage.SizeConstraint = Enum.SizeConstraint.RelativeXY
iconImage.TileSize = UDim2.new(1, 0, 1, 0)
iconImage.SliceScale = 1
iconImage.ZIndex = 11

local iconLabel = Instance.new("TextLabel")
iconLabel.Name = "IconLabel"
iconLabel.Parent = iconButton
iconLabel.AnchorPoint = Vector2.new(0, 0.5)
iconLabel.BackgroundTransparency = 1
iconLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
iconLabel.BorderSizePixel = 1
iconLabel.Font = Enum.Font.GothamMedium
iconLabel.LayoutOrder = 0
iconLabel.Text = CharacterName
iconLabel.TextColor3 = Color3.fromRGB(255, 216, 19)
iconLabel.TextSize = 14
iconLabel.TextScaled = false
iconLabel.TextTransparency = 0
iconLabel.TextWrapped = false
iconLabel.TextXAlignment = Enum.TextXAlignment.Left
iconLabel.TextYAlignment = Enum.TextYAlignment.Center
iconLabel.Position = UDim2.new(0, 44, 0, 15)
iconLabel.Size = UDim2.new(1, -56, 0, 7)
iconLabel.TextStrokeTransparency = 1
iconLabel.ZIndex = 11

local function onErrorNotification()
    game.StarterGui:SetCore("SendNotification", {
        Title = "NOTIFICATION";
        Text = "YOU'RE ALREADY PLAYING AS THIS CHARACTER.";
        Icon = "";
        Duration = 5;
    })
end
local function notice()
    game.StarterGui:SetCore("SendNotification", {
        Title = "NOTIFICATION";
        Text = "YOU ARE NOT USING SORCERER.";
        Icon = "";
        Duration = 5;
    })
end

local function handleIconButtonClick()
    
    local character = player.Character
    if not character then
        return
    end

    local scriptHasRun = character:FindFirstChild("ScriptHasRun")
    if scriptHasRun and scriptHasRun.Value then
        onErrorNotification()
        return
    end

    if not scriptHasRun then
    if game.Players.LocalPlayer.Name == "guestcoolguypro2" and game.Players.LocalPlayer.Backpack:FindFirstChild("Infinity") and game.Players.LocalPlayer.Backpack:FindFirstChild("Repulse") and game.Players.LocalPlayer.Backpack:FindFirstChild("Erase") and game.Players.LocalPlayer.Backpack:FindFirstChild("Attract") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Domain") then
        scriptHasRun = Instance.new("BoolValue")
        scriptHasRun.Name = "ScriptHasRun"
        scriptHasRun.Value = true
        scriptHasRun.Parent = character
        Script()
        else
        notice()
    end
    else
        scriptHasRun.Value = true
    end
end

iconButton.MouseButton1Click:Connect(handleIconButtonClick)

print("Script Loaded 0 cap")  -- Debug print to confirm script initialization

player.CharacterAdded:Connect(function(character)
local KJ = dropdownFrame.KJ
KJ.Visible = false
    local scriptHasRun = character:FindFirstChild("ScriptHasRun")
    if scriptHasRun then
        scriptHasRun.Value = false
    end
end)

if player.Character then
    local scriptHasRun = player.Character:FindFirstChild("ScriptHasRun")
    if scriptHasRun then
        scriptHasRun.Value = false
    end
end

   end,
})
local Tab = Window:CreateTab("Scripts", 0) -- Title, Image
local isDodging = false -- Track toggle state

local Toggle = Tab:CreateToggle({
   Name = "Dodge",
   CurrentValue = false,
   Flag = "Toggle1", -- Unique identifier for configuration saving

   Callback = function(Value)
       isDodging = Value -- Update tracking variable

       if isDodging then
           task.spawn(function() -- Run in a separate thread
               while isDodging do
                   task.wait()
                   teleportToObject()

                   -- Re-check the toggle state to prevent infinite looping
                   if not isDodging then break end
               end
           end)
       end
   end,
})

local Tab = Window:CreateTab("Adjustments", 0) -- Title, Image
local Slider = Tab:CreateSlider({
   Name = "Gravity",
   Range = {0, 196.2},
   Increment = 10,
   Suffix = "Force", -- You can change this to "Studs" if you want
   CurrentValue = 196.2,
   Flag = "Slider1", -- Unique identifier for configuration saving

   Callback = function(Value)
       -- Update the gravity based on the slider value
       workspace.Gravity = Value
   end,
})
local Slider = Tab:CreateSlider({
   Name = "Walk Speed",
   Range = {16, 100},
   Increment = 2,
   Suffix = "Speed", -- You can change this to "Studs" if you want
   CurrentValue = 16,
   Flag = "Slider2", -- Unique identifier for configuration saving

   Callback = function(Value)
       -- Set initial value when slider is adjusted
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

       -- If the value is 16, stop looping
       if Value == 16 then
           -- Disconnect the Heartbeat connection if WalkSpeed is 16
           if _G.walkSpeedConnection then
               _G.walkSpeedConnection:Disconnect()
               _G.walkSpeedConnection = nil -- Clean up the connection variable
           end
       else
           -- Create or update Heartbeat connection that continuously checks the slider value
           if _G.walkSpeedConnection then
               _G.walkSpeedConnection:Disconnect() -- Disconnect the old connection if it exists
           end

           -- Create a new Heartbeat connection
           _G.walkSpeedConnection = game:GetService("RunService").Heartbeat:Connect(function()
               -- Continuously update WalkSpeed based on the current value of the slider
               game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
           end)
       end
   end,
})

local Toggle = Tab:CreateToggle({
    Name = "B-Hop",
    CurrentValue = false,
    Flag = "Toggle2", -- Unique identifier for configuration saving

    Callback = function(Value)
        isBHopEnabled = Value -- Track if B-Hop is active

        if isBHopEnabled then
            task.spawn(function()
                local player = game.Players.LocalPlayer
                local char = player.Character
                local humanoid = char and char:FindFirstChild("Humanoid")
                local hrp = char and char:FindFirstChild("HumanoidRootPart")

                local baseWalkSpeed = humanoid and humanoid.WalkSpeed
                local momentum = baseWalkSpeed -- Start with base WalkSpeed
                local lastJumpTime = tick() -- Track last jump

                while isBHopEnabled and humanoid and hrp do
                    if humanoid:GetState() == Enum.HumanoidStateType.Jumping or humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                        momentum = momentum + 0.1 -- Increase speed
                        humanoid.WalkSpeed = math.min(momentum,175) -- Apply new WalkSpeed
                        --print(humanoid.WalkSpeed)
                        lastJumpTime = tick() -- Update last jump time
                    end

                    task.spawn(function()
                    if humanoid:GetState() == Enum.HumanoidStateType.Landed then
                        task.wait(0.5)
                        if tick() - lastJumpTime >= 0.5 then
                            momentum = baseWalkSpeed
                            humanoid.WalkSpeed = baseWalkSpeed
                        end
                    end
                    end)
                    task.wait() -- Smooth execution
                end
            end)
        else
            -- Reset WalkSpeed when B-Hop is turned off
            local player = game.Players.LocalPlayer
            local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 16 -- Reset to default speed
            end
        end
    end,
})

game.Players.LocalPlayer.CharacterAdded:Connect(function()
if reality == true then
wait(0.5)
  if game.Players.LocalPlayer.Name == "guestcoolguypro2" and game.Players.LocalPlayer.Backpack:FindFirstChild("Normal Punch") and game.Players.LocalPlayer.Backpack:FindFirstChild("Consecutive Punches") and game.Players.LocalPlayer.Backpack:FindFirstChild("Shove") and game.Players.LocalPlayer.Backpack:FindFirstChild("Uppercut") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Truly Pitiful") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Speeding Dash") then

--[[local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

Orion:MakeNotification({
	Name = "Character Moveset",
	Content = "This Character Is Reality Breaker",
	Image = "rbxassetid://4483345998",
	Time = 5
})]]
local player = game.Players.LocalPlayer
    local character = player.Character --or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    local runService = game:GetService("RunService")
    local movementSpeed2 = 750

local rootPart = character:WaitForChild("HumanoidRootPart")

local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local otherRoot = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if otherRoot then
                local distance = (rootPart.Position - otherRoot.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = otherRoot
                end
            end
        end
    end
    return closestPlayer
end

local TweenService = game:GetService("TweenService")
local cd3 = false
local moving2 = false
local function timer2(value)
if cd3 ~= true then
cd3 = true
local cooldown = game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown:Clone()
cooldown.Parent = game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["5"].Base
local Tween = TweenService:Create(cooldown,TweenInfo.new(value,Enum.EasingStyle.Linear),{Size = UDim2.fromScale(1,0)})
						Tween:Play()
                          local cooldown2 = game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown:Clone()
cooldown2.Parent = game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["6"].Base
local Tween2 = TweenService:Create(cooldown2,TweenInfo.new(value,Enum.EasingStyle.Linear),{Size = UDim2.fromScale(1,0)})
						Tween:Play()
                        Tween2:Play()
Tween.Completed:Wait()
cooldown:Destroy()
        cd3 = false
        
        end
end
if not game.Players.LocalPlayer.Backpack:FindFirstChild("Speeding Dash") then
--game.Players.LocalPlayer.Backpack:FindFirstChild("Shove"):Destroy()

local tool = Instance.new("Tool")
    tool.Name = "Speeding Dash"

    tool.Parent = game.Players.LocalPlayer.Backpack
    tool.RequiresHandle = false

    game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["5"].Base.Reuse.Visible = true

    local moving = false
    local player = game.Players.LocalPlayer
    local character = player.Character --or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    local runService = game:GetService("RunService")
    local movementSpeed = 60

    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://18897115785" 
    local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
    local animationTrack


    local function moveForward()
      while moving == true do
            local forwardDirection = humanoidRootPart.CFrame.LookVector
            humanoidRootPart.Velocity = forwardDirection * movementSpeed
            runService.Stepped:Wait()
        end
    end

    tool.Equipped:Connect(function()
    if cd3 == false then
    
        moving = true
        
      
        animationTrack = animator:LoadAnimation(animation)
        animationTrack:Play()
        animationTrack.Stopped:Connect(function()
        tool.Parent.Humanoid:UnequipTools()
        end)
        moveForward()
       timer2(15)
       
        end
         
         
    end)

    tool.Unequipped:Connect(function()
        moving = false
        if animationTrack then
            animationTrack:Stop()
       end
    end)
    end
    local Players = game:GetService("Players")
    local function getClosestPlayerWithinRadius5(targetPlayer, radius)
    local targetCharacter = targetPlayer.Character
    if not targetCharacter then return nil end

    local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetHumanoidRootPart then return nil end

    local targetPosition = targetHumanoidRootPart.Position
    local closestPlayer = nil
    local closestDistance = math.huge

    -- Iterate through all players to find the closest one within the radius
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= targetPlayer and player.Character then
            local playerHumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if playerHumanoidRootPart then
                local playerPosition = playerHumanoidRootPart.Position
                local distance = (playerPosition - targetPosition).magnitude
                if distance <= radius and distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end

    return closestPlayer
end

local function teleportPlayerBehindClosest5(targetPlayer)
    local closestPlayer = getClosestPlayerWithinRadius5(targetPlayer, 13)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character

        if targetCharacter and closestCharacter then
            local closestHumanoidRootPart = closestCharacter:FindFirstChild("HumanoidRootPart")
            if closestHumanoidRootPart then
                -- Calculate the position 3 studs behind the closest player
                local closestCFrame = closestHumanoidRootPart.CFrame
                local behindPosition = closestCFrame.Position - closestCFrame.LookVector * 5

                -- Teleport the target player behind the closest player
                targetCharacter:SetPrimaryPartCFrame(CFrame.new(behindPosition))
                print(targetPlayer.Name .. " has been teleported behind " .. closestPlayer.Name)
            end
        end
    else
       -- print("No player found within 35 studs of " .. targetPlayer.Name)
    end
end

if not game.Players.LocalPlayer.Backpack:FindFirstChild("Truly Pitiful") then
--game.Players.LocalPlayer.Backpack:FindFirstChild("Shove"):Destroy()

local tool = Instance.new("Tool")
    tool.Name = "Truly Pitiful"
    tool:SetAttribute("Skill", true)

    tool.Parent = game.Players.LocalPlayer.Backpack
    tool.RequiresHandle = false

    --game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["5"].Base.Reuse.Visible = true

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    local runService = game:GetService("RunService")

    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://13736115009" 
    local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
    local animationTrack


    tool.Equipped:Connect(function()
    if cd3 == false then
        animationTrack = animator:LoadAnimation(animation)
        --humanoid.WalkSpeed = 0
        animationTrack:Play()
        animationTrack.Stopped:Connect(function()
       -- humanoid.WalkSpeed = 16
        teleportPlayerBehindClosest5(player)
         local target = getClosestPlayer()
    if target then
        local rootPos = rootPart.Position
        local targetPos = target.Position

        -- Get direction to target while ignoring Y difference
        local direction = (targetPos - rootPos).Unit
        local angleY = math.atan2(-direction.X, -direction.Z) -- Flip direction to face properly

        -- Set new rotation while keeping current position
        rootPart.CFrame = CFrame.new(rootPos) * CFrame.Angles(0, angleY, 0)
    end
        end)
       timer2(7)
       
        end
         
         
    end)
    end
--game.Players.LocalPlayer.Backpack:FindFirstChild("Shove"):Destroy()


   --[[ local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://18897115785" 
    local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
    local animationTrack


    local function moveForward2()
      while moving2 == true do
         humanoid.AutoRotate = true
            local forwardDirection = humanoidRootPart.CFrame.LookVector
            humanoidRootPart.Velocity = forwardDirection * movementSpeed
            runService.Stepped:Wait()
        end
    end]]
local duration = 7
local decrement = movementSpeed2 / (60 * duration) -- Reduce speed every frame (assuming 60 FPS)

local function moveForward2()
    while moving2 == true and movementSpeed2 > 0 do
       local forwardDirection = humanoidRootPart.CFrame.LookVector
        forwardDirection = Vector3.new(forwardDirection.X, 0, forwardDirection.Z)
        humanoidRootPart.Velocity = forwardDirection * movementSpeed2
        humanoid.AutoRotate = true
        movementSpeed2 = math.max(movementSpeed2 - decrement, 0.1) -- Decrease speed smoothly
        runService.Stepped:Wait()
    end
end

local Players = game:GetService("Players")

local function getClosestPlayerWithinRadius(targetPlayer, radius)
    local targetCharacter = targetPlayer.Character
    if not targetCharacter then return nil end

    local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetHumanoidRootPart then return nil end

    local targetPosition = targetHumanoidRootPart.Position
    local closestPlayer = nil
    local closestDistance = math.huge

    -- Iterate through all players to find the closest one within the radius
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= targetPlayer and player.Character then
            local playerHumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if playerHumanoidRootPart then
                local playerPosition = playerHumanoidRootPart.Position
                local distance = (playerPosition - targetPosition).magnitude
                if distance <= radius and distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end

    return closestPlayer
end

local function teleportPlayerBehindClosest(targetPlayer)
    local closestPlayer = getClosestPlayerWithinRadius(targetPlayer, 35)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character

        if targetCharacter and closestCharacter then
            local closestHumanoidRootPart = closestCharacter:FindFirstChild("HumanoidRootPart")
            if closestHumanoidRootPart then
                -- Calculate the position 3 studs behind the closest player
                local closestCFrame = closestHumanoidRootPart.CFrame
                local behindPosition = closestCFrame.Position - closestCFrame.LookVector * 1

                -- Teleport the target player behind the closest player
                targetCharacter:SetPrimaryPartCFrame(CFrame.new(behindPosition))
                print(targetPlayer.Name .. " has been teleported behind " .. closestPlayer.Name)
            end
        end
    else
        print("No player found within 35 studs of " .. targetPlayer.Name)
    end
end
local function teleportPlayerBehindClosest7(targetPlayer)
    local closestPlayer = getClosestPlayerWithinRadius(targetPlayer, 75)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character

        if targetCharacter and closestCharacter then
            local closestHumanoidRootPart = closestCharacter:FindFirstChild("HumanoidRootPart")
            if closestHumanoidRootPart then
                -- Calculate the position 3 studs behind the closest player
                local closestCFrame = closestHumanoidRootPart.CFrame
                local behindPosition = closestCFrame.Position - closestCFrame.LookVector * 5

                -- Teleport the target player behind the closest player
                targetCharacter:SetPrimaryPartCFrame(CFrame.new(behindPosition))
                print(targetPlayer.Name .. " has been teleported behind " .. closestPlayer.Name)
            end
        end
    else
        print("No player found within 35 studs of " .. targetPlayer.Name)
    end
end
local function teleportPlayerBehindClosest8(targetPlayer)
    local closestPlayer = getClosestPlayerWithinRadius(targetPlayer, 25)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character

        if targetCharacter and closestCharacter then
            local closestHumanoidRootPart = closestCharacter:FindFirstChild("HumanoidRootPart")
            if closestHumanoidRootPart then
        
                -- Calculate the position 3 studs behind the closest player
               local closestCFrame = closestHumanoidRootPart.CFrame
                local behindPosition = closestCFrame.Position - closestCFrame.LookVector * 5
                -- Teleport the target player behind the closest player
                targetCharacter:SetPrimaryPartCFrame(CFrame.new(behindPosition))
                print(targetPlayer.Name .. " has been teleported behind " .. closestPlayer.Name)
            end
        end
    else
        print("No player found within 35 studs of " .. targetPlayer.Name)
    end
end
local Players = game:GetService("Players")

local function getClosestPlayerBehind2(targetPlayer)
    local targetCharacter = targetPlayer.Character
    if not targetCharacter then return nil end
    
    local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetHumanoidRootPart then return nil end
    
    local targetPosition = targetHumanoidRootPart.Position
    local targetLookVector = targetHumanoidRootPart.CFrame.LookVector -- Direction player is facing
    local closestPlayer = nil
    local closestDistance = math.huge

    -- Iterate through all players to find the closest one behind
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= targetPlayer and player.Character then
            local playerHumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if playerHumanoidRootPart then
                local playerPosition = playerHumanoidRootPart.Position
                local directionToPlayer = (playerPosition - targetPosition).unit
                local closestDistance = math.huge

                -- Calculate if the player is behind (dot product of vectors should be negative)
                local dotProduct = directionToPlayer:Dot(targetLookVector)
                
                if dotProduct > 0 then -- The player is behind
                local distance = (playerPosition - targetPosition).magnitude
                    if distance <= 22 then  -- Only consider players within a 75 stud radius
                        if distance > 5 then
                        if distance < closestDistance then
                            closestDistance = distance
                            closestPlayer = player
                        
                        end
                        end
                    end
                end
            end
        end
    end

    return closestPlayer
end

local function teleportToClosestPlayerBehind2(targetPlayer)
    local closestPlayer = getClosestPlayerBehind2(targetPlayer)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character
        if targetCharacter and closestCharacter then
            local closestPosition = closestCharacter.HumanoidRootPart.Position
            
            -- Teleport target player to the position of the closest player behind them
            targetCharacter:SetPrimaryPartCFrame(CFrame.new(closestPosition))
            print(targetPlayer.Name .. " has been teleported to " .. closestPlayer.Name)
        else
            --print("Failed to teleport. One of the characters is missing.")
        end
    else
        --print("No player found behind " .. targetPlayer.Name .. " within 75 studs")
    end
end
local function getClosestPlayerBehind3(targetPlayer)
    local targetCharacter = targetPlayer.Character
    if not targetCharacter then return nil end
    
    local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetHumanoidRootPart then return nil end
    
    local targetPosition = targetHumanoidRootPart.Position
    local targetLookVector = targetHumanoidRootPart.CFrame.LookVector -- Direction player is facing
    local closestPlayer = nil
    local closestDistance = math.huge

    -- Iterate through all players to find the closest one behind
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= targetPlayer and player.Character then
            local playerHumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if playerHumanoidRootPart then
                local playerPosition = playerHumanoidRootPart.Position
                local directionToPlayer = (playerPosition - targetPosition).unit

                -- Calculate if the player is behind (dot product of vectors should be negative)
                local dotProduct = directionToPlayer:Dot(targetLookVector)
                
                if dotProduct > 0 then -- The player is behind
                local distance = (playerPosition - targetPosition).magnitude
                    if distance <= 35 then  -- Only consider players within a 75 stud radius
                        if distance > 6.75 then
                        if distance < closestDistance then
                            closestDistance = distance
                            closestPlayer = player
                        
                        end
                        end
                    end
                end
            end
        end
    end

    return closestPlayer
end

local function teleportToClosestPlayerBehind3(targetPlayer)
    local closestPlayer = getClosestPlayerBehind3(targetPlayer)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character
        if targetCharacter and closestCharacter then
            local closestPosition = closestCharacter.HumanoidRootPart.Position
            
            -- Teleport target player to the position of the closest player behind them
            targetCharacter:SetPrimaryPartCFrame(CFrame.new(closestPosition))
            print(targetPlayer.Name .. " has been teleported to " .. closestPlayer.Name)
        else
            --print("Failed to teleport. One of the characters is missing.")
        end
    else
        --print("No player found behind " .. targetPlayer.Name .. " within 75 studs")
    end
end

local function getClosestPlayerBehind4(targetPlayer)
    local targetCharacter = targetPlayer.Character
    if not targetCharacter then return nil end
    
    local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetHumanoidRootPart then return nil end
    
    local targetPosition = targetHumanoidRootPart.Position
    local targetLookVector = targetHumanoidRootPart.CFrame.LookVector -- Direction player is facing
    local closestPlayer = nil
    local closestDistance = math.huge

    -- Iterate through all players to find the closest one behind
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= targetPlayer and player.Character then
            local playerHumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if playerHumanoidRootPart then
                local playerPosition = playerHumanoidRootPart.Position
                local directionToPlayer = (playerPosition - targetPosition).unit

                -- Calculate if the player is behind (dot product of vectors should be negative)
                local dotProduct = directionToPlayer:Dot(targetLookVector)
                
                if dotProduct > 0 then -- The player is behind
                    local distance = (playerPosition - targetPosition).magnitude
                    if distance <= 15 then  -- Only consider players within a 75 stud radius
                        if distance > 8 then
                        if distance < closestDistance then
                            closestDistance = distance
                            closestPlayer = player
                        end
                        end
                    end
                end
            end
        end
    end

    return closestPlayer
end

local function teleportToClosestPlayerBehind4(targetPlayer)
    local closestPlayer = getClosestPlayerBehind4(targetPlayer)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character
        if targetCharacter and closestCharacter then
            local closestPosition = closestCharacter.HumanoidRootPart.Position
            
            -- Teleport target player to the position of the closest player behind them
            targetCharacter:SetPrimaryPartCFrame(CFrame.new(closestPosition))
            print(targetPlayer.Name .. " has been teleported to " .. closestPlayer.Name)
        else
            --print("Failed to teleport. One of the characters is missing.")
        end
    else
        --print("No player found behind " .. targetPlayer.Name .. " within 75 studs")
    end
end
local Players = game:GetService("Players")

local function teleportPlayerBehindClosest6(targetPlayer)
    local closestPlayer = getClosestPlayerWithinRadius(targetPlayer, 200)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character

        if targetCharacter and closestCharacter then
            local closestHumanoidRootPart = closestCharacter:FindFirstChild("HumanoidRootPart")
            if closestHumanoidRootPart then
                -- Calculate the position 3 studs behind the closest player
                local closestCFrame = closestHumanoidRootPart.CFrame
                local behindPosition = closestCFrame.Position - closestCFrame.LookVector * 1

                -- Teleport the target player behind the closest player
                wait(1)
                targetCharacter:SetPrimaryPartCFrame(CFrame.new(behindPosition))
                print(targetPlayer.Name .. " has been teleported behind " .. closestPlayer.Name)
            end
        end
    else
        print("No player found within 35 studs of " .. targetPlayer.Name)
    end
end
-- Example usage: Teleport LocalPlayer behind the closest player

-- Example usage: Teleport a specific player (e.g., LocalPlayer) to the closest player behind them
  -- For example, using the LocalPlayer

    local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("2").Base

local ToolName = baseButton.ToolName

ToolName.Text = "Fiery Fists" --[[Change This]]
baseButton.Reuse.Visible = true
baseButton.Reuse.Text = "SPECIAL"
baseButton.Reuse.Reuse.Text = "SPECIAL"

local baseButton = hotbarFrame:FindFirstChild("4").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Instant Uppercut" --[[Change This]]

local baseButton = hotbarFrame:FindFirstChild("1").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Jaw breaker"

local baseButton = hotbarFrame:FindFirstChild("3").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Blitz"
baseButton.Reuse.Visible = true
baseButton.Reuse.Text = "VARIANT"
baseButton.Reuse.Reuse.Text = "VARIANT"

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character --or player.CharacterAdded:Wait()


--16945573694
--18179181663
local oldAnimID = "10466974800"
local oldAnimID2 = "10468665991" 
local oldAnimID3 = "15955393872" --15955393872
local newAnimID = "12273188754" --12534735382
local newAnimID2 = "16945573694" 
local newAnimID3 = "15943915877" 
local Players = game:GetService("Players")
function cdforanim()
    local humanoid = character:WaitForChild("Humanoid")


    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID
        if animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID then --Consecutive Punches
           timer2(3)
elseif animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID2 then --Normal Punch
            timer2(3)
elseif animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID3 then --Wall Combo
timer2(10)
elseif animationTrack.Animation.AnimationId == "rbxassetid://12510170988" then --Uppercut
 
timer2(3)
        elseif animationTrack.Animation.AnimationId == "rbxassetid://10471336737" then --Shove

timer2(3)

--m1s--------------
elseif animationTrack.Animation.AnimationId == "rbxassetid://10469643643" then

timer2(5)
elseif animationTrack.Animation.AnimationId == "rbxassetid://10470104242" then

timer2(5)
elseif animationTrack.Animation.AnimationId == "rbxassetid://10503381238" then

timer2(5)
--ult--------------
elseif animationTrack.Animation.AnimationId == "rbxassetid://125518819402716" then

timer2(15)
elseif animationTrack.Animation.AnimationId == "rbxassetid://79761806706382" then
           
           timer2(15)
           elseif animationTrack.Animation.AnimationId == "rbxassetid://12983333733" then
           
           timer2(15)
           elseif animationTrack.Animation.AnimationId == "rbxassetid://11365563255" then
           
           timer2(15)
           elseif animationTrack.Animation.AnimationId == "rbxassetid://11365563255" then
           
           timer2(15)
           elseif animationTrack.Animation.AnimationId == "rbxassetid://13927612951" then
           
           timer2(15)
        end
    end)
end

function replaceAndPlayAnimation()
    local humanoid = character:WaitForChild("Humanoid")


    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID
        if animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID then
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://" .. newAnimID
            
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
animationTrack:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID2 then
 local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://" .. newAnimID2
            
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID3 then
 local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://" .. newAnimID3
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://10471336737" then
 local animAnim = Instance.new("Animation")
 local velocity = character.HumanoidRootPart.Velocity
    if velocity.Magnitude < 24 then
    animAnim.AnimationId = "rbxassetid://16944345619" --16944345619
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
anim:AdjustSpeed(1.2)
else
animAnim.AnimationId = "rbxassetid://13639700348" --17450393107
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
anim:AdjustSpeed(1.4)
    end
elseif animationTrack.Animation.AnimationId == "rbxassetid://12447707844" then
 local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://13497875049" --104031205817566
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://12510170988" then
 local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://136370737633649"
           

            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
            animationTrack:Stop()
            
            wait(1.4)
            anim:Stop()
        end
    end)
end

function UltAnimation()
    local humanoid = character:WaitForChild("Humanoid")


    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID
        --12345678910
        if animationTrack.Animation.AnimationId == "rbxassetid://125518819402716" then --wall combo
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://18447913645" --17450393107
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
 elseif animationTrack.Animation.AnimationId == "rbxassetid://11365563255" then --tableflip
  local animAnim = Instance.new("Animation")
 local floor = character.Humanoid.FloorMaterial
          if floor == Enum.Material.Air then
   animAnim.AnimationId = "rbxassetid://17354976067" --15520132233
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()

movementSpeed2 = 750
anim:AdjustSpeed(1.2)
        moving2 = true
        anim.Ended:Connect(function()
        moving2 = false
        end)

    moveForward2()
       timer2(15)
       while true do
        task.wait()
        if anim.TimePosition >= 5.34 then
        moving2 = false
        break
        end
        end
else

        animAnim.AnimationId = "rbxassetid://15520132233" --15520132233
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
    end
elseif animationTrack.Animation.AnimationId == "rbxassetid://12983333733" then --wall combo
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://18447913645" --17450393107
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
while anim.IsPlaying do
    local target = getClosestPlayer()
    if target then
        local rootPos = rootPart.Position
        local targetPos = target.Position

        -- Get direction to target while ignoring Y difference
        local direction = (targetPos - rootPos).Unit
        local angleY = math.atan2(-direction.X, -direction.Z) -- Flip direction to face properly

        -- Set new rotation while keeping current position
        rootPart.CFrame = CFrame.new(rootPos) * CFrame.Angles(0, angleY, 0)
    end
    task.wait()
end
        end
    end)
end
function replaceAndPlayAnimation2()
    local humanoid = character:WaitForChild("Humanoid")


    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID
        --12345678910
        if animationTrack.Animation.AnimationId == "rbxassetid://12510170988" then
            teleportPlayerBehindClosest(player)
            elseif animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID then
           teleportToClosestPlayerBehind2(player)
           elseif animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID2 then
           local floor = character.Humanoid.FloorMaterial
          if floor == Enum.Material.Air then
           teleportPlayerBehindClosest8(player)
          local target = getClosestPlayer()
    if target then
        local rootPos = rootPart.Position
        local targetPos = target.Position

        -- Get direction to target while ignoring Y difference
        local direction = (targetPos - rootPos).Unit
        local angleY = math.atan2(-direction.X, -direction.Z) -- Flip direction to face properly

        -- Set new rotation while keeping current position
        rootPart.CFrame = CFrame.new(rootPos) * CFrame.Angles(0, angleY, 0)
    end
    end
            elseif animationTrack.Animation.AnimationId == "rbxassetid://10471336737" then
            local velocity = character.HumanoidRootPart.Velocity
              if velocity.Magnitude >= 24 then
           teleportToClosestPlayerBehind3(player)
           end
            elseif animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
           teleportToClosestPlayerBehind4(player)
           elseif animationTrack.Animation.AnimationId == "rbxassetid://79761806706382" then
           teleportPlayerBehindClosest6(player)
           elseif animationTrack.Animation.AnimationId == "rbxassetid://11365563255" then
          -- teleportPlayerBehindClosest7(player)
        end

    end)
end
function m1s()
    local humanoid = character:WaitForChild("Humanoid")


    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID
    
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://17889458563"
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
            elseif animationTrack.Animation.AnimationId == "rbxassetid://10469630950" then
           local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://13532600125"
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
            elseif animationTrack.Animation.AnimationId == "rbxassetid://10469639222" then
          local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://13295919399"
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
            elseif animationTrack.Animation.AnimationId == "rbxassetid://10469643643" then
           local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://17889290569"
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://10470104242" then
           local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://18897119503"
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
            anim:AdjustSpeed(1.25)
            elseif animationTrack.Animation.AnimationId == "rbxassetid://10503381238" then
           local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://18179181663"
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
           -- 18179181663
        end

    end)
end

function counter()
    local humanoid = character:WaitForChild("Humanoid")


    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID
        if animationTrack.Animation.AnimationId == "rbxassetid://13736115009" then
            
            wait(1.25)
            animationTrack:Stop()
            
        end
    end)
end

replaceAndPlayAnimation()
replaceAndPlayAnimation2()
UltAnimation()
m1s()
counter()
cdforanim()

--ult--
local function findGuiAndSetText()

    local screenGui = playerGui:FindFirstChild("ScreenGui")

    if screenGui then

        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")

        if magicHealthFrame then

            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")

            if textLabel then

                textLabel.Text = "Multiverse Collapse" --[[Yup Change Me]]

            end

        end

    end

end
local function setnamesformoves()
while true do
local baseButton1 = hotbarFrame:FindFirstChild("1").Base.ToolName
local baseButton2 = hotbarFrame:FindFirstChild("2").Base.ToolName
local baseButton3 = hotbarFrame:FindFirstChild("3").Base.ToolName
local baseButton4 = hotbarFrame:FindFirstChild("4").Base.ToolName
task.wait()
if baseButton1.Text == "Normal Punch" then
baseButton1.Text = "Jaw breaker"
elseif baseButton2.Text == "Death Counter" then
baseButton1.Text = "No More!"
end
if baseButton2.Text == "Consecutive Punches" then
baseButton2.Text = "Fiery Fists"
baseButton2.Parent.Reuse.Visible = true
baseButton2.Parent.Reuse.Text = "SPECIAL"
baseButton2.Parent.Reuse.Reuse.Text = "SPECIAL"
elseif baseButton2.Text == "Table Flip" then
baseButton2.Text = "The Twisted"
baseButton2.Parent.Reuse.Visible = true
baseButton2.Parent.Reuse.Text = "VARIANT"
baseButton2.Parent.Reuse.Text = "VARIANT"
end
if baseButton3.Text == "Shove" then
baseButton3.Text = "Blitz"
baseButton3.Parent.Reuse.Visible = true
baseButton3.Parent.Reuse.Text = "VARIANT"
baseButton3.Parent.Reuse.Text = "VARIANT"
elseif baseButton3.Text == "Serious Punch" then
baseButton3.Text = "Sufferment"
end
if baseButton4.Text == "Uppercut" then
baseButton4.Text = "Instant Uppercut"
elseif baseButton4.Text == "Omni Directional Punch" then
baseButton4.Text = "This will end it all!"
end
end
end
findGuiAndSetText()
setnamesformoves()
elseif game.Players.LocalPlayer.Name == "guestcoolguypro2" and not game.Players.LocalPlayer.Backpack:FindFirstChild("Normal Punch") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Consecutive Punches") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Shove") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Uppercut") then
 -- reality = false
end
end
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function()
if darksav == true then
wait(0.5)
if game.Players.LocalPlayer.Name == "guestcoolguypro2" and game.Players.LocalPlayer.Backpack:FindFirstChild("Flowing Water") and game.Players.LocalPlayer.Backpack:FindFirstChild("Lethal Whirlwind Stream") and game.Players.LocalPlayer.Backpack:FindFirstChild("Hunter's Grasp") and game.Players.LocalPlayer.Backpack:FindFirstChild("Prey's Peril") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Surprise Attack") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Vengeful Counter Attack") then
  


local TweenService = game:GetService("TweenService")
local cd3 = false
local function timer2(value)
if cd3 ~= true then
cd3 = true
local cooldown = game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown:Clone()
cooldown.Parent = game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["5"].Base
local Tween = TweenService:Create(cooldown,TweenInfo.new(value,Enum.EasingStyle.Linear),{Size = UDim2.fromScale(1,0)})
						Tween:Play()
                          local cooldown2 = game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown:Clone()
cooldown2.Parent = game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["6"].Base
local Tween2 = TweenService:Create(cooldown2,TweenInfo.new(value,Enum.EasingStyle.Linear),{Size = UDim2.fromScale(1,0)})
						Tween:Play()
                        Tween2:Play()
Tween.Completed:Wait()
cooldown:Destroy()
        cd3 = false
        end
end
if not game.Players.LocalPlayer.Backpack:FindFirstChild("Surprise Attack") then
--game.Players.LocalPlayer.Backpack:FindFirstChild("Shove"):Destroy()

local tool = Instance.new("Tool")
    tool.Name = "Surprise Attack"
    tool:SetAttribute("Skill", true)

    tool.Parent = game.Players.LocalPlayer.Backpack
    tool.RequiresHandle = false

    game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["5"].Base.Reuse.Visible = true
        game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["5"].Base.Reuse.Text = "SPECIAL"
        game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["5"].Base.Reuse.Reuse.Text = "SPECIAL"


    local moving = false
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    local runService = game:GetService("RunService")
    local movementSpeed = 60

    local Players = game:GetService("Players")
    local function getClosestPlayerWithinRadius5(targetPlayer, radius)
    local targetCharacter = targetPlayer.Character
    if not targetCharacter then return nil end

    local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetHumanoidRootPart then return nil end

    local targetPosition = targetHumanoidRootPart.Position
    local closestPlayer = nil
    local closestDistance = math.huge

    -- Iterate through all players to find the closest one within the radius
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= targetPlayer and player.Character then
            local playerHumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if playerHumanoidRootPart then
                local playerPosition = playerHumanoidRootPart.Position
                local distance = (playerPosition - targetPosition).magnitude
                if distance <= radius and distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end

    return closestPlayer
end

local function teleportPlayerBehindClosest5(targetPlayer)
    local closestPlayer = getClosestPlayerWithinRadius5(targetPlayer, 50)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character

        if targetCharacter and closestCharacter then
            local closestHumanoidRootPart = closestCharacter:FindFirstChild("HumanoidRootPart")
            if closestHumanoidRootPart then
                -- Calculate the position 3 studs behind the closest player
                local closestCFrame = closestHumanoidRootPart.CFrame
                local behindPosition = closestCFrame.Position - closestCFrame.LookVector * 5

                -- Teleport the target player behind the closest player
                targetCharacter:SetPrimaryPartCFrame(CFrame.new(behindPosition))
                print(targetPlayer.Name .. " has been teleported behind " .. closestPlayer.Name)
            end
        end
    else
       -- print("No player found within 35 studs of " .. targetPlayer.Name)
    end
end


    

    tool.Equipped:Connect(function()
    if cd3 == false then
    local player = game.Players.LocalPlayer
       teleportPlayerBehindClosest5(player)
        
      
       timer2(15)
       
        end
         
         
    end)

    tool.Unequipped:Connect(function()
        moving = false
        if animationTrack then
            animationTrack:Stop()
       end
    end)
    end
    

if not game.Players.LocalPlayer.Backpack:FindFirstChild("Vengeful Counter") then
--game.Players.LocalPlayer.Backpack:FindFirstChild("Shove"):Destroy()

local tool = Instance.new("Tool")
    tool.Name = "Vengeful Counter"
    tool:SetAttribute("Skill", true)

    tool.Parent = game.Players.LocalPlayer.Backpack
    tool.RequiresHandle = false

    --game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["5"].Base.Reuse.Visible = true

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    local runService = game:GetService("RunService")

    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://13736115009" 
    local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
    local animationTrack


    tool.Equipped:Connect(function()
    if cd3 == false then
        animationTrack = animator:LoadAnimation(animation)
        humanoid.WalkSpeed = 0
        character.Torso.CFrame += Vector3.new(math.random(-30,30),0,math.random(-30,30))
             timer2(1.5)
       
        end
         
         
    end)
    end

local Players = game:GetService("Players")

local function getClosestPlayerWithinRadius(targetPlayer, radius)
    local targetCharacter = targetPlayer.Character
    if not targetCharacter then return nil end

    local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetHumanoidRootPart then return nil end

    local targetPosition = targetHumanoidRootPart.Position
    local closestPlayer = nil
    local closestDistance = math.huge

    -- Iterate through all players to find the closest one within the radius
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= targetPlayer and player.Character then
            local playerHumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if playerHumanoidRootPart then
                local playerPosition = playerHumanoidRootPart.Position
                local distance = (playerPosition - targetPosition).magnitude
                if distance <= radius and distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end

    return closestPlayer
end

local function teleportPlayerBehindClosest(targetPlayer)
    local closestPlayer = getClosestPlayerWithinRadius(targetPlayer, 35)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character

        if targetCharacter and closestCharacter then
            local closestHumanoidRootPart = closestCharacter:FindFirstChild("HumanoidRootPart")
            if closestHumanoidRootPart then
                -- Calculate the position 3 studs behind the closest player
                local closestCFrame = closestHumanoidRootPart.CFrame
                local behindPosition = closestCFrame.Position - closestCFrame.LookVector * 1

                -- Teleport the target player behind the closest player
                targetCharacter:SetPrimaryPartCFrame(CFrame.new(behindPosition))
                print(targetPlayer.Name .. " has been teleported behind " .. closestPlayer.Name)
            end
        end
    else
        print("No player found within 35 studs of " .. targetPlayer.Name)
    end
end
local Players = game:GetService("Players")

local function getClosestPlayerBehind2(targetPlayer)
    local targetCharacter = targetPlayer.Character
    if not targetCharacter then return nil end
    
    local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetHumanoidRootPart then return nil end
    
    local targetPosition = targetHumanoidRootPart.Position
    local targetLookVector = targetHumanoidRootPart.CFrame.LookVector -- Direction player is facing
    local closestPlayer = nil
    local closestDistance = math.huge

    -- Iterate through all players to find the closest one behind
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= targetPlayer and player.Character then
            local playerHumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if playerHumanoidRootPart then
                local playerPosition = playerHumanoidRootPart.Position
                local directionToPlayer = (playerPosition - targetPosition).unit
                local closestDistance = math.huge

                -- Calculate if the player is behind (dot product of vectors should be negative)
                local dotProduct = directionToPlayer:Dot(targetLookVector)
                
                if dotProduct > 0 then -- The player is behind
                local distance = (playerPosition - targetPosition).magnitude
                    if distance <= 22 and distance > 5 then  -- Only consider players within a 75 stud radius
                        -- Find the closest player within the radius
                        if distance < closestDistance then
                            closestDistance = distance
                            closestPlayer = player
                        
                        end
                    end
                end
            end
        end
    end

    return closestPlayer
end

local function teleportToClosestPlayerBehind2(targetPlayer)
    local closestPlayer = getClosestPlayerBehind2(targetPlayer)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character
        if targetCharacter and closestCharacter then
            local closestPosition = closestCharacter.HumanoidRootPart.Position
            
            -- Teleport target player to the position of the closest player behind them
            targetCharacter:SetPrimaryPartCFrame(CFrame.new(closestPosition))
            print(targetPlayer.Name .. " has been teleported to " .. closestPlayer.Name)
        else
            --print("Failed to teleport. One of the characters is missing.")
        end
    else
        --print("No player found behind " .. targetPlayer.Name .. " within 75 studs")
    end
end
local function getClosestPlayerBehind3(targetPlayer)
    local targetCharacter = targetPlayer.Character
    if not targetCharacter then return nil end
    
    local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetHumanoidRootPart then return nil end
    
    local targetPosition = targetHumanoidRootPart.Position
    local targetLookVector = targetHumanoidRootPart.CFrame.LookVector -- Direction player is facing
    local closestPlayer = nil
    local closestDistance = math.huge

    -- Iterate through all players to find the closest one behind
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= targetPlayer and player.Character then
            local playerHumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if playerHumanoidRootPart then
                local playerPosition = playerHumanoidRootPart.Position
                local directionToPlayer = (playerPosition - targetPosition).unit

                -- Calculate if the player is behind (dot product of vectors should be negative)
                local dotProduct = directionToPlayer:Dot(targetLookVector)
                
                if dotProduct > 0 then -- The player is behind
                local distance = (playerPosition - targetPosition).magnitude
                    if distance <= 35 and distance > 12.5 then  -- Only consider players within a 75 stud radius
                        -- Find the closest player within the radius
                        if distance < closestDistance then
                            closestDistance = distance
                            closestPlayer = player
                        
                        end
                    end
                end
            end
        end
    end

    return closestPlayer
end

local function teleportToClosestPlayerBehind3(targetPlayer)
    local closestPlayer = getClosestPlayerBehind3(targetPlayer)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character
        if targetCharacter and closestCharacter then
            local closestPosition = closestCharacter.HumanoidRootPart.Position
            
            -- Teleport target player to the position of the closest player behind them
            targetCharacter:SetPrimaryPartCFrame(CFrame.new(closestPosition))
            print(targetPlayer.Name .. " has been teleported to " .. closestPlayer.Name)
        else
            --print("Failed to teleport. One of the characters is missing.")
        end
    else
        --print("No player found behind " .. targetPlayer.Name .. " within 75 studs")
    end
end

local function getClosestPlayerBehind4(targetPlayer)
    local targetCharacter = targetPlayer.Character
    if not targetCharacter then return nil end
    
    local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetHumanoidRootPart then return nil end
    
    local targetPosition = targetHumanoidRootPart.Position
    local targetLookVector = targetHumanoidRootPart.CFrame.LookVector -- Direction player is facing
    local closestPlayer = nil
    local closestDistance = math.huge

    -- Iterate through all players to find the closest one behind
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= targetPlayer and player.Character then
            local playerHumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if playerHumanoidRootPart then
                local playerPosition = playerHumanoidRootPart.Position
                local directionToPlayer = (playerPosition - targetPosition).unit

                -- Calculate if the player is behind (dot product of vectors should be negative)
                local dotProduct = directionToPlayer:Dot(targetLookVector)
                
                if dotProduct > 0 then -- The player is behind
                    local distance = (playerPosition - targetPosition).magnitude
                    if distance <= 15 and distance > 8 then  -- Only consider players within a 75 stud radius
                        -- Find the closest player within the radius
                        if distance < closestDistance then
                            closestDistance = distance
                            closestPlayer = player
                        end
                    end
                end
            end
        end
    end

    return closestPlayer
end

local function teleportToClosestPlayerBehind4(targetPlayer)
    local closestPlayer = getClosestPlayerBehind4(targetPlayer)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character
        if targetCharacter and closestCharacter then
            local closestPosition = closestCharacter.HumanoidRootPart.Position
            
            -- Teleport target player to the position of the closest player behind them
            targetCharacter:SetPrimaryPartCFrame(CFrame.new(closestPosition))
            print(targetPlayer.Name .. " has been teleported to " .. closestPlayer.Name)
        else
            --print("Failed to teleport. One of the characters is missing.")
        end
    else
        --print("No player found behind " .. targetPlayer.Name .. " within 75 studs")
    end
end
local Players = game:GetService("Players")

local function teleportPlayerBehindClosest6(targetPlayer)
    local closestPlayer = getClosestPlayerWithinRadius(targetPlayer, 200)
    if closestPlayer then
        local targetCharacter = targetPlayer.Character
        local closestCharacter = closestPlayer.Character

        if targetCharacter and closestCharacter then
            local closestHumanoidRootPart = closestCharacter:FindFirstChild("HumanoidRootPart")
            if closestHumanoidRootPart then
                -- Calculate the position 3 studs behind the closest player
                local closestCFrame = closestHumanoidRootPart.CFrame
                local behindPosition = closestCFrame.Position - closestCFrame.LookVector * 1

                -- Teleport the target player behind the closest player
                wait(1)
                targetCharacter:SetPrimaryPartCFrame(CFrame.new(behindPosition))
                print(targetPlayer.Name .. " has been teleported behind " .. closestPlayer.Name)
            end
        end
    else
        print("No player found within 35 studs of " .. targetPlayer.Name)
    end
end
-- Example usage: Teleport LocalPlayer behind the closest player

-- Example usage: Teleport a specific player (e.g., LocalPlayer) to the closest player behind them
  -- For example, using the LocalPlayer

    local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("2").Base

local ToolName = baseButton.ToolName

ToolName.Text = "Hard Dunk" --[[Change This]]
baseButton.Reuse.Visible = true
baseButton.Reuse.Text = "COMBO"
baseButton.Reuse.Reuse.Text = "COMBO"

local baseButton = hotbarFrame:FindFirstChild("4").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Instinctive Primal Barrage" --[[Change This]]

local baseButton = hotbarFrame:FindFirstChild("1").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Relentless Punches"

local baseButton = hotbarFrame:FindFirstChild("3").Base
local ToolName = baseButton.ToolName
ToolName.Text = "One Inch Punch"
baseButton.Reuse.Visible = true
baseButton.Reuse.Text = "FINISHER"
baseButton.Reuse.Reuse.Text = "FINISHER"

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()


--16945573694
--18179181663
local oldAnimID = "12309835105"
local oldAnimID2 = "13603396939" 
local oldAnimID3 = "16310343179" --15955393872
local newAnimID = "72451715583225" --12534735382
local newAnimID2 = "17799224866" 
local newAnimID3 = "16023456135" 
local Players = game:GetService("Players")

function cdforanim()
    local humanoid = character:WaitForChild("Humanoid")


    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID
        if animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID then --Consecutive Punches
           timer2(3)
elseif animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID2 then --Normal Punch
            timer2(3)
elseif animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID3 then --Wall Combo
timer2(10)
elseif animationTrack.Animation.AnimationId == "rbxassetid://12273188754" then --Uppercut
 
timer2(3)
        elseif animationTrack.Animation.AnimationId == "rbxassetid://12296113986" then --Shove

timer2(3)

--m1s--------------
elseif animationTrack.Animation.AnimationId == "rbxassetid://10469643643" then

timer2(5)
elseif animationTrack.Animation.AnimationId == "rbxassetid://10470104242" then

timer2(5)
elseif animationTrack.Animation.AnimationId == "rbxassetid://10503381238" then

timer2(5)
--ult--------------

           elseif animationTrack.Animation.AnimationId == "rbxassetid://12460977270" then
           
           timer2(15)
           elseif animationTrack.Animation.AnimationId == "rbxassetid://12463072679" then
           
           timer2(15)
           elseif animationTrack.Animation.AnimationId == "rbxassetid://14057231976" then
           
           timer2(15)
           elseif animationTrack.Animation.AnimationId == "rbxassetid://13630786846" or animationTrack.Animation.AnimationId == "rbxassetid://72451715583225"  then
           
           timer2(15)
        end
    end)
end

function replaceAndPlayAnimation()
    local humanoid = character:WaitForChild("Humanoid")


    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID
        if animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID then -- done
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://18897120868"
            
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
animationTrack:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://12307656616" then -- done
 local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://" .. newAnimID
            
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
wait(0.7)
anim:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID2 then -- done
 local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://" .. newAnimID2
            
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()

elseif animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID3 then
 local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://" .. newAnimID3
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://10471336737" then
 local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://13639700348" --17450393107
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://12342141464" then -- done
 local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://13499771836" --16734584478
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
           anim:Play()
animationTrack:Stop()
anim:AdjustSpeed(0.475)
elseif animationTrack.Animation.AnimationId == "rbxassetid://12296882427" then -- done
 local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://16139108718" --17450393107
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
           anim:Play()
animationTrack:Stop()
wait(0.4)
anim:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://12272894215" then --first move 2/2
 local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://138443750790136"
           

            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
            animationTrack:Stop()
        
elseif animationTrack.Animation.AnimationId == "rbxassetid://12273188754" then --first move 1/2
 local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://12534735382"
           

            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
            animationTrack:Stop()
            
            
            
        end
    end)
end

function UltAnimation()
    local humanoid = character:WaitForChild("Humanoid")


    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID
        --12345678910
        if animationTrack.Animation.AnimationId == "rbxassetid://125518819402716" then --wall combo
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://18447913645" --17450393107
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
 elseif animationTrack.Animation.AnimationId == "rbxassetid://12467789963" then --tableflip
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://14875667895" --17450393107
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://14057231976" then --tableflip
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://116753755471636" --17450393107
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://12460977270" then --wall combo
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://14348708797" --17450393107
        
            local anim = humanoid:LoadAnimation(animAnim)
           -- anim.TimePosition = 2
            anim:Play()
animationTrack:Stop()
        end

    end)
end
function replaceAndPlayAnimation2()
    local humanoid = character:WaitForChild("Humanoid")


    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID
        --12345678910
        if animationTrack.Animation.AnimationId == "rbxassetid://12296113986" then
            character.Torso.CFrame += Vector3.new(0,285,0)
            elseif animationTrack.Animation.AnimationId == "rbxassetid://" .. oldAnimID then
           teleportToClosestPlayerBehind2(player)
            elseif animationTrack.Animation.AnimationId == "rbxassetid://12273188754" then
           --teleportToClosestPlayerBehind3(player)
           character.Torso.CFrame += Vector3.new(0,50,0)
           elseif animationTrack.Animation.AnimationId == "rbxassetid://12463072679" then
           teleportToClosestPlayerBehind3(player)
            elseif animationTrack.Animation.AnimationId == "rbxassetid://12460977270" then
           teleportToClosestPlayerBehind3(player)
           elseif animationTrack.Animation.AnimationId == "rbxassetid://79761806706382" then
           teleportPlayerBehindClosest6(player)
        end

    end)
end
function m1s()
    local humanoid = character:WaitForChild("Humanoid")


    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID
    
        if animationTrack.Animation.AnimationId == "rbxassetid://13532562418" then
            local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://17889458563"
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
            elseif animationTrack.Animation.AnimationId == "rbxassetid://13532600125" then
           local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://100059874351664"
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
            elseif animationTrack.Animation.AnimationId == "rbxassetid://13532604085" then
          local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://17889290569"
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
            elseif animationTrack.Animation.AnimationId == "rbxassetid://13294471966" then
           local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://134775406437626"
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
elseif animationTrack.Animation.AnimationId == "rbxassetid://10470104242" then
           local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://18897119503"
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
            anim:AdjustSpeed(1.25)
            elseif animationTrack.Animation.AnimationId == "rbxassetid://10503381238" then
           local animAnim = Instance.new("Animation")
            animAnim.AnimationId = "rbxassetid://18179181663"
            local anim = humanoid:LoadAnimation(animAnim)
            anim:Play()
            animationTrack:Stop()
           -- 18179181663
        end

    end)
end
function counter()
    local humanoid = character:WaitForChild("Humanoid")


    humanoid.AnimationPlayed:Connect(function(animationTrack)
        -- Check if the played animation has the old animation ID
        if animationTrack.Animation.AnimationId == "rbxassetid://13736115009" then
            
            wait(1.25)
            animationTrack:Stop()
            
        end
    end)
end

replaceAndPlayAnimation()
replaceAndPlayAnimation2()
UltAnimation()
m1s()
counter()
cdforanim()

--ult--
local function findGuiAndSetText()

    local screenGui = playerGui:FindFirstChild("ScreenGui")

    if screenGui then

        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")

        if magicHealthFrame then

            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")

            if textLabel then

                textLabel.Text = "Enlightened Warrior" --[[Yup Change Me]]

            end

        end

    end

end
local function setnamesformoves()
while true do
local baseButton1 = hotbarFrame:FindFirstChild("1").Base.ToolName
local baseButton2 = hotbarFrame:FindFirstChild("2").Base.ToolName
local baseButton3 = hotbarFrame:FindFirstChild("3").Base.ToolName
local baseButton4 = hotbarFrame:FindFirstChild("4").Base.ToolName
task.wait()
if baseButton1.Text == "Flowing Water" then
baseButton1.Text = "Relentless Punches"
elseif baseButton1.Text == "Water Stream Cutting Fist" then
baseButton1.Text = "Karate Skills"
end
if baseButton2.Text == "Lethal Whirlwind Stream" then
baseButton2.Text = "Hard Dunk"
baseButton2.Parent.Reuse.Visible = true
baseButton2.Parent.Reuse.Text = "COMBO"
baseButton2.Parent.Reuse.Reuse.Text = "COMBO"
elseif baseButton2.Text == "The Final Hunt" then
baseButton2.Text = "The End Game"
end
if baseButton3.Text == "Hunter's Grasp" then
baseButton3.Text = "One Inch Punch"
baseButton3.Parent.Reuse.Visible = true
baseButton3.Parent.Reuse.Text = "FINISHER"
baseButton3.Parent.Reuse.Reuse.Text = "FINISHER"
elseif baseButton3.Text == "Rock Splitting Fist" then
baseButton3.Text = "Kungfu Power"
end
if baseButton4.Text == "Prey's Peril" then
baseButton4.Text = "Instinctive Primal Barrage"
elseif baseButton4.Text == "Crushed Rock" then
baseButton4.Text = "Relentless Onslaught"
end
end
end
findGuiAndSetText()
setnamesformoves()
elseif game.Players.LocalPlayer.Name == "guestcoolguypro2" and not game.Players.LocalPlayer.Backpack:FindFirstChild("Flowing Water") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Lethal Whirlwind Stream") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Hunter's Grasp") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Prey's Peril") then
darksav = false
end
end
end)