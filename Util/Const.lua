---@class CraftSim
local CraftSim = select(2, ...)

CraftSim.CONST = {}

-- One Time Info ------------
CraftSim.CONST.infoBoxSizeX = 500
CraftSim.CONST.infoBoxSizeY = 400
----------------

CraftSim.CONST.FEATURE_TOGGLES = {
}

CraftSim.CONST.PERCENT_MODS = {
    INSPIRATION = 0.001,
    MULTICRAFT = 0.0009,
    RESOURCEFULNESS = 0.00111,
    CRAFTINGSPEED = 0.002,  
}

-- some dummy recipes are not flagged as dummy ..........
CraftSim.CONST.BLIZZARD_DUMMY_RECIPES = {
    371635, -- "Demonstration Item Recipe" part of Alchemy Stone Category for Alchemy
}

CraftSim.CONST.ALCHEMICAL_EXPERIMENTATION_RECIPE_IDS = {
    370746, -- basic phial
    370743, -- basic potion
    370747, -- adv phial
    370745, -- adv potion
    60893, -- northrend research
}

-- this average comes from 20-40% resources saved on proc with a minimum of 1
-- currently this is just an approximation
CraftSim.CONST.BASE_RESOURCEFULNESS_AVERAGE_SAVE_FACTOR = 0.30
CraftSim.CONST.MULTICRAFT_CONSTANT = 2.5

CraftSim.CONST.DISCORD_INVITE_URL = "https://discord.gg/7vqKMgezXR"
CraftSim.CONST.PAYPAL_ME_URL = "https://www.paypal.com/paypalme/CraftSim"

---@enum CraftSim.EXPORT_MODE
CraftSim.CONST.EXPORT_MODE = {
    NON_WORK_ORDER = 0,
    WORK_ORDER = 1,
    SCAN = 2,
}

---@enum CraftSim.FRAMES
CraftSim.CONST.FRAMES = {
    MATERIALS = "MATERIALS",
    STAT_WEIGHTS = "STAT_WEIGHTS",
    TOP_GEAR = "TOP_GEAR",
    PRICE_DETAILS = "PRICE_DETAILS",
    PROFIT_DETAILS = "PROFIT_DETAILS",
    CRAFTING_DETAILS = "CRAFTING_DETAILS",
    SPEC_INFO = "SPEC_INFO",
    WARNING = "WARNING",
    INFO = "INFO",
    DEBUG = "DEBUG",
    DEBUG_CONTROL = "DEBUG_CONTROL",
    SPEC_SIM = "SPEC_SIM",
    CONTROL_PANEL = "CONTROL_PANEL",
    STAT_WEIGHTS_WORK_ORDER = "STAT_WEIGHTS_WORK_ORDER",
    PROFIT_DETAILS_WORK_ORDER = "PROFIT_DETAILS_WORK_ORDER",
    MATERIALS_WORK_ORDER = "MATERIALS_WORK_ORDER",
    PRICE_DETAILS_WORK_ORDER = "PRICE_DETAILS_WORK_ORDER",
    TOP_GEAR_WORK_ORDER = "TOP_GEAR_WORK_ORDER",
    PRICE_OVERRIDE_WORK_ORDER = "PRICE_OVERRIDE_WORK_ORDER",
    PRICE_OVERRIDE = "PRICE_OVERRIDE",
    RECIPE_SCAN = "RECIPE_SCAN",
    CRAFT_RESULTS = "CRAFT_RESULTS",
    STATISTICS = "STATISTICS",
    STATISTICS_WORKORDER = "STATISTICS_WORKORDER",
    CUSTOMER_SERVICE = "CUSTOMER_SERVICE",
    CUSTOMER_HISTORY = "CUSTOMER_HISTORY",
    LIVE_PREVIEW = "LIVE_PREVIEW",
    CRAFTING_DETAILS_WO = "CRAFTING_DETAILS_WO",
    SPEC_SIM_WO = "SPEC_SIM_WO",
    SPEC_INFO_WO = "SPEC_INFO_WO",
    CRAFT_DATA = "CRAFT_DATA",
    COST_DETAILS = "COST_DETAILS",
    COST_DETAILS_WO = "COST_DETAILS_WO",
    POPUP = "POPUP",
    SUPPORTERS = "SUPPORTERS",
    CRAFT_QUEUE = "CRAFT_QUEUE",
    CRAFT_BUFFS = "CRAFT_BUFFS",
    CRAFT_BUFFS_WORKORDER = "CRAFT_BUFFS_WORKORDER",
}

CraftSim.CONST.OLD_BACKDROP_OPTIONS = {
    bgFile = "Interface\\CharacterFrame\\UI-Party-Background",
    borderOptions = {
        edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight", -- this one is neat
        edgeSize = 16,
        insets = { left = 8, right = 6, top = 8, bottom = 8 },
    }
}
CraftSim.CONST.DEFAULT_BACKDROP_OPTIONS = {
    bgFile = "Interface\\Buttons\\WHITE8X8",
    borderOptions = {
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        edgeSize = 16,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    },
    colorR = 0,
    colorG = 0,
    colorB = 0,
    colorA = 1,
}

CraftSim.CONST.BACKDROPS = {
    OPTIONS_CONTENT_FRAME = {
        --bgFile = "Interface\\Buttons\\WHITE8X8",
        borderOptions = {
            edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
            edgeSize = 16,
            insets = { left = 3, right = 3, top = 3, bottom = 3 },
        }
    },
    DEBUG = {
        bgFile = "Interface\\Buttons\\WHITE8X8",
        colorR = 1,
        colorG = 1,
        colorB = 1,
        colorA = 0.5,
    }
}    

CraftSim.CONST.DRAGON_ISLES_CATEGORY_IDS = {
    1566, -- Blacksmithing,
    1582, -- Alchemy
    1587, -- Leatherworking
    1593, -- Jewelcrafting
    1588, -- Enchanting
    1592, -- Inscription
    1591, -- Tailoring
    1595, -- Engineering
    1585, -- Cooking
}

CraftSim.CONST.QUEST_PLAN_CATEGORY_IDS = {
    1688, 1522, -- Blacksmithing
    1687, 1525, -- Alchemy
    1693, -- Leatherworking
    1686, -- Jewelcrafting
    1690, 1527, -- Enchanting
    1692, -- Inscription
    1696, 1532, -- Tailoring
    1691, 1528, -- Engineering
    1526, -- Cooking
}

-- that are not within a quest plan category
CraftSim.CONST.QUEST_RECIPE_IDS = {
    -- Heart in a Bottle
    377984, -- Herbalism
    377989, -- Leatherworking   
    377987, -- Mining
    377978, -- Alchemy
    377982, -- Enchanting
    377988, -- Skinning
    377981, -- Blacksmithing
    377915, -- Jewelcrafting
    377983, -- Engineering
    377985, -- Inscription
    377986, -- Tailoring
}

