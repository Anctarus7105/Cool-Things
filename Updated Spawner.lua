local cue2 = Instance.new("Sound")
	cue2.Parent = game.Workspace
	cue2.Name = "Sound"
	cue2.SoundId = "rbxassetid://u rbx asset id sound here"
	cue2.Volume = 2.5(or u volume of sound)
	cue2.PlaybackSpeed = 1(or u PBSpeed)
	cue2:Play()
wait(8)

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "U name of entity here",
		Asset = "u rbxm fire here?raw=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = false,
			Duration = 1
		},
		Shatter = false,
		Repair = false
	},
	CameraShake = {
		Enabled = false,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 150(u numb of speed u entity), 
		Delay = 0,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 1,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 50(or u numb of kill range here),
		Amount = 100(numb of damage here)
	},
	Crucifixion = {
		Enabled = true,
		Range = 40(range of crucifixion),
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"u guiding light messages here", "u guiding light messages here", "u guiding light messages here", "u guiding light messages here"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnReachNode", function(node)
	print("Entity has reached node:", node)
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Anctarus7105/Cool-Things/refs/heads/main/DeSpawner.lua"))()
    wait(2)
---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "U badge text here",
    Desc = "U badge text here",
    Reason = "U badge text here",
    Image = "rbxassetid://u badge image or texture id here"
})
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

entity:Run()
