local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
 
print("Loading #1")
 
local function Start()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(973, -139, 275)
 
    wait(.1)
 
    local A_1 = "GiveGui"
    local Event = game:GetService("ReplicatedStorage").Events.JobService
    Event:FireServer(A_1)
 
    wait(.1)
 
    local A_1 = "Apply"
    local A_2 = 
    {
	    ["job_radius"] = 110, 
	    ["CanWork"] = true, 
	    ["indoor_job_point"] = game:GetService("Workspace").JobPoints.TheaterInterior, 
	    ["Workers"] = 
    {
    }, 
	    ["ID"] = "MovieActor", 
	    ["job_point"] = game:GetService("Workspace").JobPoints.Theater, 
	    ["MaxPositions"] = 4, 
	    ["Data"] = 
    {
	    ["HourReqirement"] = 2, 
	    ["EndTime"] = "23:00:00", 
	    ["Shiftless"] = false, 
	    ["JobDesc"] = "Roleplay improv scenarios to give a show to the audience. Dress in costumes and use props to convey a playscript with a unique twist of your own flavor!", 
	    ["JobTitle"] = "Actor", 
	    ["RequiredConstantWork"] = false, 
	    ["UniformShirt"] = 6401487262, 
	    ["UniformPants"] = 7442991927, 
	    ["Commission"] = 0, 
	    ["StartTime"] = "17:00:00", 
	    ["BasePay"] = 450, 
	    ["JobRules"] = "Use the door in the theater room to enter the backstage, from there follow the prompts and pick your costume, and make sure your team roleplays according to the script. Use /me to roleplay actions (ex: /me picks up the rock.)"
    }
    }
    local Event = game:GetService("ReplicatedStorage").Events.JobService
    Event:FireServer(A_1, A_2)
 
 
    wait(.1)
 
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(268, 15, 40)
end
 
Start()
 
local function Check()
    if game:GetService("Lighting").ClockTime == 23 then
        print("Restarting")
        Start()
    end
end
 
game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(Check)
 
