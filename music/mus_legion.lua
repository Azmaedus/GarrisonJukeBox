-- STRUCTURE 
-- [1] : Integer - ID of the music (new system)
-- [2] : String - Path of the music file
-- [3] : Integer - Length of the music file in seconds

-- Get localization
local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Legion
local music = {
	{
		id = 252,
		name = L["TITLE_LEGION_ANDUIN"],
		files = {
			{2594, "sound\\music\\Legion\\MUS_70_AnduinPt1_A1.mp3", 74},
			{2595, "sound\\music\\Legion\\MUS_70_AnduinPt1_A2.mp3", 112},
			{2596, "sound\\music\\Legion\\MUS_70_AnduinPt1_B.mp3", 140},
			{2597, "sound\\music\\Legion\\MUS_70_AnduinPt1_C.mp3", 137},
			{2598, "sound\\music\\Legion\\MUS_70_AnduinPt1_D.mp3", 89},
			{2599, "sound\\music\\Legion\\MUS_70_AnduinPt1_E.mp3", 70},
			{2600, "sound\\music\\Legion\\MUS_70_AnduinPt1_H1.mp3", 87},
			{2601, "sound\\music\\Legion\\MUS_70_AnduinPt1_H2.mp3", 115},
			{2602, "sound\\music\\Legion\\MUS_70_AnduinPt2_B.mp3", 111},
			{2603, "sound\\music\\Legion\\MUS_70_AnduinPt2_C.mp3", 53},
			{2604, "sound\\music\\Legion\\MUS_70_AnduinPt2_H.mp3", 122},
		},
	},

	{
		id = 253,
		name = L["TITLE_LEGION_DALARAN"],
		files = {
			{2605, "sound\\music\\Legion\\MUS_70_DalaranDawn_A.mp3", 94},
			{2606, "sound\\music\\Legion\\MUS_70_DalaranDawn_B.mp3", 91},
			{2607, "sound\\music\\Legion\\MUS_70_DalaranDawn_H.mp3", 93},
			{2608, "sound\\music\\Legion\\MUS_70_DalaranDusk_A.mp3", 97},
			{2609, "sound\\music\\Legion\\MUS_70_DalaranDusk_B.mp3", 94},
			{2610, "sound\\music\\Legion\\MUS_70_DalaranDusk_C.mp3", 96},
			{2611, "sound\\music\\Legion\\MUS_70_DalaranDusk_H.mp3", 97},
			{2612, "sound\\music\\Legion\\MUS_70_DalaranHalls1_A.mp3", 134},
			{2613, "sound\\music\\Legion\\MUS_70_DalaranHalls1_B.mp3", 126},
			{2614, "sound\\music\\Legion\\MUS_70_DalaranHalls1_C.mp3", 131},
			{2615, "sound\\music\\Legion\\MUS_70_DalaranHalls1_H.mp3", 137},
			{2616, "sound\\music\\Legion\\MUS_70_DalaranHalls2_A.mp3", 110},
			{2617, "sound\\music\\Legion\\MUS_70_DalaranHalls2_B.mp3", 110},
			{2618, "sound\\music\\Legion\\MUS_70_DalaranHalls2_H.mp3", 110},
			{2619, "sound\\music\\Legion\\MUS_70_DalaranJaina_A.mp3", 102},
			{2620, "sound\\music\\Legion\\MUS_70_DalaranJaina_B.mp3", 115},
			{2621, "sound\\music\\Legion\\MUS_70_DalaranJaina_C.mp3", 65},
			{2622, "sound\\music\\Legion\\MUS_70_DalaranJaina_H.mp3", 65},
			{2623, "sound\\music\\Legion\\MUS_70_DalaranKhadgar_Day_A.mp3", 67},
			{2624, "sound\\music\\Legion\\MUS_70_DalaranKhadgar_Day_B.mp3", 49},
			{2625, "sound\\music\\Legion\\MUS_70_DalaranKhadgar_Day_C.mp3", 66},
			{2626, "sound\\music\\Legion\\MUS_70_DalaranKhadgar_Day_H.mp3", 67},
			{2627, "sound\\music\\Legion\\MUS_70_DalaranKhadgar_Night_A.mp3", 72},
			{2628, "sound\\music\\Legion\\MUS_70_DalaranKhadgar_Night_B.mp3", 77},
			{2629, "sound\\music\\Legion\\MUS_70_DalaranKhadgar_Night_C.mp3", 66},
			{2630, "sound\\music\\Legion\\MUS_70_DalaranKhadgar_Night_H.mp3", 73},
			{2631, "sound\\music\\Legion\\MUS_70_DalaranSewers1_A.mp3", 131},
			{2632, "sound\\music\\Legion\\MUS_70_DalaranSewers1_B.mp3", 94},
			{2633, "sound\\music\\Legion\\MUS_70_DalaranSewers1_C.mp3", 69},
			{2634, "sound\\music\\Legion\\MUS_70_DalaranSewers1_H.mp3", 131},
			{2635, "sound\\music\\Legion\\MUS_70_DalaranSewers2_A.mp3", 153},
			{2636, "sound\\music\\Legion\\MUS_70_DalaranSewers2_B.mp3", 128},
			{2637, "sound\\music\\Legion\\MUS_70_DalaranSewers2_H.mp3", 155},
		},
	},

	{
		id = 254,
		name = L["TITLE_LEGION_MISC"],
		files = {
			{2638, "sound\\music\\Legion\\MUS_70_AsSoonAsPret_A.mp3", 89},
			{2639, "sound\\music\\Legion\\MUS_70_AsSoonAsPret_B.mp3", 81},
			{2640, "sound\\music\\Legion\\MUS_70_AsSoonAsPret_H.mp3", 126},
			{2641, "sound\\music\\Legion\\MUS_70_ClientScene_MAW_Intro_Moment.mp3", 19},
			{2656, "sound\\music\\Legion\\MUS_70_Glimmer_A.mp3", 46},
			{2657, "sound\\music\\Legion\\MUS_70_Glimmer_H.mp3", 47},
			{2784, "sound\\music\\Legion\\MUS_70_Totems_H.mp3", 349},
		},
	},

	{
		id = 255,
		name = L["TITLE_LEGION_DEMONHUNTER"],
		files = {
			{2642, "sound\\music\\Legion\\MUS_70_DemonHunterPt1_B.mp3", 110},
			{2643, "sound\\music\\Legion\\MUS_70_DemonHunterPt1_C.mp3", 66},
			{2644, "sound\\music\\Legion\\MUS_70_DemonHunterPt1_D.mp3", 78},
			{2645, "sound\\music\\Legion\\MUS_70_DemonHunterPt1_H.mp3", 127},
			{2646, "sound\\music\\Legion\\MUS_70_DemonHunterPt2_A.mp3", 55},
			{2647, "sound\\music\\Legion\\MUS_70_DemonHunterPt2_B1.mp3", 82},
			{2648, "sound\\music\\Legion\\MUS_70_DemonHunterPt2_B2.mp3", 77},
			{2649, "sound\\music\\Legion\\MUS_70_DemonHunterPt2_C.mp3", 72},
			{2650, "sound\\music\\Legion\\MUS_70_DemonHunterPt2_H.mp3", 122},
			{2651, "sound\\music\\Legion\\MUS_70_DemonHunterPt3_A.mp3", 72},
			{2652, "sound\\music\\Legion\\MUS_70_DemonHunterPt3_B.mp3", 72},
			{2653, "sound\\music\\Legion\\MUS_70_DemonHunterPt3_C.mp3", 36},
			{2654, "sound\\music\\Legion\\MUS_70_DemonHunterPt3_D.mp3", 64},
			{2655, "sound\\music\\Legion\\MUS_70_DemonHunterPt3_H.mp3", 130},
		},
	},

	{
		id = 256,
		name = L["TITLE_LEGION_EMERALDHIGHTMARE"],
		files = {
			{2658, "sound\\music\\Legion\\MUS_70_EmeraldNightmareOrch_A.mp3", 69},
			{2659, "sound\\music\\Legion\\MUS_70_EmeraldNightmareOrch_B.mp3", 62},
			{2660, "sound\\music\\Legion\\MUS_70_EmeraldNightmareOrch_H.mp3", 137},
			{2661, "sound\\music\\Legion\\MUS_70_EmeraldNightmareSyn_A.mp3", 111},
			{2662, "sound\\music\\Legion\\MUS_70_EmeraldNightmareSyn_H.mp3", 128},
			{2663, "sound\\music\\Legion\\MUS_70_EmeraldNightmare_C.mp3", 130},
			{2664, "sound\\music\\Legion\\MUS_70_EmeraldNightmare_D.mp3", 118},
			{2665, "sound\\music\\Legion\\MUS_70_EmeraldNightmare_E.mp3", 33},
			{2666, "sound\\music\\Legion\\MUS_70_EmeraldNightmare_F.mp3", 34},
			{2667, "sound\\music\\Legion\\MUS_70_EmeraldNightmare_G.mp3", 113},
			{2668, "sound\\music\\Legion\\MUS_70_EmeraldNightmare_J.mp3", 100},
			{2669, "sound\\music\\Legion\\MUS_70_EmeraldNightmare_K.mp3", 114},
			{2670, "sound\\music\\Legion\\MUS_70_EmeraldNightmare_L.mp3", 97},
			{2671, "sound\\music\\Legion\\MUS_70_EmeraldNightmare_M.mp3", 92},
		},
	},

	{
		id = 257,
		name = L["TITLE_LEGION_ENCHANTEDNE"],
		files = {
			{2672, "sound\\music\\Legion\\MUS_70_EnchantedNightElves_A.mp3", 99},
			{2673, "sound\\music\\Legion\\MUS_70_EnchantedNightElves_B.mp3", 100},
			{2674, "sound\\music\\Legion\\MUS_70_EnchantedNightElves_C.mp3", 101},
			{2675, "sound\\music\\Legion\\MUS_70_EnchantedNightElves_H.mp3", 101},
		},
	},

	{
		id = 258,
		name = L["TITLE_LEGION_ENRAPTUREDWOOD"],
		files = {
			{2676, "sound\\music\\Legion\\MUS_70_EnrapturedWoodlands_A.mp3", 123},
			{2677, "sound\\music\\Legion\\MUS_70_EnrapturedWoodlands_B.mp3", 102},
			{2678, "sound\\music\\Legion\\MUS_70_EnrapturedWoodlands_C.mp3", 92},
			{2679, "sound\\music\\Legion\\MUS_70_EnrapturedWoodlands_H.mp3", 124},
		},
	},

	{
		id = 259,
		name = L["TITLE_LEGION_FELGLADE"],
		files = {
			{2680, "sound\\music\\Legion\\MUS_70_FelGlade_A.mp3", 40},
			{2681, "sound\\music\\Legion\\MUS_70_FelGlade_B.mp3", 82},
			{2682, "sound\\music\\Legion\\MUS_70_FelGlade_C.mp3", 99},
			{2683, "sound\\music\\Legion\\MUS_70_FelGlade_H.mp3", 96},
		},
	},

	{
		id = 260,
		name = L["TITLE_LEGION_HIGHELFTOMB"],
		files = {
			{2684, "sound\\music\\Legion\\MUS_70_HighElfTomb_A.mp3", 69},
			{2685, "sound\\music\\Legion\\MUS_70_HighElfTomb_H1.mp3", 101},
			{2686, "sound\\music\\Legion\\MUS_70_HighElfTomb_H2.mp3", 111},
		},
	},

	{
		id = 261,
		name = L["TITLE_LEGION_HIGHMOUNTAIN"],
		files = {
			{2687, "sound\\music\\Legion\\MUS_70_HighMountain1_A.mp3", 83},
			{2688, "sound\\music\\Legion\\MUS_70_HighMountain1_B.mp3", 91},
			{2689, "sound\\music\\Legion\\MUS_70_HighMountain1_H.mp3", 91},
			{2690, "sound\\music\\Legion\\MUS_70_HighMountain2_A.mp3", 83},
			{2691, "sound\\music\\Legion\\MUS_70_HighMountain2_B.mp3", 84},
			{2692, "sound\\music\\Legion\\MUS_70_HighMountain2_H.mp3", 84},
			{2693, "sound\\music\\Legion\\MUS_70_HighMountain3_A.mp3", 66},
			{2694, "sound\\music\\Legion\\MUS_70_HighMountain3_B.mp3", 66},
			{2695, "sound\\music\\Legion\\MUS_70_HighMountain3_H.mp3", 65},
			{2696, "sound\\music\\Legion\\MUS_70_HighMountain4_A.mp3", 103},
			{2697, "sound\\music\\Legion\\MUS_70_HighMountain4_B.mp3", 104},
			{2698, "sound\\music\\Legion\\MUS_70_HighMountain4_H.mp3", 105},
			{2699, "sound\\music\\Legion\\MUS_70_HighMountain5_A.mp3", 62},
			{2700, "sound\\music\\Legion\\MUS_70_HighMountain5_B.mp3", 61},
			{2701, "sound\\music\\Legion\\MUS_70_HighMountain5_H.mp3", 62},
		},
	},

	{
		id = 262,
		name = L["TITLE_LEGION_HOLYWARRIORS"],
		files = {
			{2702, "sound\\music\\Legion\\MUS_70_HolyWarriorsGather_A.mp3", 60},
			{2703, "sound\\music\\Legion\\MUS_70_HolyWarriorsGather_B.mp3", 137},
			{2704, "sound\\music\\Legion\\MUS_70_HolyWarriorsGather_C.mp3", 137},
			{2705, "sound\\music\\Legion\\MUS_70_HolyWarriorsGather_H.mp3", 137},
			{2706, "sound\\music\\Legion\\MUS_70_HolyWarriorsOath_A.mp3", 74},
			{2707, "sound\\music\\Legion\\MUS_70_HolyWarriorsOath_B.mp3", 109},
			{2708, "sound\\music\\Legion\\MUS_70_HolyWarriorsOath_C.mp3", 130},
			{2709, "sound\\music\\Legion\\MUS_70_HolyWarriorsOath_D.mp3", 131},
			{2710, "sound\\music\\Legion\\MUS_70_HolyWarriorsOath_E.mp3", 131},
			{2711, "sound\\music\\Legion\\MUS_70_HolyWarriorsOath_F.mp3", 73},
			{2712, "sound\\music\\Legion\\MUS_70_HolyWarriorsOath_G.mp3", 102},
			{2713, "sound\\music\\Legion\\MUS_70_HolyWarriorsOath_H.mp3", 131},
		},
	},

	{
		id = 263,
		name = L["TITLE_LEGION_LAILADEMON"],
		files = {
			{2714, "sound\\music\\Legion\\MUS_70_LailaDemon_A.mp3", 126},
			{2715, "sound\\music\\Legion\\MUS_70_LailaDemon_B.mp3", 125},
			{2716, "sound\\music\\Legion\\MUS_70_LailaDemon_C.mp3", 120},
			{2717, "sound\\music\\Legion\\MUS_70_LailaDemon_D1.mp3", 95},
			{2718, "sound\\music\\Legion\\MUS_70_LailaDemon_D2.mp3", 97},
			{2719, "sound\\music\\Legion\\MUS_70_LailaDemon_H.mp3", 192},
		},
	},

	{
		id = 264,
		name = L["TITLE_LEGION_LASTSTAND"],
		files = {
			{2720, "sound\\music\\Legion\\MUS_70_LastStand_H1.mp3", 84},
			{2721, "sound\\music\\Legion\\MUS_70_LastStand_H2.mp3", 87},
			{2722, "sound\\music\\Legion\\MUS_70_LastStand_H3End.mp3", 72},
			{2723, "sound\\music\\Legion\\MUS_70_LastStand_H3_Stinger_01.mp3", 11},
		},
	},

	{
		id = 265,
		name = L["TITLE_LEGION_LEYLINES"],
		files = {
			{2724, "sound\\music\\Legion\\MUS_70_LeyLines_A.mp3", 69},
			{2725, "sound\\music\\Legion\\MUS_70_LeyLines_B.mp3", 69},
			{2726, "sound\\music\\Legion\\MUS_70_LeyLines_C.mp3", 65},
			{2727, "sound\\music\\Legion\\MUS_70_LeyLines_H.mp3", 92},
		},
	},

	{
		id = 266,
		name = L["TITLE_LEGION_MENACEDARKTITANS"],
		files = {
			{2728, "sound\\music\\Legion\\MUS_70_MenaceoftheDarkTitans_A.mp3", 121},
			{2729, "sound\\music\\Legion\\MUS_70_MenaceoftheDarkTitans_B.mp3", 95},
			{2730, "sound\\music\\Legion\\MUS_70_MenaceoftheDarkTitans_C.mp3", 98},
			{2731, "sound\\music\\Legion\\MUS_70_MenaceoftheDarkTitans_H1.mp3", 84},
			{2732, "sound\\music\\Legion\\MUS_70_MenaceoftheDarkTitans_H2.mp3", 65},
		},
	},

	{
		id = 267,
		name = L["TITLE_LEGION_MIRE"],
		files = {
			{2733, "sound\\music\\Legion\\MUS_70_Mire1_H.mp3", 9},
			{2734, "sound\\music\\Legion\\MUS_70_Mire2_H.mp3", 15},
			{2735, "sound\\music\\Legion\\MUS_70_Mire3_H.mp3", 23},
			{2736, "sound\\music\\Legion\\MUS_70_Mire4_H.mp3", 9},
			{2737, "sound\\music\\Legion\\MUS_70_Mire5_H.mp3", 12},
		},
	},

	{
		id = 268,
		name = L["TITLE_LEGION_MOONRISING"],
		files = {
			{2738, "sound\\music\\Legion\\MUS_70_MoonRising_A.mp3", 121},
			{2739, "sound\\music\\Legion\\MUS_70_MoonRising_B.mp3", 119},
			{2740, "sound\\music\\Legion\\MUS_70_MoonRising_C.mp3", 125},
			{2741, "sound\\music\\Legion\\MUS_70_MoonRising_H.mp3", 157},
		},
	},

	{
		id = 269,
		name = L["TITLE_LEGION_NOSSHARAH"],
		files = {
			{2742, "sound\\music\\Legion\\MUS_70_NosSharah_A.mp3", 75},
			{2743, "sound\\music\\Legion\\MUS_70_NosSharah_B.mp3", 62},
			{2744, "sound\\music\\Legion\\MUS_70_NosSharah_C.mp3", 46},
			{2745, "sound\\music\\Legion\\MUS_70_NosSharah_D.mp3", 126},
			{2746, "sound\\music\\Legion\\MUS_70_NosSharah_E.mp3", 75},
			{2747, "sound\\music\\Legion\\MUS_70_NosSharah_H.mp3", 127},
		},
	},

	{
		id = 270,
		name = L["TITLE_LEGION_ORDERHALLDEV"],
		files = {
			{2748, "sound\\music\\Legion\\MUS_70_OrderHallDevotions_A.mp3", 113},
			{2749, "sound\\music\\Legion\\MUS_70_OrderHallDevotions_B.mp3", 128},
			{2750, "sound\\music\\Legion\\MUS_70_OrderHallDevotions_C.mp3", 119},
			{2751, "sound\\music\\Legion\\MUS_70_OrderHallDevotions_D.mp3", 127},
			{2752, "sound\\music\\Legion\\MUS_70_OrderHallDevotions_E.mp3", 66},
			{2753, "sound\\music\\Legion\\MUS_70_OrderHallDevotions_F.mp3", 127},
			{2754, "sound\\music\\Legion\\MUS_70_OrderHallDevotions_H.mp3", 126},
		},
	},

	{
		id = 271,
		name = L["TITLE_LEGION_PASSAGE"],
		files = {
			{2755, "sound\\music\\Legion\\MUS_70_Passage_A1.mp3", 76},
			{2756, "sound\\music\\Legion\\MUS_70_Passage_A2.mp3", 109},
			{2757, "sound\\music\\Legion\\MUS_70_Passage_B.mp3", 74},
			{2758, "sound\\music\\Legion\\MUS_70_Passage_C.mp3", 79},
			{2759, "sound\\music\\Legion\\MUS_70_Passage_D.mp3", 183},
			{2760, "sound\\music\\Legion\\MUS_70_Passage_H1.mp3", 102},
			{2761, "sound\\music\\Legion\\MUS_70_Passage_H2.mp3", 85},
		},
	},

	{
		id = 272,
		name = L["TITLE_LEGION_PRESERVER"],
		files = {
			{2762, "sound\\music\\Legion\\MUS_70_Preserver_H1.mp3", 90},
			{2763, "sound\\music\\Legion\\MUS_70_Preserver_H2.mp3", 97},
			{2764, "sound\\music\\Legion\\MUS_70_Preserver_H3End.mp3", 56},
		},
	},

	{
		id = 273,
		name = L["TITLE_LEGION_REQUIEMLOSTCITY"],
		files = {
			{2765, "sound\\music\\Legion\\MUS_70_RequiemfortheLostCities_A.mp3", 55},
			{2766, "sound\\music\\Legion\\MUS_70_RequiemfortheLostCities_B.mp3", 49},
			{2767, "sound\\music\\Legion\\MUS_70_RequiemfortheLostCities_C.mp3", 102},
			{2768, "sound\\music\\Legion\\MUS_70_RequiemfortheLostCities_D.mp3", 66},
			{2769, "sound\\music\\Legion\\MUS_70_RequiemfortheLostCities_E.mp3", 96},
			{2770, "sound\\music\\Legion\\MUS_70_RequiemfortheLostCities_F.mp3", 96},
			{2771, "sound\\music\\Legion\\MUS_70_RequiemfortheLostCities_G.mp3", 82},
			{2772, "sound\\music\\Legion\\MUS_70_RequiemfortheLostCities_H1.mp3", 91},
			{2773, "sound\\music\\Legion\\MUS_70_RequiemfortheLostCities_H2.mp3", 29},
			{2774, "sound\\music\\Legion\\MUS_70_RequiemfortheLostCities_H3End.mp3", 91},
		},
	},

	{
		id = 274,
		name = L["TITLE_LEGION_SACREDSTONE"],
		files = {
			{2775, "sound\\music\\Legion\\MUS_70_SacredStone_A.mp3", 120},
			{2776, "sound\\music\\Legion\\MUS_70_SacredStone_B.mp3", 113},
			{2777, "sound\\music\\Legion\\MUS_70_SacredStone_H.mp3", 124},
		},
	},

	{
		id = 275,
		name = L["TITLE_LEGION_WEEP"],
		files = {
			{2778, "sound\\music\\Legion\\MUS_70_Weep_Flute.mp3", 110},
			{2779, "sound\\music\\Legion\\MUS_70_Weep_Horn.mp3", 110},
			{2780, "sound\\music\\Legion\\MUS_70_Weep_Viola.mp3", 110},
			{2781, "sound\\music\\Legion\\MUS_70_Weep_WW.mp3", 110},
		},
	},

	{
		id = 276,
		name = L["TITLE_LEGION_WINDSEAST"],
		files = {
			{2782, "sound\\music\\Legion\\MUS_70_WindsOutoftheEast_A.mp3", 96},
			{2783, "sound\\music\\Legion\\MUS_70_WindsOutoftheEast_H.mp3", 89},
		},
	},

	{
		id = 277,
		name = L["TITLE_LEGION_SURAMAR"],
		files = {
			{2785, "sound\\music\\Legion\\MUS_70_Suramar_Pt1_A.mp3", 69},
			{2786, "sound\\music\\Legion\\MUS_70_Suramar_Pt1_H.mp3", 70},
		},
	},

	{
		id = 278,
		name = L["TITLE_LEGION_STORMHEIM"],
		files = {
			{2787, "sound\\music\\Legion\\MUS_70_Stormheim_H.mp3", 197},
		},
	},
}

GJB.musictable[GJB.EXP_LEGION] = music
