local mph, kmh = 2.23693629, 3.6
local carSpeed = 0
local speed = mph -- or kmh
local speedLimit = 1000.0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(250)
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			carSpeed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId())) * speed
			if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId() then
				if (carSpeed <= speedLimit) then  
					if IsControlPressed(0, 21) then
						SetVehicleReduceGrip(GetVehiclePedIsIn(PlayerPedId(), false), true)
					else
						SetVehicleReduceGrip(GetVehiclePedIsIn(PlayerPedId(), false), false)
					end
				end
			end
		end
	end
end)