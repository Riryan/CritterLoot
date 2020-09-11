
Citizen.CreateThread(function()
  while true do
		Wait(0)
		local player = PlayerPedId()
		local coords = GetEntityCoords(player)
		local entityHit = 0
		local shapeTest = StartShapeTestBox(coords.x, coords.y, coords.z, 2.0, 2.0, 2.0, 0.0, 0.0, 0.0, true, 8, player)
		local rtnVal, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
		local type = GetPedType(entityHit)
		local dead = IsEntityDead(entityHit)
		local holdTime = 0
		local entity = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
		local model = GetEntityModel(entityHit)

    if Citizen.InvokeNative(0x1BE19185B8AFE299,0x41AC83D1) then 
      if IsControlJustPressed(0,0xD51B784F) --INPUT_CONTEXT_Y|E
      or IsControlJustPressed(0,0x399C6619) --INPUT_LOOT2|E
      or IsControlJustPressed(0,0x41AC83D1) --INPUT_LOOT|E
      or IsControlJustPressed(0,0x2EAB0795)--INPUT_DYNAMIC_SCENARIO|E
      or IsControlJustPressed(0,0x14DB6C5E)--INPUT_LOOT_VEHICLE|E
      then 
        while true do
          getKeyDown = GetGameTimer()
          Wait(0)
          if IsControlJustReleased(0,0xD51B784F) 
          or IsControlJustReleased(0,0x399C6619) --INPUT_LOOT2|E
          or IsControlJustReleased(0,0x41AC83D1) --INPUT_LOOT|E
          or IsControlJustReleased(0,0x2EAB0795)--INPUT_DYNAMIC_SCENARIO|E
          or IsControlJustReleased(0,0x14DB6C5E)--INPUT_LOOT_VEHICLE|E
          then 
              getKeyReleased = GetGameTimer()
              holdTime = getKeyReleased - getKeyDown
            if holdTime > -23 then
              for i, row in pairs(Critter)do	
                if model == Critter[i]["model"] then
                  print(model)
							  	TriggerServerEvent("critter:addxp", 20) 
							   	TriggerServerEvent("critter:add", Critter[i]["item"])
                 	TriggerServerEvent("critter:add", Critter[i]["item2"])
							  end
              end
            end
          end
        end
      end
    end

    if Citizen.InvokeNative(0x1BE19185B8AFE299, 0xE3BF959B) then 
      if IsControlJustPressed(0,0xBE8593AF) --INPUT_PICKUP_CARRIABLE2
      or IsControlJustPressed(0,0xEB2AC491) --INPUT_PICKUP_CARRIABLE|R
      or IsControlJustPressed(0,0xE3BF959B) --INPUT_CONTEXT_X|R
      or IsControlJustPressed(0,0x27D1C284) --Loot 3
      or IsControlJustPressed(0,0xD2928083) --INPUT_DROP|R
      then 
        while true do
          getKeyDown = GetGameTimer()
          Wait(0)
          if IsControlJustReleased(0,0xBE8593AF)--INPUT_PICKUP_CARRIABLE2
          or IsControlJustReleased(0,0xEB2AC491)--INPUT_PICKUP_CARRIABLE|R
          or IsControlJustReleased(0,0xE3BF959B)--INPUT_CONTEXT_X|R
          or IsControlJustReleased(0,0x27D1C284) --Loot 3
          or IsControlJustReleased(0,0xD2928083) --INPUT_DROP|R
          then
            getKeyReleased = GetGameTimer()
            holdTime = getKeyReleased - getKeyDown
            print(holdTime, getKeyDown, getKeyReleased)
            if holdTime > 23 then
              holdTime = 0
              print("hold done do loot")
              for i, row in pairs(Carcass)do	
                if model == Carcass[i]["model"] then
                TriggerServerEvent("critter:addxp", 10) 
                TriggerServerEvent("critter:add", Carcass[i]["item"])					
                end
              end
            end
          end
        end
      end
    end
	end
end)
