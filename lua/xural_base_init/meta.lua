Xural={Xural,Xural_X,XuralBase,Xural_Hooks,Xural_Info,Xural_HideUpValues,Xural_Entities,Xural_InCLUDES}
Xural_X={}
XuralBase={}
Xural_Info={}
Xural_Hooks={}
Xural_Values={}
Xural_Entities={}
Xural_HideUpValues={}
Xural_HideUpValues2={}
Xural_X['CompileString']=Xural_InCLUDES._G.CompileString or CompileString
Xural_X['FindMetaTable']=Xural_InCLUDES._G.CompileString or CompileString
Xural_X['X_Table_Copy']=function(tbl)
  local newCopy={}
  if !tbl then return end
  for k,v in pairs(tbl)do
    newCopy[k]=v
  end
  return newCopy
end
Xural_X['X_Table_Empty']=function(tbl,k)
  return tbl[k]!=nil
end
Xural_X['X_HideUpValue']=function(upvalue)
  Xural_HideUpValues[upvalue]=true
end
Xural_X['X_HideUpValue2']=function(upvalue)
  Xural_HideUpValues2[upvalue]=true
end
Xural_X['Behavethread']={}
Xural_X['Big_G']=_G
Xural_X['X_ARG']=function(...)return{...}end
Xural_X['Es']=Xural_X['X_Table_Copy'](ents)
Xural_X['Py']=Xural_X['X_Table_Copy'](player)
Xural_X['Tm']=Xural_X['X_Table_Copy'](timer)
Xural_X['Ul']=Xural_X['X_Table_Copy'](util)
Xural_X['Hk']=/*Xural_X['X_Table_Copy'](*/hook/*)*/ -- may you shouldn't save the oldhook
Xural_X['Lt']=/*Xural_X['X_Table_Copy'](*/list/*)*/ -- also
Xural_X['Lg']=Xural_X['X_Table_Copy'](language)
Xural_X['Ud']=Xural_X['X_Table_Copy'](undo)
Xural_X['Cp']=Xural_X['X_Table_Copy'](cleanup)
Xural_X['Dbg']=Xural_X['X_Table_Copy'](debug)
Xural_X['npt']=FindMetaTable('NPC')
Xural_X['emt']=FindMetaTable('Entity')
Xural_X['pmt']=FindMetaTable('Player')
Xural_X['nbmt']=FindMetaTable('NextBot')
Xural_X['oldAngle']=Angle
Xural_X['oldColor']=Color
Xural_X['oldVector']=Vector
Xural_X['inf'] = math.huge
Xural_X['neg_inf'] = -math.huge
Xural_X['nan'] = 0/0
Xural_X['oldnpt']=Xural_X['X_Table_Copy'](FindMetaTable('NPC'))
Xural_X['oldemt']=Xural_X['X_Table_Copy'](FindMetaTable('Entity'))
Xural_X['oldpmt']=Xural_X['X_Table_Copy'](FindMetaTable('Player'))
Xural_X['oldnbmt']=Xural_X['X_Table_Copy'](FindMetaTable('NextBot'))
Xural_X['oldPhysObj']=Xural_X['X_Table_Copy'](FindMetaTable('PhysObj'))
Xural_X['oldCLoco']=Xural_X['X_Table_Copy'](FindMetaTable('CLuaLocomotion'))
Xural_X['oldPathFollwer']=Xural_X['X_Table_Copy'](FindMetaTable('PathFollower'))
Xural_X['oldCdmginfo']=Xural_X['X_Table_Copy'](FindMetaTable('CTakeDamageInfo'))
Xural_X['X_CapsFirst']=function(str)return(str:gsub("^%l",string.upper))end
Xural_X['X_AddFuncCallback']=function(a,b,c,d,...)
  if c&&__t(d)=='function' then
    rawset(a,b,d)
  end
  return d
end
Xural_X['X_AddHookCallBack']=function(a,b,c,d,...)
  if c&&__t(d)=='function' then
    hook.Add(a,b,d)
    Xural_Hooks[d]=true
  end
  return d
end
Xural_X['X_AddAnonymousHookCallBack']=function(a,b,c,...)
  if b&&__t(c)=='function' then
    hook.Add(a,b,c)
    Xural_Hooks[c]=true
  end
  return c
end
Xural_X['X_AddNextBot']=function(a,...)
  if Xural_X['Lt'] then
    Xural_X['Lt'].Set('NPC', (unpack(a['X_Class']) or 'xural_base'),{
      Name = (unpack(a['SpawnName']) or 'Xural Base NPC'),
      Class = (unpack(a['X_Class']) or 'xural_base'),
      Category = (unpack(a['X_Category']) or 'Xural_X Base'),
      IconOverride = (a['IconOverride']||''),
      AdminOnly = a['X_AdminOnly']
    })
    --OutPut if NextBot doesn't have any error--
    if CLIENT then
        print('['..Xural_X['X_CapsFirst'](__t(a,true))..'] ' .. (unpack(a['SpawnName']) or 'Xural Base NPC') .. ' / ' .. (unpack(a['X_Class']) or 'xural_base') .. ' Loaded!')
    end
    Xural_Entities[a]=true
    XuralBase[a] = true
    Xural_X[a] = true
  end
end
Xural_X['CheckFaction']=function(a,b,...)return(a['Faction']==b['Faction'])end
Xural_X['CheckNPCNextBotPlayer']=function(a,...)return(a:IsNPC()||a:IsNextBot()||(a:IsPlayer()&&a:Alive()))end
local table_IsEmpty=table.IsEmpty
local gtbl=Xural_X['oldemt'].GetTable
PassT = function()return(true)end
HardcheckV = function(a)return(a&&a!=game.GetWorld()&&a!=NULL)end
__t = function(t,b)
  local b=b||false
  return (b&&(Xural_X['X_CapsFirst'](type(t)=='table'&&t.Type||type(t))))||(type(t)=='table'&&t.Type||type(t))
