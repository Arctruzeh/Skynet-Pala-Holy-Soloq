function DKShaman_Enhancement()

  --who to focus
  if not UnitExists("focus") then
    FocusUnit("party1")
  end

  --Every Man for Himself, fix for hex when party is mage/druid
  for i=1, #TrinketList do
    if UnitDebuffID("player", TrinketList[i]) then
      _castSpell(59752)
    end
  end

  --Every Man for Himself, without priest
  if UnitClass("party1") ~= "Priest"
  and UnitClass("party1") ~= "Priest" 
  and getHp(lowest) < 50 then
    for i=1, #HardCCList do
      local name, rank, _, count, dispelType, duration, expires, _, _, _, spellID = UnitDebuffID("player", HardCCList[i])
      if spellID == HardCCList[i]
      and duration > 2 then
        _castSpell(59752)
      end
    end
  end

  --Bubble CC
  for i=1, #TrinketList do
    if UnitDebuffID("player", TrinketList[i])
    and UnitDebuffID("player", 33786) == nil
    and cdRemains(59752) ~= 0 then
      _castSpell(642)
    end
  end

  --Bubble Silence
  for i=1, #SilenceList do
    if UnitDebuffID("player", SilenceList[i])
    and getHp(lowest) < 50 then
      _castSpell(642)
    end
  end

  --Divine Shield
  if getHp("player") <= 15 then
    _castSpell(642)
  end

  --HoP P1
  if UnitExists("party1") == 1
  and getHp("party1") < 35
  and UnitClass("party1") ~= "Warrior"
  then
    if UnitDebuffID("party1", 57975) ~= nil --wound poison
    or UnitDebuffID("party1", 57970) ~= nil --deadly poison
    or UnitDebuffID("party1", 47486) ~= nil --mortal strike
    or UnitDebuffID("party1", 47465) ~= nil --rend
    or UnitDebuffID("party1", 1715) ~= nil --hamstring
    or UnitDebuffID("party1", 46968) ~= nil --shockwave
    or UnitDebuffID("party1", 12809) ~= nil --concussion blow
    or UnitDebuffID("party1", 19434) ~= nil --aimed shot
    or UnitDebuffID("party1", 49001) ~= nil --serpent sting
    or UnitDebuffID("party1", 5116) ~= nil --concussive shot
    or UnitDebuffID("party1", 58181) ~= nil --infected wounds
    or UnitDebuffID("party1", 49802) ~= nil --maim
    or UnitDebuffID("party1", 48574) ~= nil --rake
    or UnitDebuffID("party1", 50536) ~= nil --unholy blight
    or UnitDebuffID("party1", 51735) ~= nil --ebon plague
    or UnitDebuffID("party1", 55095) ~= nil --frost fever
    or UnitDebuffID("party1", 10308) ~= nil --hoj
    or UnitDebuffID("party1", 54499) ~= nil --heart of the crusader
    or UnitDebuffID("party1", 17364) ~= nil --stormstrike
    then 
      _castSpell(10278,"party1")
    end
  end

  --HoP P2
  if UnitExists("party2") == 1
  and getHp("party2") < 35
  and UnitClass("party2") ~= "Warrior"
  then
    if UnitDebuffID("party2", 57975) ~= nil --wound poison
    or UnitDebuffID("party2", 57970) ~= nil --deadly poison
    or UnitDebuffID("party2", 47486) ~= nil --mortal strike
    or UnitDebuffID("party2", 47465) ~= nil --rend
    or UnitDebuffID("party2", 1715) ~= nil --hamstring
    or UnitDebuffID("party2", 46968) ~= nil --shockwave
    or UnitDebuffID("party2", 12809) ~= nil --concussion blow
    or UnitDebuffID("party2", 19434) ~= nil --aimed shot
    or UnitDebuffID("party2", 49001) ~= nil --serpent sting
    or UnitDebuffID("party2", 5116) ~= nil --concussive shot
    or UnitDebuffID("party2", 58181) ~= nil --infected wounds
    or UnitDebuffID("party2", 49802) ~= nil --maim
    or UnitDebuffID("party2", 48574) ~= nil --rake
    or UnitDebuffID("party2", 50536) ~= nil --unholy blight
    or UnitDebuffID("party2", 51735) ~= nil --ebon plague
    or UnitDebuffID("party2", 55095) ~= nil --frost fever
    or UnitDebuffID("party2", 10308) ~= nil --hoj
    or UnitDebuffID("party2", 54499) ~= nil --heart of the crusader
    or UnitDebuffID("party2", 17364) ~= nil --stormstrike
    then 
      _castSpell(10278,"party2")
    end
  end

  --Bauble Arena
  if getHp(lowest) < 40 then
    for i=1, #SilenceList do
      if UnitDebuffID("player", 51514) --hex
      or UnitDebuffID("player", SilenceList[i])
      or cdRemains(48825) ~= 0
      then
        UseItemByName("Bauble of True Blood", lowest)
      end
    end
  end

  --Turn Evil Gargoyle
  for i = 1, ObjectCount() do
    local object = ObjectWithIndex(i)
    if string.find(select(1, ObjectName(object)), "Ebon Gargoyle") ~= nil  
    and UnitIsEnemy(object, "player") 
    and not UnitDebuffID(object, 10326)
    and UnitCanAttack("player", object) == 1 then
      _castSpell(10326, object)
    end
  end

  --Hammer of Wrath
  for _, unit in ipairs(EnemyList) do
    if ValidUnit(unit, "enemy") then
      if UnitDebuffID(unit, 51724) == nil --sap
      and UnitDebuffID(unit, 33786) == nil --cyclone
      and UnitDebuffID(unit, 12826) == nil --poly
      and UnitBuffID(unit, 45438) == nil --ice block
      and UnitBuffID(unit, 642) == nil --bubble
      and UnitBuffID(unit, 19263) == nil --deterrance
      and UnitBuffID(unit, 31224) == nil --cloak of shadows
      and UnitIsFacing ("player", unit) == true
      and getHp(lowest) > 50
      and getHp(unit) <= 20 then
        _castSpell(48806, unit)
      end
    end
  end

  --Cleanse Hard CC P1
  if UnitExists("party1") == 1 
  and CanHeal("party1") then
    for i=1, #HardCCList do
      if UnitDebuffID("party1", HardCCList[i]) then
        _castSpell(4987, "party1")
      end
    end
  end

  --Cleanse Hard CC P2
  if UnitExists("party2") == 1 
  and CanHeal("party2") then
    for i=1, #HardCCList do
      if UnitDebuffID("party2", HardCCList[i]) then
        _castSpell(4987, "party2")
      end
    end
  end

  --Cleanse Silence P1
  if UnitExists("party1") == 1 
  and CanHeal("party1")
  and UnitClass("party1") ~= "Warrior" 
  and UnitClass("party1") ~= "Rogue" then
    for i=1, #SilenceList do
      if UnitDebuffID("party1", SilenceList[i]) then
        _castSpell(4987, "party1")
      end
    end
  end

  --Cleanse Silence P2
  if UnitExists("party2") == 1 
  and CanHeal("party2")
  and UnitClass("party2") ~= "Warrior" 
  and UnitClass("party2") ~= "Rogue" then
    for i=1, #SilenceList do
      if UnitDebuffID("party2", SilenceList[i]) then
        _castSpell(4987, "party2")
      end
    end
  end

  --Cleanse Root P1 lowest > 60
  if UnitExists("party1") == 1 
  and getHp(lowest) > 60
  and ( UnitClass("party1") == "Warrior" or UnitClass("party1") == "Rogue" or UnitClass("party1") == "Death Knight" ) then
    for i=1, #RootList do
      if UnitDebuffID("party1", RootList[i]) then
        _castSpell(4987, "party1")
      end
    end
  end

  --Cleanse Root P2 lowest > 60
  if UnitExists("party2") == 1 
  and getHp(lowest) > 60
  and ( UnitClass("party2") == "Warrior" or UnitClass("party2") == "Rogue" or UnitClass("party2") == "Death Knight" ) then
    for i=1, #RootList do
      if UnitDebuffID("party2", RootList[i]) then
        _castSpell(4987, "party2")
      end
    end
  end

  --HoJ CC
  for _, unit in ipairs(EnemyList) do
    local spellName, _, _, _, startCast, endCast, _, _, canInterrupt = UnitCastingInfo(unit) 
    for i=1, #CCList do
      if GetSpellInfo(CCList[i]) == spellName 
      and canInterrupt == false then
        if ((endCast/1000) - GetTime()) < .5 then
          _castSpell(10308, unit)
        end
      end
    end
  end

  --hoj priest/hpal
  for _, unit in ipairs(EnemyList) do
    if ValidUnit(unit, "enemy") then 
      if UnitClass(unit) == "Priest" 
      or UnitSpec(unit) == "Holy" then
        _castSpell(10308, unit)
      end
    end
  end

  --Mana Divine Illumination
  local PlayerMana = 100 * UnitPower("player") / UnitPowerMax("player")

  if PlayerMana <= 75  then
    _castSpell(31842)
  end

  --Mana Divine Plea
  local PlayerMana = 100 * UnitPower("player") / UnitPowerMax("player")

  if getHp(lowest) > 80
  and PlayerMana <= 60  then
    _castSpell(54428)
  end

  --Freedom P1
  if UnitExists("party1") == 1 
  and not UnitDebuffID("party1", 10308)
  and not UnitDebuffID("party1", 8643)
  and not UnitDebuffID("party1", 33786)
  then
    for i=1, #FreedomList do
      if UnitDebuffID("party1", FreedomList[i]) then
        _castSpell(1044, "party1")
      end
    end
  end

  --Freedom P2
  if UnitExists("party2") == 1
  and not UnitDebuffID("party1", 10308)
  and not UnitDebuffID("party1", 8643)
  and not UnitDebuffID("party1", 33786)
  then
    for i=1, #FreedomList do
      if UnitDebuffID("party2", FreedomList[i]) then
        _castSpell(1044, "party2")
      end
    end
  end

  --Heal Pets
  --insta flash of light
  if UnitBuffID("player", 54149) 
  and getHp(lowestpet) < 85
  and getHp(lowestpet) < getHp(lowest) then 
    _castSpell(48785, lowestpet)
  end

  --holy shock
  if getHp(lowestpet) < 85
  and getHp(lowestpet) < getHp(lowest) then 
    _castSpell(48825, lowestpet)
  end

  --flash of light
  if getHp(lowestpet) < 85
  and getHp(lowestpet) < getHp(lowest) then 
    _castSpell(48785, lowestpet)
  end

  --Infusion of Light
  if UnitBuffID("player", 54149) 
  and getHp(lowest) < 85 then
    _castSpell(48785, withoutbeacon)
  end

  --Divine Favor
  if getHp(lowest) < 50 then
    _castSpell(20216)
  end

  --Holy Shock
  if getHp(lowest) < 70 then 
    _castSpell(48825, withoutbeacon)
  end

  --Hand of Sacrifice
  if not UnitBuffID("party1", 64205)
  and not UnitBuffID("party2", 64205)
  and getHp("party1") < 45
  and getHp("party1") > 10 then 
    _castSpell(6940,"party1")
  end
  if not UnitBuffID("party1", 64205)
  and not UnitBuffID("party2", 64205)
  and getHp("party2") < 45
  and getHp("party2") > 10 then 
    _castSpell(6940,"party2")
  end

  --Divine Sacrifice
  if not UnitBuffID("party1", 6940)
  and not UnitBuffID("party2", 6940)
  and getHp("party1") > 10
  and getHp("party2") > 10
  and ( getHp("party1") < 50 or getHp("party2") < 50 ) then
    _castSpell(64205)
  end

  --Flash of Light
  if getHp(lowest) < 85 then 
    _castSpell(48785, withoutbeacon)
  end

  --Flash of Light
  if getHp("player") < 95
  and getHp("party1") > 95
  and getHp("party2") > 95 then 
    _castSpell(48785, "player")
  end

  --Sacred Shield
  if UnitBuffID(lowest, 53601) == nil
  and getHp("party1") ~= getHp("player")
  and getHp("party1") ~= getHp("party2")
  and getHp(lowest) < 95 then
    _castSpell(53601, lowest)
  end

  if UnitBuffID("player", 32727)
  and UnitBuffID("player", 53601) == nil
  and UnitBuffID("party1", 53601) == nil
  and UnitBuffID("party2", 53601) == nil then 
    _castSpell(53601, "party1")
  end

  --beacon warlock/hunter pet
  if UnitClass("party1") == "Warlock"
  or UnitClass("party1") == "Hunter" then
    if UnitBuffID("partypet1", 53563) == nil then
      _castSpell(53563, "partypet1")
    end
  end

  if UnitClass("party2") == "Warlock"
  or UnitClass("party2") == "Hunter" then
    if UnitBuffID("partypet2", 53563) == nil then
      _castSpell(53563, "partypet2")
    end
  end

  --Beacon party1 if nobody has it
  if UnitExists(lowest) == 1
  and UnitBuffID("player", 53563) == nil
  and UnitBuffID("party1", 53563) == nil
  and UnitBuffID("partypet1", 53563) == nil
  and UnitBuffID("party2", 53563) == nil 
  and UnitBuffID("partypet2", 53563) == nil
  then 
    _castSpell(53563, "party1")
  end

  --Cleanse Root Player
  if UnitExists("player") == 1 then
    for i=1, #RootList do
      if UnitDebuffID("player", RootList[i]) then
        _castSpell(4987, "player")
      end
    end
  end

  --Cleanse Root P1
  if UnitExists("party1") == 1 then
    for i=1, #RootList do
      if UnitDebuffID("party1", RootList[i]) then
        _castSpell(4987, "party1")
      end
    end
  end

  --Cleanse Root P2
  if UnitExists("party2") == 1 then
    for i=1, #RootList do
      if UnitDebuffID("party2", RootList[i]) then
        _castSpell(4987, "party2")
      end
    end
  end

  --Cleanse Slow Player
  if UnitExists("player") == 1 then
    for i=1, #SlowList do
      if UnitDebuffID("player", SlowList[i]) then
        _castSpell(4987, "player")
      end
    end
  end

  --Cleanse Slow P1
  if UnitExists("party1") == 1 then
    for i=1, #SlowList do
      if UnitDebuffID("party1", SlowList[i]) then
        _castSpell(4987, "party1")
      end
    end
  end

  --Cleanse Slow P2
  if UnitExists("party2") == 1 then
    for i=1, #SlowList do
      if UnitDebuffID("party2", SlowList[i]) then
        _castSpell(4987, "party2")
      end
    end
  end

  --Cleanse DoT's P1
  ----dk dots
  if UnitDebuffID("party1", 49194) == nil
  and (
    UnitDebuffID("party1", 55095) --frost fever
    or UnitDebuffID("party1",51735) --ebon plague
    or UnitDebuffID("party1",55078) --blood plague
    ) then 
    _castSpell(4987, "party1")
  end

  ----dots
  if UnitDebuffID("party1", 47811) --Immolate
  or UnitDebuffID("party1", 47813) --corruption
  or UnitDebuffID("party1", 49233) --flame shock
  or UnitDebuffID("party1", 48300) --devouring plague
  then 
    _castSpell(4987,"party1")
  end

  --Cleanse DoT's P2
  ----dk dots
  if UnitDebuffID("party2", 49194) == nil
  and (
    UnitDebuffID("party2",55095) --frost fever
    or UnitDebuffID("party2",51735) --ebon plague
    or UnitDebuffID("party2",55078) --blood plague
    ) then 
    _castSpell(4987, "party2")
  end

  ---dots
  if UnitDebuffID("party2", 47811) --Immolate
  or UnitDebuffID("party2", 47813) --corruption
  or UnitDebuffID("party2", 49233) --flame shock
  or UnitDebuffID("party2", 48300) --devouring plague
  then 
    _castSpell(4987,"party2")
  end

  --Cleanse DoT's Player
  ----dk dots
  if UnitDebuffID("player",49194) == nil
  and (
    UnitDebuffID("player",55095) --frost fever
    or UnitDebuffID("player",51735) --ebon plague
    or UnitDebuffID("player",55078) --blood plague
    ) then 
    _castSpell(4987, "player")
  end

  ----dots
  if UnitDebuffID("player", 47811) --Immolate
  or UnitDebuffID("player", 47813) --corruption
  or UnitDebuffID("player", 49233) --flame shock
  or UnitDebuffID("player", 48300) --devouring plague
  then _castSpell(4987,"player")
  end

  --Judgement of Light
  if UnitExists("focustarget") == 1
  and UnitDebuffID("focustarget", 51724) == nil --sap
  and UnitDebuffID("focustarget", 33786) == nil --cyclone
  and UnitDebuffID("focustarget", 12826) == nil --poly
  and UnitBuffID("focustarget", 45438) == nil --ice block
  and UnitBuffID("focustarget", 642) == nil --bubble
  and UnitBuffID("focustarget", 19263) == nil --deterrance
  and UnitBuffID("focustarget", 31224) == nil --cloak of shadows
  and UnitBuffID("focustarget", 48707) == nil --AMS
  then
    _castSpell(20271,"focustarget")
  end

  --Shield of Righteousness
  if UnitExists("target") == 1
  and UnitPower("player") > 26
  and UnitDebuffID("focustarget", 51724) == nil --sap
  and UnitDebuffID("focustarget", 33786) == nil --cyclone
  and UnitDebuffID("focustarget", 12826) == nil --poly
  and UnitBuffID("focustarget", 45438) == nil --ice block
  and UnitBuffID("focustarget", 642) == nil --bubble
  and UnitBuffID("focustarget", 19263) == nil --deterrance
  and UnitBuffID("focustarget", 48707) == nil --anti magic shell
  then 
    _castSpell(61411,"focustarget")
  end

  --Buff Seal of Light
  if not UnitBuffID("player", 20165)
  and not UnitBuffID("player", 20166)
  and not UnitBuffID("player", 31801) then
    _castSpell(20165)
  end

  --Buff Righteous Fury
  if not UnitBuffID("player", 25780) then
    _castSpell(25780)
  end

  --Buff Kings
  for _, unit in ipairs(PartyList) do
    if not UnitBuffID(unit, 20217)
    and UnitPower("player")>=5000 then 
      _castSpell(20217, unit)
    end
  end

  --Mount in prep
  if UnitExists("party2")
  and UnitBuffID("party2", 20217)
  and UnitBuffID("player", 25780)
  and UnitBuffID("player", 20165)
  --and UnitBuffID("player", ) 
  and IsMounted() == nil 
  and UnitBuffID("player", 32727) then
    CallCompanion("MOUNT", 1)
    CallCompanion("MOUNT", 2)
  end

  --Mount in arena
  if UnitExists("party2")
  and UnitBuffID("party2", 20217)
  and UnitBuffID("player", 25780)
  and UnitBuffID("player", 20165)
  --and UnitBuffID("player", ) 
  and IsMounted() == nil 
  --and UnitBuffID("player", 32727) 
  and UnitAffectingCombat("player") ~= 1
  then
    CallCompanion("MOUNT", 1)
    CallCompanion("MOUNT", 2)
  end

end