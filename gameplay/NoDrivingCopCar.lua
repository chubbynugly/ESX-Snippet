
--[[
----------------------------------------------------------------------------
____________________________________________________________________________

                        AUTHOR : Chubbs

            Désactive la possibilité de conduire des voiture de police si non flic
            simple disable people from driving police cars if not a police


____________________________________________________________________________

---------------------------------------------------------------------------
]]--

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedInAnyPoliceVehicle(GetPlayerPed(PlayerId())) then
            local veh = GetVehiclePedIsUsing(GetPlayerPed(PlayerId()), false)
            if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(PlayerId())) then
                if PlayerData.job ~= nil and PlayerData.job.name ~= 'police' then
                  drawTxt("~r~It's against the rules for civilians to drive these vehicles!",0,1,0.5,0.8,0.6,255,255,255,255)
                  SetVehicleUndriveable(veh, true)
                end
            end
        end
    end
end)

--since everyone needed this 

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x , y)
end
