function General()

  local que = true
  local accept = true
  local leave = true

  --Que for Arena
  if que == true
  and not IsActiveBattlefieldArena() then
    local status, mapName, instanceID, bracketMin, bracketMax, teamSize, registeredMatch = GetBattlefieldStatus(1)
    if status ~= "queued"
    and status ~= "confirm" then
      RunMacroText("/say .arenaq solo")
    end
  end

  --accept que pop
  if accept == true
  and not IsActiveBattlefieldArena() then
    local status, mapName, instanceID, bracketMin, bracketMax, teamSize, registeredMatch = GetBattlefieldStatus(1)
    if status == "confirm" then
      AcceptBattlefieldPort(1, 1)
    end
  end

  --leave arena when finished
  if leave == true
  and GetBattlefieldWinner() ~= nil then
    LeaveBattlefield()
  end

  --move to spot while in prep room
  if UnitBuffID("player", 32727) 
  and GetMinimapZoneText() == "Nagrand Arena" then
    local X1,Y1,Z1 = ObjectPosition("player")
    local X2 = 4083.7341308594
    local Y2 = 2871.1450195313
    if sqrt((X1 - X2)^2 + (Y1 - Y2)^2) > 1
    and sqrt((X1 - X2)^2 + (Y1 - Y2)^2) < 20 then
      MoveTo (X2, Y2, Z1, true)
    end
  end
  if UnitBuffID("player", 32727) 
  and GetMinimapZoneText() == "Nagrand Arena" then
    local X1,Y1,Z1 = ObjectPosition("player")
    local X2 = 4029.8989257813
    local Y2 = 2969.6813964844
    if sqrt((X1 - X2)^2 + (Y1 - Y2)^2) > 1
    and sqrt((X1 - X2)^2 + (Y1 - Y2)^2) < 20 then
      MoveTo (X2, Y2, Z1, true)
    end
  end
  if UnitBuffID("player", 32727) 
  and GetMinimapZoneText() == "Ruins of Lordaeron" then
    local X1,Y1,Z1 = ObjectPosition("player")
    local X2 = 1278.7303466797
    local Y2 = 1732.9677734375
    if sqrt((X1 - X2)^2 + (Y1 - Y2)^2) > 1
    and sqrt((X1 - X2)^2 + (Y1 - Y2)^2) < 20 then
      MoveTo (X2, Y2, Z1, true)
    end
  end
  if UnitBuffID("player", 32727) 
  and GetMinimapZoneText() == "Ruins of Lordaeron" then
    local X1,Y1,Z1 = ObjectPosition("player")
    local X2 = 1293.4775390625
    local Y2 = 1601.1761474609
    if sqrt((X1 - X2)^2 + (Y1 - Y2)^2) > 1
    and sqrt((X1 - X2)^2 + (Y1 - Y2)^2) < 20 then
      MoveTo (X2, Y2, Z1, true)
    end
  end
  if UnitBuffID("player", 32727) 
  and GetMinimapZoneText() == "Blade's Edge Arena" then
    local X1,Y1,Z1 = ObjectPosition("player")
    local X2 = 1286.0847167969
    local Y2 = 1667.2406005859
    if sqrt((X1 - X2)^2 + (Y1 - Y2)^2) > 1
    and sqrt((X1 - X2)^2 + (Y1 - Y2)^2) < 20 then
      MoveTo (X2, Y2, Z1, true)
    end
  end
  if UnitBuffID("player", 32727) 
  and GetMinimapZoneText() == "Blade's Edge Arena" then
    local X1,Y1,Z1 = ObjectPosition("player")
    local X2 = 6290.5458984375
    local Y2 = 285.55197143555
    if sqrt((X1 - X2)^2 + (Y1 - Y2)^2) > 1
    and sqrt((X1 - X2)^2 + (Y1 - Y2)^2) < 20 then
      MoveTo (X2, Y2, Z1, true)
    end
  end
  if GetMinimapZoneText() == "Blade's Edge Arena" 
  and GetBattlefieldInstanceRunTime() >= 40000
  and GetBattlefieldInstanceRunTime() <= 40200 then
    RunMacroText("/p Play down. You will not get healed if you go on bridge. Juega debajo del puente. No sanarás si vas al puente.")
  end

  --move to spot after prep
  if GetMinimapZoneText() == "Nagrand Arena" 
  and GetBattlefieldInstanceRunTime() >= 60000
  and GetBattlefieldInstanceRunTime() <= 63000 then
    local X1,Y1,Z1 = ObjectPosition("player")
    local X2 = 4058.950928
    local Y2 = 2883.189697
    if sqrt((X1 - X2)^2 + (Y1 - Y2)^2) < 60 then
      MoveTo (X2, Y2, Z1, true)
    end
  end
  if GetMinimapZoneText() == "Nagrand Arena" 
  and GetBattlefieldInstanceRunTime() >= 60000
  and GetBattlefieldInstanceRunTime() <= 63000 then
    local X1,Y1,Z1 = ObjectPosition("player")
    local X2 = 4054.444336
    local Y2 = 2959.295654
    if sqrt((X1 - X2)^2 + (Y1 - Y2)^2) < 60 then
      MoveTo (X2, Y2, Z1, true)
    end
  end
  if GetMinimapZoneText() == "Ruins of Lordaeron" 
  and GetBattlefieldInstanceRunTime() >= 60000
  and GetBattlefieldInstanceRunTime() <= 63000 then
    local X1,Y1,Z1 = ObjectPosition("player")
    local X2 = 1282.008789
    local Y2 = 1666.809937
    MoveTo (X2, Y2, Z1, true)
  end
  if GetMinimapZoneText() == "Blade's Edge Arena" 
  and GetBattlefieldInstanceRunTime() >= 60000
  and GetBattlefieldInstanceRunTime() <= 63000 then
    local X1,Y1,Z1 = ObjectPosition("player")
    local X2 = 6222.885742
    local Y2 = 275.027283
    if sqrt((X1 - X2)^2 + (Y1 - Y2)^2) < 60 then
      MoveTo (X2, Y2, Z1, true)
    end
  end
  if GetMinimapZoneText() == "Blade's Edge Arena" 
  and GetBattlefieldInstanceRunTime() >= 60000
  and GetBattlefieldInstanceRunTime() <= 63000 then
    local X1,Y1,Z1 = ObjectPosition("player")
    local X2 = 6254.819336
    local Y2 = 248.692902
    if sqrt((X1 - X2)^2 + (Y1 - Y2)^2) < 60 then
      MoveTo (X2, Y2, Z1, true)
    end
  end

  --stop moving if casting/channeling
  if hasCastTime("player") == true then
    local X1,Y1,Z1 = ObjectPosition("player")
    MoveTo (X1, Y1, Z1, true)
  end

  --random jump
  if hasCastTime("player") ~= true then
    local jump = random(0, 1000)
    if jump == 500 then
      JumpOrAscendStart()
    end
  end

  --Lowest HP Party Member
  lowest = nil
  for i=1, #PartyUnits do
    if UnitExists(PartyUnits[i])
    and (lowest == nil or getHp(PartyUnits[i]) < getHp(lowest)) then
      lowest = PartyUnits[i]  
    end
  end

  --Lowest HP Party Member without beacon
  withoutbeacon = nil
  for i=1, #PartyUnits do
    if UnitExists(PartyUnits[i])
    and UnitBuffID(PartyUnits[i], 53563) == nil
    and (withoutbeacon == nil or getHp(PartyUnits[i]) < getHp(withoutbeacon)) then
      withoutbeacon = PartyUnits[i] 
    end
  end

  --Lowest HP Party Pet Member
  lowestpet = nil
  for i=1, #PartyPetUnits do
    if UnitExists(PartyPetUnits[i])
    and (lowestpet == nil or getHp(PartyPetUnits[i]) < getHp(lowestpet)) then
      lowestpet = PartyPetUnits[i]  
    end
  end

  --Move to party
  if UnitExists("party1") == 1 
  and UnitIsDead("party1") == nil
  and UnitIsConnected("party1") == 1
  and _LoS("party1")
  and GetDistanceBetweenObjects ("player", "party1") > 39 then
    local X, Y, Z = GetPositionBetweenObjects ("party1", "player", 37)
    MoveTo (X, Y, Z, InstantTurn)
  end

  if UnitExists("party2") == 1 
  and UnitIsDead("party2") == nil
  and UnitIsConnected("party2") == 1
  and _LoS("party2")
  and GetDistanceBetweenObjects ("player", "party2") > 39 then
    local X, Y, Z = GetPositionBetweenObjects ("party2", "player", 37)
    MoveTo (X, Y, Z, InstantTurn)
  end

  --start moving if out of los
  if UnitExists(lowest) == 1 
  and UnitIsDead(lowest) == nil
  and UnitIsConnected(lowest) == 1
  and lowest ~= "player"
  and not _LoS(lowest)
  and not _LoS("party1", "party2") 
  then

    if MoveToObject(lowest) ~= nil then
      local X, Y, Z = MoveToObject(lowest)
      MoveTo (X, Y, Z, true)
    end

    if MoveToObject(lowest) == nil then
      stayinlos(lowest, "player")
    end

  end

  if UnitExists("party1") == 1 
  and UnitIsDead("party1") == nil
  and UnitIsConnected("party1") == 1
  and not _LoS("party1")
  and _LoS("party1", "party2") 
  then

    if MoveToObject("party1") ~= nil then
      local X, Y, Z = MoveToObject("party1")
      MoveTo (X, Y, Z, true)
    end

    if MoveToObject("party1") == nil then
      stayinlos("party1", "player")
    end

  end

  if UnitExists("party2") == 1 
  and UnitIsDead("party2") == nil
  and UnitIsConnected("party2") == 1
  and not _LoS("party2")
  and _LoS("party1", "party2") 
  then

    if MoveToObject("party2") ~= nil then
      local X, Y, Z = MoveToObject("party2")
      MoveTo (X, Y, Z, true)
    end

    if MoveToObject("party2") == nil then
      stayinlos("party2", "player")
    end

  end

  --move away from melee
  for _, unit in ipairs(EnemyList) do
    if meleehittingme(unit) 
    and UnitCastingInfo("player") == nil 
    and UnitChannelInfo("player") == nil then
      local X1, Y1, Z1 = GetPositionBetweenObjects (unit, "player", 10)
      local X2, Y2, Z2 = ObjectPosition("player")
      if TraceLine(X1,Y1,Z1 + 2, X2,Y2,Z2 + 2) == nil then
        MoveTo (X1, Y1, Z1, InstantTurn)
      end
    end
  end

  --move away from priest
  for _, unit in ipairs(EnemyList) do
    if ValidUnit(unit, "enemy")
    and UnitClass(unit) == "Priest"
    and GetDistanceBetweenObjects ("player", unit) < 10 
    and UnitCastingInfo("player") == nil 
    and UnitChannelInfo("player") == nil then
      local X1, Y1, Z1 = GetPositionBetweenObjects (unit, "player", 10)
      local X2, Y2, Z2 = ObjectPosition("player")
      if TraceLine(X1,Y1,Z1 + 2, X2,Y2,Z2 + 2) == nil then
        MoveTo (X1, Y1, Z1, InstantTurn)
      end
    end
  end

end