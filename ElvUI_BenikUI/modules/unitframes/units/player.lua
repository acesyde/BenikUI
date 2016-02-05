local E, L, V, P, G, _ = unpack(ElvUI);
local UFB = E:GetModule('BuiUnits');
local UF = E:GetModule('UnitFrames');

local _G = _G
local CreateFrame = CreateFrame

local CAN_HAVE_CLASSBAR = (E.myclass == "PALADIN" or E.myclass == "DRUID" or E.myclass == "DEATHKNIGHT" or E.myclass == "WARLOCK" or E.myclass == "PRIEST" or E.myclass == "MONK" or E.myclass == 'MAGE' or E.myclass == 'ROGUE')

function UFB:Construct_PlayerFrame()
	local frame = _G["ElvUF_Player"]
	frame.EmptyBar = self:CreateEmptyBar(frame)
	
	if not frame.Portrait.backdrop.shadow then
		frame.Portrait.backdrop:CreateSoftShadow()
		frame.Portrait.backdrop.shadow:Hide()
	end

	if E.db.bui.buiStyle == true then
		frame.Portrait.backdrop:Style('Outside')
		frame.Portrait.backdrop.style:Hide()
	end
	
	local f = CreateFrame("Frame", nil, frame)
	frame.portraitmover = f
	
	self:ArrangePlayer()
	self:TogglePlayerBarTransparency()
end

function UFB:TogglePlayerBarTransparency()
	local frame = _G["ElvUF_Player"]
	if E.db.ufb.toggleTransparency then
		frame.EmptyBar:SetTemplate('Transparent')
	else
		frame.EmptyBar:SetTemplate('Default')
	end
end

function UFB:TogglePlayerBarShadow()
	local frame = _G["ElvUF_Player"]
	if E.db.ufb.toggleShadow then
		frame.EmptyBar.shadow:Show()
	else
		frame.EmptyBar.shadow:Hide()
	end
end

