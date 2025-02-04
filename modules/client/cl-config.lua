local Config = {}

-- Plate used for displaying in testdrive and in showcase
Config.plateVehiclePreview = "CIAOPEPE" --<string> or <false>

-- Notification Provider For action
Config.ProviderNotification = "lgf_duipack" -- base is ox_lib , you can implement your own notification at "shared.lua"
Config.InteractionSystem = "textui"         -- "textui" or "ox_target"

Config.Zones = {
    ["zone1"] = {
        PedZone = { Position = vector4(-52.3086, -1098.7841, 25.4223, 286.2565), Model = "a_m_m_business_01", Scenario = "WORLD_HUMAN_STAND_IMPATIENT" },
        Jobs = { OnlyJob = false, RequiredJob = "unemployed", RequiredGradeJob = 3 },
        Blip = {
            Enable = true,
            Scale = 1.0,
            Color = 7,
            Label = "Vehicle Shop 1",
            Sprite = 523
        },
        SpawnPosition = { -- NORE: OneSync limit is 424 units around a player
            VehiclePrewiew = {
                ["normal"] = vec4(-42.5776, -1098.4122, 26.1519, 92.9815),
                -- ["boat"] = vec4(),
                -- ["aircraft"] = vec4()
            },
            VehicleBuyed   = { -- Manage Spawn bosition based on Vehicle Class, normal is for all vehicles excluding boat and aircraft
                ["normal"] = vec4(-30.4238, -1090.0797, 26.1519, 337.8634),
                -- ["boat"] = vec4(),
                -- ["aircraft"] = vec4()
            },
            TestDrive      = { -- Same logic for Test Drive
                ["normal"] = { Position = vec4(-30.4238, -1090.0797, 26.1519, 337.8634), Duration = 60000 },
                -- ["aircraft"] = {
                --     Position = vec4(),
                -- },
                -- ["boat"]  = {
                --     Position = vec4(-52.6011, -1111.6671, 26.4358, 68.4445),
                -- },
            }
        },

        ShopVehicles = {

        }
    }
}


-- Icon for Context menu based on vehicle class
Config.IconClass = {
    ["Sports"]     = "trophy",
    ["SUV"]        = "truck",
    ["Compact"]    = "car",
    ["Super"]      = "star",
    ["Motorcycle"] = "motorcycle",
    ["Boat"]       = "ship"
}



return Config
