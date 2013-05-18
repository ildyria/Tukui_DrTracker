local framelist, self, aura, classCat
local select = select
local UnitGUID, GetSpellInfo, GetTime, pairs, print = UnitGUID, GetSpellInfo, GetTime, pairs, print
local class = select(2, UnitClass('player'))

if Tukui then
	framelist = {
		--[FRAME NAME]	= {UNITID,SIZE,ANCHOR,ANCHORFRAME,X,Y,"ANCHORNEXT","ANCHORPREVIOUS",nextx,nexty},
		["TukuiPlayer"]	= {"player",34,"TOPRIGHT","TOPLEFT",-2,0,"RIGHT","LEFT",-2,0},
		["TukuiArena1"]	= {"arena1",26,"TOPRIGHT","TOPLEFT",-60,-1,"RIGHT","LEFT",-2,0},
		["TukuiArena2"]	= {"arena2",26,"TOPRIGHT","TOPLEFT",-60,-1,"RIGHT","LEFT",-2,0},
		["TukuiArena3"]	= {"arena3",26,"TOPRIGHT","TOPLEFT",-60,-1,"RIGHT","LEFT",-2,0},
		["TukuiArena4"]	= {"arena4",26,"TOPRIGHT","TOPLEFT",-60,-1,"RIGHT","LEFT",-2,0},
		["TukuiArena5"]	= {"arena5",26,"TOPRIGHT","TOPLEFT",-60,-1,"RIGHT","LEFT",-2,0},
	}

elseif ElvUI then
	framelist = {
		--[FRAME NAME]	= {UNITID,SIZE,ANCHOR,ANCHORFRAME,X,Y,"ANCHORNEXT","ANCHORPREVIOUS",nextx,nexty},
		-- My settings
		--["ElvUF_Player"]	= {"player",36,"TOPLEFT","BOTTOMLEFT",-1,-14,"LEFT","RIGHT",2,0},
		--["ElvUF_Target"]	= {"target",36,"TOPLEFT","BOTTOMLEFT",-1,-44,"LEFT","RIGHT",2,0},
		["ElvUF_Player"]	= {"player",40,"TOPRIGHT","TOPLEFT",-2,0,"RIGHT","LEFT",-2,0},
		["ElvUF_Arena1"]	= {"arena1",26,"TOPRIGHT","BOTTOMLEFT",-4,-10,"RIGHT","LEFT",-2,0},
		["ElvUF_Arena2"]	= {"arena2",26,"TOPRIGHT","BOTTOMLEFT",-4,-10,"RIGHT","LEFT",-2,0},
		["ElvUF_Arena3"]	= {"arena3",26,"TOPRIGHT","BOTTOMLEFT",-4,-10,"RIGHT","LEFT",-2,0},
		["ElvUF_Arena4"]	= {"arena4",26,"TOPRIGHT","BOTTOMLEFT",-4,-10,"RIGHT","LEFT",-2,0},
		["ElvUF_Arena5"]	= {"arena5",26,"TOPRIGHT","BOTTOMLEFT",-4,-10,"RIGHT","LEFT",-2,0},
	}
end

if class == 'DEATHKNIGHT' then
	classCat = {
		["silence"] = true,
		["ctrlstun"] = true,
		["ctrlroot"] = true,
		}
elseif class == 'DRUID' then
	classCat = {
		["disorient"] = true,
		["silence"] = false,
		["fear"] = false,
		["ctrlstun"] = true,
		["cyclone"] = true,
		["ctrlroot"] = true,
		}
elseif class == 'HUNTER' then
	classCat = {
		["disorient"] = true,
		["silence"] = true,
		["disarm"] = false,
		["fear"] = false,
		["ctrlstun"] = true,
		["ctrlroot"] = true,
		["scatters"] = true,
		["entrapment"] = false,
		}
elseif class == 'MAGE' then
	classCat = {
		["disorient"] = true,
		["silence"] = true,
		["ctrlstun"] = true,
		["ctrlroot"] = true,
		["scatters"] = false,
		["iceward"] = true,
		}