function UFB:ArrangePlayer()
	local frame = _G["ElvUF_Player"]
	local EMPTY_BARS_HEIGHT = E.db.ufb.barheight
	
	local db = E.db['unitframe']['units'].player
	local stagger = frame.Stagger
	local USE_PORTRAIT = db.portrait.enable
	local USE_PORTRAIT_OVERLAY = db.portrait.overlay and USE_PORTRAIT
	local PORTRAIT_DETACHED = E.db.ufb.detachPlayerPortrait
	local SPACING = E.Spacing;
	local BORDER = E.Border;
	local SHADOW_SPACING = BORDER*3
	local USE_POWERBAR = db.power.enable
	local POWERBAR_HEIGHT = db.power.height
	local USE_INSET_POWERBAR = db.power.width == 'inset' and USE_POWERBAR
	local USE_MINI_POWERBAR = db.power.width == 'spaced' and USE_POWERBAR
	local POWERBAR_DETACHED = db.power.detachFromFrame
	local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR and not POWERBAR_DETACHED
	local POWERBAR_OFFSET = db.power.offset
	local USE_CLASSBAR = db.classbar.enable and CAN_HAVE_CLASSBAR
	local USE_MINI_CLASSBAR = db.classbar.fill == "spaced" and USE_CLASSBAR and db.classbar.detachFromFrame ~= true
	local CLASSBAR_HEIGHT = db.classbar.height
	local CLASSBAR_WIDTH = db.width - (BORDER*2)
	local USE_EMPTY_BAR = E.db.ufb.barshow
	local PLAYER_PORTRAIT_WIDTH = E.db.ufb.PlayerPortraitWidth
	local PLAYER_PORTRAIT_HEIGHT = E.db.ufb.PlayerPortraitHeight
	local USE_STAGGER = stagger and stagger:IsShown();
	local STAGGER_WIDTH = USE_STAGGER and (db.stagger.width + (BORDER*2)) or 0;

	-- Empty Bar
	do
		local health = frame.Health
		local power = frame.Power
		local emptybar = frame.EmptyBar
		
		if USE_EMPTY_BAR then
			emptybar:Show()
			
			if USE_STAGGER then
				stagger:Point('BOTTOMLEFT', emptybar, 'BOTTOMRIGHT', BORDER*2 + (E.PixelMode and 0 or SPACING), BORDER)
				stagger:Point('TOPRIGHT', health, 'TOPRIGHT', STAGGER_WIDTH, 0)
			end
			
			if USE_POWERBAR_OFFSET then
				emptybar:Point('TOPLEFT', power, 'BOTTOMLEFT', -BORDER, 0)
				emptybar:Point('BOTTOMRIGHT', power, 'BOTTOMRIGHT', BORDER, -EMPTY_BARS_HEIGHT)
			elseif USE_MINI_POWERBAR or USE_INSET_POWERBAR then
				emptybar:Point('TOPLEFT', health, 'BOTTOMLEFT', -BORDER, 0)
				emptybar:Point('BOTTOMRIGHT', health, 'BOTTOMRIGHT', BORDER, -EMPTY_BARS_HEIGHT)
			elseif POWERBAR_DETACHED or not USE_POWERBAR then
				emptybar:Point('TOPLEFT', health, 'BOTTOMLEFT', -BORDER, 0)
				emptybar:Point('BOTTOMRIGHT', health, 'BOTTOMRIGHT', BORDER, -EMPTY_BARS_HEIGHT)
			else
				emptybar:Point('TOPLEFT', power, 'BOTTOMLEFT', -BORDER, 0)
				emptybar:Point('BOTTOMRIGHT', power, 'BOTTOMRIGHT', BORDER, -EMPTY_BARS_HEIGHT)
			end
		else
			emptybar:Hide()
		end
	end
	
	-- Portrait
	do	
		local portrait = frame.Portrait
		if USE_PORTRAIT then
			if not USE_PORTRAIT_OVERLAY then
				if E.db.ufb.PlayerPortraitTransparent then
					portrait.backdrop:SetTemplate('Transparent')
				else
					portrait.backdrop:SetTemplate('Default', true)
				end

				if E.db.ufb.PlayerPortraitShadow and PORTRAIT_DETACHED then
					portrait.backdrop.shadow:Show()
				else
					portrait.backdrop.shadow:Hide()
				end
				
				local rIcon = frame.Resting
				local power = frame.Power
				
				if PORTRAIT_DETACHED then
					frame.portraitmover:Width(PLAYER_PORTRAIT_WIDTH)
					frame.portraitmover:Height(PLAYER_PORTRAIT_HEIGHT)
					portrait.backdrop:SetAllPoints(frame.portraitmover)

					if portrait.backdrop.style then
						if E.db.ufb.PlayerPortraitStyle then
							portrait.backdrop.style:ClearAllPoints()
							portrait.backdrop.style:Point('TOPLEFT', portrait.backdrop, 'TOPLEFT', 0, E.db.ufb.PlayerPortraitStyleHeight)
							portrait.backdrop.style:Point('BOTTOMRIGHT', portrait.backdrop, 'TOPRIGHT', 0, (E.PixelMode and -1 or 1))
							portrait.backdrop.style:Show()
							if USE_POWERBAR then
								local r, g, b = power:GetStatusBarColor()
								portrait.backdrop.style.color:SetVertexColor(r, g, b)
							end
						else
							portrait.backdrop.style:Hide()
						end
					end

					if db.portrait.style == '3D' then
						portrait.backdrop:SetFrameStrata(frame:GetFrameStrata())
						portrait:SetFrameStrata(portrait.backdrop:GetFrameStrata())
					end
					if not frame.portraitmover.mover then
						frame.portraitmover:ClearAllPoints()
						frame.portraitmover:Point('TOPRIGHT', frame, 'TOPLEFT', -BORDER, 0)
						E:CreateMover(frame.portraitmover, 'PlayerPortraitMover', 'Player Portrait', nil, nil, nil, 'ALL,SOLO')
						frame.portraitmover:ClearAllPoints()
						frame.portraitmover:SetPoint("BOTTOMLEFT", frame.portraitmover.mover, "BOTTOMLEFT")
					else
						frame.portraitmover:ClearAllPoints()
						frame.portraitmover:SetPoint("BOTTOMLEFT", frame.portraitmover.mover, "BOTTOMLEFT")		
					end
					
					if db.restIcon then
						rIcon:ClearAllPoints()
						if E.db.ufb.PlayerPortraitStyle and portrait.backdrop.style then
							rIcon:SetParent(portrait.backdrop.style)
							rIcon:Point('CENTER', portrait.backdrop.style, 'TOPLEFT')					
						else
							rIcon:SetParent(portrait)
							rIcon:Point('CENTER', portrait, 'TOPLEFT')
						end
					end
				else
					portrait.backdrop:ClearAllPoints()
					portrait.backdrop:Point("TOPLEFT", frame, "TOPLEFT", BORDER, 0)

					if USE_EMPTY_BAR then
						portrait.backdrop:Point("BOTTOMRIGHT", frame.EmptyBar, "BOTTOMLEFT", BORDER - SPACING*3, 0)
					elseif USE_MINI_POWERBAR or USE_POWERBAR_OFFSET or not USE_POWERBAR or USE_INSET_POWERBAR or POWERBAR_DETACHED then
						portrait.backdrop:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMLEFT", BORDER - SPACING*3, 0)
					else
						portrait.backdrop:Point("BOTTOMRIGHT", frame.Power.backdrop, "BOTTOMLEFT", BORDER - SPACING*3, 0)
					end
					
					if db.portrait.style == '3D' then
						portrait.backdrop:SetFrameLevel(frame.Power:GetFrameLevel() + 1)
					end
					
					if db.restIcon then
						rIcon:ClearAllPoints()
						rIcon:SetParent(frame)
						rIcon:Point('CENTER', frame, 'TOPLEFT')
					end
				end
				portrait:ClearAllPoints()
				portrait:Point('BOTTOMLEFT', portrait.backdrop, 'BOTTOMLEFT', BORDER, BORDER)		
				portrait:Point('TOPRIGHT', portrait.backdrop, 'TOPRIGHT', -(E.PixelMode and db.portrait.style == '3D' and BORDER*2 or BORDER), -BORDER) --Fix portrait overlapping border when pixel mode and 3D style is enabled
			end
		end
	end
	
	local mini_classbarY = 0
	if USE_MINI_CLASSBAR then
		mini_classbarY = -(SPACING+(CLASSBAR_HEIGHT/2))
	end
	
	--Threat
	do
		local threat = frame.Threat

		if db.threatStyle ~= 'NONE' and db.threatStyle ~= nil then
			if db.threatStyle == "GLOW" then
				threat:SetFrameStrata('BACKGROUND')
				threat.glow:ClearAllPoints()
				threat.glow:SetBackdropBorderColor(0, 0, 0, 0)
				if E.db.ufb.threat and USE_EMPTY_BAR and not USE_POWERBAR_OFFSET then
					threat.glow:Point("TOPLEFT", frame.EmptyBar, "TOPLEFT", -SHADOW_SPACING, SHADOW_SPACING+mini_classbarY)
					threat.glow:Point("TOPRIGHT", frame.EmptyBar, "TOPRIGHT", SHADOW_SPACING, SHADOW_SPACING+mini_classbarY)			
				else
					threat.glow:Point("TOPLEFT", -SHADOW_SPACING, SHADOW_SPACING+mini_classbarY)
					threat.glow:Point("TOPRIGHT", SHADOW_SPACING, SHADOW_SPACING+mini_classbarY)
				end

				if USE_MINI_POWERBAR then
					if USE_EMPTY_BAR then
						threat.glow:Point("BOTTOMLEFT", frame.EmptyBar, "BOTTOMLEFT", -SHADOW_SPACING, -SHADOW_SPACING + (POWERBAR_HEIGHT/2))
						threat.glow:Point("BOTTOMRIGHT", frame.EmptyBar, "BOTTOMLEFT", SHADOW_SPACING, -SHADOW_SPACING + (POWERBAR_HEIGHT/2))
					else
						threat.glow:Point("BOTTOMLEFT", -SHADOW_SPACING, -SHADOW_SPACING + (POWERBAR_HEIGHT/2))
						threat.glow:Point("BOTTOMRIGHT", SHADOW_SPACING, -SHADOW_SPACING + (POWERBAR_HEIGHT/2))					
					end
				else
					if USE_EMPTY_BAR then
						threat.glow:Point("BOTTOMLEFT", frame.EmptyBar, "BOTTOMLEFT", -SHADOW_SPACING, -SHADOW_SPACING)
						threat.glow:Point("BOTTOMRIGHT", frame.EmptyBar, "BOTTOMRIGHT", SHADOW_SPACING, -SHADOW_SPACING)
					else
						threat.glow:Point("BOTTOMLEFT", -SHADOW_SPACING, -SHADOW_SPACING)
						threat.glow:Point("BOTTOMRIGHT", SHADOW_SPACING, -SHADOW_SPACING)					
					end
				end

				if USE_POWERBAR_OFFSET then
					threat.glow:Point("TOPRIGHT", SHADOW_SPACING-POWERBAR_OFFSET, SHADOW_SPACING+mini_classbarY)
					threat.glow:Point("BOTTOMRIGHT", SHADOW_SPACING-POWERBAR_OFFSET, -SHADOW_SPACING)

					if USE_PORTRAIT == true and not USE_PORTRAIT_OVERLAY then
						if PORTRAIT_DETACHED then -- check
							threat.glow:Point("TOPRIGHT", frame.portraitmover, "TOPRIGHT", SHADOW_SPACING, -SHADOW_SPACING)
							threat.glow:Point("BOTTOMRIGHT", frame.portraitmover, "BOTTOMRIGHT", SHADOW_SPACING, -SHADOW_SPACING)
						else
							threat.glow:Point("BOTTOMLEFT", frame.Portrait.backdrop, "BOTTOMLEFT", -4, -4)
						end
					else
						threat.glow:Point("BOTTOMLEFT", frame.Health, "BOTTOMLEFT", -5, -5)
					end
					threat.glow:Point("BOTTOMRIGHT", frame.Health, "BOTTOMRIGHT", 5, -5)
				end
			elseif db.threatStyle == "ICONTOPLEFT" or db.threatStyle == "ICONTOPRIGHT" or db.threatStyle == "ICONBOTTOMLEFT" or db.threatStyle == "ICONBOTTOMRIGHT" or db.threatStyle == "ICONTOP" or db.threatStyle == "ICONBOTTOM" or db.threatStyle == "ICONLEFT" or db.threatStyle == "ICONRIGHT" then
				threat:SetFrameStrata('HIGH')
				local point = db.threatStyle
				point = point:gsub("ICON", "")

				threat.texIcon:ClearAllPoints()
				threat.texIcon:SetPoint(point, frame.Health, point)
			end
		end
	end
end

function UFB:InitPlayer()
	self:Construct_PlayerFrame()
	hooksecurefunc(UF, 'Update_PlayerFrame', UFB.ArrangePlayer)
end