---@enum CraftSim.DEBUG_IDS
CraftSim.CONST.DEBUG_IDS = {
    MAIN = "MAIN",
    SPECDATA = "SPECDATA",
    ERROR = "ERROR",
    DATAEXPORT = "DATAEXPORT",
    SIMULATION_MODE = "SIMULATION_MODE",
    REAGENT_OPTIMIZATION = "REAGENT_OPTIMIZATION",
    PRICEDATA = "PRICEDATA",
    PROFIT_CALCULATION = "PROFIT_CALCULATION",
    FRAMES = "FRAMES",
    CACHE = "CACHE",
    PROFILING = "PROFILING",
    RECIPE_SCAN = "RECIPE_SCAN",
    CRAFT_RESULTS = "CRAFT_RESULTS",
    PRICE_OVERRIDE = "PRICE_OVERRIDE",
    AVERAGE_PROFIT = "AVERAGE_PROFIT",
    STATISTICS = "STATISTICS",
    CUSTOMER_SERVICE = "CUSTOMER_SERVICE",
    CUSTOMER_HISTORY = "CUSTOMER_HISTORY",
    COMM = "COMM",
    UTIL = "UTIL",
    PRICE_DETAILS = "PRICE_DETAILS",
    MEDIA = "MEDIA",
    TOP_GEAR = "TOP_GEAR",
    CRAFT_DATA = "CRAFT_DATA",
    COST_DETAILS = "COST_DETAILS",
    PRICE_APIS = "PRICE_APIS",
    CONTROL_PANEL = "CONTROL_PANEL",
    CRAFTQ = "CRAFTQ",
    NEWS = "NEWS",
    CRAFT_DATA_COLLECT = "CRAFT_DATA_COLLECT",
    BUFFDATA = "BUFFDATA",
}

CraftSim.CONST.ERROR = {
    NO_PRICE_DATA = 0,
    NO_RECIPE_DATA = 1
}

--> used in GUTIL now
-- if more needed, add https://wowpedia.fandom.com/wiki/LE_ITEM_BIND
CraftSim.CONST.BINDTYPES = {
    SOULBOUND = 1
}

CraftSim.CONST.PROFESSIONTOOL_INV_TYPES = {
    TOOL = "INVTYPE_PROFESSION_TOOL",
    GEAR = "INVTYPE_PROFESSION_GEAR"
}

-- CraftSim.CONST.PROFESSION_INV_SLOTS = {{
--     TOOL = "PROF0TOOLSLOT",
--     GEAR0 = "PROF0GEAR0SLOT",
--     GEAR1 = "PROF0GEAR1SLOT"
--     }, 
--     {
--         TOOL = "PROF1TOOLSLOT",
--         GEAR0 = "PROF1GEAR0SLOT",
--         GEAR1 = "PROF1GEAR1SLOT"
--     },
--     {
--         TOOL = "COOKINGTOOLSLOT",
--         GEAR0 = "COOKINGGEAR0SLOT"
--     }
-- }

CraftSim.CONST.STAT_MAP = {
    ITEM_MOD_RESOURCEFULNESS_SHORT = "resourcefulness",
    ITEM_MOD_INSPIRATION_SHORT = "inspiration",
    ITEM_MOD_MULTICRAFT_SHORT = "multicraft",
    ITEM_MOD_CRAFTING_SPEED_SHORT = "craftingspeed",
    CRAFTING_DETAILS_RECIPE_DIFFICULTY = "recipedifficulty",
    CRAFTING_DETAILS_SKILL = "skill",
    CRAFTING_DETAILS_INSPIRATION = "inspiration",
    CRAFTING_DETAILS_INSPIRATION_SKILL = "inspirationBonusSkill",
    CRAFTING_DETAILS_MULTICRAFT = "multicraft",
    CRAFTING_DETAILS_RESOURCEFULNESS = "resourcefulness",
}

CraftSim.CONST.EMPTY_SLOT_LINK = "empty"
CraftSim.CONST.EMPTY_SLOT_TEXTURE = "Interface\\containerframe\\bagsitemslot2x"

CraftSim.CONST.SUPPORTED_PRICE_API_ADDONS = {"TradeSkillMaster", "Auctionator", "RECrystallize", "OribosExchange"}

CraftSim.CONST.REAGENT_TYPE = {
	OPTIONAL = 0,
	REQUIRED = 1,
	FINISHING_REAGENT = 2
}

CraftSim.CONST.AUCTION_HOUSE_CUT = 0.95

CraftSim.CONST.ENCHANTING_VELLUM_ID = 38682

CraftSim.CONST.TSM_DEFAULT_PRICE_EXPRESSION = "first(DBRecent, DBMinbuyout)"

CraftSim.CONST.RECIPE_TYPES = {
    GEAR = 0, -- like blue gear
    SOULBOUND_GEAR = 1, -- like purple gear
    NO_QUALITY_MULTIPLE = 2, -- like transmuted air
    NO_QUALITY_SINGLE = 3, -- like repair hammer
    MULTIPLE = 4, -- like potions..
    SINGLE = 5, -- like omnium draconis
    NO_CRAFT_OPERATION = 6, -- like reclaim from alchemy or old world stuff
    GATHERING = 7,
    NO_ITEM = 8, -- like phial experimentation
    ENCHANT = 9,
}

CraftSim.CONST.DEFAULT_POSITIONS = {
    REAGENT_FRAME = {
        x = 0,
        y = 0,
    },
    PRICE_DETAILS_FRAME = {
        x = 0,
        y = 10,
    },
    TOP_GEAR_FRAME = {
        x = -5,
        y = 3,
    },
    STAT_WEIGHT_FRAME = {
        x = 0,
        y = -80,
    }
}

CraftSim.CONST.RECIPE_CATEGORIES = {
    ALL = 999999,
    BLACKSMITHING = {
        STONEWORK = 1684,
        SMELTING = 1678,
        TOOLS = 1677,
        WEAPONS = 1675,
        ARMOR = 1567,
        SHIELDS = 1786,
    },
    ALCHEMY = {
        ELEMENTAL_BOTH = 1646,
        PHIALS = {
            AIR = 1603,
            FROST = 1644,
        },
        POTIONS = {
            AIR = 1602,
            FROST = 1645
        },
        REAGENT = 1611,
        FINISHING_REAGENT = 1608,
        OPTIONAL_REAGENTS = 1609,
        INCENSE = 1610,
        TRANSMUTATIONS = 1604,
        ESSENTIALS = 1681,
        ALCHEMIST_STONES = 1605,
        CAULDRONS = 1612,
    },
    ENCHANTING = {
        FINISHING_REAGENTS = 1792,
        CLOAK_ENCHANTMENTS = 1778,
        CHEST_ENCHANTMENTS = 1777,
        BRACER_ENCHANTMENTS = 1776,
        BOOT_ENCHANTMENTS = 1775,
        RING_ENCHANTMENTS = 1774,
        WEAPON_ENCHANTMENTS = 1779,
        PROFESSION_TOOL_ENCHANTMENTS = 1780,
        RODS_AND_WANDS = 1781,
        ILLUSORY_GOODS = 1782,
        SHATTERS = 1783,
        MAGICAL_MERCHANDISE = 1803,
    },
    ENGINEERING = {
        PARTS = 1718,
        FINISHING_REAGENTS = 1717,
        OPTIONAL_REAGENTS = 1722,
        TINKERS = 1713,
        GOGGLES = 1715,
        ARMOR = 1723,
        WEAPONS = 1716,
        COGWHEELS = 1720,
        SCOPES_AND_AMMO = 1712,
        FIREWORKS = 1711,
        EXPLOSIVES = 1721,
        DEVICES = 1710,
        PROFESSION_EQUIPMENT = 1714,
        ROBOTICS = 1719,
    },
    LEATHERWORKING = {
        DRUMS = 1655,
        ARMOR_KITS = 1651,
        LEATHER_ARMOR = 1657,
        MAIL_ARMOR = 1658,
        PROFESSION_EQUIPMENT = 1656,
        WEAPONS = 1648,
        ELEMENTAL_PATTERNS = 1811,
        BESTIAL_PATTERNS = 1812,
        DECAYED_PATTERNS = 1810,
        REAGENTS = 1654,
        OPTIONAL_REAGENTS = 1649,
        TOYS = 1652,
    },
    INSCRIPTION = {
        INSCRIPTION_ESSENTIALS = 1730,
        INKS = 1754,
        REAGENTS = 1767,
        MISSIVES = 1756,
        CRAFTING_TOOL_MISSIVES = 1789,
        GATHERING_TOOL_MISSIVES = 1790,
        RUNES_AND_SIGILS = 1761,
        TRINKETS = 1748,
        WEAPONS = 1758,
        PROFESSION_EQUIPMENT = 1755,
        SCROLLS = 1763,
        MYSTERIES = 1762,
        CONTRACTS = 1759,
        DRACONIC_TREATISES = 1757,
        RENEWED_PROTO_DRAKE = 1799,
        WINDBORNE_VELOCIDRAKE = 1800,
        HIGHLAND_DRAKE = 1801,
        CLIFFSIDE_WYLDERDRAKE = 1802,
    },
    JEWELCRAFTING = {
        REAGENTS = 1630,
        TRINKETS = 1631,
        JEWELRY = 1632,
        STATUES_AND_CARVING = 1633,
        PROFESSION_EQUIP = 1642,
        EXTRA_GLASSWARES = 1635,
        RUDI_GEMS = 1636,
        AIR_GEMS = 1637,
        EARTH_GEMS = 1638,
        FIRE_GEMS = 1639,
        FROST_GEMS = 1640,
        PRIMALIST_GEMS = 1641,
        MISC = 1629,
    },
    TAILORING = {
        UNRAVELLING = 1668,
        CLOTH_BOLTS = 1669,
        OPTIONAL_REAGENTS = 1673,
        FINISHING_REAGENTS = 1671,
        PROFESSION_EQUIPMENT = 1606,
        SPELLTHREAD = 1672, -- Leg enchants for casters
        BAGS = 1674,
        ASSORTED_EMBROIDERY = 1670, -- Toys, Bandages & Banners stuff
        EXPERIMENTS = 1667, -- Two recipes to break your tool and get a set of daggers

        -- Armor
        ARMOR = 1662,
        AZUREWEAVE_ARMOR = 1665,
        CHRONOCLOTH_ARMOR = 1666,
    }
}

