local Config = {}

-- Icon for Context menu based on vehicle class
Config.IconClass = {
    ["Sports"]     = "trophy",
    ["SUV"]        = "truck",
    ["Compact"]    = "car",
    ["Super"]      = "star",
    ["Motorcycle"] = "motorcycle",
    ["Boat"]       = "ship"
}


-- Notification Provider For action
Config.ProviderNotification = "lgf_duipack" -- <"lgf_duipack" or "ox_lib">

Config.InteractionSystem = "ox_target" -- "textui" or "ox_target"

Config.Zones = {
    ["zone1"] = {
        PedZone = { Position = vector4(-52.3086, -1098.7841, 25.4223, 286.2565), Model = "a_m_m_business_01", Scenario = "WORLD_HUMAN_STAND_IMPATIENT" },
        Jobs = { OnlyJob = false, RequiredJob = "unemployed", RequiredGradeJob = 3 },
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
            { Label = "Remus",                     Hash = "remus",      Price = 25000, Class = "Sports",     Description = "High-performance sports car with sleek design." },
            { Label = "Revolter",                  Hash = "revolter",   Price = 23000, Class = "Sports",     Description = "Modern electric sports car with incredible handling." },
            { Label = "RT3000",                    Hash = "rt3000",     Price = 27000, Class = "Super",      Description = "A futuristic supercar with top-tier specs." },
            { Label = "Ruston",                    Hash = "ruston",     Price = 26000, Class = "Sports",     Description = "A high-end, sporty vehicle with a classic appeal." },
            { Label = "Schafter V12",              Hash = "schafter3",  Price = 28000, Class = "Luxury",     Description = "Luxury sedan with elite performance." },
            { Label = "Schafter LWB",              Hash = "schafter4",  Price = 27000, Class = "Luxury",     Description = "Long-wheelbase luxury sedan, perfect for comfort." },
            { Label = "Schlagen GT",               Hash = "schlagen",   Price = 29000, Class = "Sports",     Description = "A powerful and stylish vehicle for the track." },
            { Label = "Schwartzer",                Hash = "schwarzer",  Price = 26000, Class = "Sports",     Description = "A sleek, high-performance coupe." },
            { Label = "Sentinel",                  Hash = "sentinel3",  Price = 23000, Class = "Sports",     Description = "A versatile and high-speed vehicle for every occasion." },
            { Label = "Sentinel Classic Widebody", Hash = "sentinel4",  Price = 24000, Class = "Sports",     Description = "Classic design with modern widebody modifications." },
            { Label = "Seven-70",                  Hash = "seven70",    Price = 30000, Class = "Super",      Description = "A top-tier supercar with unmatched acceleration." },
            { Label = "SM722",                     Hash = "sm722",      Price = 32000, Class = "Sports",     Description = "A custom sports vehicle for those who demand speed." },
            { Label = "Specter",                   Hash = "specter",    Price = 26000, Class = "Sports",     Description = "Futuristic styling and great handling." },
            { Label = "Specter Custom",            Hash = "specter2",   Price = 29000, Class = "Sports",     Description = "Customized version of the Specter for higher performance." },
            { Label = "Itali GTO Stinger TT",      Hash = "stingertt",  Price = 35000, Class = "Super",      Description = "An Italian masterpiece with a turbocharged twin-turbo engine." },
            { Label = "Streiter",                  Hash = "streiter",   Price = 29000, Class = "Sports",     Description = "A high-tech sports car with a futuristic feel." },
            { Label = "Sugoi",                     Hash = "sugoi",      Price = 25000, Class = "Sports",     Description = "A sports car built for ultimate performance." },
            { Label = "Sultan",                    Hash = "sultan",     Price = 23000, Class = "Sports",     Description = "A popular sports sedan known for its performance." },
            { Label = "Sultan Classic",            Hash = "sultan2",    Price = 26000, Class = "Sports",     Description = "A classic and elegant version of the Sultan." },
            { Label = "Sultan RS Classic",         Hash = "sultan3",    Price = 28000, Class = "Sports",     Description = "The ultimate version of the Sultan with classic styling." },
            { Label = "Surano",                    Hash = "surano",     Price = 28000, Class = "Sports",     Description = "A beautiful and fast sports car." },
            { Label = "Drift Tampa",               Hash = "tampa2",     Price = 25000, Class = "Sports",     Description = "A drift-ready muscle car for those who love the slide." },
            { Label = "10F",                       Hash = "tenf",       Price = 32000, Class = "Super",      Description = "Top-level performance with sleek design." },
            { Label = "10F Widebody",              Hash = "tenf2",      Price = 35000, Class = "Super",      Description = "Widebody version of the 10F with even more power." },
            { Label = "Tropos Rallye",             Hash = "tropos",     Price = 26000, Class = "Off-Road",   Description = "An off-road rally car built for rugged terrain." },
            { Label = "Vectre",                    Hash = "vectre",     Price = 28000, Class = "Sports",     Description = "An all-around high-performance sports car." },
            { Label = "Verlierer",                 Hash = "verlierer2", Price = 24000, Class = "Sports",     Description = "An iconic sports car with timeless appeal." },
            { Label = "Veto Classic",              Hash = "veto",       Price = 23000, Class = "Sports",     Description = "A stylish and classic city car with performance." },

            -- Motorcycles
            { Label = "Akuma",                     Hash = "akuma",      Price = 22000, Class = "Motorcycle", Description = "A fast and agile sportbike with great handling." },
            { Label = "Bati 801",                  Hash = "bati",       Price = 25000, Class = "Motorcycle", Description = "An iconic and powerful sport motorcycle." },
            { Label = "Hexer",                     Hash = "hexer",      Price = 24000, Class = "Motorcycle", Description = "A classic cruiser for long rides." },
            { Label = "Sanchez",                   Hash = "sanchez",    Price = 20000, Class = "Motorcycle", Description = "An off-road motorcycle perfect for rough terrain." },
            { Label = "Thrust",                    Hash = "thrust",     Price = 28000, Class = "Motorcycle", Description = "A sleek, high-speed motorcycle for the open road." },
            { Label = "Nightblade",                Hash = "nightblade", Price = 30000, Class = "Motorcycle", Description = "A powerful motorcycle with a custom look and feel." },
            { Label = "Ruffian",                   Hash = "ruffian",    Price = 24000, Class = "Motorcycle", Description = "A tough and rugged motorcycle, ideal for tough conditions." },

        },

    }
}

return Config