elseif class == 'MONK' then
	classCat = {
		["disorient"] = true,
		["silence"] = false,
		["disarm"] = true,
		["ctrlstun"] = true,
		["ctrlroot"] = true,
		}
elseif class == 'PALADIN' then
	classCat = {
		["disorient"] = true,
		["silence"] = false,
		["fear"] = false,
		["ctrlstun"] = true,
		}
elseif class == 'PRIEST' then
	classCat = {
		["disorient"] = false,
		["silence"] = true,
		["disarm"] = false,
		["fear"] = true,
		["ctrlroot"] = true,
		["horror"] = true,
		["mc"] = true,
		}
elseif class == 'ROGUE' then
	classCat = {
		["disorient"] = true,
		["silence"] = true,
		["disarm"] = false,
		["fear"] = true,
		["ctrlstun"] = true,
		["rndstun"] = false,
		["ctrlroot"] = false,
		}
elseif class == 'SHAMAN' then
	classCat = {
		["disorient"] = true,
		["ctrlstun"] = true,
		["ctrlroot"] = true,
		["bindelemental"] = true,
		}
elseif class == 'WARLOCK' then
	classCat = {
		["silence"] = true,
		["disarm"] = false,
		["fear"] = true,
		["ctrlstun"] = true,
		["horror"] = true,
		["banish"] = true,
		}
elseif class == 'WARRIOR' then
	classCat = {
		["disarm"] = true,
		["fear"] = true,
		["ctrlstun"] = true,
		["rndstun"] = true,
		["ctrlroot"] = true,
		}
end