CraftSim.CONST.RECIPE_ITEM_SUBTYPES = {
    ALL = 999999,
    BLACKSMITHING = {
        STONEWORK = 8, -- "Other"
        METAL_AND_STONE = 7,
        BLACKSMITHING = 0,
        LEATHERWORKING = 1,
        SKINNING = 10,
        TAILORING = 6,
        HERBALISM = 3,
        MINING = 5,

        -- WEAPONS
        MACE_2H = 5,
        FIST = 13,
        POLEARM = 6,
        SWORDS_1H = 7,
        AXE_1H = 0,
        DAGGERS = 15,
        AXE_2H = 1,
        SWORDS_2H = 8,
        MACE_1H = 4,
        WARGLAIVES = 9,

        -- ARMOR
        PLATE = 4,
        SHIELDS = 6,
    },
    ALCHEMY = {
        PHIALS = 3, -- "Flask"
        POTIONS = 1,
        REAGENT = 11, -- "Other"
        FINISHING_REAGENT = 19,
        OPTIONAL_REAGENTS = 18,
        INCENSE = 8, -- "other"
        ELEMENTAL = 10, -- transmutations
        EXPLOSIVES_AND_DEVICES = 0, -- transmutations
        MISC = 0, -- trinket
    },
    ENCHANTING = {
        FINISHING_REAGENTS = 19,
        RODS = 8,
        WANDS = 19,
        ILLUSIONS = 8, -- weapon enchantment transmogs and toys
        ILLUSORY_ADORNMENTS = 2, -- temporary shoulder glows
        SCEPTERS = 14, -- scepters of spectacle
        SHATTERS = 4,
        COMPANION_PETS = 2,

        -- Gear Enchantments
        CLOAK = 3,
        CHEST = 4,
        WRIST = 5,
        FEET = 9,
        FINGER = 10,
        WEAPON = 11,
        PROFESSION_TOOL = 14,
    },
    ENGINEERING = {
        PARTS = 1,
        EXPLOSIVES_AND_DEVICES = 0, -- Explosives, S.A.V.I.O.R, Rummage Through Scrap
        FINISHING_REAGENTS = 19,
        OPTIONAL_REAGENTS = 18, -- Safety Components, Cogwheels, Magazine of Healing Darts
        TWO_HANDED_WEAPON = 12, -- Scopes
        OTHER = 9, -- Tinkers, Fireworks, most Devices
        OTHER2 = 8, -- Ammo, Portable Alchemy/Engineering Benches
        OTHER_BOMB_CRATES = 4, -- Bomb Crates
        COMPANION_PETS = 2,

        -- Goggles/Bracers (Armor)
        PLATE = 4,
        CLOTH = 1,
        MAIL = 3,
        LEATHER = 2,

        -- Weapons
        GUNS = 3,

        -- Tools
        ENGINEERING = 7,
        MINING = 5,
        FISHING = 9,
        JEWELCRAFTING = 11,
        TAILORING = 6,

    },
    LEATHERWORKING = {
        DRUMS = 8, -- Drums
        MISC = 14, -- Armor Kits
        MISCELLANEOUS = 0, -- Witherrot Tome
        OTHER = 4, -- Toys

        -- Armor
        LEATHER = 2,
        MAIL = 3,

        -- Tools
        ALCHEMY = 2,
        SKINNING = 10,
        BLACKSMITHING = 0,
        HERBALISM = 3,
        LEATHERWORKING = 1,
        JEWELCRAFTING = 11,
        ENGINEERING = 7,

        -- Weapons
        CROSSBOWS = 18,
        BOWS = 2,

        -- Reagents
        OPTIONAL_REAGENTS = 18, -- Fang Adornments, Toxified Armor Patch (Optional Reagents)
        LEATHER_REAGENTS = 6, -- Hides, Scales (Reagents)
    },
    INSCRIPTION = {
        MILLING = 11,
        SIGILS = 18,
        VANTUS_RUNES = 9,
        FAUNA_RUNES = 8,
        BUNDLE_O_CARDS = 8,
        STAVES = 10,
        OFFHANDS = 0,
    },
    JEWELCRAFTING = {
        GEMS = 9, -- Other
    },
    TAILORING = {
        UNRAVELLING = 2,
        CLOTH_BOLTS = 5,
        OPTIONAL_REAGENTS = 18,
        FINISHING_REAGENTS = 19,
        ARMOR = 1,
        SPELLTHREAD = 8,
        BANDAGES = 7,
        TOYS_AND_BANNERS = 4,
        EXPERIMENTS = 2, -- Two recipes to break your tool and get a set of daggers

        -- Profession Gear
        TAILORING = 6,
        ALCHEMY = 2,
        COOKING = 4,
        ENCHANTING = 8,
        FISHING = 0,
        HERBALISM = 3,

        -- Bags
        BAG = 0,
        REAGENT_BAG = 11,
    },
}

---@enum CraftSim.BuffID
CraftSim.CONST.BUFF_IDS = {
    INSPIRATION_INCENSE = 371234,
    PHIAL_OF_QUICK_HANDS = 393665,
    PHIAL_OF_QUICK_HANDS_SPELL_Q1 = 381264,
    PHIAL_OF_QUICK_HANDS_SPELL_Q2 = 393689,
    PHIAL_OF_QUICK_HANDS_SPELL_Q3 = 393692,
    ALCHEMICALLY_INSPIRED = 382093,
}

CraftSim.CONST.LOCALES = {
    EN = "enUS",
    DE = "deDE",
    IT = "itIT",
    RU = "ruRU",
    PT = "ptBR",
    ES = "esES",
    FR = "frFR",
    MX = "esMX",
    KO = "koKR",
    TW = "zhTW",
    CN = "zhCN",
}

