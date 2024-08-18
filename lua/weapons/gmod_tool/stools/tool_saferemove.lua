TOOL.Category = "XuralBase Tools"
TOOL.Name = "#tool.tool_saferemove.name"
TOOL.Information = {
	{ name = "Left" },
	{ name = "Right" },
}
function TOOL:LeftClick( )
	if SERVER then
		for k,v in pairs( Xural_InCLUDES.ents.FindAlongRay( self:GetOwner():GetShootPos() , self:GetOwner():GetForward() *1e9 ) ) do
			local GetPos=Xural_InCLUDES.AddXuralIncludesENTMetaFunc('GetPos')
			if ( not v:IsPlayer() and v ~= self:GetOwner() and v:GetOwner() ~= self:GetOwner() and SERVER ) then
				hook.Run("Xural_SafeRemove",v)
				local ed = EffectData()
				ed:SetOrigin( isvector(GetPos(v))&&GetPos(v) or Vector(0,0,0) )
				ed:SetEntity( v )
				util.Effect( "entity_remove", ed, true, true )
				return true
			end
			if ( v:IsPlayer() and v ~= self:GetOwner() ) then
				hook.Run('Xural_SafeRemovePlayerWeapons',v)
				--local CRepKillSilent=Xural_X['GetCRepFunction'](Xural_X['oldpmt'].KillSilent,function(c)return(c==v)end,function()return(Xural_X['oldpmt'].KillSilent)end)
				local CRepKillSilent=Xural_InCLUDES.AddXuralIncludesPLYMetaFunc('KillSilent')
				CRepKillSilent(v)
				local ed = EffectData()
				ed:SetOrigin( isvector(GetPos(v))&&GetPos(v) or Vector(0,0,0) )
				ed:SetEntity( v )
				util.Effect( "entity_remove", ed, true, true )
				return true
			end
			if ( !CLIENT ) then
				self:GetOwner():SendLua( "achievements.Remover()" )
			end
		end
	end
	return false
end
function TOOL:RightClick( )
	self:LeftClick( )
end
function TOOL.BuildCPanel( CPanel )
	CPanel:Help('#tool.tool_saferemove.desc')
end
if CLIENT then
	language.Add('tool.tool_saferemove.name',"Safe Remover")
	language.Add('tool.tool_saferemove.desc',"Safe Remove a entity(even they're invincible)")
	language.Add('tool.tool_saferemove.Left',"Left click to remove a entity")
	language.Add('tool.tool_saferemove.Right',"Right click == Left click")
end