local function GetDrIcons() 
	if class == 'DEATHKNIGHT' then
		return {
		["ctrlstun"] = select(3,GetSpellInfo(108194)), --Aspyxiate
		["ctrlroot"] = select(3,GetSpellInfo(96294)), -- Chains of Ice (Chilblains Root)
		["silence"] = select(3,GetSpellInfo(47476)), -- Strangulate
		}
	elseif class == 'DRUID' then
		return {
		["ctrlstun"] = select(3,GetSpellInfo(5211)), -- Mighty Bash
		["cyclone"] = select(3,GetSpellInfo(33786)),
		["disorient"] = select(3,GetSpellInfo(2637)), -- Hibernate
		["fear"] = select(3,GetSpellInfo(113056)), -- Intimidating Roar
		["ctrlroot"] = select(3,GetSpellInfo(339)), -- Entangling Roots
		["silence"] = select(3,GetSpellInfo(78675)), -- Solar Beam
		}
	elseif class == 'HUNTER' then
		return {
		["ctrlstun"] = select(3,GetSpellInfo(24394)), -- Intimidation
		["disarm"] = select(3,GetSpellInfo(91644)), -- Snatch
		["disorient"] = select(3,GetSpellInfo(91644)), -- Freezing Trap
		["entrapment"] = select(3,GetSpellInfo(64803)),
		["fear"] = select(3,GetSpellInfo(1513)), -- Scare Beast
		["ctrlroot"] = select(3,GetSpellInfo(128405)), -- Narrow Escape
		["scatters"] = select(3,GetSpellInfo(19503)),
		["silence"] = select(3,GetSpellInfo(34490)), -- Silencing Shot
		}
	elseif class == 'MAGE' then
		return {
		["ctrlstun"] = select(3,GetSpellInfo(44572)),
		["disorient"] = select(3,GetSpellInfo(118)),
		["iceward"] = select(3,GetSpellInfo(111340)),
		["ctrlroot"] = select(3,GetSpellInfo(122)),
		["scatters"] = select(3,GetSpellInfo(19503)),
		["silence"] = select(3,GetSpellInfo(55021)),
		}
	elseif class == 'MONK' then
		return {
		["ctrlstun"] = select(3,GetSpellInfo(119381)), -- Leg Sweep 
		["disarm"] = select(3,GetSpellInfo(117368)), -- Grapple Weapon
		["disorient"] = select(3,GetSpellInfo(115078)), -- Paralysis
		["ctrlroot"] = select(3,GetSpellInfo(116706)), -- Disable
		["silence"] = select(3,GetSpellInfo(116709)), -- Spear Hand Strike
		}
	elseif class == 'PALADIN' then
		return {
		["ctrlstun"] = select(3,GetSpellInfo(853)), -- Hammer of Justice
		["disorient"] = select(3,GetSpellInfo(20066)), -- Repentance
		["fear"] = select(3,GetSpellInfo(10326)), -- Turn Evil
		["silence"] = select(3,GetSpellInfo(31935)), -- Avenger's Shield
		}
	elseif class == 'PRIEST' then
		return {
		["disarm"] = select(3,GetSpellInfo(64058)), -- Psychic Horror (Disarm effect)
		["disorient"] = select(3,GetSpellInfo(9484)), -- Shackle Undead
		["fear"] = select(3,GetSpellInfo(8122)),
		["horror"] = select(3,GetSpellInfo(64044)),
		["mc"] = select(3,GetSpellInfo(605)),
		["ctrlroot"] = select(3,GetSpellInfo(114404)), -- Void Tendrils
		["silence"] = select(3,GetSpellInfo(15487)), -- Silence
		}
	elseif class == 'ROGUE' then
		return {
		["ctrlstun"] = select(3,GetSpellInfo(408)),-- Kidney Shot
		["disarm"] = select(3,GetSpellInfo(51722)), -- Dismantle
		["disorient"] = select(3,GetSpellInfo(6770)), -- Sap
		["fear"] = select(3,GetSpellInfo(2094)), -- Blind
		["rndstun"] = select(3,GetSpellInfo(113953)), -- Paralysis
		["ctrlroot"] = select(3,GetSpellInfo(116706)), -- Disable, because it shares icon with rndstun
		["silence"] = select(3,GetSpellInfo(1330)), -- Garrote
		}
	elseif class == 'SHAMAN' then
		return {
		["bindelemental"] = select(3,GetSpellInfo(76780)),
		["ctrlstun"] = select(3,GetSpellInfo(118905)), -- Static Charge (Capacitor Totem)
		["disorient"] = select(3,GetSpellInfo(51514)), -- Hex
		["ctrlroot"] = select(3,GetSpellInfo(64695)), -- Earthgrab
		}
	elseif class == 'WARLOCK' then
		return {
		["banish"] = select(3,GetSpellInfo(710)),
		["ctrlstun"] = select(3,GetSpellInfo(89766)), -- Axe Toss (Felguard)
		["disarm"] = select(3,GetSpellInfo(118093)), -- Disarm (Voidwalker/Voidlord)
		["fear"] = select(3,GetSpellInfo(118699)), -- Fear
		["horror"] = select(3,GetSpellInfo(6789)), -- Mortal Coil
		["silence"] = select(3,GetSpellInfo(24259)), -- Spell Lock (Felhunter)
		}
	elseif class == 'WARRIOR' then
		return {
		["ctrlstun"] = select(3,GetSpellInfo(132168)), -- Shockwave
		["disarm"] = select(3,GetSpellInfo(676)),
		["fear"] = select(3,GetSpellInfo(5246)), -- Intimidating Shout
		["rndstun"] = select(3,GetSpellInfo(118895)), -- Dragon Roar
		["ctrlroot"] = select(3,GetSpellInfo(107566)), -- Staggering Shout 
		}
	end
		--["test"] = select(3,GetSpellInfo(80353)),
end

