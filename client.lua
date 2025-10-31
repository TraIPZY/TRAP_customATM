
-- Liste des ATM
local atms = {
    { model = "prop_atm_01", coords = vector4(-1185.6064, -884.7079, 13.8862, 394.8909) }, -- test 1
    { model = "prop_atm_01", coords = vector4(-2037.3993, -498.3040, 12.0988, 229.0453) },   -- test 2
   -- { model = "prop_fleeca_atm", coords = vector4(-47.36, -1759.67, 29.42, 90.0) } -- Station-service
}

-- Spawn des ATM
CreateThread(function()
    for _, atm in pairs(atms) do
        local model = GetHashKey(atm.model)
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(10) end
        local obj = CreateObject(model, atm.coords.x, atm.coords.y, atm.coords.z - 1.0, false, false, false)
        SetEntityHeading(obj, atm.coords.w)
        FreezeEntityPosition(obj, true)
    end
end)
