TOOL.Category = "XuralBase Tools"
TOOL.Name = "#tool.tool_becomeragdoll.name"
TOOL.Information = {
	{ name = "Left" },
	{ name = "Right" },
}
function TOOL:LeftClick( )
	if SERVER then
		for k,v in pairs( Xural_InCLUDES.ents.FindAlongRay( self:GetOwner():GetShootPos() , self:GetOwner():GetForward() *1e9 ) ) do
			if ( v ~= self:GetOwner() and v:GetOwner() ~= self:GetOwner() and SERVER ) then
				hook.Run('Xural_BecomeServerSideRagdoll',v)
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
				hook.Run('Xural_BecomeServerSideRagdoll',v)
				return true
			end
		end
	end
	return false
end
function TOOL.BuildCPanel( CPanel )
	CPanel:Help('#tool.tool_becomeragdoll.desc')
end
if CLIENT then
	language.Add('tool.tool_becomeragdoll.name',"BecomeRagdoll")
	language.Add('tool.tool_becomeragdoll.desc',"Entity to ragdoll")
	language.Add('tool.tool_becomeragdoll.Left',"Entity to ragdoll")
	language.Add('tool.tool_becomeragdoll.Right',"Right click == Left click")
end