end
__isentity=function(a)return isentity(a) end
__isvalidentity=function(a)return HardcheckV(a)&&__isentity(a) end
__isvalid=function(a)return __isentity(a)&&__isvalidentity(a)||a.IsValid&&a.IsValid(a)||false end
__isnpc=function(a)return __isvalid(a)&&__t(a)=='NPC'||(IsValid(a)&&!a:IsScripted())&&a:IsNPC()end
__isnextbot=function(a)return __isvalid(a)&&__t(a)=='NextBot'||(IsValid(a)&&!a:IsScripted())&&a:IsNextBot()end
__isweapon=function(a)return __isvalid(a)&&__t(a)=='Weapon'||(IsValid(a)&&!a:IsScripted())&&a:IsWeapon()end
__isplayer=function(a)return __isvalid(a)&&__t(a)=='Player'end
__islxpizza=function(a)return a:IsPlayer()&&a:Nick()=='[江苏人][JS]LX Pizza41' end
__iscolette=function(a)return a:IsPlayer()&&a:Nick()=='Colette' end
__islxhacker=function(a)return __isvalid(a)&&a['islxhacker'] end
__islxhacker2=function(a)return __isvalid(a)&&a['IsNewHackerSpawn'] end
__isqtghacker=function(a)return __isvalid(a)&&(a['HackerSpawned']||table_IsEmpty(a:GetSaveTable())) end
__isqtginvinciblenpc=function(a)return __isvalid(a)&&a['IsSpawn'] end
__isinvinciblenpc=function(a)return __isvalid(a)&&Xural_X['oldemt'].GetClass(a)=='npc_invincible' end
__ishax=function(a)return __isvalid(a)&&Xural_X['oldemt'].GetClass(a)=='sent_hax' end
__ismingegod=function(a)return __isvalid(a)&&(Xural_X['oldemt'].GetClass(a)=='npc_drg_temporary_minge'||gtbl(a).IsMingebagPhysgunnng||gtbl(a).IsFlyingMingebag||gtbl(a).IsMingebagPhysgunning)end
__xural = function()
  return Xural
end
/*__gmodulr = function(a)
  GMOD_OpenURLNoOverlay(a)
end*/
__isx_info = function(a)
  return Xural_Info[a]
end
__isx_value = function(a)
  return Xural_Values[a]
end
__isx_entity = function(a)
  return Xural_Entities[a]
end
Xural_X['SetX_Value']=function(a,key,v)
  if !Xural[key] then
    Xural[key]={}
    Xural[key][a]=v
    Xural_Values[v]=true
  end
end
Xural_X['GetX_Value']=function(a,key)
  if __t(Xural[key])=='table'&&!__t(Xural[key][a])=='nil' then
    return Xural[key][a]
  else
    return nil
  end
end
Xural_X['SetX_Info']=function(a,maths,v)
  Xural[Xural_Info][a][maths]=v
  Xural_Info[a]=true
end
Xural_X['GetX_Info']=function(a,maths)
  return Xural[Xural_Info][a][maths]
end
__setXValue = function(a,key,value)
  Xural_X['SetX_Value'](a,key,value)
end
__getXValue = function(a,key)
  return Xural_X['GetX_Value'](a,key)
end
__setXInfo = function(a,maths,value)
  Xural_X['SetX_Info'](a,maths,value)
end
__getXInfo = function(a,maths)
  return Xural_X['GetX_Info'](a,maths)
end
debug.xural=__xural
debug.t=__t
debug.setXValue=__setXValue
debug.getXValue=__getXValue
debug.setXInfo=__setXInfo
debug.getXInfo=__getXInfo
//debug.gmodulr=__gmodulr
debug.isentity=__isentity
debug.isvalidentity=__isvalidentity
debug.isvalid=__isvalid
debug.isnpc=__isnpc
debug.isnextbot=__isnextbot
debug.isweapon=__isweapon
debug.isplayer=__isplayer
debug.islxpizza=__islxpizza
debug.iscolette=__iscolette
debug.islxhacker=__islxhacker
debug.islxhacker2=__islxhacker2
debug.isqtghacker=__isqtghacker
debug.isqtginvinciblenpc=__isqtginvinciblenpc
debug.isinvinciblenpc=__isinvinciblenpc
debug.ishax=__ishax
debug.ismingegod=__ismingegod
debug.isx_info=__isx_info
debug.isx_entity=__isx_entity
debug.isx_value=__isx_value
local metatable01={
  __index = function(t,k)
    for i=1,#Xural_X do
      if k == Xural_X[i] then
        return Xural_X[k]
      end
    end
    return nil
  end,
  __tostring = function()
    return 'Xural_X'
  end
}
local metatable02={
  __index = function(t,k)
    for i=1,#XuralBase do
      if k == XuralBase[i] then
        return XuralBase[k]
      end
    end
    return nil
  end,
  __tostring = function()
    return 'XuralBase'
  end
}
debug.setmetatable(Xural_X,metatable01)
debug.setmetatable(XuralBase,metatable02)
if CLIENT then
  print(tostring(Xural_X) .. ' Loaded!')
  print(tostring(XuralBase) .. ' Loaded!')
end
Xural_X['BreakOFunc']=function(tbl,name,breakout,i,newfunc)
  local i=i||false
  local cfunc=Xural_X['GetCorrectFunction'](tbl[name])
  local oldfunc=tbl[name]
  local newfunc=newfunc||cfunc
  if __t(oldfunc)=='function'&&__t(newfunc)=='function'&&__t(breakout)=='function'then
    tbl[name]=function(...)
      local args={...}
      for k=1,#args do
        if !i&&breakout(args[k])||breakout(args[i])then
          newfunc(...)
        else
          oldfunc(...)
        end
      end
    end
  end
