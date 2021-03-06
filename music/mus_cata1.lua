-- STRUCTURE 
-- [1] : Integer - ID of the music (new system)
-- [2] : String - Path of the music file
-- [3] : Integer - Length of the music file in seconds
-- [4] : Integer - Blizzard File ID

-- Get localization
local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Cataclysm
local music = {
	{
		id = 82,
		name = L["TITLE_MAIN_THEME"],
		files = {
			{1065, "Sound\\Music\\cataclysm\\MUS_Shattering_UU01.mp3", 725, 441737},
		},
	},
	{
		id = 83,
		name = L["TITLE_DRUIDS_OT_FLAME"],
		files = {
			{1066, "Sound\\Music\\cataclysm\\MUS_42_DruidsoftheFlameA_Hero_UU01.mp3", 91, 528352},
			{1067, "Sound\\Music\\cataclysm\\MUS_42_DruidsoftheFlameA_UU01.mp3", 84, 528353},
			{1068, "Sound\\Music\\cataclysm\\MUS_42_DruidsoftheFlameA_UU02.mp3", 89, 528354},
			{1069, "Sound\\Music\\cataclysm\\MUS_42_DruidsoftheFlameA_UU03.mp3", 44, 528355},
			{1070, "Sound\\Music\\cataclysm\\MUS_42_DruidsoftheFlameB_Hero_UU01.mp3", 88, 528356},
			{1071, "Sound\\Music\\cataclysm\\MUS_42_DruidsoftheFlameB_UU01.mp3", 87, 528357},
			{1072, "Sound\\Music\\cataclysm\\MUS_42_DruidsoftheFlameB_UU02.mp3", 86, 528358},
			{1073, "Sound\\Music\\cataclysm\\MUS_42_DruidsoftheFlameB_UU03.mp3", 86, 528359},
		},
	},
	{
		id = 84,
		name = L["TITLE_ELEMENTALAIR"],
		files = {
			{1074, "Sound\\Music\\cataclysm\\MUS_42_Elemental_AirA_UU01.mp3", 47, 528160},
			{1075, "Sound\\Music\\cataclysm\\MUS_42_Elemental_AirA_UU02.mp3", 38, 528161},
			{1076, "Sound\\Music\\cataclysm\\MUS_42_Elemental_AirB_UU01.mp3", 44, 528162},
			{1077, "Sound\\Music\\cataclysm\\MUS_42_Elemental_AirB_UU02.mp3", 54, 528163},
			{1078, "Sound\\Music\\cataclysm\\MUS_42_Elemental_AirC_UU01.mp3", 61, 528164},
			{1079, "Sound\\Music\\cataclysm\\MUS_42_Elemental_AirD_UU01.mp3", 34, 528165},
			{1080, "Sound\\Music\\cataclysm\\MUS_42_Elemental_AirD_UU02.mp3", 34, 528166},
		},
	},
	{
		id = 85,
		name = L["TITLE_ELEMENTALEARTH"],
		files = {
			{1081, "Sound\\Music\\cataclysm\\MUS_42_Elemental_EarthA_UU01.mp3", 58, 528360},
			{1082, "Sound\\Music\\cataclysm\\MUS_42_Elemental_EarthA_UU02.mp3", 80, 528361},
			{1083, "Sound\\Music\\cataclysm\\MUS_42_Elemental_EarthA_UU03.mp3", 65, 528362},
			{1084, "Sound\\Music\\cataclysm\\MUS_42_Elemental_EarthA_UU04.mp3", 58, 528363},
		},
	},
	{
		id = 86,
		name = L["TITLE_ELEMENTALWATER"],
		files = {
			{1085, "Sound\\Music\\cataclysm\\MUS_42_Elemental_WaterA_UD01.mp3", 67, 528167},
			{1086, "Sound\\Music\\cataclysm\\MUS_42_Elemental_WaterA_UN01.mp3", 67, 528168},
			{1087, "Sound\\Music\\cataclysm\\MUS_42_Elemental_WaterB_UD01.mp3", 34, 528169},
			{1088, "Sound\\Music\\cataclysm\\MUS_42_Elemental_WaterB_UN01.mp3", 34, 528170},
			{1089, "Sound\\Music\\cataclysm\\MUS_42_Elemental_WaterC_UD01.mp3", 63, 528171},
			{1090, "Sound\\Music\\cataclysm\\MUS_42_Elemental_WaterC_UN01.mp3", 67, 528172},
			{3130, "Sound\\Music\\cataclysm\\mus_42_elemental_water_ambient_uu01.mp3", 75, 528173},
		},
	},
	{
		id = 87,
		name = L["TITLE_ELEMENTALBONDS"],
		files = {
			{1091, "Sound\\Music\\cataclysm\\MUS_42_ElementalBondsA_UU01.mp3", 54, 528155},
			{1092, "Sound\\Music\\cataclysm\\MUS_42_ElementalBondsA_UU02.mp3", 54, 528156},
			{1093, "Sound\\Music\\cataclysm\\MUS_42_ElementalBondsA_UU03.mp3", 54, 528157},
			{1094, "Sound\\Music\\cataclysm\\MUS_42_ElementalBondsB_UU01.mp3", 29, 528158},
			{1095, "Sound\\Music\\cataclysm\\MUS_42_ElementalBondsB_UU02.mp3", 26, 528159},
		},
	},
	{
		id = 88,
		name = L["TITLE_THRALLAGGRA"],
		files = {
			{1096, "Sound\\Music\\cataclysm\\MUS_42_ThrallAggraA_ED01.mp3", 72, 528174},
			{1097, "Sound\\Music\\cataclysm\\MUS_42_ThrallAggraA_EN01.mp3", 61, 528175},
			{1098, "Sound\\Music\\cataclysm\\MUS_42_ThrallAggraB_ED01.mp3", 53, 528176},
			{1099, "Sound\\Music\\cataclysm\\MUS_42_ThrallAggraB_EN01.mp3", 44, 528177},
			{1100, "Sound\\Music\\cataclysm\\MUS_42_ThrallAggraC_EU01.mp3", 57, 528178},
			{1101, "Sound\\Music\\cataclysm\\MUS_42_ThrallAggraC_EU02.mp3", 57, 528373},
			{1102, "Sound\\Music\\cataclysm\\MUS_43_ThrallEarthWarder_UU01.mp3", 62, 575694},
			{1103, "Sound\\Music\\cataclysm\\MUS_43_ThrallEarthWarder_UU02.mp3", 42, 575695},
			{1104, "Sound\\Music\\cataclysm\\MUS_43_ThrallEarthWarder_UU03.mp3", 47, 575696},
			{1105, "Sound\\Music\\cataclysm\\MUS_43_ThrallEarthWarder_UU04.mp3", 29, 575697},
		},
	},
	{
		id = 89,
		name = L["TITLE_NIGHTELVES"],
		files = {
			{1106, "Sound\\Music\\cataclysm\\MUS_NightElves_GU01.mp3", 160, 441705},
			{1107, "Sound\\Music\\cataclysm\\MUS_NightElves_GU02.mp3", 85, 441706},
			{1108, "Sound\\Music\\cataclysm\\MUS_NightElves_GU03.mp3", 85, 441707},
			{1109, "Sound\\Music\\cataclysm\\MUS_NightElves_GU04.mp3", 81, 441708},
			{1110, "Sound\\Music\\cataclysm\\MUS_NightElves_GU05.mp3", 81, 441709},
			{1111, "Sound\\Music\\cataclysm\\MUS_SirenQuest_EU01.mp3", 42, 455562},
		},
	},
	{
		id = 90,
		name = L["TITLE_AFTERMATH"],
		files = {
			{1112, "Sound\\Music\\cataclysm\\MUS_Aftermath_UU01.mp3", 125, 441521},
			{1113, "Sound\\Music\\cataclysm\\MUS_Aftermath_UU02.mp3", 125, 441522},
			{1114, "Sound\\Music\\cataclysm\\MUS_Aftermath_UU03.mp3", 58, 441523},
			{1115, "Sound\\Music\\cataclysm\\MUS_Aftermath_UU04.mp3", 82, 441524},
		},
	},
	{
		id = 91,
		name = L["TITLE_DRAGONSOUL"],
		files = {
			{1116, "Sound\\Music\\cataclysm\\MUS_43_DragonSoulA_Hero_UU01.mp3", 32, 575662},
			{1117, "Sound\\Music\\cataclysm\\MUS_43_DragonSoulA_Moment_01.mp3", 31, 575663},
			{1118, "Sound\\Music\\cataclysm\\MUS_43_DragonSoulA_Moment_02.mp3", 32, 575664},
			{1119, "Sound\\Music\\cataclysm\\MUS_43_DragonSoulA_Moment_03.mp3", 32, 575665},
			{1120, "Sound\\Music\\cataclysm\\MUS_43_DragonSoulA_Moment_04.mp3", 60, 575666},
			{1121, "Sound\\Music\\cataclysm\\MUS_43_DragonSoulB_UU01.mp3", 47, 575667},
			{1122, "Sound\\Music\\cataclysm\\MUS_43_DragonSoulB_UU02.mp3", 49, 575668},
			{1123, "Sound\\Music\\cataclysm\\MUS_43_DragonSoulB_UU03.mp3", 51, 575669},
			{1124, "Sound\\Music\\cataclysm\\MUS_43_Gunships_Hero_UU01.mp3", 189, 575681},
			{1125, "Sound\\Music\\cataclysm\\MUS_43_Gunships_Stinger_01.mp3", 15, 575682},
			{1126, "Sound\\Music\\cataclysm\\MUS_43_Gunships_Stinger_02.mp3", 14, 575683},
			{1127, "Sound\\Music\\cataclysm\\MUS_43_Gunships_Stinger_03.mp3", 5, 575684},
			{1128, "Sound\\Music\\cataclysm\\MUS_43_Gunships_Stinger_04.mp3", 10, 575685},
			{1129, "Sound\\Music\\cataclysm\\MUS_43_Gunships_UU01.mp3", 31, 575686},
			{1130, "Sound\\Music\\cataclysm\\MUS_43_Gunships_UU02.mp3", 18, 575687},
			{1131, "Sound\\Music\\cataclysm\\MUS_43_Gunships_UU03.mp3", 42, 575688},
			{1132, "Sound\\Music\\cataclysm\\MUS_43_Gunships_UU04.mp3", 45, 575689},
		},
	},
	{
		id = 92,
		name = L["TITLE_DEATHWING"],
		files = {
			{1133, "Sound\\Music\\cataclysm\\MUS_43_DeathwingCorruption_UU01.mp3", 35, 575651},
			{1134, "Sound\\Music\\cataclysm\\MUS_43_DeathwingCorruption_UU02.mp3", 34, 575652},
			{1135, "Sound\\Music\\cataclysm\\MUS_43_DeathwingCorruption_UU03.mp3", 32, 575653},
			{1136, "Sound\\Music\\cataclysm\\MUS_43_DeathwingCorruption_UU04.mp3", 59, 575654},
			{1137, "Sound\\Music\\cataclysm\\MUS_43_DeathwingCorruption_UU05.mp3", 58, 575655},
			{1138, "Sound\\Music\\cataclysm\\MUS_43_DeathwingCorruption_UU06.mp3", 31, 575656},
			{1139, "Sound\\Music\\cataclysm\\MUS_43_DeathwingCorruption_UU07.mp3", 70, 575657},
			{1140, "Sound\\Music\\cataclysm\\MUS_43_DeathwingOutro_UU01.mp3", 58, 575658},
			{1141, "Sound\\Music\\cataclysm\\MUS_43_DeathwingsFall_Hero_UU01.mp3", 147, 575659},
			{1142, "Sound\\Music\\cataclysm\\MUS_43_DeathwingsFall_UU01.mp3", 111, 575660},
			{1143, "Sound\\Music\\cataclysm\\MUS_43_DeathwingsFall_UU02.mp3", 104, 575661},
		},
	},
	{
		id = 93,
		name = L["TITLE_FANGS_OT_FATHER"],
		files = {
			{1144, "Sound\\Music\\cataclysm\\MUS_43_FangsOfTheFatherA_Hero_UU01.mp3", 121, 575670},
			{1145, "Sound\\Music\\cataclysm\\MUS_43_FangsOfTheFatherA_UU01.mp3", 97, 575671},
			{1146, "Sound\\Music\\cataclysm\\MUS_43_FangsOfTheFatherA_UU02.mp3", 99, 575672},
			{1147, "Sound\\Music\\cataclysm\\MUS_43_FangsOfTheFatherA_UU03.mp3", 92, 575673},
			{1148, "Sound\\Music\\cataclysm\\MUS_43_FangsOfTheFatherB_UU01.mp3", 77, 575674},
			{1149, "Sound\\Music\\cataclysm\\MUS_43_FangsOfTheFatherB_UU02.mp3", 61, 575675},
			{1150, "Sound\\Music\\cataclysm\\MUS_43_FangsOfTheFatherB_UU03.mp3", 61, 575676},
			{1151, "Sound\\Music\\cataclysm\\MUS_43_FangsOfTheFatherC_Hero_UU01.mp3", 151, 575677},
			{1152, "Sound\\Music\\cataclysm\\MUS_43_FangsOfTheFatherC_UU02.mp3", 80, 575678},
			{1153, "Sound\\Music\\cataclysm\\MUS_43_FangsOfTheFatherC_UU03.mp3", 74, 575679},
			{1154, "Sound\\Music\\cataclysm\\MUS_43_FangsOfTheFatherC_UU04.mp3", 63, 575680},
		},
	},
	{
		id = 94,
		name = L["TITLE_HAUNTED"],
		files = {
			{1155, "Sound\\Music\\cataclysm\\MUS_Haunted_UU01.mp3", 111, 441671},
			{1156, "Sound\\Music\\cataclysm\\MUS_Haunted_UU02.mp3", 128, 441672},
			{1157, "Sound\\Music\\cataclysm\\MUS_Haunted_UU03.mp3", 109, 443302},
		},
	},
	{
		id = 95,
		name = L["TITLE_WARSHIPS"],
		files = {
			{1158, "Sound\\Music\\cataclysm\\MUS_43_Warships_Hero_01.mp3", 90, 575700},
			{1159, "Sound\\Music\\cataclysm\\MUS_43_Warships_UU01.mp3", 66, 575701},
			{1160, "Sound\\Music\\cataclysm\\MUS_43_Warships_UU02.mp3", 29, 575702},
		},
	},
	{
		id = 96,
		name = L["TITLE_NIGHTWALK"],
		files = {
			{1161, "Sound\\Music\\cataclysm\\MUS_43_NightWalk_UU01.mp3", 59, 575690},
			{1162, "Sound\\Music\\cataclysm\\MUS_43_NightWalk_UU02.mp3", 60, 575691},
			{1163, "Sound\\Music\\cataclysm\\MUS_43_NightWalk_UU03.mp3", 59, 575692},
			{1164, "Sound\\Music\\cataclysm\\MUS_43_NightWalk_UU04.mp3", 59, 575693},
		},
	},
	{
		id = 97,
		name = L["TITLE_TWILIGHTHIGHLANDS"],
		files = {
			{1165, "Sound\\Music\\cataclysm\\MUS_43_TwilightsHammer_UU01.mp3", 113, 575698},
			{1166, "Sound\\Music\\cataclysm\\MUS_43_TwilightsHammer_UU02.mp3", 55, 575699},
			{1167, "Sound\\Music\\cataclysm\\MUS_TwilightHighlands_GU01.mp3", 68, 441797},
			{1168, "Sound\\Music\\cataclysm\\MUS_TwilightHighlands_GU02.mp3", 67, 441798},
			{1169, "Sound\\Music\\cataclysm\\MUS_TwilightHighlands_GU03.mp3", 67, 441799},
			{1170, "Sound\\Music\\cataclysm\\MUS_TwilightHighlands_GU04.mp3", 78, 441800},
			{1171, "Sound\\Music\\cataclysm\\MUS_TwilightHighlands_GU05.mp3", 67, 441801},
			{1172, "Sound\\Music\\cataclysm\\MUS_TwilightsHammer_UU01.mp3", 92, 441802},
			{1173, "Sound\\Music\\cataclysm\\MUS_TwilightsHammer_UU02.mp3", 48, 441803},
			{1174, "Sound\\Music\\cataclysm\\MUS_TwilightsHammer_UU03.mp3", 48, 441804},
			{1175, "Sound\\Music\\cataclysm\\MUS_TwilightVale_GU01.mp3", 110, 441805},
			{1176, "Sound\\Music\\cataclysm\\MUS_TwilightVale_GU02.mp3", 81, 441806},
			{1177, "Sound\\Music\\cataclysm\\MUS_TwilightVale_GU03.mp3", 80, 441807},
			{1178, "Sound\\Music\\cataclysm\\MUS_TwilightVale_GU04.mp3", 62, 441808},
			{1179, "Sound\\Music\\cataclysm\\MUS_TwilightVale_GU05.mp3", 46, 441809},
		},
	},
	{
		id = 98,
		name = L["TITLE_WELLOFETERNITY"],
		files = {
			{1180, "Sound\\Music\\cataclysm\\MUS_43_WellOfEternity_Hero_UU01.mp3", 84, 575703},
			{1181, "Sound\\Music\\cataclysm\\MUS_43_WellOfEternity_UU01.mp3", 84, 575704},
			{1182, "Sound\\Music\\cataclysm\\MUS_43_WellOfEternity_UU02.mp3", 84, 575705},
			{1183, "Sound\\Music\\cataclysm\\MUS_43_WellOfEternity_UU03.mp3", 92, 575706},
			{1184, "Sound\\Music\\cataclysm\\MUS_43_WellOfEternity_UU04.mp3", 102, 575707},
			{1185, "Sound\\Music\\cataclysm\\MUS_43_WellOfEternity_UU05.mp3", 85, 575708},
			{1186, "Sound\\Music\\cataclysm\\MUS_43_WellOfEternity_UU06.mp3", 85, 575709},
		},
	},
	{
		id = 99,
		name = L["TITLE_ZINAZSHARI"],
		files = {
			{1187, "Sound\\Music\\cataclysm\\MUS_43_ZinAzshari_Hero_UU01.mp3", 177, 575710},
			{1188, "Sound\\Music\\cataclysm\\MUS_43_ZinAzshari_UU01.mp3", 92, 575711},
			{1189, "Sound\\Music\\cataclysm\\MUS_43_ZinAzshari_UU02.mp3", 71, 575712},
			{1190, "Sound\\Music\\cataclysm\\MUS_43_ZinAzshari_UU03.mp3", 51, 575713},
			{1191, "Sound\\Music\\cataclysm\\MUS_43_ZinAzshari_UU04.mp3", 107, 575714},
			{1192, "Sound\\Music\\cataclysm\\MUS_43_ZinAzshari_UU05.mp3", 46, 575715},
			{1193, "Sound\\Music\\cataclysm\\MUS_43_ZinAzshari_UU06.mp3", 113, 575716},
		},
	},
	{
		id = 100,
		name = L["TITLE_RAGE_OT_FIRELANDS"],
		files = {
			{1194, "Sound\\Music\\cataclysm\\MUS_42_FirelandsA_Hero_UU01.mp3", 103, 528364},
			{1195, "Sound\\Music\\cataclysm\\MUS_42_FirelandsA_UU01.mp3", 91, 528365},
			{1196, "Sound\\Music\\cataclysm\\MUS_42_FirelandsA_UU02.mp3", 76, 528366},
			{1197, "Sound\\Music\\cataclysm\\MUS_42_FirelandsA_UU03.mp3", 58, 528367},
			{1198, "Sound\\Music\\cataclysm\\MUS_42_FirelandsB_Hero_UU01.mp3", 108, 528368},
			{1199, "Sound\\Music\\cataclysm\\MUS_42_FirelandsB_UU01.mp3", 63, 528369},
			{1200, "Sound\\Music\\cataclysm\\MUS_42_FirelandsB_UU02.mp3", 53, 528370},
			{1201, "Sound\\Music\\cataclysm\\MUS_42_FirelandsB_UU03.mp3", 65, 528371},
			{1202, "Sound\\Music\\cataclysm\\MUS_42_FirelandsB_UU04.mp3", 52, 528372},
			{1203, "Sound\\Music\\cataclysm\\MUS_AdventureA_Hero_UU01.mp3", 141, 528374},
			{1204, "Sound\\Music\\cataclysm\\MUS_AdventureA_Moment_UU01.mp3", 13, 528375},
			{1205, "Sound\\Music\\cataclysm\\MUS_AdventureA_Moment_UU02.mp3", 15, 528376},
			{1206, "Sound\\Music\\cataclysm\\MUS_AdventureA_Moment_UU03.mp3", 22, 528377},
			{1207, "Sound\\Music\\cataclysm\\MUS_AdventureA_Moment_UU04.mp3", 16, 528378},
			{1208, "Sound\\Music\\cataclysm\\MUS_AdventureA_UU01.mp3", 52, 528379},
			{1209, "Sound\\Music\\cataclysm\\MUS_AdventureA_UU03.mp3", 35, 528380},
			{1210, "Sound\\Music\\cataclysm\\MUS_AdventureA_UU04.mp3", 49, 528381},
			{1211, "Sound\\Music\\cataclysm\\MUS_AdventureA_UU05.mp3", 53, 528382},
			{1212, "Sound\\Music\\cataclysm\\MUS_AdventureA_UU06.mp3", 43, 528383},
			{1213, "Sound\\Music\\cataclysm\\MUS_Firelands_GU01.mp3", 148, 441609},
		},
	},
	{
		id = 101,
		name = L["TITLE_GILNEAS"],
		files = {
			{1214, "Sound\\Music\\cataclysm\\MUS_AllianceHero_UU01.mp3", 195, 441525},
			{1215, "Sound\\Music\\cataclysm\\MUS_Cataclysm_UU01.mp3", 79, 441535},
			{1216, "Sound\\Music\\cataclysm\\MUS_Cataclysm_UU02.mp3", 71, 441536},
			{1217, "Sound\\Music\\cataclysm\\MUS_Cataclysm_UU03.mp3", 61, 441537},
			{1218, "Sound\\Music\\cataclysm\\MUS_Cataclysm_UU04.mp3", 111, 441538},
			{1219, "Sound\\Music\\cataclysm\\MUS_Cataclysm_UU05.mp3", 73, 441539},
			{1220, "Sound\\Music\\cataclysm\\MUS_Cataclysm_UU06.mp3", 48, 441540},
			{1221, "Sound\\Music\\cataclysm\\MUS_GilneasEvent_E01.mp3", 32, 462922},
			{1222, "Sound\\Music\\cataclysm\\MUS_GilneasEvent_E02.mp3", 24, 462923},
			{1223, "Sound\\Music\\cataclysm\\MUS_GilneasEvent_E03.mp3", 28, 462924},
			{1224, "Sound\\Music\\cataclysm\\MUS_GilneasEvent_E04.mp3", 108, 462925},
		},
	},
	{
		id = 102,
		name = L["TITLE_BARROWDENS"],
		files = {
			{1225, "Sound\\Music\\cataclysm\\MUS_BarrowDens_GU01.mp3", 64, 441526},
			{1226, "Sound\\Music\\cataclysm\\MUS_BarrowDens_GU02.mp3", 50, 441527},
			{1227, "Sound\\Music\\cataclysm\\MUS_BarrowDens_GU03.mp3", 66, 441528},
			{1228, "Sound\\Music\\cataclysm\\MUS_BarrowDens_GU04.mp3", 51, 441529},
			{1229, "Sound\\Music\\cataclysm\\MUS_BarrowDens_GU05.mp3", 58, 441530},
		},
	},
	{
		id = 103,
		name = L["TITLE_CHOGALL"],
		files = {
			{1230, "Sound\\Music\\cataclysm\\MUS_ChoGall_E01.mp3", 169, 441541},
			{1231, "Sound\\Music\\cataclysm\\MUS_ChoGall_E02.mp3", 60, 441542},
			{1232, "Sound\\Music\\cataclysm\\MUS_ChoGall_E03.mp3", 29, 441543},
			{1233, "Sound\\Music\\cataclysm\\MUS_ChoGall_E04.mp3", 19, 441544},
		},
	},
	{
		id = 104,
		name = L["TITLE_COLDMOUNTAINS"],
		files = {
			{1234, "Sound\\Music\\cataclysm\\MUS_ColdMountain_GU01.mp3", 151, 441545},
			{1235, "Sound\\Music\\cataclysm\\MUS_ColdMountain_GU02.mp3", 39, 441546},
			{1236, "Sound\\Music\\cataclysm\\MUS_ColdMountain_GU03.mp3", 70, 441547},
			{1237, "Sound\\Music\\cataclysm\\MUS_ColdMountain_GU04.mp3", 32, 441548},
			{1238, "Sound\\Music\\cataclysm\\MUS_ColdMountain_GU05.mp3", 31, 441549},
			{1239, "Sound\\Music\\cataclysm\\MUS_ColdMountain_GU06.mp3", 48, 441550},
			{1240, "Sound\\Music\\cataclysm\\MUS_ColdMountain_GU07.mp3", 68, 441551},
			{1241, "Sound\\Music\\cataclysm\\MUS_ColdMountain_GU08.mp3", 71, 441552},
		},
	},
	{
		id = 105,
		name = L["TITLE_HYJAL"],
		files = {
			{1242, "Sound\\Music\\cataclysm\\MUS_DarkwhisperGorge_GU01.mp3", 119, 441572},
			{1243, "Sound\\Music\\cataclysm\\MUS_DarkwhisperGorge_GU02.mp3", 118, 441573},
			{1244, "Sound\\Music\\cataclysm\\MUS_Fire_UU01.mp3", 62, 441610},
			{1245, "Sound\\Music\\cataclysm\\MUS_Fire_UU02.mp3", 43, 441611},
			{1246, "Sound\\Music\\cataclysm\\MUS_GuardiansofHyjal_GU01.mp3", 133, 441667},
			{1247, "Sound\\Music\\cataclysm\\MUS_GuardiansofHyjal_GU02.mp3", 137, 441668},
			{1248, "Sound\\Music\\cataclysm\\MUS_GuardiansofHyjal_GU03.mp3", 80, 441669},
			{1249, "Sound\\Music\\cataclysm\\MUS_GuardiansofHyjal_GU04.mp3", 143, 441670},
			{1250, "Sound\\Music\\cataclysm\\MUS_Hyjal_GU01.mp3", 84, 441673},
			{1251, "Sound\\Music\\cataclysm\\MUS_Hyjal_GU02.mp3", 84, 441674},
			{1252, "Sound\\Music\\cataclysm\\MUS_Hyjal_GU03.mp3", 84, 441675},
			{1253, "Sound\\Music\\cataclysm\\MUS_Hyjal_GU04.mp3", 116, 441676},
			{1254, "Sound\\Music\\cataclysm\\MUS_LandWillWeep_UU01.mp3", 53, 441677},
			{1255, "Sound\\Music\\cataclysm\\MUS_LandWillWeep_UU02.mp3", 53, 441678},
			{1256, "Sound\\Music\\cataclysm\\MUS_Nordrassil_GU01.mp3", 117, 441710},
			{1257, "Sound\\Music\\cataclysm\\MUS_Nordrassil_GU02.mp3", 115, 441711},
			{1258, "Sound\\Music\\cataclysm\\MUS_Nordrassil_GU03.mp3", 117, 441712},
			{1259, "Sound\\Music\\cataclysm\\MUS_Crypt_UU01.mp3", 105, 443298},
			{1260, "Sound\\Music\\cataclysm\\MUS_FlowerAura_EU_01.mp3", 28, 445197},
			{1261, "Sound\\Music\\cataclysm\\MUS_Mysterious_UU01.mp3", 99, 441704},
		},
	},
	{
		id = 106,
		name = L["TITLE_DEEPHOLM"],
		files = {
			{1262, "Sound\\Music\\cataclysm\\MUS_Deepholm_GU01.mp3", 123, 441576},
			{1263, "Sound\\Music\\cataclysm\\MUS_Deepholm_GU02.mp3", 126, 441577},
			{1264, "Sound\\Music\\cataclysm\\MUS_DeepholmEvent_E01.mp3", 114, 463826},
			{1265, "Sound\\Music\\cataclysm\\MUS_DeepholmEvent_E02.mp3", 136, 463827},
			{1266, "Sound\\Music\\cataclysm\\MUS_Elemental_UU01.mp3", 59, 441591},
			{1267, "Sound\\Music\\cataclysm\\MUS_Elemental_UU02.mp3", 40, 441592},
			{1268, "Sound\\Music\\cataclysm\\MUS_Elemental_UU03.mp3", 38, 441593},
			{1269, "Sound\\Music\\cataclysm\\MUS_Elemental_UU04.mp3", 131, 441594},
			{1270, "Sound\\Music\\cataclysm\\MUS_Elemental_UU05.mp3", 72, 441595},
			{1271, "Sound\\Music\\cataclysm\\MUS_Elemental_UU06.mp3", 46, 441596},
			{1272, "Sound\\Music\\cataclysm\\MUS_Elemental_UU07.mp3", 69, 441597},
			{1273, "Sound\\Music\\cataclysm\\MUS_Scarred_UU01.mp3", 78, 441725},
			{1274, "Sound\\Music\\cataclysm\\MUS_Scarred_UU02.mp3", 27, 441726},
			{1275, "Sound\\Music\\cataclysm\\MUS_Scarred_UU03.mp3", 35, 441727},
			{1276, "Sound\\Music\\cataclysm\\MUS_Scarred_UU04.mp3", 51, 441728},
			{1277, "Sound\\Music\\cataclysm\\MUS_PiratesSurrender_UU01.mp3", 128, 441715},
		},
	},
	{
		id = 107,
		name = L["TITLE_EYE_OT_VORTEX"],
		files = {
			{1278, "Sound\\Music\\cataclysm\\MUS_EyeOfTheVortex_GU01.mp3", 97, 441598},
			{1279, "Sound\\Music\\cataclysm\\MUS_EyeOfTheVortex_GU02.mp3", 49, 441599},
			{1280, "Sound\\Music\\cataclysm\\MUS_EyeOfTheVortex_GU03.mp3", 69, 441600},
			{1281, "Sound\\Music\\cataclysm\\MUS_DarkEvent_E01.mp3", 39, 463766},
		},
	},
	{
		id = 108,
		name = L["TITLE_GOBLINS"],
		files = {
			{1282, "Sound\\Music\\cataclysm\\MUS_Goblin_UU01.mp3", 24, 441612},
			{1283, "Sound\\Music\\cataclysm\\MUS_Goblin_UU02.mp3", 12, 441613},
			{1284, "Sound\\Music\\cataclysm\\MUS_Goblin_UU03.mp3", 9, 441614},
			{1285, "Sound\\Music\\cataclysm\\MUS_Goblin_UU04.mp3", 14, 441615},
			{1286, "Sound\\Music\\cataclysm\\MUS_Goblin_UU05.mp3", 19, 441616},
			{1287, "Sound\\Music\\cataclysm\\MUS_Goblin_UU06.mp3", 18, 441617},
			{1288, "Sound\\Music\\cataclysm\\MUS_Goblin_UU07.mp3", 10, 441618},
			{1289, "Sound\\Music\\cataclysm\\MUS_Goblin_UU08.mp3", 47, 441619},
			{1290, "Sound\\Music\\cataclysm\\MUS_Goblin_UU09.mp3", 86, 441620},
			{1291, "Sound\\Music\\cataclysm\\MUS_Goblin_UU10.mp3", 47, 441621},
			{1292, "Sound\\Music\\cataclysm\\MUS_Goblin_UU11.mp3", 45, 441622},
			{1293, "Sound\\Music\\cataclysm\\MUS_Goblin_UU12.mp3", 46, 441623},
			{1294, "Sound\\Music\\cataclysm\\MUS_Goblin_UU13.mp3", 47, 441624},
			{1295, "Sound\\Music\\cataclysm\\MUS_Goblin_UU14.mp3", 47, 441625},
			{1296, "Sound\\Music\\cataclysm\\MUS_Goblin_UU15.mp3", 47, 441626},
			{1297, "Sound\\Music\\cataclysm\\MUS_Goblin_UU16.mp3", 87, 441627},
			{1298, "Sound\\Music\\cataclysm\\MUS_Goblin_UU17.mp3", 86, 441628},
			{1299, "Sound\\Music\\cataclysm\\MUS_Goblin_UU18.mp3", 85, 441629},
			{1300, "Sound\\Music\\cataclysm\\MUS_Goblin_UU19.mp3", 24, 441630},
			{1301, "Sound\\Music\\cataclysm\\MUS_Goblin_UU20.mp3", 11, 441631},
			{1302, "Sound\\Music\\cataclysm\\MUS_Goblin_UU21.mp3", 11, 441632},
			{1303, "Sound\\Music\\cataclysm\\MUS_Goblin_UU22.mp3", 19, 441633},
			{1304, "Sound\\Music\\cataclysm\\MUS_Goblin_UU23.mp3", 8, 441634},
			{1305, "Sound\\Music\\cataclysm\\MUS_Goblin_UU24.mp3", 14, 441635},
			{1306, "Sound\\Music\\cataclysm\\MUS_Goblin_UU25.mp3", 14, 441636},
			{1307, "Sound\\Music\\cataclysm\\MUS_Goblin_UU26.mp3", 19, 441637},
			{1308, "Sound\\Music\\cataclysm\\MUS_Goblin_UU27.mp3", 19, 441638},
			{1309, "Sound\\Music\\cataclysm\\MUS_Goblin_UU28.mp3", 19, 441639},
			{1310, "Sound\\Music\\cataclysm\\MUS_Goblin_UU29.mp3", 16, 441640},
			{1311, "Sound\\Music\\cataclysm\\MUS_Goblin_UU30.mp3", 18, 441641},
			{1312, "Sound\\Music\\cataclysm\\MUS_Goblin_UU31.mp3", 19, 441642},
			{1313, "Sound\\Music\\cataclysm\\MUS_Goblin_UU32.mp3", 14, 441643},
			{1314, "Sound\\Music\\cataclysm\\MUS_Goblin_UU33.mp3", 15, 441644},
			{1315, "Sound\\Music\\cataclysm\\MUS_Goblin_UU34.mp3", 18, 441645},
			{1316, "Sound\\Music\\cataclysm\\MUS_Goblin_UU35.mp3", 17, 441646},
			{1317, "Sound\\Music\\cataclysm\\MUS_Goblin_UU36.mp3", 16, 441647},
			{1318, "Sound\\Music\\cataclysm\\MUS_Goblin_UU37.mp3", 17, 441648},
			{1319, "Sound\\Music\\cataclysm\\MUS_Goblin_UU38.mp3", 8, 441649},
			{1320, "Sound\\Music\\cataclysm\\MUS_Goblin_UU39.mp3", 8, 441650},
			{1321, "Sound\\Music\\cataclysm\\MUS_Goblin_UU40.mp3", 10, 441651},
			{1322, "Sound\\Music\\cataclysm\\MUS_Goblin_UU41.mp3", 17, 441652},
			{1323, "Sound\\Music\\cataclysm\\MUS_Goblin_UU42.mp3", 18, 441653},
			{1324, "Sound\\Music\\cataclysm\\MUS_Goblin_UU43.mp3", 21, 441654},
			{1325, "Sound\\Music\\cataclysm\\MUS_Goblin_UU44.mp3", 20, 441655},
			{1326, "Sound\\Music\\cataclysm\\MUS_Goblin_UU45.mp3", 16, 441656},
			{1327, "Sound\\Music\\cataclysm\\MUS_Goblin_UU46.mp3", 18, 441657},
			{1328, "Sound\\Music\\cataclysm\\MUS_Goblin_UU47.mp3", 51, 441658},
			{1329, "Sound\\Music\\cataclysm\\MUS_GoblinHotRodRadioLoop_EU01.mp3", 165, 450391},
			{1330, "Sound\\Music\\cataclysm\\MUS_LIRescue_EU01.mp3", 37, 443303},
			{1331, "Sound\\Music\\cataclysm\\MUS_LIRescue_EU02.mp3", 11, 443304},
			{1332, "Sound\\Music\\cataclysm\\MUS_LIRescue_EU03.mp3", 53, 443305},
			{1333, "Sound\\Music\\cataclysm\\MUS_LIRescue_EU04.mp3", 87, 443306},
		},
	},
	{
		id = 109,
		name = L["TITLE_ULDUM"],
		files = {
			{1334, "Sound\\Music\\cataclysm\\MUS_LostCity_GU01.mp3", 133, 441679},
			{1335, "Sound\\Music\\cataclysm\\MUS_LostCity_GU02.mp3", 118, 441680},
			{1336, "Sound\\Music\\cataclysm\\MUS_LostCity_GU03.mp3", 80, 441681},
			{1337, "Sound\\Music\\cataclysm\\MUS_LostCity_GU04.mp3", 98, 441682},
			{1338, "Sound\\Music\\cataclysm\\MUS_LostCity_GU05.mp3", 72, 441683},
			{1339, "Sound\\Music\\cataclysm\\MUS_Skywall_GU01.mp3", 159, 441744},
			{1340, "Sound\\Music\\cataclysm\\MUS_Skywall_GU02.mp3", 207, 441745},
			{1341, "Sound\\Music\\cataclysm\\MUS_Skywall_GU03.mp3", 109, 441746},
			{1342, "Sound\\Music\\cataclysm\\MUS_Skywall_GU04.mp3", 117, 441747},
			{1343, "Sound\\Music\\cataclysm\\MUS_Skywall_GU05.mp3", 140, 441748},
			{1344, "Sound\\Music\\cataclysm\\MUS_Skywall_GU06.mp3", 42, 441749},
			{1345, "Sound\\Music\\cataclysm\\MUS_Skywall_GU07.mp3", 42, 441750},
			{1346, "Sound\\Music\\cataclysm\\MUS_Skywall_GU08.mp3", 42, 441751},
			{1347, "Sound\\Music\\cataclysm\\MUS_Skywall_GU09.mp3", 207, 441752},
			{1348, "Sound\\Music\\cataclysm\\MUS_Skywall_GU10.mp3", 109, 441753},
			{1349, "Sound\\Music\\cataclysm\\MUS_Treasure_UU01.mp3", 158, 441791},
			{1350, "Sound\\Music\\cataclysm\\MUS_Treasure_UU02.mp3", 91, 441792},
			{1351, "Sound\\Music\\cataclysm\\MUS_Treasure_UU03.mp3", 63, 441793},
			{1352, "Sound\\Music\\cataclysm\\MUS_Treasure_UU04.mp3", 69, 441794},
			{1353, "Sound\\Music\\cataclysm\\MUS_Treasure_UU05.mp3", 77, 441795},
			{1354, "Sound\\Music\\cataclysm\\MUS_Treasure_UU06.mp3", 70, 441796},
			{1355, "Sound\\Music\\cataclysm\\MUS_UldumA_GU01.mp3", 134, 441810},
			{1356, "Sound\\Music\\cataclysm\\MUS_UldumA_GU02.mp3", 44, 441811},
			{1357, "Sound\\Music\\cataclysm\\MUS_UldumA_GU03.mp3", 94, 441812},
			{1358, "Sound\\Music\\cataclysm\\MUS_UldumA_GU04.mp3", 110, 441813},
			{1359, "Sound\\Music\\cataclysm\\MUS_UldumA_GU05.mp3", 110, 441814},
			{1360, "Sound\\Music\\cataclysm\\MUS_UldumB_GU01.mp3", 126, 441815},
			{1361, "Sound\\Music\\cataclysm\\MUS_UldumB_GU02.mp3", 127, 441816},
			{1362, "Sound\\Music\\cataclysm\\MUS_UldumB_GU03.mp3", 127, 441817},
			{1363, "Sound\\Music\\cataclysm\\MUS_UldumB_GU04.mp3", 56, 441818},
			{1364, "Sound\\Music\\cataclysm\\MUS_UldumB_GU05.mp3", 57, 441819},
			{1365, "Sound\\Music\\cataclysm\\MUS_UldumB_GU06.mp3", 93, 441820},
			{1366, "Sound\\Music\\cataclysm\\MUS_UldumEvent_E01.mp3", 79, 463828},
		},
	},
	{
		id = 110,
		name = L["TITLE_VASHJIR"],
		files = {
			{1367, "Sound\\Music\\cataclysm\\MUS_Rift_UU01.mp3", 90, 441716},
			{1368, "Sound\\Music\\cataclysm\\MUS_Rift_UU02.mp3", 63, 441717},
			{1369, "Sound\\Music\\cataclysm\\MUS_Rift_UU03.mp3", 32, 441718},
			{1370, "Sound\\Music\\cataclysm\\MUS_Rift_UU04.mp3", 61, 441719},
			{1371, "Sound\\Music\\cataclysm\\MUS_Vashjir_GU01.mp3", 98, 441838},
			{1372, "Sound\\Music\\cataclysm\\MUS_Vashjir_GU02.mp3", 98, 441839},
			{1373, "Sound\\Music\\cataclysm\\MUS_Vashjir_GU03.mp3", 153, 441840},
			{1374, "Sound\\Music\\cataclysm\\MUS_Vashjir_GU04.mp3", 48, 441841},
			{1375, "Sound\\Music\\cataclysm\\MUS_Vashjir_GU05.mp3", 92, 441842},
			{1376, "Sound\\Music\\cataclysm\\MUS_Vashjir_GU06.mp3", 153, 441843},
			{1377, "Sound\\Music\\cataclysm\\MUS_Vashjir_GU07.mp3", 91, 441844},
			{1378, "Sound\\Music\\cataclysm\\MUS_Vashjir_GU08.mp3", 46, 441845},
			{1379, "Sound\\Music\\cataclysm\\MUS_Vashjir_GU09.mp3", 132, 441846},
			{1380, "Sound\\Music\\cataclysm\\MUS_VashjirNaga_GU01.mp3", 87, 441832},
			{1381, "Sound\\Music\\cataclysm\\MUS_VashjirNaga_GU02.mp3", 97, 441833},
			{1382, "Sound\\Music\\cataclysm\\MUS_VashjirNaga_GU03.mp3", 97, 441834},
			{1383, "Sound\\Music\\cataclysm\\MUS_VashjirNaga_GU04.mp3", 97, 441835},
			{1384, "Sound\\Music\\cataclysm\\MUS_VashjirNaga_GU05.mp3", 127, 441836},
			{1385, "Sound\\Music\\cataclysm\\MUS_VashjirNaga_GU06.mp3", 113, 441837},
			{1386, "Sound\\Music\\cataclysm\\MUS_VashjirNagaThrone_GU01.mp3", 43, 441826},
			{1387, "Sound\\Music\\cataclysm\\MUS_VashjirNagaThrone_GU02.mp3", 89, 441827},
			{1388, "Sound\\Music\\cataclysm\\MUS_VashjirNagaThrone_GU03.mp3", 96, 441828},
			{1389, "Sound\\Music\\cataclysm\\MUS_VashjirNagaThrone_GU04.mp3", 96, 441829},
			{1390, "Sound\\Music\\cataclysm\\MUS_VashjirNagaThrone_GU05.mp3", 91, 441830},
			{1391, "Sound\\Music\\cataclysm\\MUS_VashjirNagaThrone_GU06.mp3", 92, 441831},
		},
	},
	{
		id = 111,
		name = L["TITLE_SHADOWS"],
		files = {
			{1392, "Sound\\Music\\cataclysm\\MUS_Shadows_UU01.mp3", 90, 441732},
			{1393, "Sound\\Music\\cataclysm\\MUS_Shadows_UU02.mp3", 29, 441733},
			{1394, "Sound\\Music\\cataclysm\\MUS_Shadows_UU03.mp3", 53, 441734},
			{1395, "Sound\\Music\\cataclysm\\MUS_Shadows_UU04.mp3", 70, 441735},
			{1396, "Sound\\Music\\cataclysm\\MUS_Shadows_UU05.mp3", 60, 441736},
		},
	},
	{
		id = 112,
		name = L["TITLE_WORDS_AND_MUSIC"],
		files = {
			{1397, "Sound\\Music\\cataclysm\\MUS_WordsAndMusicByEvent_E01.mp3", 52, 464065},
		},
	},
	{
		id = 113,
		name = L["TITLE_CHAMBEROTASPECTS"],
		files = {
			{1398, "Sound\\Music\\ZoneMusic\\ChamberOfTheAspects\\CA_AspectsGeneralWalkADay01.mp3", 93, 229783},
			{1399, "Sound\\Music\\ZoneMusic\\ChamberOfTheAspects\\CA_AspectsGeneralWalkADay02.mp3", 133, 229784},
			{1400, "Sound\\Music\\ZoneMusic\\ChamberOfTheAspects\\CA_AspectsGeneralWalkADay03.mp3", 75, 229785},
			{1401, "Sound\\Music\\ZoneMusic\\ChamberOfTheAspects\\CA_AspectsGeneralWalkADay04.mp3", 65, 229786},
			{1402, "Sound\\Music\\ZoneMusic\\ChamberOfTheAspects\\CA_AspectsGeneralWalkANight01.mp3", 90, 229787},
			{1403, "Sound\\Music\\ZoneMusic\\ChamberOfTheAspects\\CA_AspectsGeneralWalkANight02.mp3", 133, 229788},
			{1404, "Sound\\Music\\ZoneMusic\\ChamberOfTheAspects\\CA_AspectsGeneralWalkANight03.mp3", 75, 229789},
			{1405, "Sound\\Music\\ZoneMusic\\ChamberOfTheAspects\\CA_AspectsGeneralWalkANight04.mp3", 65, 229790},
			{1406, "Sound\\Music\\ZoneMusic\\ChamberOfTheAspects\\CA_AspectsGeneralWalkAUni01.mp3", 75, 229791},
			{1407, "Sound\\Music\\ZoneMusic\\ChamberOfTheAspects\\CA_AspectsGeneralWalkAUni02.mp3", 65, 229792},
			{1408, "Sound\\Music\\ZoneMusic\\ChamberOfTheAspects\\CA_AspectsIntroADay01.mp3", 73, 229793},
			{1409, "Sound\\Music\\ZoneMusic\\ChamberOfTheAspects\\CA_AspectsIntroANight01.mp3", 73, 229794},
		},
	},
}

GJB.musictable[GJB.EXP_CATA1] = music
