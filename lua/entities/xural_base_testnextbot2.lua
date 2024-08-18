--Don't Touch--
AddCSLuaFile()
if !XuralBase||!Xural_X then return end
--Set--
ENT['SpawnModel']={"models/Humans/Group01/male_02.mdl"}
ENT['SpawnName']={'Xural Base Test NPC2'}
ENT['SpawnDeathNoticeName']={'Xural Base Test NPC2'}
ENT['SpawnHealth']={114514}
ENT['DoMeleedmgRange']=10000000000
ENT['MeleedmgRange']=10000000000
ENT['X_Class']={'xural_base_testnextbot2'}
ENT['X_Category']={'Xural_X Base'}
ENT['X_AdminOnly']=true
ENT['MeleeAtkAct']={ACT_MELEE_ATTACK_SWING}
ENT['DoDamageDebug']=function(a,b)
	hook.Run('Xural_SafeRemove',a,a)--let attacker kill himself
	print('DamageDebugTest')--output
end
ENT['Faction']='FACTION_X_TESTNPC3'
ENT['Base']=unpack({'xural_base'})
ENT['Type']=unpack({'nextbot'})
ENT['UseDeathRagdoll']=false
ENT['UseDeathNotice']=false
--Register--
Xural_X.X_AddNextBot(ENT)