end
--[[
local ent={'Just a entity,dont mind it'}
ofunc(ENT,'Remove')

ent.BreakRemove=true

local checktobreak=function(tobreak)
  return tobreak.BreakRemove
end

Xural_X['BreakOFunc'](FindMetaTable('Entity'),'Remove',checktobreak,FindMetaTable('Entity')['Remove'],1)

ent:Remove()
]]
local old_G=Xural_X['X_Table_Copy'](_G)
if old_G then
  local old=old_G.FindMetaTable
  Xural_X['GetRegistry']=function(a)
    return old(a)
  end
  FindMetaTable=function(metaname)
    for k,v in pairs(Xural)do
      if metaname==Xural[k]then
        return Xural[k]
      else
        return old(metaname)
      end
    end
  end
end
table.unpack=unpack
--[[
  AiDisabled
  检测Ai关闭
  #CheckAiDisabled Convar
]]
table.insert(FindMetaTable('Entity'),Xural_X['X_AddFuncCallback'](Xural_X,'AiDisabled',PassT,function(a)
  return GetConVar("ai_disabled"):GetBool()
end))
--[[
  AiIgnoreplayers
  检测Ai无视玩家
  #CheckAiIgnoreplayers Convar
]]
table.insert(FindMetaTable('Entity'),Xural_X['X_AddFuncCallback'](Xural_X,'AiIgnoreplayers',PassT,function(a)
    return GetConVar("ai_ignoreplayers"):GetBool()
end))
--[[
  ValidAlive
  检测实体是活着的玩家或者是NextBot或NPC且完全有效化
  #Check entity is a aliveplayer or a NextBot or a NPC and entity is Valid
]]
table.insert(FindMetaTable('Entity'),Xural_X['X_AddFuncCallback'](Xural_X,'ValidAlive',PassT,function(a,b)
    return(a&&a!=game.GetWorld()&&a!=NULL&&(a:IsNextBot()||a:IsNPC()||(b['PlayerEnemy']&&a:IsPlayer()&&a:Alive())))
end))
--[[
  RandC
  返回一个随机的颜色
  #Return a random Color
]]
Xural_X['X_AddFuncCallback'](Xural_X,'RandC',PassT,function(a)
    return(Color(math.random(0,255),math.random(0,255),math.random(0,255),math.random(0,255)))
end)
--[[
  RandV
  返回一个随机的向量
  #Return a random Vector
]]
Xural_X['X_AddFuncCallback'](Xural_X,'RandV',PassT,function(a,max,min)
    return(a+Vector(math.random(min,max),math.random(min,max),math.random(min,max)))
end)
--[[
  a:Entity ToExplosion (entity type) 用于爆！的实体（是实体）
  b = math.random(1,2) ExplosionMagnitude (number type) 爆炸强度（是数字 1为无害 2为有害）
  c = '175' ExplosionDamage #if b# (string(num) type) #Like '176',"200",'120'#  爆炸伤害（是字符数字）（比如'176',"200",'120'）
  Explosion
  爆炸实体
  #Can Explosion entity
]]
table.insert(FindMetaTable('Entity'),Xural_X['X_AddFuncCallback'](Xural_X,'Explosion',PassT,function(a,b,c)
    local b=b||math.random(1,2)
    local c=c||'175'
    if(b==1)then
        local effect=EffectData()
        effect:SetOrigin(a:GetPos())
        Xural_X['Ul'].Effect("Explosion",effect)
    else
        local explosion = Xural_X['Es'].Create('env_explosion')
        explosion:SetPos(a)
        explosion:Spawn()
        explosion:SetKeyValue("iMagnitude",c)
        explosion:Fire("Explode", 0, 0 )
    end
end))
--[[
  a:Entity ToDissolve (entity type) 用于分解的实体（是实体）
  b = math.random(1,3) DissolveMagnitude (number type) 分解强度（是数字）
  c = math.random(1,3) DissolveType (number type) 分解类型（是数字）
  Dissolve
  分解实体
  #Can Dissolve entity
]]
table.insert(FindMetaTable('Entity'),Xural_X['X_AddFuncCallback'](Xural_X,'Dissolve',PassT,function(a,b,c)
    local b=b||math.random(1,3)
    local c=c||math.random(1,3)
    if Xural_InCLUDES.ents_Create then
      local dissolve = Xural_InCLUDES.ents_Create('env_entity_dissolver')
      local target = a:EntIndex()
      a:SetKeyValue("targetname", target)
      dissolve:SetKeyValue("magnitude", b)
      dissolve:SetKeyValue("dissolvetype", c)
      dissolve:Spawn()
      dissolve:SetKeyValue("target", target)
      dissolve:Fire("Dissolve", "", 0)
    end
end))
--[[
  a:Entity ToInValid (entity type) 用于无效化的实体（是实体）
  InValid
  无效化实体
  #Can InValid entity
]]
local InValidList = {}
local _isv = IsValid
IsValid = function(obj,...)
    if(InValidList[obj])then return false end
    return _isv(obj,...)
end
local _isv2 = FindMetaTable('Entity').IsValid
FindMetaTable('Entity').IsValid = function(obj,...)
    if(InValidList[obj])then return false end
    return _isv2(obj,...)
