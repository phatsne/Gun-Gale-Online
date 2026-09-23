local AnimationCatalog = {
    -- Replace these IDs with real Roblox animation asset IDs after upload.
    -- Gắn id của các animation tương tự vào đây ví dụ như shoot = "id của animation shoot"
    Idle = "",
    Move = "",
    Shoot = "73021726356995",
    Reload = "",
    Hit = "",
    Death = "",
    MeleeSwing = "",
    SkillCast = "",
    Jump = "",

    Priority = {
        Idle = Enum.AnimationPriority.Idle,
        Move = Enum.AnimationPriority.Movement,
        Shoot = Enum.AnimationPriority.Action,
        Reload = Enum.AnimationPriority.Action,
        Hit = Enum.AnimationPriority.Action,
        Death = Enum.AnimationPriority.Action,
        MeleeSwing = Enum.AnimationPriority.Action,
        SkillCast = Enum.AnimationPriority.Action,
        Jump = Enum.AnimationPriority.Action,
    },
}

return AnimationCatalog