local function GetSpellDR() 
	return {
		--[[ DISORIENTS ]]--
		[  2637] = {"disorient"},	-- Hibernate
		[    99] = {"disorient"},	-- Disorienting Roar (talent)
		[  3355] = {"disorient"},	-- Freezing Trap
		[ 19386] = {"disorient"},	-- Wyvern Sting
		[   118] = {"disorient"},	-- Polymorph
		[ 28272] = {"disorient"},	-- Polymorph (pig)
		[ 28271] = {"disorient"},	-- Polymorph (turtle)
		[ 61305] = {"disorient"},	-- Polymorph (black cat)
		[ 61025] = {"disorient"},	-- Polymorph (serpent) -- FIXME: gone ?
		[ 61721] = {"disorient"},	-- Polymorph (rabbit)
		[ 61780] = {"disorient"},	-- Polymorph (turkey)
		[ 82691] = {"disorient"},	-- Ring of Frost
		[115078] = {"disorient"},	-- Paralysis
		[ 20066] = {"disorient"},	-- Repentance
		[  9484] = {"disorient"},	-- Shackle Undead
		[  1776] = {"disorient"},	-- Gouge
		[  6770] = {"disorient"},	-- Sap
		[ 51514] = {"disorient"},	-- Hex
		[107079] = {"disorient"},	-- Quaking Palm

		--[[ SILENCES ]]--
		[ 47476] = {"silence"},		-- Strangulate
		[ 78675] = {"silence"},		-- Solar Beam -- FIXME: check id
		[ 81261] = {"silence"},		-- Solar Beam -- Definitely correct
		[ 34490] = {"silence"},		-- Silencing Shot
		[ 55021] = {"silence"},		-- Improved Counterspell
		[102051] = {"silence"},		-- Frostjaw (talent)
		[116709] = {"silence"},		-- Spear Hand Strike
		[ 31935] = {"silence"},		-- Avenger's Shield
		[ 15487] = {"silence"},		-- Silence
		[  1330] = {"silence"},		-- Garrote
		[ 24259] = {"silence"},		-- Spell Lock (Felhunter)
		[115782] = {"silence"},		-- Optical Blast (Observer)
		[ 18498] = {"silence"},		-- Glyph of Gag Order
		[ 25046] = {"silence"},		-- Arcane Torrent (Energy version)
		[ 28730] = {"silence"},		-- Arcane Torrent (Mana version)
		[ 50613] = {"silence"},		-- Arcane Torrent (Runic power version)
		[ 69179] = {"silence"},		-- Arcane Torrent (Rage version)
		[ 80483] = {"silence"},		-- Arcane Torrent (Focus version)

		--[[ DISARMS ]]--
		[ 91644] = {"disarm"},		-- Snatch (Bird of Prey)
		[ 50541] = {"disarm"},		-- Clench (Scorpid)
		[117368] = {"disarm"},		-- Grapple Weapon
		[ 64058] = {"disarm"},		-- Psychic Horror (Disarm effect)
		[ 51722] = {"disarm"},		-- Dismantle
		[118093] = {"disarm"},		-- Disarm (Voidwalker/Voidlord)
		[   676] = {"disarm"},		-- Disarm

		--[[ FEARS ]]--
		[  1513] = {"fear"},		-- Scare Beast
		[105421] = {"fear"},		-- Blinding Light
		[ 10326] = {"fear"},		-- Turn Evil
		[  8122] = {"fear"},		-- Psychic Scream
		[113792] = {"fear"},		-- Psychic Terror (Psyfiend)
		[  2094] = {"fear"},		-- Blind
		[118699] = {"fear"},		-- Fear -- new SpellID in MoP, Blood Fear uses same ID
		[  5484] = {"fear"},		-- Howl of Terror
		[  6358] = {"fear"},		-- Seduction (Succubus)
		[115268] = {"fear"},		-- Mesmerize (Shivarra) -- FIXME: verify this is the correct category
		[104045] = {"fear"},		-- Sleep (Metamorphosis) -- FIXME: verify this is the correct category
		[  5246] = {"fear"},		-- Intimidating Shout (main target)
		[ 20511] = {"fear"},		-- Intimidating Shout (secondary targets)

		--[[ CONTROL STUNS ]]--
		[108194] = {"ctrlstun"},	-- Asphyxiate (talent)
		[ 91800] = {"ctrlstun"},	-- Gnaw (Ghoul)
		[ 91797] = {"ctrlstun"},	-- Monstrous Blow (Dark Transformation Ghoul)
		[115001] = {"ctrlstun"},	-- Remorseless Winter (talent)
		[ 22570] = {"ctrlstun"},	-- Maim
		[  9005] = {"ctrlstun"},	-- Pounce
		[  5211] = {"ctrlstun"},	-- Mighty Bash (talent)
		[102795] = {"ctrlstun"},	-- Bear Hug
		[113801] = {"ctrlstun"},	-- Bash (treants in feral spec) (Bugged by blizzard - it instantly applies all 3 levels of DR right now, making any target instantly immune to ctrlstuns)
		[ 24394] = {"ctrlstun"},	-- Intimidation
		[ 90337] = {"ctrlstun"},	-- Bad Manner (Monkey)
		[ 50519] = {"ctrlstun"},	-- Sonic Blast (Bat)
		-- [ 56626] = {"ctrlstun"}, -- Sting (Wasp) --FIXME: this doesn't share with ctrlstun anymore. Unknown what it is right now, so watch for it on www.arenajunkies.com/topic/227748-mop-diminishing-returns-updating-the-list
		[117526] = {"ctrlstun"},	-- Binding Shot (talent)
		[ 44572] = {"ctrlstun"},	-- Deep Freeze
		[118271] = {"ctrlstun"},	-- Combustion Impact (Combustion; Fire)
		[119392] = {"ctrlstun"},	-- Charging Ox Wave (talent)
		[119381] = {"ctrlstun"},	-- Leg Sweep (talent)
		[122242] = {"ctrlstun"},	-- Clash (Brewmaster)
		[120086] = {"ctrlstun"},	-- Fists of Fury (Windwalker)
		[   853] = {"ctrlstun"},	-- Hammer of Justice
		[119072] = {"ctrlstun"},	-- Holy Wrath (Protection)
		[105593] = {"ctrlstun"},	-- Fist of Justice (talent)
		-- [ 88625] = {"ctrlstun"}, -- Holy Word: Chastise --FIXME: this doesn't share with ctrlstun anymore. Unknown what it is right now, so watch for it on www.arenajunkies.com/topic/227748-mop-diminishing-returns-updating-the-list
		[  1833] = {"ctrlstun"},	-- Cheap Shot
		[   408] = {"ctrlstun"},	-- Kidney Shot
		[118905] = {"ctrlstun"},	-- Static Charge (Capacitor Totem)
		[ 30283] = {"ctrlstun"},	-- Shadowfury
		[ 89766] = {"ctrlstun"},	-- Axe Toss (Felguard)
		-- [ 22703] = {"ctrlstun"}, -- Infernal Awakening (Infernal) -- According to the DR thread on AJ, this doesn't have DR at all.
		[132168] = {"ctrlstun"},	-- Shockwave
		[105771] = {"ctrlstun"},	-- Warbringer (talent)
		[ 20549] = {"ctrlstun"},	-- War Stomp

		--[[ RANDOM STUNS ]]--
		[113953] = {"rndstun"},		-- Paralysis (Paralytic Poison five stack stun)
		[118895] = {"rndstun"},		-- Dragon Roar (talent)
		[ 77505] = {"rndstun"},		-- Earthquake Knockdown (Elemental)
		[ 85387] = {"rndstun"},		-- Aftermath (Destruction)

		--[[ CYCLONE ]]--
		[ 33786] = {"cyclone"}, -- Cyclone

		--[[ ROOTS ]]--
		[ 96294] = {"ctrlroot"},	-- Chains of Ice (Chilblains Root)
		[   339] = {"ctrlroot"},	-- Entangling Roots
		[ 19975] = {"ctrlroot"},	-- Nature's Grasp (Uses different spellIDs than Entangling Roots for the same spell)
		[102359] = {"ctrlroot"},	-- Mass Entanglement (talent)
		[ 50245] = {"ctrlroot"},	-- Pin (Crab)
		[  4167] = {"ctrlroot"},	-- Web (Spider)
		[ 54706] = {"ctrlroot"},	-- Venom Web Spray (Silithid)
		[ 90327] = {"ctrlroot"},	-- Lock Jaw (Dog)
		[128405] = {"ctrlroot"},	-- Narrow Escape (talent)
		[   122] = {"ctrlroot"},	-- Frost Nova
		[ 33395] = {"ctrlroot"},	-- Freeze (Water Elemental)
		[116706] = {"ctrlroot"},	-- Disable
		[114404] = {"ctrlroot"},	-- Void Tendrils
		[ 64695] = {"ctrlroot"},	-- Earthgrab
		[ 63685] = {"ctrlroot"},	-- Freeze (Frozen Power talent)
		[107566] = {"ctrlroot"},	-- Staggering Shout (talent)

		--[[ HORROR ]]--
		[ 64044] = {"horror"},		-- Psychic Horror (Horrify effect)
		[ 87204] = {"horror"},		-- Sin and Punishment (MoP PvP 4 piece)
		[  6789] = {"horror"},		-- Mortal Coil

		--[[ MISC ]]--
		[ 19503] = {"scatters"},	-- Scatter Shot
		[ 31661] = {"scatters"},	-- Dragon's Breath
		[111340] = {"iceward"},		-- Ice Ward
		[   605] = {"mc"},			-- Dominate Mind
		[ 76780] = {"bindelemental"},-- Bind Elemental
		[   710] = {"banish"},		-- Banish
		[ 64803] = {"entrapment"},	-- Entrapment

		[  1459] = {"test"},		-- Testing purpose (Intel Mage)
		[   130] = {"test","fear"},	-- Testing purpose (Slow Fall)
	}
