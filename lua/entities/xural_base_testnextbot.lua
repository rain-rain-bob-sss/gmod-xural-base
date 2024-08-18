--Don't Touch--
AddCSLuaFile()
if !XuralBase||!Xural_X then return end
--Set--
ENT['SpawnModel']={"models/Humans/Group01/male_09.mdl"}
ENT['SpawnName']={'Xural Base Test NPC'}
ENT['SpawnDeathNoticeName']={'Xural Base Test NPC'}
ENT['SpawnHealth']={100}
ENT['X_Class']={'xural_base_testnextbot'}
ENT['X_Category']={'Xural_X Base'}
ENT['X_AdminOnly']=true
ENT['MeleeAtkAct']={ACT_MELEE_ATTACK_SWING}
ENT['Faction']='FACTION_X_TESTNPC2'
ENT['Base']=unpack({'xural_base'})
ENT['Type']=unpack({'nextbot'})
--Register--
Xural_X.X_AddNextBot(ENT)