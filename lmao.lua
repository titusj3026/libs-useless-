--octo no touch my code pls
local players = game:GetService("Players")
local plr = players.LocalPlayer
function FindPlayer(name) -- name = string provided to look for player
    for i,v in pairs(game.Players:GetPlayers()) do  -- iterating though players
        if v.Name:lower():sub(1,#name) == name:lower() then	-- checking to see if player name matches the provided string
            return v.Name
        end
    end
end
local function getChar()
    return plr.Character
end

local function getBp()
    return plr.Backpack
end

local function getPlr(str)
    for i,v in pairs(players:GetPlayers()) do
        if v.Name:lower():match(str) or v.DisplayName:lower():match(str) then
            return v
        end
    end
end

local netless_Y = Vector3.new(0, 26, 0)
local v3_101 = Vector3.new(1, 0, 1)
local inf = math.huge
local v3_0 = Vector3.new(0,0,0)
local function getNetlessVelocity(realPartVelocity) --edit this if you have a better netless method
    if (realPartVelocity.Y > 1) or (realPartVelocity.Y < -1) then
        return realPartVelocity * (25.1 / realPartVelocity.Y)
    end
    realPartVelocity = realPartVelocity * v3_101
    local mag = realPartVelocity.Magnitude
    if mag > 1 then
        realPartVelocity = realPartVelocity * 100 / mag
    end
    return realPartVelocity + netless_Y
end

local function align(Part0, Part1, p, r)
	Part0.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0.0001, 0.0001, 0.0001, 0.0001)
    Part0.CFrame = Part1.CFrame
	local att0 = Instance.new("Attachment", Part0)
	att0.Orientation = r or v3_0
	att0.Position = v3_0
	att0.Name = "att0_" .. Part0.Name
	local att1 = Instance.new("Attachment", Part1)
	att1.Orientation = v3_0 
	att1.Position = p or v3_0
	att1.Name = "att1_" .. Part1.Name

	local apd = Instance.new("AlignPosition", att0)
	apd.ApplyAtCenterOfMass = false
	apd.MaxForce = inf
	apd.MaxVelocity = inf
	apd.ReactionForceEnabled = false
	apd.Responsiveness = 200
	apd.Attachment1 = att1
	apd.Attachment0 = att0
	apd.Name = "AlignPositionRfalse"
	apd.RigidityEnabled = false

	local ao = Instance.new("AlignOrientation", att0)
	ao.MaxAngularVelocity = inf
	ao.MaxTorque = inf
	ao.PrimaryAxisOnly = false
	ao.ReactionTorqueEnabled = false
	ao.Responsiveness = 200
	ao.Attachment1 = att1
	ao.Attachment0 = att0
	ao.RigidityEnabled = false
    
	if type(getNetlessVelocity) == "function" then
	    local realVelocity = Vector3.new(0,30,0)
        local steppedcon = game:GetService("RunService").Stepped:Connect(function()
            Part0.Velocity = realVelocity
        end)
        local heartbeatcon = game:GetService("RunService").Heartbeat:Connect(function()
            realVelocity = Part0.Velocity
            Part0.Velocity = getNetlessVelocity(realVelocity)
        end)
        Part0.Destroying:Connect(function()
            Part0 = nil
            steppedcon:Disconnect()
            heartbeatcon:Disconnect()
        end)
	end
	
    att0.Orientation = r or v3_0
	att0.Position = v3_0
	att1.Orientation = v3_0 
	att1.Position = p or v3_0
	Part0.CFrame = Part1.CFrame
end

local function attachTool(tool,cf)
    for i,v in pairs(tool:GetDescendants()) do
        if not (v:IsA("BasePart") or v:IsA("Mesh") or v:IsA("SpecialMesh")) then
            v:Destroy()
        end
    end
    local rgrip1 = Instance.new("Weld")
	rgrip1.Name = "RightGrip"
	rgrip1.Part0 = getChar()["Right Arm"]
	rgrip1.Part1 = tool.Handle
	rgrip1.C0 = cf
	rgrip1.C1 = tool.Grip
	rgrip1.Parent = getChar()["Right Arm"]
    tool.Parent = getBp()
    tool.Parent = getChar().Humanoid
    tool.Parent = getChar()
    tool.Handle:BreakJoints()
    tool.Parent = getBp()
    tool.Parent = getChar().Humanoid
    local rgrip2 = Instance.new("Weld")
	rgrip2.Name = "RightGrip"
	rgrip2.Part0 = getChar()["Right Arm"]
	rgrip2.Part1 = tool.Handle
	rgrip2.C0 = cf
	rgrip2.C1 = tool.Grip
	rgrip2.Parent = getChar()["Right Arm"]
    return rgrip2
end




























































-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide
function Bring(targ)
    local target = getPlr(tostring(targ):lower())
        local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
        if target == nil or tool == nil then return end
        local attWeld = attachTool(tool,CFrame.new(0,0,0))
        firetouchinterest(target.Character.Humanoid.RootPart,tool.Handle,0)
        firetouchinterest(target.Character.Humanoid.RootPart,tool.Handle,0)
        tool.AncestryChanged:Wait()
        wait(.25)
        attWeld:Destroy()