end

function UpdateDRTracker(self)
	local time = self.start + 18 - GetTime()

	if time < 0 then
		local frame = self:GetParent()
		frame.actives[self.cat] = nil
		self:SetScript("OnUpdate", nil)
		DisplayDrActives(frame)
	end
end

function DisplayDrActives(self)
--	print("mem DrTracker = "..GetAddOnMemoryUsage("Tukui_DrTracker"))
	if not self.actives then return end
	if not self.auras then self.auras = {} end
	local index
	local previous = nil
	index = 1
	
	for _, _ in pairs(self.actives) do
		local aura = self.auras[index]
		if not aura then
			aura = CreateFrame("Frame", "IldyUI"..self.target.."DrFrame"..index, self)
			aura:Width(self.size) -- default value
			aura:Height(self.size) -- default value
			aura:SetScale(1)
			aura:SetTemplate("Default")
			if index == 1 then
				aura:Point(self.anchor, self:GetParent().Health, self.anchorframe, self.x, self.y)
			else
				aura:Point(self.nextanchor, previous, self.nextanchorframe, self.nextx, self.nexty)
			end
			aura.icon = aura:CreateTexture("$parenticon", "ARTWORK")
			aura.icon:Point("TOPLEFT", 2, -2)
			aura.icon:Point("BOTTOMRIGHT", -2, 2)
			aura.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			aura.cooldown = CreateFrame("Cooldown", "$parentCD", aura, "CooldownFrameTemplate")
			aura.cooldown:SetAllPoints(aura.icon)
			aura.cooldown:SetReverse()
			aura.cat = "cat"
			aura.start = 0
			
			-- insert aura
			self.auras[index] = aura
		end
		-- save previous
		previous = aura
		-- next
		index = index + 1
	end

	index = 1
	for cat, value in pairs(self.actives) do
		aura = self.auras[index]
		aura.icon:SetTexture(value.icon)
		if(value.dr == 1) then
			aura:SetBackdropBorderColor(1,1,0,1)
		elseif(value.dr == 2) then
			aura:SetBackdropBorderColor(1,.5,0,1)
		else
			aura:SetBackdropBorderColor(1,0,0,1)
		end
		CooldownFrame_SetTimer(aura.cooldown, value.start, 18, 1)
		aura.start = value.start
		aura.cat = cat
		aura:SetScript("OnUpdate", UpdateDRTracker)
		aura.cooldown:Show()

		aura:Show()
		index = index + 1
	end
	
	-- Hide remaining
	for i = index, #self.auras, 1 do
		local aura = self.auras[i]
		aura:SetScript("OnUpdate", nil)
		aura:Hide()
	end
