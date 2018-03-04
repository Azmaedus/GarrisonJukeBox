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
			{2787, "sound\\music\\legion\\mus_70_balloonride_stinger_01.mp3", 11},
			{2796, "sound\\music\\legion\\mus_70_chaoschimes_01.mp3", 81},
			{2797, "sound\\music\\legion\\mus_70_clientscene_70_if1_01.mp3", 45},
			{2798, "sound\\music\\legion\\mus_70_clientscene_70_if2_01.mp3", 73},
			{2799, "sound\\music\\legion\\mus_70_clientscene_70_if3_01.mp3", 70},
			{2641, "sound\\music\\Legion\\MUS_70_ClientScene_MAW_Intro_Moment.mp3", 19},
			{2656, "sound\\music\\Legion\\MUS_70_Glimmer_A.mp3", 46},
			{2657, "sound\\music\\Legion\\MUS_70_Glimmer_H.mp3", 47},
			{2784, "sound\\music\\Legion\\MUS_70_Totems_H.mp3", 349},
			{2815, "sound\\music\\legion\\mus_70_invincible_stinger_01.mp3", 11},
			{2816, "sound\\music\\legion\\mus_70_kingdomswillburn_maintitle.mp3", 649},
			{2824, "sound\\music\\legion\\mus_70_mylunesmelody_full.mp3", 43},
			{2834, "sound\\music\\legion\\mus_70_ruinsofauberdine_01_stinger_01.mp3", 9},
			{2861, "sound\\music\\legion\\mus_70_tourneybattle06_stinger_01.mp3", 9},
			{2874, "sound\\music\\legion\\mus_71_bondsoffate.mp3", 88},
			{2891, "sound\\music\\legion\\mus_72_cavernwindh.mp3", 123},
			{2892, "sound\\music\\legion\\mus_72_noreturningh.mp3", 180},
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
			{2804, "sound\\music\\legion\\mus_70_highmountain6_a.mp3", 78},
			{2805, "sound\\music\\legion\\mus_70_highmountain6_b.mp3", 80},
			{2806, "sound\\music\\legion\\mus_70_highmountain6_h.mp3", 80},
			{2807, "sound\\music\\legion\\mus_70_highmountain7_a.mp3", 42},
			{2808, "sound\\music\\legion\\mus_70_highmountain7_b.mp3", 43},
			{2809, "sound\\music\\legion\\mus_70_highmountain7_h.mp3", 43},
			{2810, "sound\\music\\legion\\mus_70_highmountain8_a.mp3", 51},
			{2811, "sound\\music\\legion\\mus_70_highmountain8_b.mp3", 50},
			{2812, "sound\\music\\legion\\mus_70_highmountain8_h.mp3", 50},
			{2813, "sound\\music\\legion\\mus_70_highmountain9_a.mp3", 37},
			{2814, "sound\\music\\legion\\mus_70_highmountain9_h.mp3", 37},
			{2800, "sound\\music\\legion\\mus_70_highmountain10_a.mp3", 110},
			{2801, "sound\\music\\legion\\mus_70_highmountain10_b.mp3", 111},
			{2802, "sound\\music\\legion\\mus_70_highmountain10_h.mp3", 110},
			{2803, "sound\\music\\legion\\mus_70_highmountain10_stinger_01.mp3", 13},
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
			{2817, "sound\\music\\legion\\mus_70_laststand_a.mp3", 78},
			{2818, "sound\\music\\legion\\mus_70_laststand_b.mp3", 78},
			{2819, "sound\\music\\legion\\mus_70_laststand_c.mp3", 78},
			{2820, "sound\\music\\legion\\mus_70_laststand_d.mp3", 78},
			{2821, "sound\\music\\legion\\mus_70_laststand_e.mp3", 78},
			{2822, "sound\\music\\legion\\mus_70_laststand_f.mp3", 78},
			{2720, "sound\\music\\Legion\\MUS_70_LastStand_H1.mp3", 84},
			{2823, "sound\\music\\legion\\mus_70_laststand_h1_stinger_01.mp3", 9},
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
			{2847, "sound\\music\\legion\\mus_70_suramar_pt1_b.mp3", 59},
			{2848, "sound\\music\\legion\\mus_70_suramar_pt2_a.mp3", 63},
			{2849, "sound\\music\\legion\\mus_70_suramar_pt2_b.mp3", 95},
			{2850, "sound\\music\\legion\\mus_70_suramar_pt2_h.mp3", 100},
		},
	},

	{
		id = 278,
		name = L["TITLE_LEGION_STORMHEIM"],
		files = {
			{2787, "sound\\music\\Legion\\MUS_70_Stormheim_H.mp3", 197},
			{2839, "sound\\music\\legion\\mus_70_stormheim_a.mp3", 88},
			{2840, "sound\\music\\legion\\mus_70_stormheim_b1.mp3", 76},
			{2841, "sound\\music\\legion\\mus_70_stormheim_b2.mp3", 123},
			{2842, "sound\\music\\legion\\mus_70_stormheim_c.mp3", 156},
			{2843, "sound\\music\\legion\\mus_70_stormheim_d.mp3", 42},
			{2844, "sound\\music\\legion\\mus_70_stormheim_e.mp3", 54},
			{2845, "sound\\music\\legion\\mus_70_stormheim_f.mp3", 64},
			{2846, "sound\\music\\legion\\mus_70_stormheim_g.mp3", 65},
		},
	},
	
	{
		id = 279,
		name = L["TITLE_LEGION_CANTICLE"],
		files = {
			{2789, "sound\\music\\legion\\mus_70_canticleofsacrifice_a.mp3", 247},
			{2790, "sound\\music\\legion\\mus_70_canticleofsacrifice_b.mp3", 249},
			{2791, "sound\\music\\legion\\mus_70_canticleofsacrifice_c.mp3", 177},
			{2792, "sound\\music\\legion\\mus_70_canticleofsacrifice_d.mp3", 184},
			{2793, "sound\\music\\legion\\mus_70_canticleofsacrifice_e.mp3", 13},
			{2794, "sound\\music\\legion\\mus_70_canticleofsacrifice_f.mp3", 53},
			{2795, "sound\\music\\legion\\mus_70_canticleofsacrifice_h.mp3", 253},
		},
	},

	{
		id = 280,
		name = L["TITLE_LEGION_RELENTLESS"],
		files = {
			{2825, "sound\\music\\legion\\mus_70_relentless_a.mp3", 6},
			{2826, "sound\\music\\legion\\mus_70_relentless_b.mp3", 6},
			{2827, "sound\\music\\legion\\mus_70_relentless_c.mp3", 7},
			{2828, "sound\\music\\legion\\mus_70_relentless_d.mp3", 7},
			{2829, "sound\\music\\legion\\mus_70_relentless_e.mp3", 13},
			{2830, "sound\\music\\legion\\mus_70_relentless_f.mp3", 9},
			{2831, "sound\\music\\legion\\mus_70_relentless_g.mp3", 50},
			{2832, "sound\\music\\legion\\mus_70_relentless_h.mp3", 149},
			{2833, "sound\\music\\legion\\mus_70_relentless_j.mp3", 78},
		},
	},

	{
		id = 281,
		name = L["TITLE_LEGION_ROSE"],
		files = {
			{2835, "sound\\music\\legion\\mus_70_rose_a.mp3", 75},
			{2836, "sound\\music\\legion\\mus_70_rose_h.mp3", 75},
		},
	},

	{
		id = 282,
		name = L["TITLE_LEGION_KARAZHAN"],
		files = {
			{2837, "sound\\music\\legion\\mus_70_sanctumofkarazhan_h1.mp3", 102},
			{2838, "sound\\music\\legion\\mus_70_sanctumofkarazhan_h2.mp3", 118},
			{2865, "sound\\music\\legion\\mus_71_karazhan_1h.mp3", 58},
			{2866, "sound\\music\\legion\\mus_71_karazhan_2h.mp3", 94},
			{2867, "sound\\music\\legion\\mus_71_karazhan_3h.mp3", 61},
			{2868, "sound\\music\\legion\\mus_71_karazhan_4h.mp3", 100},
			{2869, "sound\\music\\legion\\mus_71_karazhan_5h.mp3", 126},
			{2870, "sound\\music\\legion\\mus_71_karazhan_6h.mp3", 105},
			{2871, "sound\\music\\legion\\mus_71_karazhan_7h.mp3", 37},
			{2872, "sound\\music\\legion\\mus_71_karazhan_8h.mp3", 69},
			{2873, "sound\\music\\legion\\mus_71_karazhan_vortex_01.mp3", 73},
		},
	},

	{
		id = 283,
		name = L["TITLE_LEGION_TEMPEST"],
		files = {
			{2851, "sound\\music\\legion\\mus_70_tempest_a.mp3", 145},
			{2852, "sound\\music\\legion\\mus_70_tempest_b.mp3", 40},
			{2853, "sound\\music\\legion\\mus_70_tempest_b_stinger_01.mp3", 17},
			{2854, "sound\\music\\legion\\mus_70_tempest_c.mp3", 77},
			{2855, "sound\\music\\legion\\mus_70_tempest_d.mp3", 76},
			{2856, "sound\\music\\legion\\mus_70_tempest_e.mp3", 16},
			{2857, "sound\\music\\legion\\mus_70_tempest_f.mp3", 16},
			{2858, "sound\\music\\legion\\mus_70_tempest_g.mp3", 24},
			{2859, "sound\\music\\legion\\mus_70_tempest_h1.mp3", 75},
			{2860, "sound\\music\\legion\\mus_70_tempest_h2.mp3", 78},
		},
	},

	{
		id = 284,
		name = L["TITLE_LEGION_WEARENOTALONE"],
		files = {
			{2862, "sound\\music\\legion\\mus_70_wearenotalone_a.mp3", 89},
			{2863, "sound\\music\\legion\\mus_70_wearenotalone_b.mp3", 60},
			{2864, "sound\\music\\legion\\mus_70_wearenotalone_h.mp3", 105},
		},
	},

	{
		id = 285,
		name = L["TITLE_LEGION_ETERNALHOLLYBREW"],
		files = {
			{2875, "sound\\music\\legion\\mus_71_eternalhollybrew_a.mp3", 160},
			{2876, "sound\\music\\legion\\mus_71_eternalhollybrew_b.mp3", 203},
			{2877, "sound\\music\\legion\\mus_71_eternalhollybrew_h.mp3", 206},
			{2878, "sound\\music\\legion\\mus_71_eternalhollybrew_hwb.mp3", 207},
		},
	},

	{
		id = 286,
		name = L["TITLE_LEGION_WINTERHOLIDAY"],
		files = {
			{2879, "sound\\music\\legion\\mus_71_winterholiday_a.mp3", 112},
			{2880, "sound\\music\\legion\\mus_71_winterholiday_b.mp3", 111},
			{2881, "sound\\music\\legion\\mus_71_winterholiday_c.mp3", 112},
			{2882, "sound\\music\\legion\\mus_71_winterholiday_d.mp3", 97},
			{2883, "sound\\music\\legion\\mus_71_winterholiday_e.mp3", 39},
			{2884, "sound\\music\\legion\\mus_71_winterholiday_f.mp3", 44},
			{2885, "sound\\music\\legion\\mus_71_winterholiday_g.mp3", 63},
			{2886, "sound\\music\\legion\\mus_71_winterholiday_h.mp3", 112},
		},
	},

	{
		id = 287,
		name = L["TITLE_LEGION_AWAKENINGS"],
		files = {
			{2887, "sound\\music\\legion\\mus_72_awakeningsa.mp3", 75},
			{2888, "sound\\music\\legion\\mus_72_awakeningsb.mp3", 58},
			{2889, "sound\\music\\legion\\mus_72_awakeningsc.mp3", 55},
			{2890, "sound\\music\\legion\\mus_72_awakeningsh.mp3", 71},
		},
	},

	{
		id = 288,
		name = L["TITLE_LEGION_FELTITAN"],
		files = {
			{2893, "sound\\music\\legion\\mus_72_feltitana.mp3", 77},
			{2894, "sound\\music\\legion\\mus_72_feltitanb.mp3", 67},
			{2895, "sound\\music\\legion\\mus_72_feltitanc.mp3", 70},
			{2896, "sound\\music\\legion\\mus_72_feltitanh.mp3", 111},
		},
	},

	{
		id = 289,
		name = L["TITLE_LEGION_KILJAEDEN"],
		files = {
			{2897, "sound\\music\\legion\\mus_72_kiljaedena.mp3", 61},
			{2898, "sound\\music\\legion\\mus_72_kiljaedenb.mp3", 44},
			{2899, "sound\\music\\legion\\mus_72_kiljaedenc.mp3", 57},
			{2900, "sound\\music\\legion\\mus_72_kiljaedend.mp3", 85},
			{2901, "sound\\music\\legion\\mus_72_kiljaedenh.mp3", 94},
		},
	},

	{
		id = 290,
		name = L["TITLE_LEGION_MOUNTSCENE"],
		files = {
			{2902, "sound\\music\\legion\\mus_72_mount_scene_dark.mp3", 31},
			{2903, "sound\\music\\legion\\mus_72_mount_scene_deathknight.mp3", 32},
			{2904, "sound\\music\\legion\\mus_72_mount_scene_hero.mp3", 29},
			{2905, "sound\\music\\legion\\mus_72_mount_scene_monk.mp3", 28},
		},
	},

	{
		id = 291,
		name = L["TITLE_LEGION_PLACEOFREST"],
		files = {
			{2906, "sound\\music\\legion\\mus_72_placeofresta.mp3", 71},
			{2907, "sound\\music\\legion\\mus_72_placeofrestb.mp3", 63},
			{2908, "sound\\music\\legion\\mus_72_placeofresth1.mp3", 71},
			{2909, "sound\\music\\legion\\mus_72_placeofresth2.mp3", 71},
			{2910, "sound\\music\\legion\\mus_72_placeofresth3.mp3", 71},
		},
	},

	{
		id = 292,
		name = L["TITLE_LEGION_RUINEDCATHEDRAL"],
		files = {
			{2911, "sound\\music\\legion\\mus_72_ruinedcathedrala.mp3", 53},
			{2912, "sound\\music\\legion\\mus_72_ruinedcathedralb.mp3", 37},
			{2913, "sound\\music\\legion\\mus_72_ruinedcathedralc.mp3", 58},
			{2914, "sound\\music\\legion\\mus_72_ruinedcathedrald.mp3", 61},
			{2915, "sound\\music\\legion\\mus_72_ruinedcathedrale.mp3", 50},
			{2916, "sound\\music\\legion\\mus_72_ruinedcathedralf.mp3", 124},
			{2917, "sound\\music\\legion\\mus_72_ruinedcathedralh.mp3", 79},
		},
	},

	{
		id = 293,
		name = L["TITLE_LEGION_SHACKLED"],
		files = {
			{2918, "sound\\music\\legion\\mus_72_shackleda.mp3", 121},
			{2919, "sound\\music\\legion\\mus_72_shackledb.mp3", 58},
			{2920, "sound\\music\\legion\\mus_72_shackledc.mp3", 26},
			{2921, "sound\\music\\legion\\mus_72_shackledd.mp3", 72},
			{2922, "sound\\music\\legion\\mus_72_shacklede.mp3", 77},
			{2923, "sound\\music\\legion\\mus_72_shackledf.mp3", 124},
			{2924, "sound\\music\\legion\\mus_72_shackledh.mp3", 119},
		},
	},

	{
		id = 294,
		name = L["TITLE_LEGION_TOMBOFSARGERAS"],
		files = {
			{2925, "sound\\music\\legion\\mus_72_tombofsargeras_battlea.mp3", 59},
			{2926, "sound\\music\\legion\\mus_72_tombofsargeras_battleb.mp3", 70},
			{2927, "sound\\music\\legion\\mus_72_tombofsargeras_battleh1.mp3", 28},
			{2928, "sound\\music\\legion\\mus_72_tombofsargeras_battleh2.mp3", 53},
			{2929, "sound\\music\\legion\\mus_72_tombofsargerasa.mp3", 55},
			{2930, "sound\\music\\legion\\mus_72_tombofsargerasb.mp3", 58},
			{2931, "sound\\music\\legion\\mus_72_tombofsargerasc.mp3", 54},
			{2932, "sound\\music\\legion\\mus_72_tombofsargerasd.mp3", 42},
			{2933, "sound\\music\\legion\\mus_72_tombofsargerase.mp3", 67},
			{2934, "sound\\music\\legion\\mus_72_tombofsargerasf.mp3", 61},
			{2935, "sound\\music\\legion\\mus_72_tombofsargerash.mp3", 154},
		},
	},

	{
		id = 295,
		name = L["TITLE_LEGION_ARGUS"],
		files = {
			{2936, "sound\\music\\legion\\mus_73_argus1pt1_a.mp3", 102},
			{2937, "sound\\music\\legion\\mus_73_argus1pt1_b.mp3", 102},
			{2938, "sound\\music\\legion\\mus_73_argus1pt1_c.mp3", 102},
			{2939, "sound\\music\\legion\\mus_73_argus1pt1_h.mp3", 102},
			{2940, "sound\\music\\legion\\mus_73_argus1pt2_a.mp3", 85},
			{2941, "sound\\music\\legion\\mus_73_argus1pt2_b.mp3", 85},
			{2942, "sound\\music\\legion\\mus_73_argus1pt2_c.mp3", 85},
			{2943, "sound\\music\\legion\\mus_73_argus1pt2_h.mp3", 85},
			{2944, "sound\\music\\legion\\mus_73_argus1pt3_a.mp3", 67},
			{2945, "sound\\music\\legion\\mus_73_argus1pt3_b.mp3", 67},
			{2946, "sound\\music\\legion\\mus_73_argus1pt3_c.mp3", 67},
			{2947, "sound\\music\\legion\\mus_73_argus1pt3_h.mp3", 67},
			{2948, "sound\\music\\legion\\mus_73_argus1pt4_a.mp3", 102},
			{2949, "sound\\music\\legion\\mus_73_argus1pt4_c.mp3", 102},
			{2950, "sound\\music\\legion\\mus_73_argus1pt4_h.mp3", 102},
			{2951, "sound\\music\\legion\\mus_73_argus2pt1_a.mp3", 69},
			{2952, "sound\\music\\legion\\mus_73_argus2pt1_b.mp3", 69},
			{2953, "sound\\music\\legion\\mus_73_argus2pt1_c.mp3", 68},
			{2954, "sound\\music\\legion\\mus_73_argus2pt1_h.mp3", 69},
			{2955, "sound\\music\\legion\\mus_73_argus2pt2_a.mp3", 121},
			{2956, "sound\\music\\legion\\mus_73_argus2pt2_b.mp3", 122},
			{2957, "sound\\music\\legion\\mus_73_argus2pt2_c.mp3", 121},
			{2958, "sound\\music\\legion\\mus_73_argus2pt2_d.mp3", 173},
			{2959, "sound\\music\\legion\\mus_73_argus2pt2_h.mp3", 122},
			{2960, "sound\\music\\legion\\mus_73_arguscore1_a.mp3", 86},
			{2961, "sound\\music\\legion\\mus_73_arguscore1_b.mp3", 86},
			{2962, "sound\\music\\legion\\mus_73_arguscore1_c.mp3", 85},
			{2963, "sound\\music\\legion\\mus_73_arguscore1_h.mp3", 86},
			{2964, "sound\\music\\legion\\mus_73_arguscore2_a.mp3", 83},
			{2965, "sound\\music\\legion\\mus_73_arguscore2_b.mp3", 83},
			{2966, "sound\\music\\legion\\mus_73_arguscore2_c.mp3", 82},
			{2967, "sound\\music\\legion\\mus_73_arguscore2_d.mp3", 84},
			{2968, "sound\\music\\legion\\mus_73_arguscore2_h.mp3", 84},
		},
	},

	{
		id = 296,
		name = L["TITLE_LEGION_ARGUS_ACIENTEREDAR"],
		files = {
			{2969, "sound\\music\\legion\\mus_73_ancienteredar_a.mp3", 124},
			{2970, "sound\\music\\legion\\mus_73_ancienteredar_b.mp3", 127},
			{2971, "sound\\music\\legion\\mus_73_ancienteredar_c.mp3", 89},
			{2972, "sound\\music\\legion\\mus_73_ancienteredar_d.mp3", 91},
			{2973, "sound\\music\\legion\\mus_73_ancienteredar_e.mp3", 87},
			{2974, "sound\\music\\legion\\mus_73_ancienteredar_f.mp3", 124},
			{2975, "sound\\music\\legion\\mus_73_ancienteredar_h.mp3", 133},
		},
	},

	{
		id = 297,
		name = L["TITLE_LEGION_ARGUS_BALEFULNIGHT"],
		files = {
			{2976, "sound\\music\\legion\\mus_73_balefulnight_a.mp3", 87},
			{2977, "sound\\music\\legion\\mus_73_balefulnight_h.mp3", 91},
		},
	},

	{
		id = 298,
		name = L["TITLE_LEGION_ARGUS_SEATOFTHEPANTHEON"],
		files = {
			{2978, "sound\\music\\legion\\mus_73_seatofthepantheon_a.mp3", 67},
			{2979, "sound\\music\\legion\\mus_73_seatofthepantheon_b.mp3", 72},
			{2980, "sound\\music\\legion\\mus_73_seatofthepantheon_c.mp3", 80},
		},
	},

	{
		id = 299,
		name = L["TITLE_LEGION_ARGUS_XERA"],
		files = {
			{2981, "sound\\music\\legion\\mus_73_xera_a.mp3", 108},
			{2982, "sound\\music\\legion\\mus_73_xera_h.mp3", 108},
		},
	},
}

GJB.musictable[GJB.EXP_LEGION] = music