---@enum CraftSim.LOCALIZATION_IDS
CraftSim.CONST.TEXT = {
    RESOURCEFULNESS_EXPLANATION_TOOLTIP = 0,
    MULTICRAFT_ADDITIONAL_ITEMS_EXPLANATION_TOOLTIP = 1,
    MULTICRAFT_ADDITIONAL_ITEMS_VALUE_EXPLANATION_TOOLTIP = 2,
    MULTICRAFT_ADDITIONAL_ITEMS_HIGHER_QUALITY_EXPLANATION_TOOLTIP = 3,
    INSPIRATION_ADDITIONAL_ITEMS_EXPLANATION_TOOLTIP = 4,
    INSPIRATION_ADDITIONAL_ITEMS_HIGHER_QUALITY_EXPLANATION_TOOLTIP = 5,
    MULTICRAFT_ADDITIONAL_ITEMS_HIGHER_VALUE_EXPLANATION_TOOLTIP = 6,
    INSPIRATION_ADDITIONAL_ITEMS_VALUE_EXPLANATION_TOOLTIP = 7,
    INSPIRATION_ADDITIONAL_ITEMS_HIGHER_VALUE_EXPLANATION_TOOLTIP = 8,
    RECIPE_DIFFICULTY_LABEL = 9,
    INSPIRATION_LABEL = 10,
    MULTICRAFT_LABEL = 11,
    RESOURCEFULNESS_LABEL = 12,
    RECIPE_DIFFICULTY_EXPLANATION_TOOLTIP = 13,
    INSPIRATION_EXPLANATION_TOOLTIP = 14,
    MULTICRAFT_EXPLANATION_TOOLTIP = 15,
    REAGENTSKILL_EXPLANATION_TOOLTIP = 17,
    
    -- required stuff
    STAT_INSPIRATION = 18,
    STAT_MULTICRAFT = 19,
    STAT_RESOURCEFULNESS = 20,
    STAT_CRAFTINGSPEED = 21,
    EQUIP_MATCH_STRING = 22,
    ENCHANTED_MATCH_STRING = 24,
    --

    -- optional: 
    STAT_SKILL = 25,
    STAT_MULTICRAFT_BONUS = 26,
    STAT_RESOURCEFULNESS_BONUS = 27,
    STAT_PHIAL_EXPERIMENTATION = 28,
    STAT_POTION_EXPERIMENTATION = 29,
    STAT_CRAFTINGSPEED_BONUS = 30,
    STAT_INSPIRATION_BONUS = 31,

    INSPIRATION_SKILL_LABEL = 32,
    INSPIRATION_SKILL_EXPLANATION_TOOLTIP = 33,
    REAGENTFACTOR_EXPLANATION_TOOLTIP = 34,

    RESOURCEFULNESS_BONUS_LABEL = 35,
    MATERIAL_QUALITY_BONUS_LABEL = 36,
    MATERIAL_QUALITY_MAXIMUM_LABEL = 37,
    EXPECTED_QUALITY_LABEL = 38,
    NEXT_QUALITY_LABEL = 39,
    MISSING_SKILL_LABEL = 40,
    MISSING_SKILL_INSPIRATION_LABEL = 41,
    SKILL_LABEL = 42,
    MULTICRAFT_BONUS_LABEL = 43,
    HSV_EXPLANATION = 47,
    STATISTICS_CDF_EXPLANATION = 49,

    POPUP_NO_PRICE_SOURCE_SYSTEM = 60,
    POPUP_NO_PRICE_SOURCE_TITLE = 61,
    POPUP_NO_PRICE_SOURCE_WARNING = 62,
    POPUP_NO_PRICE_SOURCE_WARNING_SUPPRESS = 63,
    
    SIMULATION_MODE_NONE = 64,
    SIMULATION_MODE_LABEL = 65,
    SIMULATION_MODE_TITLE = 66,
    SIMULATION_MODE_TOOLTIP = 67,
    SIMULATION_MODE_OPTIONAL = 68,
    SIMULATION_MODE_FINISHING = 69,

    OPTIONS_TITLE = 70,
    OPTIONS_GENERAL_TAB = 71,
    OPTIONS_GENERAL_PRICE_SOURCE = 72,
    OPTIONS_GENERAL_CURRENT_PRICE_SOURCE = 73,
    OPTIONS_GENERAL_NO_PRICE_SOURCE = 74,
    OPTIONS_GENERAL_SHOW_PROFIT = 75,
    OPTIONS_GENERAL_SHOW_PROFIT_TOOLTIP = 76,
    OPTIONS_GENERAL_REMEMBER_LAST_RECIPE = 77,
    OPTIONS_GENERAL_REMEMBER_LAST_RECIPE_TOOLTIP = 78,
    OPTIONS_GENERAL_DETAILED_TOOLTIP = 79,
    OPTIONS_GENERAL_DETAILED_TOOLTIP_TOOLTIP = 80,
    OPTIONS_GENERAL_SUPPORTED_PRICE_SOURCES = 81,
    OPTIONS_PERFORMANCE_RAM = 82,
    OPTIONS_PERFORMANCE_RAM_TOOLTIP = 83,
    OPTIONS_MODULES_TAB = 84,
    OPTIONS_PROFIT_CALCULATION_TAB = 85,
    OPTIONS_CRAFTING_TAB = 86,
    OPTIONS_TSM_RESET = 87,
    OPTIONS_TSM_INVALID_EXPRESSION = 88,
    OPTIONS_TSM_VALID_EXPRESSION = 89,
    OPTIONS_MODULES_TRANSPARENCY = 90,
    OPTIONS_MODULES_MATERIALS = 91,
    OPTIONS_MODULES_AVERAGE_PROFIT = 92,
    OPTIONS_MODULES_TOP_GEAR = 93,
    OPTIONS_MODULES_COST_OVERVIEW = 94,
    OPTIONS_MODULES_SPECIALIZATION_INFO = 95,
    OPTIONS_MODULES_CUSTOMER_HISTORY_SIZE = 96,
    OPTIONS_PROFIT_CALCULATION_OFFSET = 97,
    OPTIONS_PROFIT_CALCULATION_OFFSET_TOOLTIP = 98,
    OPTIONS_PROFIT_CALCULATION_MULTICRAFT_CONSTANT = 99,
    OPTIONS_PROFIT_CALCULATION_MULTICRAFT_CONSTANT_EXPLANATION = 100,
    OPTIONS_PROFIT_CALCULATION_RESOURCEFULNESS_CONSTANT = 101,
    OPTIONS_PROFIT_CALCULATION_RESOURCEFULNESS_CONSTANT_EXPLANATION = 102,
    OPTIONS_GENERAL_SHOW_NEWS_CHECKBOX = "OPTIONS_GENERAL_SHOW_NEWS_CHECKBOX",
    OPTIONS_GENERAL_SHOW_NEWS_CHECKBOX_TOOLTIP = "OPTIONS_GENERAL_SHOW_NEWS_CHECKBOX_TOOLTIP",
    OPTIONS_GENERAL_HIDE_MINIMAP_BUTTON_CHECKBOX = "OPTIONS_GENERAL_HIDE_MINIMAP_BUTTON_CHECKBOX",
    OPTIONS_GENERAL_HIDE_MINIMAP_BUTTON_TOOLTIP = "OPTIONS_GENERAL_HIDE_MINIMAP_BUTTON_TOOLTIP",

    CONTROL_PANEL_MODULES_TOP_GEAR_LABEL = 150,
    CONTROL_PANEL_MODULES_TOP_GEAR_TOOLTIP = 151,
    CONTROL_PANEL_MODULES_CRAFT_QUEUE_LABEL = "CONTROL_PANEL_MODULES_CRAFT_QUEUE_LABEL",
    CONTROL_PANEL_MODULES_CRAFT_QUEUE_TOOLTIP ="CONTROL_PANEL_MODULES_CRAFT_QUEUE_TOOLTIP",
    CONTROL_PANEL_MODULES_CRAFT_BUFFS_LABEL ="CONTROL_PANEL_MODULES_CRAFT_BUFFS_LABEL",
    CONTROL_PANEL_MODULES_CRAFT_BUFFS_TOOLTIP ="CONTROL_PANEL_MODULES_CRAFT_BUFFS_TOOLTIP",
    CONTROL_PANEL_MODULES_PRICE_DETAILS_LABEL = 152,
    CONTROL_PANEL_MODULES_PRICE_DETAILS_TOOLTIP = 153,
    CONTROL_PANEL_MODULES_AVERAGE_PROFIT_LABEL = 154,
    CONTROL_PANEL_MODULES_AVERAGE_PROFIT_TOOLTIP = 155,
    CONTROL_PANEL_MODULES_MATERIAL_OPTIMIZATION_LABEL = 156,
    CONTROL_PANEL_MODULES_MATERIAL_OPTIMIZATION_TOOLTIP = 157,
    CONTROL_PANEL_MODULES_PRICE_OVERRIDES_LABEL = 158,
    CONTROL_PANEL_MODULES_PRICE_OVERRIDES_TOOLTIP = 159,
    CONTROL_PANEL_MODULES_CRAFT_DATA_LABEL = 160,
    CONTROL_PANEL_MODULES_CRAFT_DATA_TOOLTIP = 161,
    CONTROL_PANEL_MODULES_SPECIALIZATION_INFO_LABEL = 162,
    CONTROL_PANEL_MODULES_SPECIALIZATION_INFO_TOOLTIP = 163,
    CONTROL_PANEL_MODULES_CRAFT_RESULTS_LABEL = 164,
    CONTROL_PANEL_MODULES_CRAFT_RESULTS_TOOLTIP = 165,
    CONTROL_PANEL_MODULES_COST_DETAILS_LABEL = 166,
    CONTROL_PANEL_MODULES_COST_DETAILS_TOOLTIP = 167,
    CONTROL_PANEL_MODULES_RECIPE_SCAN_LABEL = 168,
    CONTROL_PANEL_MODULES_RECIPE_SCAN_TOOLTIP = 169,
    CONTROL_PANEL_MODULES_CUSTOMER_SERVICE_LABEL = 170,
    CONTROL_PANEL_MODULES_CUSTOMER_SERVICE_TOOLTIP = 171,
    CONTROL_PANEL_RESET_FRAMES = 172,
    CONTROL_PANEL_OPTIONS = 173,
    CONTROL_PANEL_NEWS = 174,
    CONTROL_PANEL_FORGEFINDER_EXPORT = 175,
    CONTROL_PANEL_FORGEFINDER_EXPORTING = 176,
    CONTROL_PANEL_FORGEFINDER_EXPLANATION = 177,
    CONTROL_PANEL_DEBUG = 178,
    CONTROL_PANEL_TITLE = 179,
    CONTROL_PANEL_MODULES_CUSTOMER_HISTORY_LABEL = 180,
    CONTROL_PANEL_MODULES_CUSTOMER_HISTORY_TOOLTIP = 181,
    CONTROL_PANEL_SUPPORTERS_BUTTON = "ControlPanel_1",

    SPEC_INFO_TITLE = 200,
    SPEC_INFO_SIMULATE_KNOWLEDGE_DISTRIBUTION = 201,
    SPEC_INFO_NODE_TOOLTIP = 202,
    SPEC_INFO_WORK_IN_PROGRESS = 203,

    CRAFT_RESULTS_TITLE = 250,
    CRAFT_RESULTS_LOG = 251,
    CRAFT_RESULTS_LOG_1 = 252,
    CRAFT_RESULTS_LOG_2 = 253,
    CRAFT_RESULTS_LOG_3 = 254,
    CRAFT_RESULTS_LOG_4 = 255,
    CRAFT_RESULTS_LOG_5 = 256,
    CRAFT_RESULTS_CRAFTED_ITEMS = 257,
    CRAFT_RESULTS_SESSION_PROFIT = 258,
    CRAFT_RESULTS_RESET_DATA = 259,
    CRAFT_RESULTS_EXPORT_JSON = 260,
    CRAFT_RESULTS_RECIPE_STATISTICS = 261,
    CRAFT_RESULTS_NOTHING = 262,
    CRAFT_RESULTS_STATISTICS_1 = 263,
    CRAFT_RESULTS_STATISTICS_2 = 264,
    CRAFT_RESULTS_STATISTICS_3 = 265,
    CRAFT_RESULTS_STATISTICS_4 = 266,
    CRAFT_RESULTS_STATISTICS_5 = 267,
    CRAFT_RESULTS_STATISTICS_6 = 268,
    CRAFT_RESULTS_STATISTICS_7 = 269,
    CRAFT_RESULTS_STATISTICS_8 = 270,
    CRAFT_RESULTS_STATISTICS_9 = 271,
    CRAFT_RESULTS_STATISTICS_10 = 272,
    CRAFT_RESULTS_STATISTICS_11 = 273,
    CRAFT_RESULTS_SAVED_REAGENTS = 274,
    CRAFT_RESULTS_DISABLE_CHECKBOX = "CRAFTRESULTS_DISABLE_CHECKBOX",
    CRAFT_RESULTS_DISABLE_CHECKBOX_TOOLTIP = "CRAFTRESULTS_DISABLE_CHECKBOX_TOOLTIP",
    
    MATERIALS_TITLE = 300,
    MATERIALS_INSPIRATION_BREAKPOINT = 301,
    MATERIALS_INSPIRATION_BREAKPOINT_TOOLTIP = 302,
    MATERIALS_REACHABLE_QUALITY = 303,
    MATERIALS_MISSING = 304,
    MATERIALS_AVAILABLE = 305,
    MATERIALS_CHEAPER = 306,
    MATERIALS_BEST_COMBINATION = 307,
    MATERIALS_NO_COMBINATION = 308,
    MATERIALS_ASSIGN = 309,
    
    STAT_WEIGHTS_TITLE = 350,
    STAT_WEIGHTS_EXPLANATION_TITLE = 351,
    STAT_WEIGHTS_SHOW_EXPLANATION_BUTTON = 352,
    STAT_WEIGHTS_HIDE_EXPLANATION_BUTTON = 353,
    STAT_WEIGHTS_SHOW_STATISTICS_BUTTON = 354,
    STAT_WEIGHTS_HIDE_STATISTICS_BUTTON = 355,
    STAT_WEIGHTS_PROFIT_CRAFT = 356,
    STAT_WEIGHTS_PROFIT_EXPLANATION_TAB = 357,
    STAT_WEIGHTS_PROFIT_EXPLANATION_HSV_TAB = 358,
    STAT_WEIGHTS_PROFIT_EXPLANATION = 359,
    STAT_WEIGHTS_PROFIT_EXPLANATION_HSV = 360,

    COST_DETAILS_TITLE = 400,
    COST_DETAILS_EXPLANATION = 401,
    COST_DETAILS_CRAFTING_COSTS = 402,
    COST_DETAILS_ITEM_HEADER = 403,
    COST_DETAILS_AH_PRICE_HEADER = 404,
    COST_DETAILS_OVERRIDE_HEADER = 405,
    COST_DETAILS_CRAFT_DATA_HEADER = 406,
    COST_DETAILS_USED_SOURCE = 407,

    CRAFT_DATA_TITLE = 450,
    CRAFT_DATA_EXPLANATION = 451,
    CRAFT_DATA_RECIPE_ITEMS = 452,
    CRAFT_DATA_DELETE_ALL = 453,
    CRAFT_DATA_DELETE_RECIPE = 454,
    CRAFT_DATA_CRAFTER = 455,
    CRAFT_DATA_EXPECTED_CRAFTS = 456,
    CRAFT_DATA_EXPECTED_CRAFTS_EXPLANATION = 457,
    CRAFT_DATA_CRAFTING_CHANCE = 458,
    CRAFT_DATA_UPGRADE_CHANCE_EXPLANATION = 459,
    CRAFT_DATA_EXPECTED_COSTS = 460,
    CRAFT_DATA_EXPECTED_COSTS_EXPLANATION = 461,
    CRAFT_DATA_MINIMUM_COST = 462,
    CRAFT_DATA_SAVE = 463,
    CRAFT_DATA_UPDATE = 464,
    CRAFT_DATA_UNREACHABLE = 465,
    CRAFT_DATA_DELETE = 466,
    CRAFT_DATA_SEND = 467,
    CRAFT_DATA_SAVED_MATERIALS = 468,
    CRAFT_DATA_NO_DATA = 469,
    CRAFT_DATA_OPTIONAL_MATERIALS = 470,
    CRAFT_DATA_ITEM_HEADER = 471,
    CRAFT_DATA_CRAFTER_HEADER = 472,
    CRAFT_DATA_EXPECTED_COST_HEADER = 473,
    CRAFT_DATA_CHANCE_HEADER = 474,
    CRAFT_DATA_OVERRIDE_EXPLANATION = 475,

    STATISTICS_TITLE = 500,
    STATISTICS_EXPECTED_PROFIT = 501,
    STATISTICS_CHANCE_OF = 502,
    STATISTICS_PROFIT = 503,
    STATISTICS_AFTER = 504,
    STATISTICS_CRAFTS = 505,
    STATISTICS_QUALITY_HEADER = 506,
    STATISTICS_CHANCE_HEADER = 507,
    STATISTICS_EXPECTED_CRAFTS_HEADER = 508,
    STATISTICS_INSPIRATION_HEADER = 509,
    STATISTICS_MULTICRAFT_HEADER = 510,
    STATISTICS_RESOURCEFULNESS_HEADER = 511,
    STATISTICS_HSV_NEXT = 512,
    STATISTICS_HSV_SKIP = 513,
    STATISTICS_EXPECTED_PROFIT_HEADER = 514,
    STATISTICS_EXPECTED_COSTS_HEADER = 'Statistics_ExpectedCostsHeader',
    STATISTICS_EXPECTED_COSTS_WITH_RETURN_HEADER = 'Statistics_ExpectedCostsWithReturnHeader',
    STATISTICS_EXPLANATION_ICON = 'Statistics_Explanation_HelpIcon',
    PROBABILITY_TABLE_TITLE = 515,
    PROBABILITY_TABLE_EXPLANATION = 516,

    CUSTOMER_SERVICE_TITLE = 550,
    CUSTOMER_SERVICE_RECIPE_WHISPER = 551,
    CUSTOMER_SERVICE_LIVE_PREVIEW = 552,
    CUSTOMER_SERVICE_WHISPER = 553,
    CUSTOMER_SERVICE_MESSAGE_FORMAT = 554,
    CUSTOMER_SERVICE_RESET_TO_DEFAULT = 555,
    CUSTOMER_SERVICE_ALLOW_CONNECTIONS = 556,
    CUSTOMER_SERVICE_SEND_INVITE = 557,
    CUSTOMER_SERVICE_AUTO_REPLY_EXPLANATION = 558,
    CUSTOMER_SERVICE_AUTO_REPLY_FORMAT_EXPLANATION = 559,
    CUSTOMER_SERVICE_LIVE_PREVIEW_TITLE = 560,
    CUSTOMER_SERVICE_LIVE_PREVIEW_EXPLANATION = 561,
    CUSTOMER_SERVICE_HIGHEST_GUARANTEED_CHECKBOX = 562,
    CUSTOMER_SERVICE_HIGHEST_GUARANTEED_CHECKBOX_EXPLANATION = 563,
    CUSTOMER_SERVICE_CRAFTER_PROFESSION = 564,
    CUSTOMER_SERVICE_LEARNED_RECIPES = 565,
    CUSTOMER_SERVICE_LEARNED_RECIPES_INITIAL = 566,
    CUSTOMER_SERVICE_REQUESTING_UPDATE = 567,
    CUSTOMER_SERVICE_TIMEOUT = 568,
    CUSTOMER_SERVICE_REAGENT_OPTIONAL = 569,
    CUSTOMER_SERVICE_REAGENT_FINISHING = 570,
    CUSTOMER_SERVICE_CRAFTING_COSTS = 571,
    CUSTOMER_SERVICE_EXPECTED_RESULTS = 572,
    CUSTOMER_SERVICE_EXPECTED_INSPIRATION = 573,
    CUSTOMER_SERVICE_REQUIRED_MATERIALS = 574,
    CUSTOMER_SERVICE_REAGENTS_NONE = 575,
    CUSTOMER_SERVICE_REAGENTS_LOCKED = 576,

    PRICE_DETAILS_TITLE = 600,
    PRICE_DETAILS_INV_AH = 601,
    PRICE_DETAILS_ITEM = 602,
    PRICE_DETAILS_PRICE_ITEM = 603,
    PRICE_DETAILS_PROFIT_ITEM = 604,

    PRICE_OVERRIDE_TITLE = 650,
    PRICE_OVERRIDE_REQUIRED_REAGENTS = 651,
    PRICE_OVERRIDE_OPTIONAL_REAGENTS = 652,
    PRICE_OVERRIDE_FINISHING_REAGENTS = 653,
    PRICE_OVERRIDE_RESULT_ITEMS = 654,
    PRICE_OVERRIDE_ACTIVE_OVERRIDES = 655,
    PRICE_OVERRIDE_ACTIVE_OVERRIDES_TOOLTIP = 656,
    PRICE_OVERRIDE_CLEAR_ALL = 657,
    PRICE_OVERRIDE_SAVE = 658,
    PRICE_OVERRIDE_SAVED = 659,
    PRICE_OVERRIDE_REMOVE = 660,

    RECIPE_SCAN_TITLE = 700,
    RECIPE_SCAN_MODE = 701,
    RECIPE_SCAN_SCAN_RECIPIES = 702,
    RECIPE_SCAN_SCAN_CANCEL = "RECIPESCAN_SCAN_CANCEL",
    RECIPE_SCAN_SCANNING = 703,
    RECIPE_SCAN_INCLUDE_NOT_LEARNED = 704,
    RECIPE_SCAN_INCLUDE_NOT_LEARNED_TOOLTIP = 705,
    RECIPE_SCAN_INCLUDE_SOULBOUND = 706,
    RECIPE_SCAN_INCLUDE_SOULBOUND_TOOLTIP = 707,
    RECIPE_SCAN_INCLUDE_GEAR = 708,
    RECIPE_SCAN_INCLUDE_GEAR_TOOLTIP = 709,
    RECIPE_SCAN_OPTIMIZE_TOOLS = 710,
    RECIPE_SCAN_OPTIMIZE_TOOLS_TOOLTIP = 711,
    RECIPE_SCAN_OPTIMIZE_TOOLS_WARNING = 712,
    RECIPE_SCAN_RECIPE_HEADER = 713,
    RECIPE_SCAN_LEARNED_HEADER = 714,
    RECIPE_SCAN_GUARANTEED_HEADER = 715,
    RECIPE_SCAN_HIGHEST_RESULT_HEADER = 716,
    RECIPE_SCAN_AVERAGE_PROFIT_HEADER = 717,
    RECIPE_SCAN_TOP_GEAR_HEADER = 718,
    RECIPE_SCAN_INV_AH_HEADER = 719,
    RECIPE_SCAN_SORT_BY_MARGIN = "RECIPESCAN_SORTBYMARGIN",
    RECIPE_SCAN_SORT_BY_MARGIN_TOOLTIP = "RECIPESCAN_SORTBYMARGIN_TOOLTIP",
    RECIPE_SCAN_USE_INSIGHT_CHECKBOX = "RECIPESCAN_USE_INSIGHT_CHECKBOX",
    RECIPE_SCAN_USE_INSIGHT_CHECKBOX_TOOLTIP = "RECIPESCAN_USE_INSIGHT_CHECKBOX_TOOLTIP",
    RECIPE_SCAN_ONLY_FAVORITES_CHECKBOX = "RECIPESCAN_ONLY_FAVORITES_CHECKBOX",
    RECIPE_SCAN_ONLY_FAVORITES_CHECKBOX_TOOLTIP = "RECIPESCAN_ONLY_FAVORITES_CHECKBOX_TOOLTIP",
    RECIPE_SCAN_EQUIPPED = "RECIPESCAN_EQUIPPED",
    RECIPE_SCAN_MODE_Q1 = "RECIPESCAN_MODE_Q1",
    RECIPE_SCAN_MODE_Q2 = "RECIPESCAN_MODE_Q2",
    RECIPE_SCAN_MODE_Q3 = "RECIPESCAN_MODE_Q3",
    RECIPE_SCAN_MODE_OPTIMIZE = "RECIPE_SCAN_MODE_OPTIMIZE",

    TOP_GEAR_TITLE = 750,
    TOP_GEAR_AUTOMATIC = 751,
    TOP_GEAR_AUTOMATIC_TOOLTIP = 752,
    TOP_GEAR_SIMULATE = 753,
    TOP_GEAR_EQUIP = 754,
    TOP_GEAR_SIMULATE_QUALITY = 755,
    TOP_GEAR_SIMULATE_EQUIPPED = 756,
    TOP_GEAR_SIMULATE_PROFIT_DIFFERENCE = 757,
    TOP_GEAR_SIMULATE_NEW_MUTLICRAFT = 758,
    TOP_GEAR_SIMULATE_NEW_CRAFTING_SPEED = 759,
    TOP_GEAR_SIMULATE_NEW_RESOURCEFULNESS = 760,
    TOP_GEAR_SIMULATE_NEW_INSPIRATION = 761,
    TOP_GEAR_SIMULATE_NEW_SKILL = 762,
    TOP_GEAR_SIMULATE_UNHANDLED = 763,
    TOP_GEAR_SIM_MODES_PROFIT = 764,
    TOP_GEAR_SIM_MODES_SKILL = 765,
    TOP_GEAR_SIM_MODES_INSPIRATION = 766,
    TOP_GEAR_SIM_MODES_MULTICRAFT = 767,
    TOP_GEAR_SIM_MODES_RESOURCEFULNESS = 768,
    TOP_GEAR_SIM_MODES_CRAFTING_SPEED = 769,

    SUPPORTERS_DESCRIPTION = "Supporters_1",
    SUPPORTERS_DESCRIPTION_2 = "Supporters_2",

    SUPPORTERS_DATE = "Supporters_Date",
    SUPPORTERS_SUPPORTER = "Supporters_Supporter",
    SUPPORTERS_TYPE = "Supporters_Type",
    SUPPORTERS_MESSAGE = "Supporters_Message",

    CUSTOMER_HISTORY_TITLE = 800,
    CUSTOMER_HISTORY_DROPDOWN_LABEL = 801,
    CUSTOMER_HISTORY_TOTAL_TIP = 802,
    CUSTOMER_HISTORY_FROM = 803,
    CUSTOMER_HISTORY_TO = 804,
    CUSTOMER_HISTORY_FOR = 805,
    CUSTOMER_HISTORY_CRAFT_FORMAT = 806,
    CUSTOMER_HISTORY_DELETE_BUTTON = 807,
    CUSTOMER_HISTORY_PURGE_DAYS_INPUT_LABEL = "CUSTOMER_HISTORY_PURGE_DAYS_INPUT_LABEL",
    CUSTOMER_HISTORY_PURGE_DAYS_INPUT_TOOLTIP = "CUSTOMER_HISTORY_PURGE_DAYS_INPUT_TOOLTIP",
    CUSTOMER_HISTORY_WHISPER_BUTTON_LABEL = "CUSTOMER_HISTORY_WHISPER_BUTTON_LABEL",
    CUSTOMER_HISTORY_PURGE_NO_TIP_LABEL = "CUSTOMER_HISTORY_PURGE_NO_TIP_LABEL",
    CUSTOMER_HISTORY_PURGE_ZERO_TIPS_CONFIRMATION_POPUP = "CUSTOMER_HISTORY_PURGE_ZERO_TIPS_CONFIRMATION_POPUP",
    CUSTOMER_HISTORY_DELETE_CUSTOMER_CONFIRMATION_POPUP = "CUSTOMER_HISTORY_DELETE_CUSTOMER_CONFIRMATION_POPUP",
    CUSTOMER_HISTORY_DELETE_CUSTOMER_POPUP_TITLE = "CUSTOMER_HISTORY_DELETE_CUSTOMER_POPUP_TITLE",
    CUSTOMER_HISTORY_PURGE_ZERO_TIPS_CONFIRMATION_POPUP_TITLE = "CUSTOMER_HISTORY_PURGE_ZERO_TIPS_CONFIRMATION_POPUP_TITLE",
    CUSTOMER_HISTORY_CUSTOMER_HEADER = "CUSTOMER_HISTORY_CUSTOMER_HEADER",
    CUSTOMER_HISTORY_TOTAL_TIP_HEADER = "CUSTOMER_HISTORY_TOTAL_TIP_HEADER",
    CUSTOMER_HISTORY_CRAFT_HISTORY_DATE_HEADER = "CUSTOMER_HISTORY_CRAFT_HISTORY_DATE_HEADER",
    CUSTOMER_HISTORY_CRAFT_HISTORY_RESULT_HEADER = "CUSTOMER_HISTORY_CRAFT_HISTORY_RESULT_HEADER",
    CUSTOMER_HISTORY_CRAFT_HISTORY_TIP_HEADER = "CUSTOMER_HISTORY_CRAFT_HISTORY_TIP_HEADER",
    CUSTOMER_HISTORY_CRAFT_HISTORY_CUSTOMER_REAGENTS_HEADER = "CUSTOMER_HISTORY_CRAFT_HISTORY_CUSTOMER_REAGENTS_HEADER",
    CUSTOMER_HISTORY_CRAFT_HISTORY_CUSTOMER_NOTE_HEADER = "CUSTOMER_HISTORY_CRAFT_HISTORY_CUSTOMER_NOTE_HEADER",

    CRAFT_QUEUE_TITLE = "CRAFT_QUEUE_TITLE",
    CRAFT_QUEUE_CRAFT_AMOUNT_LEFT_HEADER= "CRAFT_QUEUE_CRAFT_AMOUNT_LEFT_HEADER",
    CRAFT_QUEUE_CRAFT_PROFESSION_GEAR_HEADER = "CRAFT_QUEUE_CRAFT_PROFESSION_GEAR_HEADER",
    CRAFT_QUEUE_CRAFTING_COSTS_HEADER = "CRAFT_QUEUE_CRAFTING_COSTS_HEADER",
    CRAFT_QUEUE_CRAFT_BUTTON_ROW_LABEL = "CRAFT_QUEUE_CRAFT_BUTTON_ROW_LABEL",
    CRAFT_QUEUE_CRAFT_BUTTON_ROW_LABEL_WRONG_GEAR = "CRAFT_QUEUE_CRAFT_BUTTON_ROW_LABEL_WRONG_GEAR",
    CRAFT_QUEUE_CRAFT_BUTTON_ROW_LABEL_NO_MATS = "CRAFT_QUEUE_CRAFT_BUTTON_ROW_LABEL_NO_MATS",
    CRAFT_QUEUE_ADD_OPEN_RECIPE_BUTTON_LABEL = "CRAFT_QUEUE_ADD_OPEN_RECIPE_BUTTON_LABEL",
    CRAFT_QUEUE_CLEAR_ALL_BUTTON_LABEL = "CRAFT_QUEUE_CLEAR_ALL_BUTTON_LABEL",
    CRAFT_QUEUE_IMPORT_RECIPE_SCAN_BUTTON_LABEL = "CRAFT_QUEUE_IMPORT_RECIPE_SCAN_BUTTON_LABEL",
    CRAFT_QUEUE_CRAFT_BUTTON_ROW_LABEL_WRONG_PROFESSION = "CRAFT_QUEUE_CRAFT_BUTTON_ROW_LABEL_WRONG_PROFESSION",
    CRAFT_QUEUE_CRAFT_BUTTON_ROW_LABEL_ON_COOLDOWN = "CRAFT_QUEUE_CRAFT_BUTTON_ROW_LABEL_ON_COOLDOWN",
    CRAFT_QUEUE_REAGENT_INFO_HEADER = "CRAFT_QUEUE_REAGENT_INFO_HEADER",
    CRAFT_QUEUE_REAGENT_INFO_BUTTON_LABEL = "CRAFT_QUEUE_REAGENT_INFO_BUTTON_LABEL",
    CRAFT_QUEUE_CRAFT_NEXT_BUTTON_LABEL = "CRAFT_QUEUE_CRAFT_NEXT_BUTTON_LABEL",
    CRAFT_QUEUE_CRAFT_AVAILABLE_AMOUNT = "CRAFT_QUEUE_CRAFT_AVAILABLE_AMOUNT",
    CRAFTQUEUE_AUCTIONATOR_SHOPPING_LIST_BUTTON_LABEL = "CRAFTQUEUE_AUCTIONATOR_SHOPPING_LIST_BUTTON_LABEL",
    CRAFT_QUEUE_QUEUE_TAB_LABEL = "CRAFT_QUEUE_QUEUE_TAB_LABEL",
    CRAFT_QUEUE_RESTOCK_OPTIONS_TAB_LABEL = "CRAFT_QUEUE_RESTOCK_OPTIONS_TAB_LABEL",
    CRAFT_QUEUE_RESTOCK_OPTIONS_GENERAL_PROFIT_THRESHOLD_LABEL = "CRAFT_QUEUE_RESTOCK_OPTIONS_GENERAL_PROFIT_THRESHOLD_LABEL",
    CRAFT_QUEUE_RESTOCK_OPTIONS_SALE_RATE_INPUT_LABEL = "CRAFT_QUEUE_RESTOCK_OPTIONS_SALE_RATE_INPUT_LABEL",
    CRAFT_QUEUE_RESTOCK_OPTIONS_TSM_SALE_RATE_TOOLTIP = "CRAFT_QUEUE_RESTOCK_OPTIONS_TSM_SALE_RATE_TOOLTIP",
    CRAFT_QUEUE_RESTOCK_OPTIONS_AMOUNT_LABEL = "CRAFT_QUEUE_RESTOCK_OPTIONS_AMOUNT_LABEL",
    CRAFT_QUEUE_RESTOCK_OPTIONS_RESTOCK_TOOLTIP = "CRAFT_QUEUE_RESTOCK_OPTIONS_RESTOCK_TOOLTIP",
    CRAFT_QUEUE_RESTOCK_OPTIONS_ENABLE_RECIPE_LABEL = "CRAFT_QUEUE_RESTOCK_OPTIONS_ENABLE_RECIPE_LABEL",
    CRAFT_QUEUE_RESTOCK_OPTIONS_ENABLE_RECIPE_TOOLTIP = "CRAFT_QUEUE_RESTOCK_OPTIONS_ENABLE_RECIPE_TOOLTIP",
    CRAFT_QUEUE_RESTOCK_OPTIONS_GENERAL_OPTIONS_LABEL = "CRAFT_QUEUE_RESTOCK_OPTIONS_GENERAL_OPTIONS_LABEL",
    CRAFT_QUEUE_RESTOCK_OPTIONS_TSM_SALE_RATE_TOOLTIP_GENERAL = "CRAFT_QUEUE_RESTOCK_OPTIONS_TSM_SALE_RATE_TOOLTIP_GENERAL",
    CRAFT_QUEUE_TOTAL_PROFIT_LABEL = "CRAFT_QUEUE_TOTAL_PROFIT_LABEL",
    CRAFT_QUEUE_TOTAL_CRAFTING_COSTS_LABEL = "CRAFT_QUEUE_TOTAL_CRAFTING_COSTS_LABEL",
    CRAFT_QUEUE_EDIT_RECIPE_TITLE = "CRAFT_QUEUE_EDIT_RECIPE_TITLE",

    CRAFT_BUFFS_TITLE = "CRAFT_BUFFS_TITLE",

    STATIC_POPUPS_YES = "STATIC_POPUPS_YES",
    STATIC_POPUPS_NO = "STATIC_POPUPS_NO",
}

