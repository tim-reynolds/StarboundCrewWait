function recruitable.confirmFollow(skipNotification)
  if not skipNotification then
    local t = os.clock()
    local first_run = false
    if not self.last_follow then
      first_run = true
      self.last_follow = t
    end
    local d = t - self.last_follow
    self.last_follow = t

    if first_run then return end

    self.last_follow = false

    if d > 1 then return end
  end

  if not skipNotification then
    local playerEntityId = world.loadUniqueEntity(recruitable.ownerUuid())
    notify({ type = "follow", sourceId = playerEntityId})
  end

  npc.setPersistent(false)
  npc.setKeepAlive(true)
  storage.followingOwner = true
  storage.behaviorFollowing = true
  if playerEntityId and world.entityExists(playerEntityId) then
    npc.setDamageTeam(recruitable.defaultDamageTeam)
  end
end


function recruitable.confirmUnfollow(skipNotification)
  if not skipNotification then
    local t = os.clock()
    local first_run = false
    if not self.last_follow then
      first_run = true
      self.last_follow = t
    end
    local d = t - self.last_follow
    self.last_follow = t

    if first_run then return end

    self.last_follow = false

    if d > 1 then return end
  end
  if not skipNotification then
    local playerEntityId = world.loadUniqueEntity(recruitable.ownerUuid())
    notify({ type = "unfollow", sourceId = playerEntityId})
  end

  npc.setPersistent(true)
  npc.setKeepAlive(false)
  storage.followingOwner = false
  storage.behaviorFollowing = false
  npc.setDamageTeam(recruitable.defaultDamageTeam)
end

function recruitable.confirmUnfollowBehavior(skipNotification)

  if not skipNotification then
    local t = os.clock()
    local first_run = false
    if not self.last_follow then
      first_run = true
      self.last_follow = t
    end
    local d = t - self.last_follow
    self.last_follow = t

    if first_run then return end

    self.last_follow = false

    if d > 1 then return end
  end
  if not skipNotification then
    local playerEntityId = world.loadUniqueEntity(recruitable.ownerUuid())
    notify({ type = "unfollow", sourceId = playerEntityId})
  end

  npc.setPersistent(false)
  npc.setKeepAlive(true)
  storage.followingOwner = true
  storage.behaviorFollowing = false
  if playerEntityId and world.entityExists(playerEntityId) then
    npc.setDamageTeam(recruitable.defaultDamageTeam)
  end
end