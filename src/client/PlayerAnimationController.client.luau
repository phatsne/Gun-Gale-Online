local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local animations = require(ReplicatedStorage.Shared.AnimationCatalog)
local trackMap = {}

local function ensureAnimator()
    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = humanoid
    end

    return humanoid, animator
end

local function loadAnimation(animator, name, assetId)
    if not assetId or assetId == "" then
        return nil
    end

    local animation = Instance.new("Animation")
    animation.AnimationId = assetId
    local track = animator:LoadAnimation(animation)
    track.Name = name
    track.Priority = animations.Priority[name]
    return track
end

local function setupCharacter()
    local humanoid, animator = ensureAnimator()
    for name, assetId in pairs(animations) do
        if type(assetId) == "string" and assetId ~= "" and name ~= "Priority" then
            local track = loadAnimation(animator, name, assetId)
            if track then
                trackMap[name] = track
            end
        end
    end

    local idleTrack = trackMap.Idle
    if idleTrack then
        idleTrack:Play(0.1, 1, 1)
    end
end

local function onCharacterAdded(newCharacter)
    character = newCharacter
    setupCharacter()
end

player.CharacterAdded:Connect(onCharacterAdded)
setupCharacter()
