--Don't Touch--
AddCSLuaFile()
if !XuralBase||!Xural_X then return end
--Set--
ENT['SpawnModel']={"models/Zombie/Classic.mdl"}
ENT['SpawnName']={'Xural Base Test NPC3 - Zombine'}
ENT['SpawnDeathNoticeName']={'Xural Base Test NPC3 - Zombine'}
ENT['DieSounds']={'Zombie.Die'}
ENT['SpawnSounds']={''}
ENT['FindEnemySounds']={'Zombie.Alert'}
ENT['IdleSounds']={'Zombie.Idle'}
ENT['TakeDamageSounds']={'Zombie.Attack'}
ENT['TakeDamageRightSounds']={'Zombie.AttackHit'}
ENT['InjuredSounds']={'Zombie.Pain'}
ENT['SpawnHealth']={100}
ENT['DoMeleedmgRange']=50
ENT['MeleedmgRange']=70
ENT['BloodColor']={BLOOD_COLOR_GREEN}
ENT['X_Class']={'xural_base_zombine'}
ENT['X_Category']={'Xural_X Base'}
ENT['X_AdminOnly']=true
ENT['MeleeAtkAct']={ACT_MELEE_ATTACK1}
ENT['MeleeDamageType']=DMG_SLASH
ENT['WalkAct']=ACT_WALK
ENT['RunAct']=ACT_WALK
ENT['MeleeDamage']=math.random(10,20)
ENT['MeleeAtkTime']=1
ENT['MeleeAtkTimeDelay']=2
ENT['WalkSpeed']=50
ENT['ChaseSpeed']=70
ENT['CanJump']=false
ENT['Faction']='FACTION_X_TESTNPC4'
ENT['Base']=unpack({'xural_base'})
ENT['Type']=unpack({'nextbot'})
ENT['PlayerEnemy']=true
ENT['UseDeathRagdoll']=true
ENT['UseDeathNotice']=true
--Xural_X.X_AddFuncCallback(ENT,'CtEnemyReason',PassT,function(a,b)
	--Try # && means and, || means or, ! means not 
	--return (a:IsNPC()||a:IsNextBot()&&a!=b&&!Xural_X['CheckFaction'](a,b)||(!Xural_X['AiIgnoreplayers']()&&a:IsPlayer()&&a:Alive()))
--end)
--Register--
Xural_X.X_AddNextBot(ENT)