end

local spell = GetSpellDR()

local icon = GetDrIcons()

local eventRegistered = {
		["SPELL_AURA_APPLIED"] = true,
		["SPELL_AURA_REFRESH"] = true,
		["SPELL_AURA_REMOVED"] = true
		}

local function CombatLogCheck(self, ...)																-- Combat event handler
	local _, _, eventType, _, _, _, _, _, destGUID, _, _, _, spellID, _, _, auraType, _ = ...

	if( not eventRegistered[eventType] ) then
		return
	end

	if(destGUID ~= UnitGUID(self.target)) then
		return
	end


	-- Enemy gained a debuff
	local needupdate = false
	if( eventType == "SPELL_AURA_APPLIED" ) then
		if( auraType == "DEBUFF" and spell[spellID] ) then
		-- if( auraType == "BUFF" and spell[spellID]) then
			if not self.actives then self.actives = {} end
			for _,cat in pairs(spell[spellID]) do
				if classCat[cat] then
					if self.actives[cat] then
						if(self.actives[cat].start + 18 < GetTime()) then
							self.actives[cat].start = GetTime()
							self.actives[cat].dr = 1
							self.actives[cat].icon = icon[cat]
						else
							self.actives[cat].start = GetTime()
							self.actives[cat].dr = 2*self.actives[cat].dr
							self.actives[cat].icon = icon[cat]
						end
					else
						self.actives[cat] = {}
						self.actives[cat].start = GetTime()
						self.actives[cat].dr = 1
						self.actives[cat].icon = icon[cat]
					end
				end
			end
			needupdate = true
		end

	-- Enemy had a debuff refreshed before it faded, so fade + gain it quickly
	elseif( eventType == "SPELL_AURA_REFRESH" ) then
		if( auraType == "DEBUFF" and spell[spellID] ) then
		-- if( auraType == "BUFF" and spell[spellID]) then
			if not self.actives then self.actives = {} end
			for _,cat in pairs(spell[spellID]) do
				if classCat[cat] then
					if(not self.actives[cat]) then
						self.actives[cat] = {}
						self.actives[cat].dr = 1
					end
					self.actives[cat].start = GetTime()
					self.actives[cat].dr = 2*self.actives[cat].dr
					self.actives[cat].icon = icon[cat]
				end
			end
			needupdate = true
		end

	-- Buff or debuff faded from an enemy
	elseif( eventType == "SPELL_AURA_REMOVED" ) then
		if( auraType == "DEBUFF" and spell[spellID] ) then
		-- if( auraType == "BUFF" and spell[spellID]) then
			if not self.actives then self.actives = {} end
			for _,cat in pairs(spell[spellID]) do
				if classCat[cat] then
					if self.actives[cat] then
						if(self.actives[cat].start + 18 < GetTime()) then
							self.actives[cat].start = GetTime()
							self.actives[cat].dr = 1
							self.actives[cat].icon = icon[cat]
						else
							self.actives[cat].start = GetTime()
							self.actives[cat].dr = self.actives[cat].dr
							self.actives[cat].icon = icon[cat]
						end
					else
						self.actives[cat] = {}
						self.actives[cat].start = GetTime()
						self.actives[cat].dr = 1
						self.actives[cat].icon = icon[cat]
					end
				end
			end
			needupdate = true
		end
	end
	if (needupdate) then DisplayDrActives(self) end
