--[=====[
[[SND Metadata]]
author: Nar
version: 0.0.1
description: "Prepare maps"

configs:
  loot:
    default: "pass"
    description: Loot pass - need
  gearset:
    default: 0
    description : GearsSet
[[End Metadata]]
--]=====]




require "NonuLualib"

local loot = Config.Get("loot")
local gearset = Config.Get("gearset")

yield("/fulf on")
yield("/fulf "..loot)
yield("/gearset change "..gearset)
Sleep(1)
yield("/li Spriggan")
WaitForLifestream()
yield("/li Limsa Lominsa")
WaitForLifestream()

yield("/rotation auto big")
yield("/bmrai on")


