local BUI, E, L, V, P, G = unpack(select(2, ...))
local mod = BUI:GetModule('Databars');
local DT = E:GetModule('DataTexts');
local DB = E:GetModule('DataBars');
local LSM = E.LSM;


local _G = _G

local GetPetExperience = GetPetExperience
local HideUIPanel, ShowUIPanel = HideUIPanel, ShowUIPanel
local InCombatLockdown = InCombatLockdown
local UnitXP, UnitXPMax = UnitXP, UnitXPMax

-- GLOBALS: hooksecurefunc, selectioncolor, ElvUI_ExperienceBar, SpellBookFrame

local function OnClick(self)
	if self.template == 'NoBackdrop' then return end
	if not SpellBookFrame:IsShown() then ShowUIPanel(SpellBookFrame) else HideUIPanel(SpellBookFrame) end
end

function mod:ApplyXpStyling()
	local bar = _G.ElvUI_ExperienceBar
	
	mod:ApplyStyle(bar, "experience")
end

function mod:ToggleXPBackdrop()
	if E.db.benikuiDatabars.experience.enable ~= true then return end
	local bar = _G.ElvUI_ExperienceBar

	mod:ToggleBackdrop(bar, "experience")
end

function mod:UpdateXpNotifierPositions()
	local bar = DB.StatusBars.Experience

	mod:UpdateNotifierPositions(bar, "experience")
end

function mod:GetXP(unit)
	if(unit == 'pet') then
		return GetPetExperience()
	else
		return UnitXP(unit), UnitXPMax(unit)
	end
end

function mod:UpdateXpNotifier()
	local bar = DB.StatusBars.Experience

	if E.db.databars.experience.orientation ~= 'VERTICAL' then
		bar.f:Hide()
	else
		bar.f:Show()
		local cur, max = mod:GetXP('player')
		if max == 0 then max = 1 end
		bar.f.txt:SetFormattedText('%d%%', cur / max * 100)
	end
end

function mod:XpTextOffset()
	local text = DB.StatusBars.Experience.text
	text:Point('CENTER', 0, E.db.databars.experience.textYoffset or 0)
end

function mod:LoadXP()
	local bar = ElvUI_ExperienceBar

	self:XpTextOffset()
	hooksecurefunc(DB, 'ExperienceBar_Update', mod.XpTextOffset)

	local db = E.db.benikuiDatabars.experience.notifiers

	if db.enable then
		self:CreateNotifier(bar)
		self:UpdateXpNotifierPositions()
		self:UpdateXpNotifier()
		hooksecurefunc(DB, 'ExperienceBar_Update', mod.UpdateXpNotifier)
		hooksecurefunc(DT, 'LoadDataTexts', mod.UpdateXpNotifierPositions)
		hooksecurefunc(DB, 'UpdateAll', mod.UpdateXpNotifierPositions)
		hooksecurefunc(DB, 'UpdateAll', mod.UpdateXpNotifier)
	end

	if E.db.benikuiDatabars.experience.enable ~= true then return end

	self:StyleBar(bar, OnClick)
	self:ToggleXPBackdrop()
	self:ApplyXpStyling()

	hooksecurefunc(DB, 'UpdateAll', mod.ApplyXpStyling)
end