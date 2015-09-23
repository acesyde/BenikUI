﻿local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UFB = E:GetModule('BuiUnits');
local UF = E:GetModule('UnitFrames');

local ElvUF = ElvUI.oUF

function UFB:ConstructPartyPortraits()
	for _, header in pairs(UF.headers) do
		local headername = header:GetName()
		if headername == 'ElvUF_Party' then
			for i = 1, header:GetNumChildren() do
				local group = select(i, header:GetChildren())
				for j = 1, group:GetNumChildren() do
					local unitbutton = select(j, group:GetChildren())
					local unitbuttonname = unitbutton:GetName()
					unitbutton.Portrait3D = UF:Construct_Portrait(unitbutton, 'model')
					unitbutton.Portrait2D = UF:Construct_Portrait(unitbutton, 'texture')
				end
			end
		end
	end
	
	UF:UpdateAllHeaders()
end

function UFB:Update_PartyFrames(frame, db)
	--local db = E.db['unitframe']['units'].party
	frame.db = db
	if frame.Portrait then
		frame.Portrait:Hide()
		frame.Portrait:ClearAllPoints()
		frame.Portrait.backdrop:Hide()
	end
	frame.Portrait = db.portrait.style == '2D' and frame.Portrait2D or frame.Portrait3D

	local BORDER = E.Border;
	local SPACING = E.Spacing;
	local USE_POWERBAR = db.power.enable
	local USE_INSET_POWERBAR = db.power.width == 'inset' and USE_POWERBAR
	local USE_MINI_POWERBAR = db.power.width == 'spaced' and USE_POWERBAR
	local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR
	local POWERBAR_OFFSET = db.power.offset
	local POWERBAR_HEIGHT = db.power.height
	local POWERBAR_WIDTH = db.width - (BORDER*2)

	local USE_PORTRAIT = db.portrait.enable
	local USE_PORTRAIT_OVERLAY = db.portrait.overlay and USE_PORTRAIT
	local PORTRAIT_WIDTH = db.portrait.width
	
	--Adjust some variables
	do
		if USE_PORTRAIT_OVERLAY or not USE_PORTRAIT then
			PORTRAIT_WIDTH = 0
		end
	end
	
	if not frame.isChild then
		
		-- Health
		do
			local health = frame.Health
			
			health.bg:ClearAllPoints()
			if not USE_PORTRAIT_OVERLAY then
				health:Point("TOPLEFT", PORTRAIT_WIDTH+BORDER, -BORDER)
				health.bg:SetParent(health)
				health.bg:SetAllPoints()
			else
				health.bg:Point('BOTTOMLEFT', health:GetStatusBarTexture(), 'BOTTOMRIGHT')
				health.bg:Point('TOPRIGHT', health)
				health.bg:SetParent(frame.Portrait.overlay)
			end
		end
		
		--Power
		do
			local power = frame.Power

			if USE_POWERBAR and USE_PORTRAIT and not USE_PORTRAIT_OVERLAY then
				--Position
				power:ClearAllPoints()
				if USE_POWERBAR_OFFSET then
					power:Point("TOPLEFT", frame.Health, "TOPLEFT", -POWERBAR_OFFSET, -POWERBAR_OFFSET)
					power:Point("BOTTOMRIGHT", frame.Health, "BOTTOMRIGHT", -POWERBAR_OFFSET, -POWERBAR_OFFSET)
					power:SetFrameStrata("LOW")
					power:SetFrameLevel(2)
				elseif USE_MINI_POWERBAR then
					power:Width((POWERBAR_WIDTH/2) - BORDER*2)
					power:Height(POWERBAR_HEIGHT)
					power:Point("LEFT", frame, "BOTTOMLEFT", (BORDER*2 + 4)+PORTRAIT_WIDTH, BORDER + (POWERBAR_HEIGHT/2))
					power:SetFrameStrata("MEDIUM")
					power:SetFrameLevel(frame:GetFrameLevel() + 3)
				elseif USE_INSET_POWERBAR then
					power:Height(POWERBAR_HEIGHT)
					power:Point("BOTTOMLEFT", frame.Health, "BOTTOMLEFT", BORDER + (BORDER*2), BORDER + (BORDER*2))
					power:Point("BOTTOMRIGHT", frame.Health, "BOTTOMRIGHT", -(BORDER + (BORDER*2)), BORDER + (BORDER*2))
					power:SetFrameStrata("MEDIUM")
					power:SetFrameLevel(frame:GetFrameLevel() + 3)
				else
					power:Point("TOPLEFT", frame.Health.backdrop, "BOTTOMLEFT", BORDER, -(E.PixelMode and 0 or (BORDER + SPACING)))
					power:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -(BORDER), BORDER)
				end
			end
		end
		
		-- Portrait
		do
			local portrait = frame.Portrait

			if USE_PORTRAIT then
				if not frame:IsElementEnabled('Portrait') then
					frame:EnableElement('Portrait')
				end
				portrait:ClearAllPoints()

				if USE_PORTRAIT_OVERLAY then
					if db.portrait.style == '3D' then
						portrait:SetFrameLevel(frame.Health:GetFrameLevel() + 1)
					end
					portrait:SetAllPoints(frame.Health)
					portrait:SetAlpha(0.3)
					portrait:Show()
					portrait.backdrop:Hide()
				else
					portrait:SetAlpha(1)
					portrait:Show()
					portrait.backdrop:Show()
					portrait.backdrop:ClearAllPoints()
					portrait.backdrop:Point("TOPLEFT", frame, "TOPLEFT")
					if db.portrait.style == '3D' then
						portrait:SetFrameLevel(frame:GetFrameLevel() + 5)
					end

					if USE_MINI_POWERBAR or USE_POWERBAR_OFFSET or not USE_POWERBAR or USE_INSET_POWERBAR then
						portrait.backdrop:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMLEFT", E.PixelMode and -1 or SPACING, 0)
					else
						portrait.backdrop:Point("BOTTOMRIGHT", frame.Power.backdrop, "BOTTOMLEFT", E.PixelMode and -1 or SPACING, 0)
					end

					portrait:Point('BOTTOMLEFT', portrait.backdrop, 'BOTTOMLEFT', BORDER, BORDER)
					portrait:Point('TOPRIGHT', portrait.backdrop, 'TOPRIGHT', -BORDER, -BORDER)
				end
			else
				if frame:IsElementEnabled('Portrait') then
					frame:DisableElement('Portrait')
					portrait:Hide()
					portrait.backdrop:Hide()
				end
			end
		end
		
		--OverHealing
		do
			local healPrediction = frame.HealPrediction

			if db.healPrediction then
				if not USE_PORTRAIT_OVERLAY then
					healPrediction.myBar:SetParent(frame)
					healPrediction.otherBar:SetParent(frame)
					healPrediction.absorbBar:SetParent(frame)
				else
					healPrediction.myBar:SetParent(frame.Portrait.overlay)
					healPrediction.otherBar:SetParent(frame.Portrait.overlay)
					healPrediction.absorbBar:SetParent(frame.Portrait.overlay)
				end
			end
		end
	end
	
	if UF.db.colors.transparentHealth then
		UF:ToggleTransparentStatusBar(true, frame.Health, frame.Health.bg)
	else
		UF:ToggleTransparentStatusBar(false, frame.Health, frame.Health.bg, (USE_PORTRAIT and USE_PORTRAIT_OVERLAY) ~= true)
	end
	
	frame:UpdateAllElements()
end