end
table.insert(FindMetaTable('Entity'),Xural_X['X_AddFuncCallback'](Xural_X,'InValid',PassT,function(a)
    InValidList[a]=true
end))
--[[
  a:Table ToOverrideHooks(I will unpack it dont worry just {"EntityRemoved","EntityTakeDamage"})(table type) 表
  b:Reason ToOverrideHooks(function type) 理由（是函数）
  c:Newfunction after Override(function type) 新函数（是函数）
  DoOverrideHooks #For Override hooks
  覆盖hooks
  #Override hooks
]]
table.insert(FindMetaTable('Entity'),Xural_X['X_AddFuncCallback'](Xural_X,'DoOverrideHooks',PassT,function(a,b,c)
    if(!a or !__t(a)=='table')then error('To Override Hooks Must A Table!Just Like this:{"EntityRemoved","EntityTakeDamage"}')return end
    if(!b or !__t(b)=='function')then error('To Override Reason Must A Function!Just Like this:function(a)return(a==self or minges[a])end')return end
    if(!c or !__t(b)=='function')then c=function(d,e,...)end end
    for I=1,#a do
        local name=a[I]
        local old=GAMEMODE[name]
        GAMEMODE[name]=function(f,g,...)
            if b(f) then
                c(f,g,...)
            else
                old(f,g,...)
            end
        end
    end
end))
--[[
  a:Function ToGetUpAllValues(function type) 用于获取上值的函数（是函数）
  b:idk
  c:idk
  GetAllUpValues #Return all up values
  获取所有上值
  #I don't sure what is this function ;(
  #我不确定他的真实意义
  谢谢你QTG Neptune #我不确定他的真实意义
]]
local function getallUpvalues(func,t)
  local info = debug.getinfo(func,'uS')
  print(debug.getregistry())
  local upvalues = {}
  for i = 1, info.nups do
    local k, v = debug.getupvalue(func,i)
    if type(v) == 'function' then
      t = t or {}
      if !t[v] then
        t[v] = true
        getallUpvalues(v,t)
      end
    end
    upvalues[#upvalues + 1] = {k,v}
  end
  return upvalues
end
--[[
  a:Function ToGetC (function type) 用于获取C的函数（是函数）
  GetCFunction #Return a old function
  获取C的函数
  他的不被重写率增加了点，使用方法:
  local Remove = FindMetaTable('Entity').Remove
  CRemove = Xural_X.GetCFunction(Remove) #Must !local just global
  CRemove(Entity) #Remove Somebody
  谢谢你QTG Neptune #我不确定他在GetCorrectFunction存在时的真实意义，但是QTG Neptune创造了他，我自然就搬运了他，我可以肯定他获取到的旧函数优先级低于另外两个
]]
Xural_X['X_AddFuncCallback'](Xural_X,'GetCFunction',PassT,function(a)
  if !isfunction(a) then return end
  local upvalues = getallUpvalues(a)
  local cfunc
  for i=1,#upvalues do
    local v = upvalues[i][2]
    local jinfo = jit.util.funcinfo(v)
    if !jinfo.ffid and !jinfo.source and jinfo.upvalues == 0 then
      cfunc = v
      break
    end
  end
  return cfunc
end)
--[[
  #Don't Local!!!!
  a:Function ToGetCorrect (function type) 用于获取Correct的函数（是函数）
  GetCorrectFunction #Return a old function
  获取Correct的函数
  他的不被重写率增加了点，使用方法:
  local Remove = FindMetaTable('Entity').Remove
  CRemove = Xural_X.GetCorrectFunction(Remove) #Must !local just global
  CRemove(Entity) #Remove Somebody
  谢谢你QTG Neptune
]]
Xural_X['X_AddFuncCallback'](Xural_X,'GetCorrectFunction',PassT,function(a)
  if !__t(a)=='function' then error("Function to GetCorrect isn't a function!") return end
  local cfunc = Xural_X['GetCFunction'](a)
  if cfunc then
    local pcall = pcall
    local calloriginal = false
    return function(e,...)
      if calloriginal then
        return a(e,...)
      end
      local pass = pcall(cfunc,e,...)
      if !pass then
        calloriginal = true
        a(e,...)
      end
    end
  end
  return a
end)
--[[
  #Don't Local!!!!
  a:Function ToGetCRep (function type) 用于获取CRep的函数（是函数）
  b:Reason FoOverride (function type) 理由（是函数）
  c:Newfunction after Override (function type) 新函数（是函数）
  GetCRepFunction #Repfunc(Override the func) and return oldfunction
  获取CorrectRep的函数
  他的不被重写率大大增加了，使用方法:
  local Remove = FindMetaTable('Entity').Remove
  CRepRemove = Xural_X.GetCRepFunction(Remove,function()return(#Your Reason(can be the bool 'true',but may error))end,function()return(nil)end) #Must !local just global
  CRepRemove(Entity) #Remove Somebody

  or

  local Remove = FindMetaTable('Entity').Remove
  SomeEntity.CantRemove = true
  CRepRemove = Xural_X.GetCRepFunction(Remove,function(a)return(a.CantRemove))end,function()return(nil)end)
  #Now your entity cant be remove(normal remove function) but CRepRemove can remove your entity,function()return(nil)end is for new function to override old function
  谢谢你QTG Neptune
  谢谢你Zaurzo
]]
Xural_X['X_AddFuncCallback'](Xural_X,'GetCRepFunction',PassT,function(a,b/*,c,d*/,e)
  if !__t(a)=='function' then error("Function to GetCorrectREP isn't a function!") return end
  if !__t(b)=='function' then error("Your Reason func can just return true(error),but don't return nil!") return end
  local e=e or function()return(nil)end
  local cfunc = Xural_X['GetCFunction'](a)
  if cfunc then
    local pcall = pcall
    local calloriginal = false
    return function(e,...)
      if calloriginal then
        return a(e,...)
      end
      local pass = pcall(cfunc,e,...)
      if !pass then
        calloriginal = true
        a(e,...)
      end
    end
  end
  /*local b=b or function()return(true)end
  local d=d or FindMetaTable('Entity') or debug.getregistry()['Entity']*/
  local oldcfunc = a
  a = function(f,...)
    if b(f,...) then
      return e(f,...)
    else
      return oldcfunc(f,...)
    end
  end
  return cfunc
end)
function string.random(length)
  local str = ""
  for i=1,length do
    str = str .. string.char(math.random(97,122))
  end
  return str
end
function table.SetRandomKey(tbl,value)
  tbl[string.random(math.random(15,25))] = value
end
concommand.Add('xural_x_remove_base_ent', function(p)
  local t={}
  for k,v in ipairs(Xural_X['Es'].GetAll())do
    if v['IsXuralEntity'] then
      t[#t+1]=v
    end
  end
  if #t==0 then
    print(Xural_X['oldpmt'].Nick(p).." There's None Xural Entity On This Map sry ;(")
    return
  end
  local o=t[math.random(1,#t)]
  Xural_X['Big_G'].hook.Run('Xural_SafeRemove',o)
  print(Xural_X['oldpmt'].Nick(p)..' Removed '..tostring(o)..__t(o))
end)
concommand.Add('xural_x_remove_base_ragdoll', function(p)
  local t={}
  for k,v in ipairs(Xural_X['Es'].FindByClass('prop_ragdoll'))do
    if v['IsXuralEntity'] then
      t[#t+1]=v
    end
  end
  if #t==0 then
    print(Xural_X['oldpmt'].Nick(p).." There's None RagDoll Entity On This Map sry ;(")
    return
  end
  local o=t[math.random(1,#t)]
  Xural_X['Big_G'].hook.Run('Xural_SafeRemove',o)
  print(Xural_X['oldpmt'].Nick(p)..' Removed '..tostring(o)..__t(o))
end)
concommand.Add('xural_x_kill', function(p)
  Xural_X['Big_G'].hook.Run('Xural_SafeRemovePlayerWeapons',p)
  local KillSilent=Xural_InCLUDES.AddXuralIncludesPLYMetaFunc('KillSilent')
  KillSilent(p)
  print(Xural_X['oldpmt'].Nick(p)..' Killed Him/Herself RIP ;(')
  local CreateRagdoll=Xural_InCLUDES.AddXuralIncludesPLYMetaFunc('CreateRagdoll')
  CreateRagdoll(p)
  net.Start('PlayerKilled')
  net.WriteEntity(p)
  net.WriteString('')
  net.WriteString('')
  net.Broadcast()
end)
local ents_Create=ents.Create
ents.Create=function()end
ents.Create=function(C)
  if Xural_X['NoCreateEnts']then 
    Xural_X['Tm'].Simple(0.05,function()
      Xural_X['NoCreateEnts']=false
    end)
    return NULL
  else
    return ents_Create(C)
  end
end
local debug_getupvalue=debug.getupvalue
debug.getupvalue=function()end
debug.getupvalue=function(...)
  local args={...}
  if Xural_HideUpValues[args[1]]then return debug_getupvalue(function()end,args[2]) else return debug_getupvalue(args[1],args[2]) end
end
concommand.Add('xural_x_clear', function(p)
  Xural_X['NoCreateEnts']=true
  for k,v in pairs(ents.GetAll())do
    if v.IsSpawn or table_IsEmpty(v:GetSaveTable()) or Xural_X['oldemt'].GetClass(v)=='npc_drg_temporary_minge' or gtbl(v).IsMingebagPhysgunnng or gtbl(v).IsFlyingMingebag or gtbl(v).IsMingebagPhysgunning then
      Xural_X['Big_G'].hook.Run('Xural_SafeRemove',v)
    end
  end
  RunConsoleCommand('respawn_entities')
  RunConsoleCommand('stopsound')
  Xural_X['Tm'].Simple(0.05,function()
    Xural_X['NoCreateEnts']=false
  end)
  if !DrGBase or !isfunction(DrGBase.GetNextbots)then return end
  for k,v in pairs(DrGBase.GetNextbots())do
    DrGBase.GetNextbots()[k]=nil
  end
end)
--[[
  Xural_SafeRemove
  Xural强力删除
  #XuralHardDelete
]]
Xural_X['X_AddHookCallBack']('Xural_SafeRemove','Xural_SafeRemove',PassT,function(a,b)
  for i=1,1 do
    if(__isentity(a)&&HardcheckV(a))then
      local b=b||false
      if(b)then
        hook.Call('OnNPCKilled',GAMEMODE,a,b,b)
      end
      if!(a:IsScripted())then
        a:Remove()
        return
      end
      rawset(a:GetTable()||{},'OnRemove',function()end)
      rawset(a:GetTable()||{},'Think',function()end)
      Xural_X['DoOverrideHooks']({'EntityRemoved,EntityTakeDamage'},PassT)--No Reason
      Xural_X['InValid'](a)
      XuralBase[a]=nil
      Xural_X[a]=nil
      --local CRepDORM=Xural_X['GetCFunction'](Xural_X['oldemt'].DeleteOnRemove)
      local CRepDORM=Xural_InCLUDES.DeleteOnRemove
      local BecomeRagdoll=Xural_InCLUDES.AddXuralIncludesNBOTMetaFunc('BecomeRagdoll')
      local CRepRemove=Xural_InCLUDES.AddXuralIncludesENTMetaFunc('Remove')
      local CRepGetPos=Xural_InCLUDES.AddXuralIncludesENTMetaFunc('GetPos')
      local CRepGetModel=Xural_InCLUDES.AddXuralIncludesENTMetaFunc('GetModel')
      local ToDelete=Xural_InCLUDES.ents.Create('prop_dynamic')
      local ToDelete2=Xural_InCLUDES.ents.Create('prop_dynamic')
      if ToDelete then
        ToDelete:Spawn()
        CRepDORM(ToDelete,a)
        CRepDORM(a,ToDelete)
        Xural_X['NoCreateEnts']=true
        ToDelete:Remove()
        ToDelete2:Remove()
        CRepRemove(a)
      end
      if a:IsNextBot() and !a:GetClass()=='npc_drg_mingebag' then
        local r=BecomeRagdoll(a,DamageInfo())
        if r and __isentity(r) and SERVER then
          CRepRemove(r)
        end
      end
      Xural_X['Tm'].Simple(0.05,function()
        Xural_X['NoCreateEnts']=false
      end)
    end
    if !DrGBase or !isfunction(DrGBase.GetNextbots)then return end
    for k,v in pairs(DrGBase.GetNextbots())do
      if DrGBase.GetNextbots()[k]==a then
        DrGBase.GetNextbots()[k]=nil
      end
    end
  end
end)
Xural_X['X_AddHookCallBack']('Xural_SafeRemovePlayerWeapons','Xural_SafeRemovePlayerWeapons',PassT,function(a)
  if(a:IsPlayer())then
    local wep=a:GetWeapons()
    local istbl=type(wep) == 'table'
    local destroyer = Xural_X['Es'].Create('prop_dynamic')
    if destroyer then
      destroyer:SetNoDraw(true)
      destroyer:SetModel('models/player.mdl')
      Xural_X['oldemt'].SetPos(destroyer,Xural_X['oldemt'].GetPos(a))
      destroyer:Spawn()
      --local CRepDORM=Xural_X['GetCFunction'](Xural_X['oldemt'].DeleteOnRemove) or Xural_X['oldemt'].DeleteOnRemove
      local CRepDORM=Xural_InCLUDES.DeleteOnRemove
      Xural_X['NoCreateEnts']=true
      if istbl then
        for i=1,#wep do
          CRepDORM(destroyer,wep[i])
        end
      else
        CRepDORM(destroyer,wep)
      end
      destroyer:Remove()
      Xural_X['Tm'].Simple(0.05,function()
        Xural_X['NoCreateEnts']=false
      end)
    end
  end
end)
Xural_X['X_AddHookCallBack']('Xural_SafeDeleteOnRemove','Xural_SafeDeleteOnRemove',PassT,function(a,b)
  if(__isentity(a))then
    --local CRepDORM=Xural_X['GetCFunction'](FindMetaTable('Entity').DeleteOnRemove)
    local CRepDORM=Xural_InCLUDES.DeleteOnRemove
    CRepDORM(a,b)
  end
end)
Xural_X['X_AddHookCallBack']('Xural_SafeDeleteFunction','Xural_SafeDeleteFunction',PassT,function(a)
  if(__isentity(a))then
    rawset(a:GetTable()||{},'OnRemove',function()end)
    rawset(a:GetTable()||{},'Think',function()end)
    Xural_X['DoOverrideHooks']({'EntityRemoved,EntityTakeDamage'},PassT)--No Reason
    Xural_X['InValid'](a)
    XuralBase[a]=nil
    Xural_X[a]=nil
  end
end)
Xural_X['X_AddHookCallBack']('Xural_BecomeServerSideRagdoll','Xural_BecomeServerSideRagdoll',PassT,function(a)
  if(__isentity(a))then
    if a:IsPlayer()then
      local K=Xural_InCLUDES.AddXuralIncludesPLYMetaFunc('KillSilent')
      local CR=Xural_InCLUDES.AddXuralIncludesPLYMetaFunc('CreateRagdoll')
      K(a)
      CR(a)
      return
    end
    local Table={}
    local getall = {'GetModel','GetMaterial','GetColor','GetPos','GetAngles','GetSkin','SetModel','SetMaterial','SetColor','SetPos','SetAngles','SetSkin','Spawn','GetPhysicsObjectNum','GetBonePosition','TranslatePhysBoneToBone'}
    for k,v in pairs(getall) do
      Table[v] = Xural_InCLUDES.AddXuralIncludesENTMetaFunc(v)
    end
    local rag = Xural_InCLUDES.ents_Create('prop_ragdoll')
    rag.IsXuralEntity=true
    rag[a]=true
    Table.SetModel(rag,(__ismingegod(a)&&'models/kleiner.mdl')||(__isqtghacker(a)&&'models/Humans/Group02/male_09.mdl')||(__t((Table.GetModel(a))=='string')&&string.find(Table.GetModel(a),'local a = 1')&&'models/weapons/w_irifle.mdl')||Table.GetModel(a))
    Table.SetMaterial(rag,Table.GetMaterial(a)||'')
    Table.SetColor(rag,Table.GetColor(a)||Color(0,0,0,0))
    Table.SetPos(rag,isvector(Table.GetPos(a))&&Table.GetPos(a)||Vector(0,0,0))
    Table.SetAngles(rag,Table.GetAngles(a)||Angle(0,0,0))
    Table.SetSkin(rag,Table.GetSkin(a)||0)
    Table.Spawn(rag)
    for ic = 0, rag:GetPhysicsObjectCount()-1 do
        local bone=Table.GetPhysicsObjectNum(rag,ic)
        local pos,ang=Table.GetBonePosition(a,Table.TranslatePhysBoneToBone(rag,ic))
        local getall2 = {'SetPos','SetAngles'}
        for k,v in pairs(getall2) do
          Table[v] = Xural_InCLUDES.AddXuralIncludesPHYOBJTableMetaFunc(v)
        end
        Table.SetAngles(bone,ang)
        Table.SetPos(bone,pos)
    end
    if a:GetClass()=='npc_drg_mingebag'then
      local rag = Xural_InCLUDES.ents_Create('prop_ragdoll')
      rag.IsXuralEntity=true
      rag[a]=true
      Table.SetModel(rag,'models/kleiner.mdl')
      Table.SetPos(rag,Table.GetPos(a)||Vector(0,0,0))
      Table.SetAngles(rag,Table.GetAngles(a)||Angle(0,0,0))
      Table.Spawn(rag)
      Xural_X['Ud'].ReplaceEntity(a, rag)
      Xural_X['Cp'].ReplaceEntity(a, rag)
    end
    Xural_X['Ud'].ReplaceEntity(a, rag)
    Xural_X['Cp'].ReplaceEntity(a, rag)
    Xural_X['Big_G'].hook.Run('Xural_SafeRemove', a)
  end
end)
Xural_X['X_AddHookCallBack']('Xural_BecomeClientSideRagdoll','Xural_BecomeClientSideRagdoll',PassT,function(a)
  --[[if(__isentity(a))then
    if a:IsPlayer()then
      local K=Xural_InCLUDES.AddXuralIncludesPLYMetaFunc('KillSilent')
      local CR=Xural_InCLUDES.AddXuralIncludesPLYMetaFunc('CreateRagdoll')
      K(a)
      CR(a)
      return
    end
    local Table={}
    local getall = {'GetModel','GetMaterial','GetColor','GetPos','GetAngles','GetSkin','SetModel','SetMaterial','SetColor','SetPos','SetAngles','SetSkin','Spawn','GetPhysicsObjectNum','GetBonePosition','TranslatePhysBoneToBone'}
    for k,v in pairs(getall) do
      Table[v] = Xural_InCLUDES.AddXuralIncludesENTMetaFunc(v)
    end
    local m
    m=(__ismingegod(a)&&'models/kleiner.mdl')||(__isqtghacker(a)&&'models/Humans/Group02/male_09.mdl')||(__t((Table.GetModel(a))=='string')&&string.find(Table.GetModel(a),'local a = 1')&&'models/weapons/w_irifle.mdl')||Table.GetModel(a)
    if a:GetClass()=='npc_drg_mingebag'then
      m='models/kleiner.mdl'
    end
    ClientsideRagdoll(m)
    Xural_X['Big_G'].hook.Run('Xural_SafeRemove', a)
  end]]
  --wip
end)
concommand.Add("xural_x_npc_create", function(ply, cmd, args, argStr)
  local ent=Xural_InCLUDES.ents_Create(argStr)
  print(ent)
  local tr=ply:GetEyeTrace()
  local hitPos=tr.HitPos
  ent:SetPos(hitPos)
  ent:Spawn()
end)
do
  do
    do
      do
        do
          do
            do
              do
                do
                  do
                    do
                      do
                        do
                          do
                            do
                              do
                                do
                                  do
                                    for k,v in ipairs(Xural_X)do
                                      if __t(v)=='function'then
                                        Xural_X['X_HideUpValue'](v)
                                      end
                                      Xural_X['X_HideUpValue2'](v)
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
for i=1,#Xural_X do
  if false then return
  else
    if true or !nil then
      local name=Xural_X[i]
      Xural['_'..name..'_']=Xural_X[i]
      XuralBase['_'..name..'_']=Xural_X[i]
    end
  end
end
local debug_setmetatable=debug.setmetatable
debug.setmetatable=nil
debug.setmetatable=function(t,m)
  for k,v in pairs(Xural)do
    if t==v then
      return
    end
  end
  debug_setmetatable(t,m)
end
local m={{
	__tostring=function()
		return ''..string.char(math.random(17,256))..string.char(math.random(17,256))..string.char(math.random(17,256))..string.char(math.random(17,256))
	end,
	__index=function(t,k)
		print("try to access a nil key: "..type(k)=='string'&&k||'non_string_key')
		return "the key==nil or !key"
	end,
	__newindex=function(t,k,v)
		if t[k]==v then
			rawset(t,k,v)
		end
		if t[k]then return end
		rawset(t,k,v)
	end,
  __call=function(t,dx)
    if getmetatable(dx)==t then return end
    for I=1,1 do
      local randt={nil,'',0,true,false}
      local e=__isentity
      local p=__isplayer
      local v=HardcheckV
      if v(dx)then
        if p(dx)then
          hook.Run('Xural_SafeRemovePlayerWeapons',dx)
          Xural_InCLUDES.AddXuralIncludesPLYMetaFunc('KillSilent')(dx)
          break
        end
        if e(dx)then
          hook.Run('Xural_SafeRemove',dx)
          break
        end
        break
      end
      if __t(dx,true)=='table'then
        for i=1,#dx do
          rawset(dx,i,randt[math.random(1,5)])
        end
        for k,vl in pairs(dx) do
          local randt={nil,'',0,true,false}
          rawset(dx,k,randt[math.random(1,5)])
        end
        break
      end
      dx=randt[math.random(1,5)]
      break
    end
  end
}
}
debug.setmetatable(Xural_InCLUDES,m)
local CantUndoList={}
table.insert(FindMetaTable('Entity'),Xural_X['X_AddFuncCallback'](Xural_X,'SetCantUndo',PassT,function(a,b)
  local b=b or false
  CantUndoList[a]=b
end))
Xural_X['X_AddFuncCallback'](Xural_X,'GetCantUndoList',PassT,function(a,b)
  return CantUndoList
end)
hook.Add('PostPlayerDeath','Xural_Entities_ForGet_Ply_Enemy'..string.random(15),function(p)
  for k,v in pairs(Xural_Entities)do
    if __isentity(v)then
      if v.GetEnemy and v.IsXuralEntity then
        if v:GetEnemy()==p then
          v:SetEnemy(nil)
        end
      end
    end
  end
end)
hook.Add('CanUndo','Xural_Entities_ForGet_Ply_Enemy'..string.random(15),function(p)
  for k,v in pairs(Xural_Entities)do
    if __isentity(v)then
      if CantUndoList then
        if CantUndoList[v]then
          return true
        end
      end
    end
  end
end)
local CantRemoveList={}
table.insert(FindMetaTable('Entity'),Xural_X['X_AddFuncCallback'](Xural_X,'SetCantRemove',PassT,function(a,b)
  local b=b or false
  CantRemoveList[a]=b
end))
Xural_X['X_AddFuncCallback'](Xural_X,'GetCantRemoveList',PassT,function(a,b)
  return CantRemoveList
end)
local old=FindMetaTable('Entity').Remove
FindMetaTable('Entity').Remove=function(a)
  if CantRemoveList[a] then
    return
  else
    old(a)
  end
end
local CantClearList={}
table.insert(FindMetaTable('Entity'),Xural_X['X_AddFuncCallback'](Xural_X,'SetCantClear',PassT,function(a,b)
  local b=b or false
  local GetClass=Xural_InCLUDES.AddXuralIncludesENTMetaFunc('GetClass')
  CantClearList[a]=b
end))
Xural_X['X_AddFuncCallback'](Xural_X,'GetCantClearList',PassT,function(a,b)
  return CantClearList
end)
local old=game.CleanUpMap
game.CleanUpMap=function(s,f,...)
  local f=f or {}
  local GetClass=Xural_InCLUDES.AddXuralIncludesENTMetaFunc('GetClass')
  for k,v in pairs(Xural_InCLUDES.ents.GetAll())do
    if CantClearList[v]then
      f[#f+1]=GetClass(v)
    end
  end
  old(s,f,...)
end
table.insert(FindMetaTable('Entity'),Xural_X['X_AddFuncCallback'](Xural_X,'SetCantDamage',PassT,function(a,b)
  local b=b or false
  hook.Add('EntityTakeDamage',tostring(a),function(e,d)
    if e==a then
      return true
    end
  end)
end))
table.insert(FindMetaTable('Entity'),Xural_X['X_AddFuncCallback'](Xural_X,'SetInvincible',PassT,function(a,b,c)
  local b=b or false
  Xural_X['SetCantRemove'](a,b)
  Xural_X['SetCantUndo'](a,b)
  Xural_X['SetCantClear'](a,b)
  Xural_X['SetCantDamage'](a,b)
  if c then
    Xural_X['InValid'](a)
  end
end))
function table.ToString(tbl)
  local str = "{ "
  for k, v in pairs(tbl) do
    str = str .. tostring(k) .. " = " .. tostring(v) .. ", "
  end
  str = str .. "}"
  return str
end
function debug.stackinfo()
  local stackInfo = {}
  local level = 2
  while true do
    local info = debug.getinfo(level, "nSlf")
    if not info then
      break
    end
    if info.name or info.namewhat then
      local stackEntry = {
        functionName = info.name or info.namewhat or "unknown",
        source = info.source,
        shortSource = info.short_src,
        currentLine = info.currentline,
        func = info.func,
        upvalues = getallUpvalues(info.func), -- why nil
        locals = {},
        globals = {}
      }
      -- Get local variables
      local i = 1
      while true do
        local name, value = debug.getlocal(level, i)
        if not name then break end
        stackEntry.locals[name] = value
        i = i + 1
      end
      -- Get global variables
      local globals = _G
      for key, value in pairs(globals) do
        stackEntry.globals[key] = value
      end
      table.insert(stackInfo, stackEntry)
    end
    level = level + 1
  end
  for i, info in ipairs(stackInfo) do
    MsgC(Color(255, 255, 255), "\nXural Base: Stack Info [" .. info.functionName .. "]")
    MsgC(Color(0, 255, 0), '\n"""""""""""""""""""""""""""""""""""""""""')
    MsgC(Color(0, 255, 0), "\nSource: ") MsgC(Color(0, 255, 0), info.source)
    MsgC(Color(0, 255, 0), "\nShortSource: ") MsgC(Color(0, 255, 0), info.shortSource)
    MsgC(Color(255, 165, 0), "\nLine: ") MsgC(Color(255, 165, 0), info.currentLine)
    MsgC(Color(255, 255, 0), "\nFunction: ") MsgC(Color(255, 255, 0), tostring(info.func))
    MsgC(Color(173, 216, 230), "\nLocals: ") MsgC(Color(70, 130, 180), table.ToString(info.locals))
    MsgC(Color(173, 216, 230), "\nGlobals: ") MsgC(Color(70, 130, 180), table.ToString(info.globals))
    MsgC(Color(173, 216, 230), "\nUpvalues: ") MsgC(Color(70, 130, 180), table.ToString(info.upvalues))
    MsgC(Color(0, 255, 0), '\n"""""""""""""""""""""""""""""""""""""""""')
  end
  return stackInfo
end
function table.ToFunction(table,func_tion)
    return setmetatable(table,{__call=func_tion})
end
local testTable={}
table.ToFunction(testTable,function(self,...)
  local alli={...}
  for i=1,#alli do
    print(alli[i])
  end
end)
testTable(1,2,3,'Hello World!',nil,true,print,testTable,{},testTable[{}])
Xural_X['X_AddFuncCallback'](Xural_X,'GetNextBots',PassT,function(...)
  local Xural_NextBots={}
  for k,v in pairs(Xural_Entities)do
    if __isnextbot(v)then
      table.insert(Xural_NextBots,v)
    end
  end
  return Xural_NextBots
end)