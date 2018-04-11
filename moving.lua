NumberList = { 
  49, 48, 47, 46, 45,
  44, 43, 42, 41 ,41,
  39, 38, 37, 36, 34,
  34, 33, 32, 31, 30,
  29, 28, 27, 26, 25,
  24, 23, 22, 21, 20,
  19, 18, 17, 16, 15,
  14, 13, 12, 11, 10,
  9, 8, 7, 6, 5,
  4, 3, 2, 1,
}

function MoveToObject(unit)
  for i = 1, ObjectCount() do 
    local object = ObjectWithIndex(i) 
    if _LoS(object, unit) 
    and _LoS(object, "player") 
    and not _LoS(unit)
    and GetDistanceBetweenObjects("player", object) < 30
    and GetDistanceBetweenObjects(unit, object) < 30 
    then
      local X,Y,Z = ObjectPosition(object);
      return X, Y, Z
    end
  end
end

--start FUNCTION STAYINLOS
function stayinlos(unit1, unit2)
  if UnitExists(unit1) 
  and UnitIsConnected(unit1)
  and UnitIsVisible(unit1)
  and UnitExists(unit2) 
  and UnitIsConnected(unit2)
  and UnitIsVisible(unit2) then

    local X1,Y1,Z1 = ObjectPosition(unit1); 
    local X2,Y2,Z2 = ObjectPosition(unit2); 
    local X3,Y3,Z3 = TraceLine(X1,Y1,Z1 + 2, X2,Y2,Z2 + 2)
    local X4,Y4,Z4 = GetPositionBetweenObjects ("party1", "player", 29)
    local Dplusplus
    local Dminusminus
    local Dplusminus
    local Dminusplus
    local Dplusequal
    local Dminusequal
    local Dequalplus
    local Dequalminus

    if TraceLine(X1,Y1,Z1 + 2, X2,Y2,Z2 + 2) then  --was a hit

      for i=1, #NumberList do

        --[[X AXIS, TWO CHECK
        if TraceLine(X1 + NumberList[i],Y1,Z1 + 2, X1,Y1,Z1 + 2) == nil --plus equal
        and TraceLine(X2 + NumberList[i],Y2,Z2 + 2, X2,Y2,Z2 + 2) == nil
        and TraceLine(X1 + NumberList[i],Y1,Z1 + 2, X2 + NumberList[i],Y2,Z2 + 2) == nil then
          MoveTo (X1 + NumberList[i],Y1,Z1, true)
        end]]

        --XY AXIS
        if TraceLine(X1 + NumberList[i],Y1 + NumberList[i],Z1 + 2, X1,Y1,Z1 + 2) == nil --plus plus
        and TraceLine(X1 + NumberList[i],Y1 + NumberList[i],Z1 + 2, X2,Y2,Z2 + 2) == nil then
          Dplusplus = sqrt((X2 - (X1 + NumberList[i]))^2 + (Y2 - (Y1 + NumberList[i]))^2)
        else 
          Dplusplus = 1000
        end
        if TraceLine(X1 - NumberList[i],Y1 - NumberList[i],Z1 + 2, X1,Y1,Z1 + 2) == nil --minus minus
        and TraceLine(X1 - NumberList[i],Y1 - NumberList[i],Z1 + 2, X2,Y2,Z2 + 2) == nil then
          Dminusminus = sqrt((X2 - (X1 - NumberList[i]))^2 + (Y2 - (Y1 - NumberList[i]))^2)
        else 
          Dminusminus = 1000
        end
        if TraceLine(X1 + NumberList[i],Y1 - NumberList[i],Z1 + 2, X1,Y1,Z1 + 2) == nil --plus minus
        and TraceLine(X1 + 1,Y1 - 1,Z1 + 2, X2,Y2,Z2 + 2) == nil then
          Dplusminus = sqrt((X2 - (X1 + NumberList[i]))^2 + (Y2 - (Y1 - NumberList[i]))^2)
        else 
          Dplusminus = 1000
        end
        if TraceLine(X1 - NumberList[i],Y1 + NumberList[i],Z1 + 2, X1,Y1,Z1 + 2) == nil --minus plus
        and TraceLine(X1 - NumberList[i],Y1 + NumberList[i],Z1 + 2, X2,Y2,Z2 + 2) == nil then
          Dminusplus = sqrt((X2 - (X1 - NumberList[i]))^2 + (Y2 - (Y1 + NumberList[i]))^2)
        else 
          Dminusplus = 1000
        end
        --X AXIS
        if TraceLine(X1 + NumberList[i],Y1,Z1 + 2, X1,Y1,Z1 + 2) == nil --plus equal
        and TraceLine(X1 + NumberList[i],Y1,Z1 + 2, X2,Y2,Z2 + 2) == nil then
          Dplusequal = sqrt((X2 - (X1 + NumberList[i]))^2 + (Y2 - Y1)^2)
        else
          Dplusequal = 1000
        end
        if TraceLine(X1 - NumberList[i],Y1,Z1 + 2, X1,Y1,Z1 + 2) == nil --minus equal
        and TraceLine(X1 - NumberList[i],Y1,Z1 + 2, X2,Y2,Z2 + 2) == nil then
          Dminusequal = sqrt((X2 - (X1 - NumberList[i]))^2 + (Y2 - Y1)^2)
        else
          Dminusequal = 1000
        end
        --Y AXIS
        if TraceLine(X1,Y1 + NumberList[i],Z1 + 2, X1,Y1,Z1 + 2) == nil --equal plus
        and TraceLine(X1,Y1 + NumberList[i],Z1 + 2, X2,Y2,Z2 + 2) == nil then
          Dequalplus = sqrt((X2 - X1)^2 + (Y2 - (Y1 + NumberList[i]))^2)
        else
          Dequalplus = 1000
        end
        if TraceLine(X1,Y1 - NumberList[i],Z1 + 2, X1,Y1,Z1 + 2) == nil --equal minus
        and TraceLine(X1,Y1 - NumberList[i],Z1 + 2, X2,Y2,Z2 + 2) == nil then
          Dequalminus = sqrt((X2 - X1)^2 + (Y2 - (Y1 - NumberList[i]))^2)
        else
          Dequalminus = 1000
        end

        --XY AXIS
        if Dplusplus < Dminusminus
        and Dplusplus < Dplusminus
        and Dplusplus < Dminusplus 
        and Dplusplus < Dplusequal
        and Dplusplus < Dminusequal
        and Dplusplus < Dequalplus
        and Dplusplus < Dequalminus
        then
          MoveTo (X1 + NumberList[i],Y1 + NumberList[i],Z1, true)
          --print("Dplusplus")
          --return true
          --local A, B, C = (X1 + NumberList[i]),(Y1 + NumberList[i]),Z1
          --return A, B, C
          --return (X1 + NumberList[i]), (Y1 + NumberList[i]), Z1
        end
        if Dminusminus < Dplusplus
        and Dminusminus < Dplusminus
        and Dminusminus < Dminusplus 
        and Dminusminus < Dplusequal
        and Dminusminus < Dminusequal
        and Dminusminus < Dequalplus
        and Dminusminus < Dequalminus
        then
          MoveTo (X1 - NumberList[i],Y1 - NumberList[i],Z1, true)
          --print("Dminusminus")
          --return true
          --local A, B, C = (X1 - NumberList[i]),(Y1 - NumberList[i]),Z1
          --return A, B, C
          --return (X1 - NumberList[i]), (Y1 - NumberList[i]), Z1
        end
        if Dplusminus < Dminusminus
        and Dplusminus < Dplusplus
        and Dplusminus < Dminusplus 
        and Dplusminus < Dplusequal
        and Dplusminus < Dminusequal
        and Dplusminus < Dequalplus
        and Dplusminus < Dequalminus
        then
          MoveTo (X1 + NumberList[i],Y1 - NumberList[i],Z1, true)
          --print("Dplusminus")
          --return true
          --local A, B ,C = (X1 + NumberList[i]),(Y1 - NumberList[i]),Z1
          --return A, B, C
          --return (X1 + NumberList[i]), (Y1 - NumberList[i]), Z1
        end
        if Dminusplus < Dplusplus
        and Dminusplus < Dplusminus
        and Dminusplus < Dminusminus 
        and Dminusplus < Dplusequal
        and Dminusplus < Dminusequal
        and Dminusplus < Dequalplus
        and Dminusplus < Dequalminus
        then
          MoveTo (X1 - NumberList[i],Y1 + NumberList[i],Z1, true)
          --print("Dminusplus")
          --return true
          --local A, B, C = (X1 - NumberList[i]),(Y1 + NumberList[i]),Z1
          --return A, B, C
          --return (X1 - NumberList[i]), (Y1 + NumberList[i]), Z1
        end
        --X AXIS
        if Dplusequal < Dminusminus
        and Dplusequal < Dplusminus
        and Dplusequal < Dminusplus 
        and Dplusequal < Dplusplus
        and Dplusequal < Dminusequal
        and Dplusequal < Dequalplus
        and Dplusequal < Dequalminus
        then
          MoveTo (X1 + NumberList[i],Y1,Z1, true)
          --print("Dplusequal")
          --return true
          --local A, B, C = (X1 + NumberList[i]),Y1,Z1
          --return A, B, C
          --return (X1 + NumberList[i]), Y1, Z1
        end
        if Dminusequal < Dminusminus
        and Dminusequal < Dplusminus
        and Dminusequal < Dminusplus 
        and Dminusequal < Dplusplus
        and Dminusequal < Dplusequal
        and Dminusequal < Dequalplus
        and Dminusequal < Dequalminus
        then
          MoveTo (X1 - NumberList[i],Y1,Z1, true)
          --print("Dminusequal")
          --return true
          --local A, B, C = (X1 - NumberList[i]),Y1,Z1
          --return A, B, C
          --return (X1 - NumberList[i]), Y1, Z1
        end
        --Y AXIS
        if Dequalplus < Dminusminus
        and Dequalplus < Dplusminus
        and Dequalplus < Dminusplus 
        and Dequalplus < Dplusplus
        and Dequalplus < Dplusequal
        and Dequalplus < Dminusequal
        and Dequalplus < Dequalminus
        then
          MoveTo (X1,Y1 + NumberList[i],Z1, true)
          --print("Dequalplus")
          --return true
          --local A, B, C = X1, (Y1 + NumberList[i]), Z1
          --return A, B, C
          --return X1, (Y1 + NumberList[i]), Z1
        end
        if Dequalminus < Dminusminus
        and Dequalminus < Dplusminus
        and Dequalminus < Dminusplus 
        and Dequalminus < Dplusplus
        and Dequalminus < Dplusequal
        and Dequalminus < Dminusequal
        and Dequalminus < Dequalplus
        then
          MoveTo (X1,Y1 - NumberList[i],Z1, true)
          --print("Dequalminus")
          --return true
          --local A, B, C = X1, (Y1 - NumberList[i]), Z1
          --return A, B, C
          --return X1, (Y1 - NumberList[i]), Z1
        end

      end

    end

  end
end
--END FUNCTION STAYINLOS