end

--Drtracker Frame
for frame, target in pairs(framelist) do
	self = _G[frame]
	local DrTracker = CreateFrame("Frame", nil, self)
	DrTracker:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	DrTracker:SetScript("OnEvent",CombatLogCheck)
	DrTracker.target = target[1]
	DrTracker.size = target[2]
	DrTracker.anchor = target[3]
	DrTracker.anchorframe = target[4]
	DrTracker.x = target[5]
	DrTracker.y = target[6]
	DrTracker.nextanchor = target[7]
	DrTracker.nextanchorframe = target[8]
	DrTracker.nextx = target[9]
	DrTracker.nexty = target[10]
	self.DrTracker = DrTracker
end

local function tdr()
	-- don't allow moving while in combat
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	local testlist = {"fear","disorient","ctrlroot"}
	
	for frame, target in pairs(framelist) do
		self = _G[frame].DrTracker
		if not self.actives then self.actives = {} end
		local dr = 1
		for _,cat in pairs(testlist) do
			if(not self.actives[cat]) then self.actives[cat] = {} end
			self.actives[cat].dr = dr
			self.actives[cat].start = GetTime()
			self.actives[cat].icon = icon[cat]
			dr = dr*2
		end
		DisplayDrActives(self)
	end
end

SLASH_MOVINGDRTRACKER1 = "/tdr"
SlashCmdList["MOVINGDRTRACKER"] = tdr