local alpha_re
local mod = RegisterMod("Alphabirth Revived", 1)
local AlphaRevived = {}

-- |==================|
-- | USEFUL FUNCTIONS |
-- |==================|

local VECTOR_ZERO = Vector(0,0)

local modRNG = RNG() -- The RNG to be used across the mod

local function random(min, max) -- Re-implements math.random() using the API's RNG class
    if min ~= nil and max ~= nil then -- Min and max passed, integer [min,max]
        return math.floor(modRNG:RandomFloat() * (max - min + 1) + min)
    elseif min ~= nil then -- Only min passed, integer [0,min]
        return math.floor(modRNG:RandomFloat() * (min + 1))
    end
    
    return modRNG:RandomFloat() -- float (between 0.0 and 1.0)
end

local function getVectorFromDirection(direction)
    if direction == Direction.NO_DIRECTION then
        return VECTOR_ZERO
    end

    return Vector.FromAngle(-180 + direction * 90)
end

-- |=========================|
-- | VARIABLE INITIALISATION |
-- |=========================|

local CONFIG = {}
local COSTUMES = {}
local CURSES = {}
local LOCKS = {}
local ENTITIES = {}
local ENTITY_FLAGS = {}
local FAMILIARS = {}
local CHALLENGES = {}
local RUN_PARAMS = {}
local SOUNDS = {}
local ITEMS = {
    ACTIVE = {},
    PASSIVE = {},
    TRINKET = {},
    POCKET = {}
}

local SfxManager

-- |=============|
-- | API STARTUP |
-- |=============|

local function start()
    alpha_re = AlphaAPI.registerMod(mod)
    SfxManager = SFXManager()

    -- |=====================|
    -- | COSTUME DECLARATION |
    -- |=====================|
    -- Example: COSTUMES.NEW_COSTUME = Isaac.GetCostumeIdByPath(path)


    -- |===================|
    -- | CURSE DECLARATION |
    -- |===================|
    -- Example: CURSES.CURSE = alpha_mod:getCurseConfig("Name", ID)


    -- |===================================|
    -- | ITEM DECLARATION/CALLBACK BINDING |
    -- |===================================|
    -- Example: ITEMS.PASSIVE.NEW_ITEM = alpha_mod:registerItem(name, costume, cacheflags)


    -- |====================|
    -- | ENTITY DECLARATION |
    -- |====================|
    -- Example: ENTITIES.NEW_ENTITY = alpha_mod:getEntityConfig(Isaac.GetEntityTypeByName(name), Isaac.GetEntityVariantByName(name), 0)


    -- |=======================|
    -- | CHALLENGE DECLARATION |
    -- |=======================|
    -- Example: CHALLENGES.NAME = Isaac.GetChallengeIdByName(name)


    -- |=======================|
    -- | CHARACTER DECLARATION |
    -- |=======================|
    -- Example: alpha_re:registerCharacter(name, tems, effects, costumes, stats, on_start(), on_update())


    -- |=========================|
    -- | MASTER CALLBACK BINDING |
    -- |=========================|
    -- Example: mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, on_start())
   
    
end



-- |================|
-- | STARTUP METHOD |
-- |================|

local START_FUNC = start

if AlphaAPI then 
    START_FUNC()
else if not __alphaInit then
    __alphaInit = {}
end 

__alphaInit[#__alphaInit + 1] = START_FUNC

end