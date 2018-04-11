if not funcs then funcs = true

  ------------------
  --ROTATION START--
  ------------------
  function Rotation()

--Que + prep/after prep movement
    General()

--Comp specific rotation
    if GetMinimapZoneText() == "Nagrand Arena"
    or GetMinimapZoneText() == "Blade's Edge Arena"
    or GetMinimapZoneText() == "Ruins of Lordaeron" then
      if UnitClass("player") == "Paladin" then
        if ( UnitClass("party1") == "Death Knight" or UnitClass("party2") == "Death Knight" )
        and ( UnitClass("party1") == "Druid" or UnitClass("party2") == "Druid" ) 
        and UnitBuffID("player", 24907) then 
          DKDruid_Balance()
        elseif ( UnitClass("party1") == "Death Knight" or UnitClass("party2") == "Death Knight" )
        and ( UnitClass("party1") == "Druid" or UnitClass("party2") == "Druid" ) 
        and UnitBuffID("player", 24932) then 
          DKDruid_Feral()
        elseif ( UnitClass("party1") == "Death Knight" or UnitClass("party2") == "Death Knight" )
        and ( UnitClass("party1") == "Hunter" or UnitClass("party2") == "Hunter" ) then 
          DKHunter()
        elseif ( UnitClass("party1") == "Death Knight" or UnitClass("party2") == "Death Knight" )
        and ( UnitClass("party1") == "Mage" or UnitClass("party2") == "Mage" ) then 
          DKMage()
        elseif ( UnitClass("party1") == "Death Knight" or UnitClass("party2") == "Death Knight" )
        and ( UnitClass("party1") == "Priest" or UnitClass("party2") == "Priest" ) then 
          DKPriest_Shadow()
        elseif ( UnitClass("party1") == "Death Knight" or UnitClass("party2") == "Death Knight" )
        and ( UnitClass("party1") == "Rogue" or UnitClass("party2") == "Rogue" ) then 
          DKRogue()
        elseif ( UnitClass("party1") == "Death Knight" or UnitClass("party2") == "Death Knight" )
        and ( UnitClass("party1") == "Shaman" or UnitClass("party2") == "Shaman" )
        and UnitBuffID("player", 51470) then 
          DKShaman_Elemental()
        elseif ( UnitClass("party1") == "Death Knight" or UnitClass("party2") == "Death Knight" )
        and ( UnitClass("party1") == "Shaman" or UnitClass("party2") == "Shaman" )
        and UnitBuffID("player", 30809) then 
          DKShaman_Enhancement()
        elseif ( UnitClass("party1") == "Death Knight" or UnitClass("party2") == "Death Knight" )
        and ( UnitClass("party1") == "Warlock" or UnitClass("party2") == "Warlock" ) then 
          DKWarlock()
        elseif ( UnitClass("party1") == "Death Knight" or UnitClass("party2") == "Death Knight" )
        and ( UnitClass("party1") == "Warrior" or UnitClass("party2") == "Warrior" ) then 
          DKWarrior()
        elseif ( UnitClass("party1") == "Hunter" or UnitClass("party2") == "Hunter" )
        and ( UnitClass("party1") == "Warlock" or UnitClass("party2") == "Warlock" ) then 
          HunterWarlock()
        elseif ( UnitClass("party1") == "Hunter" or UnitClass("party2") == "Hunter" )
        and ( UnitClass("party1") == "Warrior" or UnitClass("party2") == "Warrior" ) then
          HunterWarrior()
        else
          Any()
        end
      end
    end

  end
  ----------------
  --ROTATION END--
  ----------------

  rate_counter = 0    
  ahk_rate = 0.20
  enabled = true

  frame = CreateFrame("Frame", nil, UIParent)
  frame:Show()    
  frame:SetScript("OnUpdate", function(self, elapsed)        
      rate_counter = rate_counter + elapsed
      if enabled and rate_counter > ahk_rate then            
        Rotation()            
        rate_counter = 0        
      end    
    end
  )

  -- Disable the rotation
  function Disable()
    enabled = false print("Disabled") AcceptBattlefieldPort(1)
  end

  -- Enable the rotation     
  function Enable()
    enabled = true print("Enabled")
  end

  function Toggle()
    if enabled then Disable() else Enable() end 
  end

  print("Skynet Paladin Holy Soloq")

end

--Disable on initial load
if enabled then Disable() else Enable() end