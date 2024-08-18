TOOL.Category = "XuralBase Tools"
TOOL.Name = "#tool.tool_checkentity.name"
TOOL.Information = {
	{ name = "Left" },
	{ name = "Right" },
}
function TOOL:LeftClick( )
	if SERVER then
		for k,v in pairs( Xural_InCLUDES.ents.FindAlongRay( self:GetOwner():GetShootPos() , self:GetOwner():GetForward() *1e9 ) ) do
			if ( not v:IsPlayer() and v ~= self:GetOwner() and v:GetOwner() ~= self:GetOwner() and SERVER ) then
				local Table={}
				local GetInCludesTable = {'GetClass','GetModel','GetName','GetColor','GetPos','GetAngles','GetOwner','GetParent','GetMaterial','GetSkin'}
				for key,value in ipairs(GetInCludesTable)do
					Table[value]=Xural_InCLUDES.AddXuralIncludesENTMetaFunc(value)
				end
				local GetENTTable = {Table.GetClass(v)||'NULL Class',Table.GetName(v)||'NULL Name',Table.GetModel(v)||'NULL Model',Table.GetColor(v)||'NULL Color',Table.GetMaterial(v)||'NULL Material',Table.GetSkin(v)||'NULL Skin',Table.GetPos(v)||'NULL Pos',Table.GetAngles(v)||'NULL Angles'}
				PrintTable(GetENTTable)
				return true
			end
			if ( v:IsPlayer() and v ~= self:GetOwner() ) then
				local Table={}
				local GetInCludesTable = {'Nick','AccountID','Armor','GetAmmo','GetWeapons'}
				local GetInCludesTable2 = {'Health'}
				for key,value in ipairs(GetInCludesTable)do
					Table[value]=Xural_InCLUDES.AddXuralIncludesPLYMetaFunc(value)
				end
				for key,value in ipairs(GetInCludesTable2)do
					Table[value]=Xural_InCLUDES.AddXuralIncludesENTMetaFunc(value)
				end
				local GetENTTable = {Table.Nick(v),Table.AccountID(v),Table.Armor(v),Table.Health(v),table.unpack(Table.GetAmmo(v)),table.unpack(Table.GetWeapons(v))}
				PrintTable(GetENTTable)
				return true
			end
		end
	end
	return false
end
function TOOL:RightClick( )
	self:LeftClick( )
end
function TOOL.BuildCPanel( CPanel )
	CPanel:Help('#tool.tool_checkentity.desc')
end
if CLIENT then
	language.Add('tool.tool_checkentity.name',"Check Entity Info")
	language.Add('tool.tool_checkentity.desc',"Get a info of a entity(or player)")
	language.Add('tool.tool_checkentity.Left',"Get a info of a entity(or player)")
	language.Add('tool.tool_checkentity.Right',"Right click == Left click")
end