end
function Control(targetname)
    
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
local ohString1 = "giveRiotShield"
local ohInstance2 = workspace[targetname]["HumanoidRootPart"]

workspace.resources.RemoteFunction:InvokeServer(ohString1, ohInstance2)
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local args = {
    [1] = "toggleShield",
    [2] = workspace.RiotShield
}

workspace.resources.RemoteEvent:FireServer(unpack(args))
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end

function Carry(ta)
    local target = getPlr(tostring(ta):lower())
        local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
        if target == nil or tool == nil then return end
        tool.Handle.CanCollide = false
        attachTool(tool,CFrame.new(1.5,-3,1) * CFrame.Angles(math.rad(-90),0,0))
        target.Character.Humanoid.PlatformStand = true
        firetouchinterest(target.Character.Humanoid.RootPart,tool.Handle,0)
        firetouchinterest(target.Character.Humanoid.RootPart,tool.Handle,0)
end

function Void(e)
    local target = getPlr(tostring(e):lower())
        local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
        if target == nil or tool == nil then return end
        local old = getChar().HumanoidRootPart.CFrame
        local olddh = workspace.FallenPartsDestroyHeight
        workspace.FallenPartsDestroyHeight = 0/0
        tool.Handle.CanCollide = false
        local attWeld = attachTool(tool,CFrame.new(-1,-2,0) * CFrame.Angles(math.rad(-90),0,0))
        target.Character.Humanoid.PlatformStand = true
        firetouchinterest(target.Character.Humanoid.RootPart,tool.Handle,0)
        firetouchinterest(target.Character.Humanoid.RootPart,tool.Handle,0)
        tool.AncestryChanged:Wait()
        getChar().HumanoidRootPart.CFrame = getChar().HumanoidRootPart.CFrame * CFrame.new(0,math.huge,0)
        wait(.5)
        attWeld:Destroy()
        wait(.5)
        getChar().HumanoidRootPart.CFrame = old
end

function Bang(aa)
     local target = getPlr(tostring(aa):lower())
        local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
        if target == nil or tool == nil then return end
        for i,v in pairs(getChar().Humanoid:GetPlayingAnimationTracks()) do
            v:Stop()
        end
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://148840371"
        local k = getChar().Humanoid:LoadAnimation(anim)
        k.Looped = true
        k:Play(0)
        k:AdjustSpeed(10)
        tool.Handle.CanCollide = false
        local attWeld= attachTool(tool,CFrame.new(0.2,4,2) * CFrame.Angles(math.rad(90),0,0))
        target.Character.Humanoid.PlatformStand = true
        firetouchinterest(target.Character.Humanoid.RootPart,tool.Handle,0)
        firetouchinterest(target.Character.Humanoid.RootPart,tool.Handle,0)
end

function Fling(ea)
    local target = getPlr(tostring(ea):lower())
        if target == nil then return end
        
        local flingTime = 2.5
        local fTime = os.clock()
        local rot = 0
        local tools = {}
        local originalGrips = {}
        local hum = getChar():FindFirstChildOfClass("Humanoid")
        local root = hum.RootPart
        local tChr = target.Character
        local tHum = tChr:FindFirstChildOfClass("Humanoid")
        local tRoot = tChr:FindFirstChild("Torso") or tChr:FindFirstChild("UpperTorso")
        local origCF = root.CFrame
        local origState = hum:GetState()
        local origFpdh = workspace.FallenPartsDestroyHeight
        workspace.FallenPartsDestroyHeight = 0 / 0
        hum:ChangeState(Enum.HumanoidStateType.Physics)
        hum:UnequipTools()
        for _, v in ipairs(plr.Backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Handle") then
                table.insert(tools, v)
                table.insert(originalGrips, v.Grip)
                v.Handle.Massless = true
                v.Grip = CFrame.new(5773, 5774, 5773)
                v.Parent = getChar()
            end
        end
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(9e30, 9e30, 9e30)
        bv.Parent = root
        local bav = Instance.new("BodyAngularVelocity")
        bav.AngularVelocity = Vector3.new(9e30, 9e30, 9e30)
        bav.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bav.Parent = root
        while true do
            if os.clock() - fTime >= flingTime then
                break
            else
                if rot == 90 then
                    rot = 0
                else
                    rot = 90
                end
                root.CFrame = tRoot.CFrame * CFrame.Angles(math.rad(rot), 0, 0) + tHum.MoveDirection * tHum.WalkSpeed * .4
            end
            task.wait()
        end
        hum:ChangeState(origState)
        bav:Destroy()
        bv:Destroy()
        root.Velocity = Vector3.new()
        root.RotVelocity = Vector3.new()
        root.CFrame = origCF
        workspace.FallenPartsDestroyHeight = origFpdh
        for i, v in ipairs(tools) do
            if originalGrips[i] then
                v.Grip = originalGrips[i]
            end
        end
        hum:UnequipTools()
end