CraftSim.CONST.IMPLEMENTED_SKILL_BUILD_UP = function() 
    return {
        Enum.Profession.Alchemy,
        Enum.Profession.Blacksmithing,
        Enum.Profession.Enchanting,
        Enum.Profession.Engineering,
        Enum.Profession.Inscription,
        Enum.Profession.Jewelcrafting,
        Enum.Profession.Leatherworking,
        Enum.Profession.Tailoring,
    }
end

CraftSim.CONST.BASE_RECRAFT_RECIPE_IDS = {
    385304, -- Blacksmithing
    389195, -- Leatherworking
    389191, -- Enchanting
    389192, -- Engineering
    389193, -- Inscription
    389194, -- Jewelcrafting
    389195, -- Tailoring

}

CraftSim.CONST.REAGENT_ID_EXCEPTION_MAPPING = {
    [199345] = 200074 -- frosted rimefin tuna to rimefin tuna, due to frosted generating it, and rimefin tuna being soulbound
}

CraftSim.CONST.EXCEPTION_ORDER_ITEM_IDS = {
    [382363] = {198236, 198237, 198238}
}

CraftSim.CONST.SPECIAL_TOOL_STATS = {
    [191228] = { -- Epic BS Hammer
        inspirationBonusSkillPercent = 0.15,
    }
}

CraftSim.CONST.ITEM_IDS = {
    OPTIONAL_REAGENTS = {
        ILLUSTRIOUS_INSIGHT = 191529,
        LESSER_ILLUSTRIOUS_INSIGHT = 191526,
    }
}

CraftSim.CONST.AUCTIONATOR_SHOPPING_LIST_QUEUE_NAME = 'CraftSim CraftQueue'

CraftSim.CONST.MAX_KNOWLEDGEPOINTS = {
    ALCHEMY=510,
    BLACKSMITHING=800,
    ENCHANTING=565,
    ENGINEERING=525,
    HERBALISM=520,
    INSCRIPTION=680,
    JEWELCRAFTING=630,
    LEATHERWORKING=750,
    MINING=455,
    SKINNING=400,
    TAILORING=630,
}


CraftSim.CONST.ATLAS_TEXTURES = {
    TRADESKILL_ICON_ADD = 'tradeskills-icon-add',
    CRAFT_BUFF_ACTIVE = 'UI-QuestTracker-Tracker-Check',
    CRAFT_BUFF_NOT_ACTIVE = 'UI-QuestTracker-Objective-Fail',
}