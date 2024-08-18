--[[
    may u c some error like this,just reload ur map,may u recode this file caused this error
    [xural base] addons/xural base/lua/xural_base_init!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!/meta_______meta.lua:132: attempt to concatenate field 'SpawnName' (a nil value)
  1. v - addons/xural base/lua/xural_base_init!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!/meta_______meta.lua:132
   2. Run - lua/includes/modules/hook.lua:96
    3. v - addons/xural base/lua/xural_base_init!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!/meta_______meta.lua:102
     4. unknown - lua/includes/modules/hook.lua:96 (x2)
]]
--Don't Touch--
AddCSLuaFile()
if !XuralBase||!Xural_X then return end
local Oldpos
local Col
include('xural_base_init/meta.lua')
AddCSLuaFile('xural_base_init/meta.lua')
CreateConVar("xural_x_noragdoll", 0, FCVAR_NONE, "", 0, 100)
--Set--
ENT['SpawnModel']={}
ENT['SpawnName']={}
ENT['SpawnDeathNoticeName']={}
ENT['SpawnHealth']={}
ENT['SpawnColor']={}
ENT['BloodColor']={}
ENT['SpawnMaterial']={}
ENT['SpawnModelScale']={}
--Sounds--
ENT['DieSounds']={}
ENT['SpawnSounds']={}
ENT['FindEnemySounds']={}
ENT['IdleSounds']={}
ENT['TakeDamageSounds']={}
ENT['TakeDamageRightSounds']={}
ENT['InjuredSounds']={}
--Melee Attack-
ENT['DoMeleedmgRange']=100
ENT['MeleedmgRange']=100
ENT['MeleeDamage']=100
ENT['MeleeDamageType']=0
ENT['MeleeAtkTime']=0.8
ENT['MeleeAtkTimeDelay']=0.8
ENT['MeleeAtkAct']={ACT_MELEE_ATTACK_SWING}
--RunAct--
ENT['JumpHeight']={}
ENT['CanJump']=unpack({false})
ENT['WalkAct']=ACT_WALK
ENT['RunAct']=ACT_RUN
ENT['IdelAct']=ACT_IDLE
ENT['JumpAct']=ACT_JUMP
ENT['BackLandAct']=ACT_WALK
ENT['WalkSpeed']=100
ENT['ChaseSpeed']=180
--Others--
ENT['X_Enemy']=nil --don't touch this
ENT['X_Class']={} --your file name
ENT['X_Category']={} --or 'Other'
ENT['CollisionBounds']=Vector(10, 10, 72)
ENT['DieRemoveDelay']=0
ENT['Faction']='FACTION_X_TESTNPC'
ENT['X_AdminOnly']=unpack({true})
ENT['UseDeathRagdoll']=unpack({true})
ENT['UseDeathNotice']=unpack({true})
ENT['IsXuralNextBot']=unpack({true})
ENT['IsXuralEntity']=unpack({true})
ENT['PlayerEnemy']=unpack({false})
ENT['NoDissolve']=unpack({false})
ENT['Base']=unpack({'base_nextbot'})
ENT['Type']=unpack({'nextbot'})
ENT['MaxFindEnemyLength']=1e9
ENT['AttackNextBot']=true
ENT['AttackNPC']=true
--CustomInit--
Xural_X['X_AddFuncCallback'](ENT,'CtInit',PassT,function(a)end)
Xural_X['X_AddFuncCallback'](ENT,'_BaseInit',PassT,function(a)end)
Xural_X['X_AddFuncCallback'](ENT,'CtMelee',PassT,function(a,b,c,d,e)
    if a['DoDamageDebug'] then
        a['DoDamageDebug'](b,d)
    end
    local dmginfo = DamageInfo()
    local c = c or b
    Xural_X['oldCdmginfo'].SetAttacker(dmginfo,b)
    Xural_X['oldCdmginfo'].SetInflictor(dmginfo,c)
    Xural_X['oldCdmginfo'].SetDamage(dmginfo,e['dmg'] or 100)
    Xural_X['oldCdmginfo'].SetDamageType(dmginfo,e['dmgtype'] or 0)
    Xural_X['oldCdmginfo'].SetDamageForce(dmginfo,e['dmgforce'] or Vector(0,0,0))
    Xural_X['oldCdmginfo'].SetDamagePosition(dmginfo,e['dmgpos'] or Vector(0,0,0))
    Xural_X['oldemt'].TakeDamageInfo(d,dmginfo)
end)
/*Xural_X['X_AddFuncCallback'](ENT,'CtRange',PassT,function(a)end)*/ --No
Xural_X['X_AddFuncCallback'](ENT,'Initialize',PassT,function(a)
    table.insert(Xural_Entities,a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        if a['Omniscient']then a['MaxFindEnemyLength']=2147483647 end
        //local D = {string.format("models/Humans/Group01/male_0%d.mdl",math.random(1,9))} because ragdoll model bug
        __setXValue(a,'X_IsIniting',true)
        a['CtInit'](a)
        a['_BaseInit'](a)
        if SERVER then
            Xural_X['Tm'].Simple(0,function()
                Xural_X['oldnbmt'].StartActivity(a,a['IdelAct']||ACT_IDLE)
            end)
            Xural_X['oldemt'].EmitSound(a,a['SpawnSounds'][math.random(1,#a['SpawnSounds'])] or 'hi.mp3')
            local m = math.random(1,9)
            Xural_X['oldemt'].SetBloodColor(a,a['BloodColor'][math.random(1,#a['BloodColor'])] or BLOOD_COLOR_RED)
            Xural_X['oldemt'].SetModel(a,a['SpawnModel'][math.random(1,#a['SpawnModel'])] or "models/Humans/Group01/male_07.mdl")
            Xural_X['oldemt'].SetModelScale(a,a['SpawnModelScale'][math.random(1,#a['SpawnModelScale'])] or 1)
            Xural_X['oldemt'].SetMaxHealth(a,a['SpawnHealth'][math.random(1,#a['SpawnHealth'])] or unpack({100}))
            Xural_X['oldemt'].SetHealth(a,a['SpawnHealth'][math.random(1,#a['SpawnHealth'])] or unpack({100}))
            Xural_X['oldemt'].SetColor(a,a['SpawnColor'][math.random(1,#a['SpawnColor'])] or unpack({Color(255,255,255,255)}))
            Xural_X['oldemt'].SetMaterial(a,a['SpawnMaterial'][math.random(1,#a['SpawnMaterial'])] or unpack({''}))
            if Xural_X['Big_G'].isvector(a['CollisionBounds']) then
                Xural_X['oldemt'].SetCollisionBounds(a,Xural_X['oldVector'](a['CollisionBounds']['x'],a['CollisionBounds']['y'],a['CollisionBounds']['z']),Xural_X['oldVector'](-a['CollisionBounds']['x'],-a['CollisionBounds']['y'],0))
            else
                Xural_X['oldemt'].SetCollisionBounds(a,a:GetModelBounds())
            end
            --[[
            a:AddCallback("PhysicsCollide", function(b,data)
                local k='HitEntity'
                local physent=data[k]
                if !HardcheckV(physent) then return end
                if Xural_X['oldemt'].GetClass(physent)=="prop_combine_ball" then
                    if Xural_X['oldemt'].IsFlagSet(b,FL_DISSOLVING) then return end
                    if HardcheckV(b) then
                        local dmg = DamageInfo()
                        local owner = physent:GetOwner()||physent
                        Xural_X['oldCdmginfo'].SetAttacker(dmg,owner)
                        Xural_X['oldCdmginfo'].SetInflictor(dmg,physent)
                        Xural_X['oldCdmginfo'].SetDamage(dmg,1145)
                        Xural_X['oldCdmginfo'].SetDamageType(dmg,DMG_DISSOLVE)
                        Xural_X['oldCdmginfo'].SetDamageForce(dmg,physent:GetVelocity())
                        b:TakeDamageInfo(dmg)
                    end
                    physent:EmitSound("NPC_CombineBall.KillImpact")
                end
            end)]]
        else
            Xural_X['Lg'].Add(unpack(a['X_Class']) or 'xural_base',unpack(a['SpawnDeathNoticeName']) or 'Xural Base NPC')
        end
        __setXValue(a,'X_IsIniting',false)
    end
end)
--CustomThink--
Xural_X['X_AddFuncCallback'](ENT,'CtThink',PassT,function(a)end)
Xural_X['X_AddFuncCallback'](ENT,'_BaseThink',PassT,function(a)end)
Xural_X['X_AddFuncCallback'](ENT,'Think',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        timer.Simple(a['DieRemoveDelay'],function()
            if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
                Oldpos=Xural_X['oldemt'].GetPos(a)
                Col=Xural_X['oldemt'].GetColor(a)
            end
        end)
        for k,v in pairs(Xural_X['Es'].FindInSphere(a:GetPos(),(50)))do
            if v:GetClass()=='prop_combine_ball'then
                if SERVER and !v[a]and!a['NoDissolve'] then
                    a['ShouldDissolveRag']=true
                    Xural_X['oldemt'].TakeDamage(a,100,v:GetOwner()||v)
                    local ents_forcollision=Xural_X['Es'].Create('prop_ragdoll')
                    if ents_forcollision then
                        ents_forcollision['IsXuralEntity']=true
                        ents_forcollision[a]=true
                        if Col==Color(255,255,255,255)then Col=a['SpawnColor'][math.random(1,#a['SpawnColor'])]||Color(255,255,255,255)end
                        Xural_X['oldemt'].SetColor(ents_forcollision,Col)
                        Xural_X['oldemt'].SetMaterial(ents_forcollision,Xural_X['oldemt'].GetMaterial(a))
                        Xural_X['oldemt'].SetModel(ents_forcollision,Xural_X['oldemt'].GetModel(a))
                        Xural_X['oldemt'].SetModelScale(ents_forcollision,Xural_X['oldemt'].GetModelScale(a))
                        Xural_X['oldemt'].SetAngles(ents_forcollision,Xural_X['oldemt'].GetAngles(a))
                        Xural_X['oldemt'].Spawn(ents_forcollision)
                        Xural_X['oldemt'].SetPos(ents_forcollision,v:GetPos()+v:GetVelocity())
                        Xural_X['oldemt'].SetNoDraw(ents_forcollision,true)
                        Xural_X['oldemt'].DrawShadow(ents_forcollision,false)
                        for i=1,50 do
                            Xural_X['oldemt'].SetSubMaterial(ents_forcollision,i,Xural_X['oldemt'].GetSubMaterial(a,i))
                        end
                        for ic = 0, ents_forcollision:GetPhysicsObjectCount()-1 do
                            local bone=Xural_X['oldemt'].GetPhysicsObjectNum(ents_forcollision,ic)
                            local pos,ang=Xural_X['oldemt'].GetBonePosition(a,Xural_X['oldemt'].TranslatePhysBoneToBone(ents_forcollision,ic))
                            Xural_X['oldPhysObj'].SetAngles(bone,ang)
                            Xural_X['oldPhysObj'].SetPos(bone,pos)
                        end
                        timer.Simple(0.2,function()
                            ents_forcollision:Remove()
                        end)
                    end
                    timer.Simple(0.1,function()
                        v[a]=true
                        a['ShouldDissolveRag']=false
                    end)
                    --[[
                    if Xural_X['oldemt'].Health(a)>100&&!a['NoDissolve'] then
                        Xural_X['Dissolve'](a,3,1)
                    end
                    --]]
                end
            end
        end
    end
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot']&&!Xural_X['AiDisabled']() then
        __setXValue(a,'X_IsThinking',true)
        a['CtThink'](a)
        a['_BaseThink'](a)
        if math.random(1,(a['IdleSounds%'] or 900))==(a['IdleSounds%2'] or 42)then
            Xural_X['oldemt'].EmitSound(a,a['IdleSounds'][math.random(1,#a['IdleSounds'])] or '')
        end
        for k,v in pairs(Xural_X['Es'].FindInSphere(a:GetPos(),(a['DoMeleedmgRange'] or 100)))do
            if a['NoAtk']then break end
            if IsValid(a)&&IsValid(a['GetEnemy'](a))&&v!=a&&!Xural_X['CheckFaction'](a,v)&&!Xural_X['CheckFaction'](v,a)&&Xural_X['Big_G'].isentity(v)&&IsValid(v)&&v==a['GetEnemy'](a) then
                a['MeleeDamagePos']=a:GetPos()
                a['MeleeDamageForce']=v:GetPos()+Vector(0,0,100)
                if Xural_X['oldnbmt'].StartActivity then
                    if a['MeleeAtkAct']then
                        Xural_X['oldnbmt'].StartActivity(a,a['MeleeAtkAct'][math.random(1,#a['MeleeAtkAct'])])
                    end
                    Xural_X['oldemt'].EmitSound(a,a['TakeDamageSounds'][math.random(1,#a['TakeDamageSounds'])] or '')
                    a['NoAtk']=true
                    Xural_X['Tm'].Simple(a['MeleeAtkTimeDelay']||2,function()
                        a['NoAtk']=false
                    end)
                    Xural_X['Tm'].Simple(a['MeleeAtkTime']||0.8,function()
                        if IsValid(a) then
                            a['NoAtk']=false
                            for t,e in pairs(Xural_X['Es'].FindInSphere(a:GetPos(),(a['MeleedmgRange'] or 100)))do
                                if !Xural_X['CheckFaction'](a,e)&&Xural_X['Big_G'].isentity(e)&&IsValid(a)&&IsValid(e)&&e!=a then
                                    if Xural_X['CheckNPCNextBotPlayer'](a) then
                                        Xural_X['oldemt'].EmitSound(e,a['TakeDamageRightSounds'][math.random(1,#a['TakeDamageRightSounds'])] or table.Random({'humenpunch_01.mp3','humenpunch_02.mp3','humenpunch_03.mp3','humenpunch_04.mp3','humenpunch.mp3'}))
                                    end
                                    a['CtMelee'](a,a,e,e,a['MeleedmgTable']||{dmg=a['MeleeDamage']||100,dmgtype=a['MeleeDamageType']||0,dmgforce=a['MeleeDamageForce']||a:GetPos(),dmgpos=a['MeleeDamagePos']||v:GetPos()+Vector(0,0,100)})
                                end
                            end
                            Xural_X['oldnbmt'].StartActivity(a,a['RunAct']||ACT_RUN)
                        end
                    end)
                end
            end
            __setXValue(a,'X_IsThinking',false)
        end
    end
end)
--CustomOnRemove--
Xural_X['X_AddFuncCallback'](ENT,'CtRm',PassT,function(a)end)
Xural_X['X_AddFuncCallback'](ENT,'_BaseRm',PassT,function(a)end)
Xural_X['X_AddFuncCallback'](ENT,'OnRemove',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        __setXValue(a,'X_IsRemoving',true)
        a['CtRm'](a)
        a['_BaseRm'](a)
        __setXValue(a,'X_IsRemoving',false)
    end
end)
--CustomOnKilled--
Xural_X['X_AddFuncCallback'](ENT,'CtKd',PassT,function(a,d)end)
Xural_X['X_AddFuncCallback'](ENT,'_BaseKd',PassT,function(a,d)end)
Xural_X['X_AddFuncCallback'](ENT,'OnKilled',PassT,function(a,d)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        __setXValue(a,'X_IsKilling',true)
        a['CtKd'](a,d)
        a['_BaseKd'](a,d)
        if a['UseDeathRagdoll'] then
            --local burntypes={2,64,8,2097152,134217728,1024,1048576,262144,16777216,33558592,100663296}--
            --local dissolvetypes={67108864,1024,256,33558592,100663296}--
            --if --[[burntypes[Xural_X['oldCdmginfo'].GetDamageType(d)}]] then
                --Xural_X['oldemt'].Ignite(rag,20)
            --end
            Xural_X['Tm'].Simple(a['DieRemoveDelay']||0,function()
                local rag=Xural_X['Es'].Create('prop_ragdoll')
                if rag then
                    rag['IsXuralEntity']=true
                    rag[a]=true
                    Xural_X['oldemt'].SetNoDraw(rag,true)
                    if Col==Color(255,255,255,255)then Col=a['SpawnColor'][math.random(1,#a['SpawnColor'])]||Color(255,255,255,255)end
                    Xural_X['oldemt'].SetColor(rag,Col)
                    Xural_X['oldemt'].SetMaterial(rag,Xural_X['oldemt'].GetMaterial(a))
                    Xural_X['oldemt'].SetModel(rag,Xural_X['oldemt'].GetModel(a))
                    Xural_X['oldemt'].SetModelScale(rag,Xural_X['oldemt'].GetModelScale(a))
                    Xural_X['oldemt'].SetAngles(rag,Xural_X['oldemt'].GetAngles(a))
                    Xural_X['oldemt'].Spawn(rag)
                    Xural_X['oldemt'].SetPos(rag,Oldpos)
                    Xural_X['oldemt'].SetNoDraw(rag,false)
                    Xural_X['oldemt'].SetVelocity(rag,Xural_X['oldemt'].GetVelocity(a))
                    Xural_X['Ud'].ReplaceEntity(a, rag)
                    Xural_X['Cp'].ReplaceEntity(a, rag)
                    for i=1,50 do
                        Xural_X['oldemt'].SetSubMaterial(rag,i,Xural_X['oldemt'].GetSubMaterial(a,i))
                    end
                    for ic = 0, rag:GetPhysicsObjectCount()-1 do
                        local bone=Xural_X['oldemt'].GetPhysicsObjectNum(rag,ic)
                        local pos,ang=Xural_X['oldemt'].GetBonePosition(a,Xural_X['oldemt'].TranslatePhysBoneToBone(rag,ic))
                        Xural_X['oldPhysObj'].SetAngles(bone,ang)
                        Xural_X['oldPhysObj'].SetPos(bone,pos)
                    end
                    --[[
                    if dissolvetypes[Xural_X['oldCdmginfo'].GetDamageType(d)Xural_X['oldCdmginfo'].GetDamageType(d)==DMG_DISSOLVE then
                        Xural_X['Dissolve'](rag,1,1)
                    end
                    --]]
                    if Xural_X['Big_G'].GetConVar("xural_x_noragdoll"):GetFloat()==1 then
                        Xural_X['oldemt'].Remove(rag)
                    end
                    if a['ShouldDissolveRag'] then
                        Xural_X['Dissolve'](rag,3,1)
                    end
                end
            end)
        end
        //GAMEMODE:AddDeathNotice(Xural_X['oldCdmginfo'].GetAttacker(d)['PrintName']||Xural_X['oldemt'].GetClass(Xural_X['oldCdmginfo'].GetAttacker(d)),-1,Xural_X['oldemt'].GetClass(Xural_X['oldCdmginfo'].GetInflictor(d)),a['PrintName'],-1)
        if a['UseDeathNotice'] then
            Xural_X['Big_G'].hook.Call( "OnNPCKilled", GAMEMODE, a, Xural_X['oldCdmginfo'].GetAttacker(d),Xural_X['oldCdmginfo'].GetInflictor(d) )
        end
        Xural_X['Tm'].Simple(a['DieRemoveDelay']||0,function()
            if HardcheckV(a)then
                Xural_X['Big_G'].hook.Run('Xural_SafeRemove',a)
            end
        end)
        Xural_X['oldemt'].EmitSound(a,a['DieSounds'][math.random(1,#a['DieSounds'])] or table.Random({'humendie_01.mp3','humendie_02.mp3','humendie_03.mp3'}))
        __setXValue(a,'X_IsKilling',false)
    end
end)
--CustomOnInjured--
Xural_X['X_AddFuncCallback'](ENT,'CtJd',PassT,function(a,b)end)
Xural_X['X_AddFuncCallback'](ENT,'_BaseJd',PassT,function(a,b)end)
Xural_X['X_AddFuncCallback'](ENT,'OnInjured',PassT,function(a,b)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        __setXValue(a,'X_IsInjurling',true)
        a['CtJd'](a,b)
        a['_BaseJd'](a,b)
        Xural_X['oldemt'].EmitSound(a,a['InjuredSounds'][math.random(1,#a['InjuredSounds'])] or '')
        __setXValue(a,'X_IsInjurling',false)
    end
end)
Xural_X['X_AddFuncCallback'](ENT,'AcceptInput',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        return(true)
    end
end)
Xural_X['X_AddFuncCallback'](ENT,'HasEnemy',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        local enemy = a['GetEnemy'](a)
        if IsValid(enemy)&&!Xural_X['CheckFaction'](a,enemy)&&!Xural_X['CheckFaction'](enemy,a) then
            if !(IsValid(enemy)) then
                return a['FindEnemy'](a)
            end
            return true
        else
            return a['FindEnemy'](a)
        end
    end
end)

--Xural_X['X_AddFuncCallback'](ENT,'CtEnemyReason',PassT,function(a)
    --[[
    Yeah you can Add your FindEnemyFunction like this
    return (ent:IsNPC()||ent:IsNextBot()&&ent!=a&&!Xural_X['CheckFaction'](a,ent)||(!Xural_X['AiIgnoreplayers']()&&a['PlayerEnemy']&&ent:IsPlayer()&&ent:Alive()))
    ]]
    --return false
--end)--no
Xural_X['X_AddFuncCallback'](ENT,'FindEnemy',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        local enemies = Xural_X['Es'].FindInSphere(a:GetPos(), a['MaxFindEnemyLength']||512)
        for k, v in pairs(enemies) do
            if(a['HardEnemyReason']&&a['HardEnemyReason'](a,v))||(HardcheckV(v)&&(a['CtNoEnemyReason']&&!a['CtNoEnemyReason'](a,v)||true)&&!Xural_X['CheckFaction'](a,v)&&!Xural_X['CheckFaction'](v,a)&&v!=a&&v:IsNextBot()&&a['AttackNextBot']||v:IsNPC()&&a['AttackNPC']||(v:IsPlayer()&&a['PlayerEnemy']&&!Xural_X['AiIgnoreplayers']()&&v:Health()>0))then
                a['SetEnemy'](a,v)
                Xural_X['oldemt'].EmitSound(a,a['FindEnemySounds'][math.random(1,#a['FindEnemySounds'])]||'')
                return true
            end
        end
        a['SetEnemy'](a,nil)
        return false
    end
end)
Xural_X['X_AddFuncCallback'](ENT,'SetEnemy',PassT,function(a,b)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        a['X_Enemy'] = b
    end
end)
Xural_X['X_AddFuncCallback'](ENT,'GetEnemy',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        return a['X_Enemy']
    end
end)
Xural_X['X_AddFuncCallback'](ENT,'ChaseEnemy',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        if not IsValid(a['GetEnemy'](a)) then return end
        a['path'] = Xural_X['Big_G'].Path('Follow')
        Xural_X['oldPathFollwer'].SetMinLookAheadDistance(a['path'],300)
        Xural_X['oldPathFollwer'].SetGoalTolerance(a['path'],20)
        Xural_X['oldPathFollwer'].Compute(a['path'],a,a['GetEnemy'](a):GetPos())
        if !IsValid(a['path']) then return 'failed' end
        while a['HasEnemy'](a) do
            if Xural_X['oldPathFollwer'].GetAge(a['path']) > 0.1 then
                Xural_X['oldPathFollwer'].Compute(a['path'],a,Xural_X['oldemt'].GetPos(a['GetEnemy'](a)))
            end
            Xural_X['oldPathFollwer'].Update(a['path'],a)
            if Xural_X['oldCLoco'].IsStuck(a['loco']) then
                a['HandleStuck'](a)
            end
            if a['CanJump']then
                if (Xural_X['oldemt'].GetPos(a['GetEnemy'](a)).z-(Xural_X['oldemt'].GetPos(a)).z)>100 then
                    a['loco']:SetJumpHeight(a['JumpHeight'][math.random(1,#a['JumpHeight'])]||100)
                    a['loco']:JumpAcrossGap(Xural_X['oldemt'].GetPos(a['GetEnemy'](a)),Xural_X['oldemt'].GetPos(a['GetEnemy'](a)))
                    a['loco']:FaceTowards(Xural_X['oldemt'].GetPos(a['GetEnemy'](a)))
                end
            end
            coroutine['yield']()
          end
        return "ok"
    end
end)
Xural_X['X_AddFuncCallback'](ENT,'OnLandOnGround',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        a:StartActivity(a['JumpAct']||ACT_JUMP)
    end
end)
Xural_X['X_AddFuncCallback'](ENT,'OnLeaveGround',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        a:StartActivity(a['BackLandAct']||ACT_WALK)
    end
end)
Xural_X['X_AddFuncCallback'](ENT,'HandleStuck',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        Xural_X['Tm'].Simple(3,function()
            if IsValid(a) then
                Xural_X['oldemt'].SetPos(a,Xural_X['oldemt'].GetPos(a)+Vector(math.random(1,5),math.random(1,5),math.random(1,5)))
                if Xural_X['oldCLoco'].IsStuck(a['loco']) then  Xural_X['oldemt'].SetPos(a,Vector(0,0,0)) end
                Xural_X['oldCLoco'].ClearStuck(a['loco'])
            end
        end)
    end
end)
Xural_X['X_AddFuncCallback'](ENT,'ResetBehavethread',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        Xural_X['Behavethread'][a]=nil
    end
end)
Xural_X['X_AddFuncCallback'](ENT,'BehaveStart',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        Xural_X['Behavethread'][a]=coroutine['create'](function()
            a['RunBehaviour'](a)
        end)
    end
end)
Xural_X['X_AddFuncCallback'](ENT,'BehaveUpdate',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        if !Xural_X['Behavethread'][a]||Xural_X['AiDisabled']()then return end
        if coroutine['status'](Xural_X['Behavethread'][a]) == "dead" then
            Xural_X['Behavethread'][a] = nil
            return
        end
        local ok, message = coroutine['resume'](Xural_X['Behavethread'][a])
        if ok == false then
            Xural_X['Behavethread'][a] = nil
            ErrorNoHalt(a, ' Error: ', message, '\n')
        end
    end
end)
Xural_X['X_AddFuncCallback'](ENT,'RunBehaviour',PassT,function(a)
    if HardcheckV(a)&&a['IsXuralEntity']&&a['IsXuralNextBot'] then
        while ( !a['CtRunBehaviour'] ) do
            if a:HasEnemy() and a['GetEnemy'](a) then
                if a['RunAct']then
                    Xural_X['oldnbmt'].StartActivity(a,a['RunAct']||ACT_RUN)
                end
                Xural_X['oldCLoco'].SetDesiredSpeed(a['loco'],a['ChaseSpeed']||math.random(180,200))
                Xural_X['oldCLoco'].SetAcceleration(a['loco'],a['ChaseSpeed']||math.random(180,200))
                a['ChaseEnemy'](a)
                if a['IdelAct']then
                    Xural_X['oldnbmt'].StartActivity(a,a['IdelAct']||ACT_IDLE)
                end
            else
                if a['WalkAct']then
                    Xural_X['oldnbmt'].StartActivity(a,a['WalkAct']||ACT_WALK)
                end
                Xural_X['oldCLoco'].SetAcceleration(a['loco'],a['WalkSpeed']||math.random(100,110))
                Xural_X['oldCLoco'].SetDesiredSpeed(a['loco'],a['WalkSpeed']||math.random(100,110))
                a:MoveToPos(Xural_X['oldemt'].GetPos(a) + Vector(_G['math']['Rand'](-1, 1), _G['math']['Rand'](-1, 1), 0) * _G['math']['Rand'](_G['math']['Rand'](0,2000),_G['math']['Rand'](0,20)))
                if a['IdelAct']then
                    Xural_X['oldnbmt'].StartActivity(a,a['IdelAct']||ACT_IDLE)
                end
            end
            if Xural_X['oldCLoco'].IsStuck(a['loco']) then
                a['HandleStuck'](a)
            end
            coroutine['yield']()
        end
        a['CtRunBehaviour'](a)
    end
end)
ENT['GetNearestTarget']=ENT['GetEnemy']