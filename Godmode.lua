--Here is the jump script because the jumping gets disabled when you remove your own humanoid (only executes this once)
if _G.ExecutedJump == true then --Only executing once so I dont go sky high
else
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

UIS.InputBegan:Connect(function(UserInput)
if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
    _G.JumpingDown = true
    while _G.JumpingDown == true and wait() do
        spawn(function()
        if game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Jumping or game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
            else
                if game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("JUMP_PART") then --Checking to see if I am reanimated
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
        end
    end
end)

UIS.InputEnded:Connect(function(UserInput)
if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
     _G.JumpingDown = false
     end
end)
_G.ExecutedJump = true
end

--Real godmode now
local reanimatedrig = Instance.new("Part") --Making a part so I can check if I am currently reanimated
reanimatedrig.Name = "JUMP_PART"

game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true --Freezing player so he cant move while reanimation

local newhum = game.Players.LocalPlayer.Character.Humanoid:Clone() --Making a humanoid to take place of the old one
newhum.Parent = game.Players.LocalPlayer.Character.Humanoid.Parent
newhum.Name = "4m6d on top"

wait(0.5) -- giving the game a second to realize that I made a humanoid so it can give it characteristics

game.Players.LocalPlayer.Character.Humanoid:Destroy() -- Deleting our humanoid so the game cant kill us

newhum.Name = "Humanoid" -- Renaming so the game knows that this is our humanoid

game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false --Unfreezing the player because we have 100% given us godmode (now to make it so we can jump)

reanimatedrig.Parent = newhum --Adding that part to our humanoid so we can jump

newhum:SetStateEnabled(Enum.HumanoidStateType.Climbing,true) --Adding some shit to our new humanoid so we can jump
newhum:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.Running,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
newhum:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
newhum:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)

game:GetService("Workspace").CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character --Viewing ourself because we unview ourself after deleting our humanoid
