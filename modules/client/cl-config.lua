local Config                = {}

-- Plate used for displaying in testdrive and in showcase
Config.plateVehiclePreview  = "CIAOPEPE" --<string> or <false>

-- Notification Provider For action
Config.ProviderNotification = "ox_lib" -- base is ox_lib , you can implement your own notification at "shared.lua"
Config.InteractionSystem    = "textui" -- "textui" or "ox_target"

Config.Zones                = {
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
        CamParams = { Distance = 5.5, Height = 1.0, },
        SpawnPosition = { -- NORE: OneSync limit is 424 units around a player (maybe create shop based on vehicle type like car shop boat shop and aircraft shop)
            VehiclePrewiew = {
                ["normal"] = vec4(-42.5776, -1098.4122, 26.1519, 92.9815),
                ["boat"] = vec4(-916.4816, -1450.5848, -0.4748, 110.5111),
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
            { Label = "Remus",                Hash = "remus",      Price = 25000, Class = "Sports",     Description = "High-performance sports car with sleek design." },
            { Label = "Revolter",             Hash = "revolter",   Price = 23000, Class = "Sports",     Description = "Modern electric sports car with incredible handling." },
            { Label = "RT3000",               Hash = "rt3000",     Price = 27000, Class = "Super",      Description = "A futuristic supercar with top-tier specs." },
            { Label = "Ruston",               Hash = "ruston",     Price = 26000, Class = "Sports",     Description = "A high-end, sporty vehicle with a classic appeal." },
            { Label = "Schafter V12",         Hash = "schafter3",  Price = 28000, Class = "Luxury",     Description = "Luxury sedan with elite performance." },
            { Label = "Schafter LWB",         Hash = "schafter4",  Price = 27000, Class = "Luxury",     Description = "Long-wheelbase luxury sedan, perfect for comfort." },
            { Label = "Schlagen GT",          Hash = "schlagen",   Price = 29000, Class = "Sports",     Description = "A powerful and stylish vehicle for the track." },
            { Label = "Schwartzer",           Hash = "schwarzer",  Price = 26000, Class = "Sports",     Description = "A sleek, high-performance coupe." },
            { Label = "Sentinel",             Hash = "sentinel3",  Price = 23000, Class = "Sports",     Description = "A versatile and high-speed vehicle for every occasion." },
            { Label = "Classic Widebody",     Hash = "sentinel4",  Price = 24000, Class = "Sports",     Description = "Classic design with modern widebody modifications." },
            { Label = "Seven-70",             Hash = "seven70",    Price = 30000, Class = "Super",      Description = "A top-tier supercar with unmatched acceleration." },
            { Label = "SM722",                Hash = "sm722",      Price = 32000, Class = "Sports",     Description = "A custom sports vehicle for those who demand speed." },
            { Label = "Specter",              Hash = "specter",    Price = 26000, Class = "Sports",     Description = "Futuristic styling and great handling." },
            { Label = "Specter Custom",       Hash = "specter2",   Price = 29000, Class = "Sports",     Description = "Customized version of the Specter for higher performance." },
            { Label = "Itali GTO Stinger TT", Hash = "stingertt",  Price = 35000, Class = "Super",      Description = "An Italian masterpiece with a turbocharged twin-turbo engine." },
            { Label = "Streiter",             Hash = "streiter",   Price = 29000, Class = "Sports",     Description = "A high-tech sports car with a futuristic feel." },
            { Label = "Sugoi",                Hash = "sugoi",      Price = 25000, Class = "Sports",     Description = "A sports car built for ultimate performance." },
            { Label = "Sultan",               Hash = "sultan",     Price = 23000, Class = "Sports",     Description = "A popular sports sedan known for its performance." },
            { Label = "Sultan Classic",       Hash = "sultan2",    Price = 26000, Class = "Sports",     Description = "A classic and elegant version of the Sultan." },
            { Label = "Sultan RS Classic",    Hash = "sultan3",    Price = 28000, Class = "Sports",     Description = "The ultimate version of the Sultan with classic styling." },
            { Label = "Surano",               Hash = "surano",     Price = 28000, Class = "Sports",     Description = "A beautiful and fast sports car." },
            { Label = "Drift Tampa",          Hash = "tampa2",     Price = 25000, Class = "Sports",     Description = "A drift-ready muscle car for those who love the slide." },
            { Label = "10F",                  Hash = "tenf",       Price = 32000, Class = "Super",      Description = "Top-level performance with sleek design." },
            { Label = "10F Widebody",         Hash = "tenf2",      Price = 35000, Class = "Super",      Description = "Widebody version of the 10F with even more power." },
            { Label = "Tropos Rallye",        Hash = "tropos",     Price = 26000, Class = "Off-Road",   Description = "An off-road rally car built for rugged terrain." },
            { Label = "Vectre",               Hash = "vectre",     Price = 28000, Class = "Sports",     Description = "An all-around high-performance sports car." },
            { Label = "Verlierer",            Hash = "verlierer2", Price = 24000, Class = "Sports",     Description = "An iconic sports car with timeless appeal." },
            { Label = "Veto Classic",         Hash = "veto",       Price = 23000, Class = "Sports",     Description = "A stylish and classic city car with performance." },
            { Label = "Akuma",                Hash = "akuma",      Price = 22000, Class = "Motorcycle", Description = "A fast and agile sportbike with great handling." },
            { Label = "Bati 801",             Hash = "bati",       Price = 25000, Class = "Motorcycle", Description = "An iconic and powerful sport motorcycle." },
            { Label = "Hexer",                Hash = "hexer",      Price = 24000, Class = "Motorcycle", Description = "A classic cruiser for long rides." },
            { Label = "Sanchez",              Hash = "sanchez",    Price = 20000, Class = "Motorcycle", Description = "An off-road motorcycle perfect for rough terrain." },
            { Label = "Thrust",               Hash = "thrust",     Price = 28000, Class = "Motorcycle", Description = "A sleek, high-speed motorcycle for the open road." },
            { Label = "Nightblade",           Hash = "nightblade", Price = 30000, Class = "Motorcycle", Description = "A powerful motorcycle with a custom look and feel." },
            { Label = "Ruffian",              Hash = "ruffian",    Price = 24000, Class = "Motorcycle", Description = "A tough and rugged motorcycle, ideal for tough conditions." },
        }
    },
    ["zone2"] = {
        PedZone = {
            Position = vector4(-897.6246, -1462.2131, 0.5954, 203.8140),
            Model = "a_m_m_business_01",
            Scenario = "WORLD_HUMAN_STAND_IMPATIENT"
        },
        Jobs = { OnlyJob = false, RequiredJob = "unemployed", RequiredGradeJob = 3 },
        Blip = {
            Enable = true,
            Scale = 1.0,
            Color = 7,
            Label = "Vehicle Shop Boat",
            Sprite = 427
        },
        CamParams = { Distance = 11.5, Height = 3.0, },
        SpawnPosition = { -- NORE: OneSync limit is 424 units around a player (maybe create shop based on vehicle type like car shop boat shop and aircraft shop)
            VehiclePrewiew = {
                -- ["normal"] = vec4(-42.5776, -1098.4122, 26.1519, 92.9815),
                ["boat"] = vec4(-916.4816, -1450.5848, -0.4748, 110.5111),
                -- ["aircraft"] = vec4()
            },
            VehicleBuyed   = { -- Manage Spawn bosition based on Vehicle Class, normal is for all vehicles excluding boat and aircraft
                -- ["normal"] = vec4(-30.4238, -1090.0797, 26.1519, 337.8634),
                ["boat"] = vec4(-916.4816, -1450.5848, -0.4748, 110.5111),
                -- ["aircraft"] = vec4()
            },
            TestDrive      = { -- Same logic for Test Drive
                -- ["normal"] = { Position = vec4(-30.4238, -1090.0797, 26.1519, 337.8634), Duration = 60000 },
                -- ["aircraft"] = {
                --     Position = vec4(),
                -- },
                ["boat"] = { Position = vec4(-916.4816, -1450.5848, -0.4748, 110.5111), Duration = 60000 },

            }
        },

        ShopVehicles = {

            { Label = "Avisa",                Hash = "avisa",        Price = 30000,  Class = "Boat", Description = "A fast and agile boat perfect for high-speed water chases." },
            { Label = "Dinghy",               Hash = "dinghy",       Price = 15000,  Class = "Boat", Description = "A small, lightweight boat ideal for quick trips." },
            { Label = "Dinghy 2",             Hash = "dinghy2",      Price = 16000,  Class = "Boat", Description = "A variant of the classic Dinghy, designed for stability." },
            { Label = "Dinghy 3",             Hash = "dinghy3",      Price = 17000,  Class = "Boat", Description = "An upgraded Dinghy, built for endurance and maneuverability." },
            { Label = "Dinghy 4",             Hash = "dinghy4",      Price = 18000,  Class = "Boat", Description = "The latest Dinghy variant with enhanced features." },
            { Label = "Weaponized Dinghy",    Hash = "dinghy5",      Price = 40000,  Class = "Boat", Description = "A weaponized version of the Dinghy for combat situations." },
            { Label = "Jetmax",               Hash = "jetmax",       Price = 45000,  Class = "Boat", Description = "A sleek, high-performance boat built for speed." },
            { Label = "Longfin",              Hash = "longfin",      Price = 35000,  Class = "Boat", Description = "A fast and reliable boat, ideal for long trips." },
            { Label = "Marquis",              Hash = "marquis",      Price = 50000,  Class = "Boat", Description = "A luxurious yacht with impressive design and performance." },
            { Label = "Kurtz 31 Patrol Boat", Hash = "patrolboat",   Price = 60000,  Class = "Boat", Description = "A heavily armored patrol boat for tactical operations." },
            { Label = "Police Predator",      Hash = "predator",     Price = 70000,  Class = "Boat", Description = "A police boat built for pursuit and high-speed chases." },
            { Label = "Seashark",             Hash = "seashark",     Price = 25000,  Class = "Boat", Description = "A versatile jet ski-style boat for both speed and maneuverability." },
            { Label = "Seashark 2",           Hash = "seashark2",    Price = 27000,  Class = "Boat", Description = "An upgraded Seashark model with improved handling." },
            { Label = "Seashark 3",           Hash = "seashark3",    Price = 29000,  Class = "Boat", Description = "A top-of-the-line Seashark with additional features." },
            { Label = "Speeder",              Hash = "speeder",      Price = 35000,  Class = "Boat", Description = "A fast, lightweight boat built for extreme speed." },
            { Label = "Speeder 2",            Hash = "speeder2",     Price = 36000,  Class = "Boat", Description = "A variant of the Speeder, designed for stability." },
            { Label = "Squalo",               Hash = "squalo",       Price = 40000,  Class = "Boat", Description = "A powerful speedboat for fast and thrilling rides." },
            { Label = "Submersible",          Hash = "submersible",  Price = 200000, Class = "Boat", Description = "A fully submersible boat, perfect for underwater exploration." },
            { Label = "Kraken",               Hash = "submersible2", Price = 250000, Class = "Boat", Description = "A high-tech submersible for extreme underwater missions." },
            { Label = "Suntrap",              Hash = "suntrap",      Price = 80000,  Class = "Boat", Description = "A luxurious boat with a unique design for relaxation and adventure." },
            { Label = "Toro",                 Hash = "toro",         Price = 60000,  Class = "Boat", Description = "A fast and agile boat with excellent handling." },
            { Label = "Toro 2",               Hash = "toro2",        Price = 65000,  Class = "Boat", Description = "An upgraded Toro model, designed for more power and performance." },
            { Label = "Tropic",               Hash = "tropic",       Price = 30000,  Class = "Boat", Description = "A great all-around boat with strong performance and versatility." },
            { Label = "Tropic 2",             Hash = "tropic2",      Price = 32000,  Class = "Boat", Description = "A variant of the Tropic with enhanced speed and durability." },
            { Label = "Tug",                  Hash = "tug",          Price = 100000, Class = "Boat", Description = "A large and powerful tugboat used for heavy-duty tasks." }
        }


    },
    ["zone3"] = {
        PedZone = {
            Position = vector4(1748.5935, 3297.4346, 40.1718, 184.6507),
            Model = "a_m_m_business_01",
            Scenario = "WORLD_HUMAN_STAND_IMPATIENT"
        },
        Jobs = { OnlyJob = false, RequiredJob = "unemployed", RequiredGradeJob = 3 },
        Blip = {
            Enable = true,
            Scale = 1.0,
            Color = 7,
            Label = "Vehicle Shop Aircraft",
            Sprite = 90
        },
        CamParams = { Distance = 16.5, Height = 1.0, },
        SpawnPosition = { -- NORE: OneSync limit is 424 units around a player (maybe create shop based on vehicle type like car shop boat shop and aircraft shop)
            VehiclePrewiew = {
                -- ["normal"] = vec4(-42.5776, -1098.4122, 26.1519, 92.9815),
                -- ["boat"] = vec4(-916.4816, -1450.5848, -0.4748, 110.5111),
                ["aircraft"] = vec4(1756.2478, 3275.5759, 41.1702, 25.4151)
            },
            VehicleBuyed   = { -- Manage Spawn bosition based on Vehicle Class, normal is for all vehicles excluding boat and aircraft
                -- ["normal"] = vec4(-30.4238, -1090.0797, 26.1519, 337.8634),
                -- ["boat"] = vec4(-916.4816, -1450.5848, -0.4748, 110.5111),
                ["aircraft"] = vec4(1712.2908, 3258.4651, 41.0802, 103.2810)
            },
            TestDrive      = { -- Same logic for Test Drive
                -- ["normal"] = { Position = vec4(-30.4238, -1090.0797, 26.1519, 337.8634), Duration = 60000 },
                ["aircraft"] = { Position = vec4(1712.2908, 3258.4651, 41.0802, 103.2810), Duration = 60000 },
                -- ["boat"] = { Position = vec4(-916.4816, -1450.5848, -0.4748, 110.5111), Duration = 60000 },

            }
        },

        ShopVehicles = {



            { Label = "Streamer216",    Hash = "streamer216", Price = 150000, Class = "Plane", Description = "A small private plane, ideal for a quick escape." },
            { Label = "Mallard",        Hash = "stunt",       Price = 100000, Class = "Plane", Description = "A small stunt plane, perfect for aerial tricks." },

            { Label = "Velum",          Hash = "velum",       Price = 200000, Class = "Plane", Description = "A reliable plane with good speed and stability." },
            { Label = "Velum 5-Seater", Hash = "velum2",      Price = 220000, Class = "Plane", Description = "A 5-seater variant of the Velum, perfect for passengers." },
            { Label = "Vestra",         Hash = "vestra",      Price = 300000, Class = "Plane", Description = "A sleek and stylish aircraft, great for fast travel." },

        }

    },
}

-- Icon for Context menu based on vehicle class
Config.IconClass            = {
    ["Sports"]     = "trophy",
    ["SUV"]        = "truck",
    ["Compact"]    = "car",
    ["Super"]      = "star",
    ["Motorcycle"] = "motorcycle",
    ["Boat"]       = "ship",
    ["Plane"]      = "plane",
    ["Helicopter"] = "helicopter",
    ["Off-road"]   = "four-wheel-drive",
    ["Van"]        = "van",
    ["Bicycle"]    = "bicycle",
    ["Emergency"]  = "ambulance",
    ["Service"]    = "service",
    ["Military"]   = "tank",
    ["Industrial"] = "gear",
    ["Civilian"]   = "person",
    ["Race"]       = "flag-checkered",
    ["Commercial"] = "briefcase",
    ["Electric"]   = "bolt"
}



return Config
