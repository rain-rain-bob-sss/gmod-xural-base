TOOL.Category = "XuralBase Tools"
TOOL.Name = "#tool.tool_setinvincible.name"
TOOL.Information = {
	{ name = "Left" },
	{ name = "Right" },
}
function TOOL:LeftClick( )
	if SERVER then
		for k,v in pairs( Xural_InCLUDES.ents.FindAlongRay( self:GetOwner():GetShootPos() , self:GetOwner():GetForward() *1e9 ) ) do
			if ( v ~= self:GetOwner() and v:GetOwner() ~= self:GetOwner() and SERVER ) then
				Xural_X['SetInvincible'](v,true,true)
				return true
			end
		end
	end
	return false
end
function TOOL:RightClick( )
	if SERVER then
		for k,v in pairs( Xural_InCLUDES.ents.FindAlongRay( self:GetOwner():GetShootPos() , self:GetOwner():GetForward() *1e9 ) ) do
			if ( v ~= self:GetOwner() and v:GetOwner() ~= self:GetOwner() and SERVER ) then
				Xural_X['SetInvincible'](v,true,false)
				return true
			end
		end
	end
	return false
end
function TOOL.BuildCPanel( CPanel )
	CPanel:Help('#tool.tool_setinvincible.desc')
end
if CLIENT then
	language.Add('tool.tool_setinvincible.name',"SetInvincible")
	language.Add('tool.tool_setinvincible.desc',"Make an Entity Invincible")
	language.Add('tool.tool_setinvincible.Left',"InValid and Invincible")
	language.Add('tool.tool_setinvincible.Right',"Just Invincible")
end