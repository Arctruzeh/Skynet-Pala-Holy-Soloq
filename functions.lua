function UnitBuffID(unit, id)    
  return UnitBuff(unit, GetSpellInfo(id))
end

function UnitDebuffID(unit, id)    
  return UnitDebuff(unit, GetSpellInfo(id))
end

function _LoS(unit,otherUnit)
  if not otherUnit then otherUnit = "player"; end
  if UnitIsVisible(unit)
  and UnitIsVisible(otherUnit) 
  --and UnitExists(unit)
  --and UnitExists(otherUnit) 
  then
    local X1,Y1,Z1 = ObjectPosition(unit);
    local X2,Y2,Z2 = ObjectPosition(otherUnit);
    return not TraceLine(X1,Y1,Z1 + 2,X2,Y2,Z2 + 2, 0x10);
  end
end

function CanHeal(unit)
  if UnitExists(unit)
  and _LoS(unit)
  and UnitIsConnected(unit)
  and not UnitIsCharmed(unit) 
  and not UnitDebuffID(unit, 33786) --Cyclone
  and not UnitIsDeadOrGhost(unit) then
    return true
  end
end

function getHp(unit) 
  if CanHeal(unit) then
    return 100 * UnitHealth(unit) / UnitHealthMax(unit)
  else
    return 200
  end
end

function cdRemains(spellid)
  if select(2,GetSpellCooldown(spellid)) + (select(1,GetSpellCooldown(spellid)) - GetTime()) > 0
  then return select(2,GetSpellCooldown(spellid)) + (select(1,GetSpellCooldown(spellid)) - GetTime())
  else return 0
  end
end

function rangeCheck(spellid,unit)
  if IsSpellInRange(GetSpellInfo(spellid),unit) == 1
  then
    return true
  end
end

function _castSpell(spellid,tar)
  if UnitCastingInfo("player") == nil
  and UnitChannelInfo("player") == nil
  and cdRemains(spellid) == 0 
  and UnitIsDead("player") == nil then
    if tar ~= nil
    and rangeCheck(spellid,tar) == nil then
      return false
    elseif tar ~= nil
    and rangeCheck(spellid,tar) == true
    and _LoS(tar) then
      CastSpellByID(spellid, tar)
      return true
    elseif tar == nil then
      CastSpellByID(spellid)
      return true
    else
      return false
    end
  end
end

-- Return true if a given type is checked
function ValidUnitType(unitType, unit)
  local isEnemyUnit = UnitCanAttack("player", unit) == 1
  return (isEnemyUnit and unitType == "enemy")
  or (not isEnemyUnit and unitType == "friend")
end

-- Return if a given unit exists, isn't dead
function ValidUnit(unit, unitType) 
  return UnitExists(unit)==1 and ValidUnitType(unitType, unit)
end

function unitismelee(unit)
  if UnitClass(unit) == "Warrior"
  or UnitClass(unit) == "Death Knight"
  or UnitClass(unit) == "Rogue" then
    return true
  end
end

function meleehittingme(unit)
  if ValidUnit(unit, "enemy")
  and GetDistanceBetweenObjects ("player", unit) < 5
  and unitismelee(unit) then
    return true
  end
end

function UnitSpec(unit)
  if UnitClass(unit) == "Paladin" then
    if UnitPowerMax(unit) > 15000 then
      return "Holy"
    elseif UnitPowerMax(unit) < 15000 then
      return "Ret"
    end
  elseif UnitClass(unit) == "Priest" then
    if UnitBuffID(unit, 15286) 
    or UnitBuffID(unit, 15473) then
      return "Shadow"
    elseif not UnitBuffID(unit, 15286)
    and not UnitBuffID(unit, 15473) then
      return "Disc"
    end
  else
    return nil
  end
end

function hasCastTime(unit)
  local name, subText, text, texture, startTime, endTime, isTradeSkill, castID, notInterruptible = UnitCastingInfo(unit)
  local name2, subText2, text2, texture2, startTime2, endTime2, isTradeSkill2, notInterruptible2 = UnitChannelInfo(unit)
  if name or name2 then
    return true
  else
    return false
  end
end