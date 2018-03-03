-- STRUCTURE 
-- [1] : Integer - ID of the music (new system)
-- [2] : String - Path of the music file
-- [3] : Integer - Length of the music file in seconds

-- Get localization
local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Cataclysm Revamp (split cata because it has too much music lol)
local music = {
	{
		id = 114,
		name = L["TITLE_ZULAMAN"],
		files = {
			{1410, "Sound\\Music\\cataclysm\\MUS_41_ZA_altarbloodgod_UU01.mp3", 68},
			{1411, "Sound\\Music\\cataclysm\\MUS_41_ZA_altarbloodgod_UU02.mp3", 68},
			{1412, "Sound\\Music\\cataclysm\\MUS_41_ZA_altarbloodgod_UU03.mp3", 68},
			{1413, "Sound\\Music\\cataclysm\\MUS_41_ZA_bethekk_UU01.mp3", 26},
			{1414, "Sound\\Music\\cataclysm\\MUS_41_ZA_bethekk_UU02.mp3", 26},
			{1415, "Sound\\Music\\cataclysm\\MUS_41_ZA_cacheofmadness_UU01.mp3", 34},
			{1416, "Sound\\Music\\cataclysm\\MUS_41_ZA_cacheofmadness_UU02.mp3", 34},
			{1417, "Sound\\Music\\cataclysm\\MUS_41_ZA_devilsterrace_UU01.mp3", 15},
			{1418, "Sound\\Music\\cataclysm\\MUS_41_ZA_devilsterrace_UU02.mp3", 15},
			{1419, "Sound\\Music\\cataclysm\\MUS_41_ZA_mandokir_UU01.mp3", 100},
			{1420, "Sound\\Music\\cataclysm\\MUS_41_ZA_mandokir_UU02.mp3", 100},
			{1421, "Sound\\Music\\cataclysm\\MUS_41_ZA_templebethek_UU01.mp3", 60},
			{1422, "Sound\\Music\\cataclysm\\MUS_41_ZA_templebethek_UU02.mp3", 60},
			{1423, "Sound\\Music\\cataclysm\\MUS_41_ZA_terracedevils_UU01.mp3", 16},
			{1424, "Sound\\Music\\cataclysm\\MUS_41_ZA_terracedevils_UU02.mp3", 16},
			{1425, "Sound\\Music\\cataclysm\\MUS_41_ZA_thecoil_UU01.mp3", 119},
			{1426, "Sound\\Music\\cataclysm\\MUS_41_ZA_thecoil_UU02.mp3", 119},
		},
	},
	{
		id = 115,
		name = L["TITLE_CORRUPTED_DRAGONBLIGHT"],
		files = {
			{1427, "Sound\\Music\\cataclysm\\MUS_43_CorruptedDragonblight_UU01.mp3", 122},
			{1428, "Sound\\Music\\cataclysm\\MUS_43_CorruptedDragonblight_UU02.mp3", 122},
			{1429, "Sound\\Music\\cataclysm\\MUS_43_CorruptedDragonblight_UU03.mp3", 84},
		},
	},
	{
		id = 116,
		name = L["TITLE_ARATHIHIGHLANDS"],
		files = {
			{1430, "Sound\\Music\\cataclysm\\MUS_ArathiHighlandsA_GD01.mp3", 67},
			{1431, "Sound\\Music\\cataclysm\\MUS_ArathiHighlandsA_GN01.mp3", 68},
			{1432, "Sound\\Music\\cataclysm\\MUS_ArathiHighlandsA_GN02.mp3", 68},
			{1433, "Sound\\Music\\cataclysm\\MUS_ArathiHighlandsB_GD01.mp3", 69},
			{1434, "Sound\\Music\\cataclysm\\MUS_ArathiHighlandsB_GN01.mp3", 69},
			{1435, "Sound\\Music\\cataclysm\\MUS_ArathiHighlandsB_GN02.mp3", 69},
			{1436, "Sound\\Music\\cataclysm\\MUS_ArathiHighlandsC_GD01.mp3", 90},
			{1437, "Sound\\Music\\cataclysm\\MUS_ArathiHighlandsC_GN01.mp3", 86},
			{1438, "Sound\\Music\\cataclysm\\MUS_ArathiHighlandsC_GN02.mp3", 86},
			{1439, "Sound\\Music\\cataclysm\\MUS_Cataclysm_UD07.mp3", 111},
			{1440, "Sound\\Music\\cataclysm\\MUS_Cataclysm_UN08.mp3", 111},
			{1441, "Sound\\Music\\cataclysm\\MUS_Cataclysm_UN09.mp3", 111},
		},
	},
	{
		id = 117,
		name = L["TITLE_AZSHARA"],
		files = {
			{1442, "Sound\\Music\\cataclysm\\MUS_Azshara_GD01.mp3", 70},
			{1443, "Sound\\Music\\cataclysm\\MUS_Azshara_GN01.mp3", 70},
		},
	},
	{
		id = 118,
		name = L["TITLE_BURNINGSTEPPES"],
		files = {
			{1444, "Sound\\Music\\cataclysm\\MUS_BurningSteppes_GU01.mp3", 133},
			{1445, "Sound\\Music\\cataclysm\\MUS_BurningSteppes_GU02.mp3", 52},
			{1446, "Sound\\Music\\cataclysm\\MUS_BurningSteppes_GU03.mp3", 80},
			{1447, "Sound\\Music\\cataclysm\\MUS_BurningSteppes_GU04.mp3", 101},
		},
	},
	{
		id = 119,
		name = L["TITLE_FELWOOD"],
		files = {
			{1448, "Sound\\Music\\cataclysm\\MUS_Cursed_UU01.mp3", 21},
			{1449, "Sound\\Music\\cataclysm\\MUS_Cursed_UU02.mp3", 85},
			{1450, "Sound\\Music\\cataclysm\\MUS_Cursed_UU03.mp3", 85},
			{1451, "Sound\\Music\\cataclysm\\MUS_Cursed_UU04.mp3", 74},
			{1452, "Sound\\Music\\cataclysm\\MUS_Cursed_UU05.mp3", 76},
			{1453, "Sound\\Music\\cataclysm\\MUS_Cursed_UU06.mp3", 79},
			{1454, "Sound\\Music\\cataclysm\\MUS_Cursed_UU07.mp3", 79},
			{1455, "Sound\\Music\\cataclysm\\MUS_Cursed_UU08.mp3", 79},
			{1456, "Sound\\Music\\cataclysm\\MUS_Cursed_UU09.mp3", 43},
			{1457, "Sound\\Music\\cataclysm\\MUS_Cursed_UU10.mp3", 30},
			{1458, "Sound\\Music\\cataclysm\\MUS_Cursed_UU11.mp3", 45},
			{1459, "Sound\\Music\\cataclysm\\MUS_Cursed_UU12.mp3", 80},
		},
	},
	{
		id = 120,
		name = L["TITLE_DARKIRONFORGE"],
		files = {
			{1460, "Sound\\Music\\cataclysm\\MUS_DarkIronforge_GU01.mp3", 154},
			{1461, "Sound\\Music\\cataclysm\\MUS_DarkIronforge_GU02.mp3", 66},
			{1462, "Sound\\Music\\cataclysm\\MUS_DarkIronforge_GU03.mp3", 54},
			{1463, "Sound\\Music\\cataclysm\\MUS_DarkIronforge_GU04.mp3", 102},
			{1464, "Sound\\Music\\cataclysm\\MUS_DarkIronforge_GU05.mp3", 46},
			{1465, "Sound\\Music\\cataclysm\\MUS_DarkIronforge_GU06.mp3", 105},
			{1466, "Sound\\Music\\cataclysm\\MUS_DarkIronforge_GU07.mp3", 94},
		},
	},
	{
		id = 121,
		name = L["TITLE_DARNASSUS"],
		files = {
			{1467, "Sound\\Music\\cataclysm\\MUS_Darnassus_GI01.mp3", 48},
			{1468, "Sound\\Music\\cataclysm\\MUS_Darnassus_GI02.mp3", 45},
		},
	},
	{
		id = 122,
		name = L["TITLE_DUROTAR"],
		files = {
			{1469, "Sound\\Music\\cataclysm\\MUS_DurotarA_GU01.mp3", 124},
			{1470, "Sound\\Music\\cataclysm\\MUS_DurotarA_GU02.mp3", 101},
			{1471, "Sound\\Music\\cataclysm\\MUS_DurotarA_GU03.mp3", 101},
			{1472, "Sound\\Music\\cataclysm\\MUS_DurotarB_GU01.mp3", 72},
			{1473, "Sound\\Music\\cataclysm\\MUS_DurotarB_GU02.mp3", 72},
			{1474, "Sound\\Music\\cataclysm\\MUS_DurotarB_GU03.mp3", 95},
			{1475, "Sound\\Music\\cataclysm\\MUS_DurotarB_GU04.mp3", 95},
			{1476, "Sound\\Music\\cataclysm\\MUS_DurotarC_GU01.mp3", 85},
			{1477, "Sound\\Music\\cataclysm\\MUS_DurotarC_GU02.mp3", 85},
			{1478, "Sound\\Music\\cataclysm\\MUS_DurotarC_GU03.mp3", 61},
			{1479, "Sound\\Music\\cataclysm\\MUS_DurotarC_GU04.mp3", 61},
			{1480, "Sound\\Music\\cataclysm\\MUS_DurotarD_GU01.mp3", 84},
			{1481, "Sound\\Music\\cataclysm\\MUS_DurotarD_GU02.mp3", 84},
		},
	},
	{
		id = 123,
		name = L["TITLE_FERALAS"],
		files = {
			{1482, "Sound\\Music\\cataclysm\\MUS_Feralas_GU01.mp3", 82},
			{1483, "Sound\\Music\\cataclysm\\MUS_Feralas_GU02.mp3", 85},
			{1484, "Sound\\Music\\cataclysm\\MUS_Feralas_GU03.mp3", 84},
			{1485, "Sound\\Music\\cataclysm\\MUS_Feralas_GU04.mp3", 84},
			{1486, "Sound\\Music\\cataclysm\\MUS_Feralas_GU05.mp3", 80},
			{1487, "Sound\\Music\\cataclysm\\MUS_Feralas_GU06.mp3", 82},
			{1488, "Sound\\Music\\cataclysm\\MUS_Feralas_GU07.mp3", 84},
			{1489, "Sound\\Music\\cataclysm\\MUS_Feralas_GU08.mp3", 62},
		},
	},
	{
		id = 124,
		name = L["TITLE_GHOST"],
		files = {
			{1490, "Sound\\Music\\cataclysm\\MUS_Ghosts_UU01.mp3", 84},
			{1491, "Sound\\Music\\cataclysm\\MUS_Ghosts_UU02.mp3", 84},
			{1492, "Sound\\Music\\cataclysm\\MUS_Ghosts_UU03.mp3", 91},
		},
	},
	{
		id = 125,
		name = L["TITLE_DUSTWALLOWMARSH"],
		files = {
			{1493, "Sound\\Music\\cataclysm\\MUS_Grimtotem_UU01.mp3", 79},
			{1494, "Sound\\Music\\cataclysm\\MUS_Grimtotem_UU02.mp3", 79},
			{1495, "Sound\\Music\\cataclysm\\MUS_Grimtotem_UU03.mp3", 79},
			{1496, "Sound\\Music\\cataclysm\\MUS_Grimtotem_UU04.mp3", 70},
		},
	},
	{
		id = 126,
		name = L["TITLE_DARKSHORE"],
		files = {
			{1497, "Sound\\Music\\cataclysm\\MUS_GroveOfTheAncients_GU01.mp3", 88},
			{1498, "Sound\\Music\\cataclysm\\MUS_GroveOfTheAncients_GU02.mp3", 88},
			{1499, "Sound\\Music\\cataclysm\\MUS_GroveOfTheAncients_GU03.mp3", 62},
			{1500, "Sound\\Music\\cataclysm\\MUS_GroveOfTheAncients_GU04.mp3", 62},
			{1501, "Sound\\Music\\cataclysm\\MUS_RuinsOfAuberdine_GU01.mp3", 100},
			{1502, "Sound\\Music\\cataclysm\\MUS_RuinsOfAuberdine_GU02.mp3", 83},
			{1503, "Sound\\Music\\cataclysm\\MUS_RuinsOfAuberdine_GU03.mp3", 83},
			{1504, "Sound\\Music\\cataclysm\\MUS_RuinsOfAuberdine_GU04.mp3", 77},
			{1505, "Sound\\Music\\cataclysm\\MUS_RuinsOfAuberdine_GU05.mp3", 77},
		},
	},
	{
		id = 127,
		name = L["TITLE_UNGORO"],
		files = {
			{1506, "Sound\\Music\\cataclysm\\MUS_Marsh_UU01.mp3", 110},
			{1507, "Sound\\Music\\cataclysm\\MUS_Marsh_UU02.mp3", 88},
			{1508, "Sound\\Music\\cataclysm\\MUS_Marsh_UU03.mp3", 84},
			{1509, "Sound\\Music\\cataclysm\\MUS_Marsh_UU04.mp3", 68},
			{1510, "Sound\\Music\\cataclysm\\MUS_Marsh_UU05.mp3", 103},
			{1511, "Sound\\Music\\cataclysm\\MUS_Marsh_UU06.mp3", 111},
			{1512, "Sound\\Music\\cataclysm\\MUS_Marsh_UU07.mp3", 110},
			{1513, "Sound\\Music\\cataclysm\\MUS_Marsh_UU08.mp3", 98},
		},
	},
	{
		id = 128,
		name = L["TITLE_MOONGLADE"],
		files = {
			{1514, "Sound\\Music\\cataclysm\\MUS_Moonglade_GU01.mp3", 90},
			{1515, "Sound\\Music\\cataclysm\\MUS_Moonglade_GU02.mp3", 39},
			{1516, "Sound\\Music\\cataclysm\\MUS_Moonglade_GU03.mp3", 32},
			{1517, "Sound\\Music\\cataclysm\\MUS_Moonglade_GU04.mp3", 89},
			{1518, "Sound\\Music\\cataclysm\\MUS_Moonglade_GU05.mp3", 87},
			{1519, "Sound\\Music\\cataclysm\\MUS_Moonglade_GU06.mp3", 73},
			{1520, "Sound\\Music\\cataclysm\\MUS_Moonglade_GU07.mp3", 91},
		},
	},
	{
		id = 129,
		name = L["TITLE_PLAINS"],
		files = {
			{1521, "Sound\\Music\\cataclysm\\MUS_Mulgore_GU01.mp3", 94},
			{1522, "Sound\\Music\\cataclysm\\MUS_Mulgore_GU02.mp3", 94},
			{1523, "Sound\\Music\\cataclysm\\MUS_Mulgore_GU03.mp3", 94},
			{1524, "Sound\\Music\\cataclysm\\MUS_MulgorePlains_GU01.mp3", 90},
			{1525, "Sound\\Music\\cataclysm\\MUS_MulgorePlains_GU02.mp3", 73},
			{1526, "Sound\\Music\\cataclysm\\MUS_Tauren_UU01.mp3", 76},
			{1527, "Sound\\Music\\cataclysm\\MUS_Tauren_UU02.mp3", 71},
			{1528, "Sound\\Music\\cataclysm\\MUS_ThunderBluff_GU01.mp3", 93},
			{1529, "Sound\\Music\\cataclysm\\MUS_ThunderBluff_GU02.mp3", 85},
			{1530, "Sound\\Music\\cataclysm\\MUS_ThunderBluff_GU03.mp3", 85},
		},
	},
	{
		id = 130,
		name = L["TITLE_ORGRIMMAR"],
		files = {
			{1531, "Sound\\Music\\cataclysm\\MUS_Orgrimmar_GU01.mp3", 108},
			{1532, "Sound\\Music\\cataclysm\\MUS_OrgrimmarLegacy_GU01.mp3", 91},
			{1533, "Sound\\Music\\cataclysm\\MUS_WarMarch_UU01.mp3", 136},
		},
	},
	{
		id = 131,
		name = L["TITLE_TELDRASIL"],
		files = {
			{1534, "Sound\\Music\\cataclysm\\MUS_Shadowglen_GU01.mp3", 87},
			{1535, "Sound\\Music\\cataclysm\\MUS_Shadowglen_GU02.mp3", 87},
			{1536, "Sound\\Music\\cataclysm\\MUS_Shadowglen_GU03.mp3", 111},
		},
	},
	{
		id = 132,
		name = L["TITLE_SILITHUS"],
		files = {
			{1537, "Sound\\Music\\cataclysm\\MUS_Silithus_GU01.mp3", 99},
			{1538, "Sound\\Music\\cataclysm\\MUS_Silithus_GU02.mp3", 62},
			{1539, "Sound\\Music\\cataclysm\\MUS_Silithus_GU03.mp3", 98},
			{1540, "Sound\\Music\\cataclysm\\MUS_Silithus_GU04.mp3", 111},
			{1541, "Sound\\Music\\cataclysm\\MUS_Silithus_GU05.mp3", 98},
			{1542, "Sound\\Music\\cataclysm\\MUS_Silithus_GU06.mp3", 141},
		},
	},
	{
		id = 133,
		name = L["TITLE_SBARRENS"],
		files = {
			{1543, "Sound\\Music\\cataclysm\\MUS_SouthernBarrens_GU01.mp3", 78},
			{1544, "Sound\\Music\\cataclysm\\MUS_SouthernBarrens_GU02.mp3", 55},
			{1545, "Sound\\Music\\cataclysm\\MUS_SouthernBarrens_GU03.mp3", 20},
			{1546, "Sound\\Music\\cataclysm\\MUS_SouthernBarrens_GU04.mp3", 22},
			{1547, "Sound\\Music\\cataclysm\\MUS_SouthernBarrens_GU05.mp3", 36},
			{1548, "Sound\\Music\\cataclysm\\MUS_SouthernBarrens_GU06.mp3", 27},
		},
	},
	{
		id = 134,
		name = L["TITLE_STONETALON"],
		files = {
			{1549, "Sound\\Music\\cataclysm\\MUS_Stonetalon_GU01.mp3", 88},
			{1550, "Sound\\Music\\cataclysm\\MUS_Stonetalon_GU02.mp3", 80},
			{1551, "Sound\\Music\\cataclysm\\MUS_Stonetalon_GU03.mp3", 80},
			{1552, "Sound\\Music\\cataclysm\\MUS_Stonetalon_GU04.mp3", 80},
		},
	},
	{
		id = 135,
		name = L["TITLE_STORMWIND"],
		files = {
			{1553, "Sound\\Music\\cataclysm\\MUS_Stormwind_GU01.mp3", 73},
			{1554, "Sound\\Music\\cataclysm\\MUS_Stormwind_GU02.mp3", 38},
			{1555, "Sound\\Music\\cataclysm\\MUS_Stormwind_GU03.mp3", 116},
			{1556, "Sound\\Music\\cataclysm\\MUS_Stormwind_GU04.mp3", 66},
		},
	},
	{
		id = 136,
		name = L["TITLE_STRAGLETHORN"],
		files = {
			{1557, "Sound\\Music\\cataclysm\\MUS_Stranglethorn_GU01.mp3", 64},
			{1558, "Sound\\Music\\cataclysm\\MUS_Stranglethorn_GU02.mp3", 90},
			{1559, "Sound\\Music\\cataclysm\\MUS_Stranglethorn_GU03.mp3", 84},
			{1560, "Sound\\Music\\cataclysm\\MUS_Stranglethorn_GU04.mp3", 89},
			{1561, "Sound\\Music\\cataclysm\\MUS_StranglethornVale_GU01.mp3", 78},
			{1562, "Sound\\Music\\cataclysm\\MUS_StranglethornVale_GU02.mp3", 93},
			{1563, "Sound\\Music\\cataclysm\\MUS_StranglethornVale_GU03.mp3", 91},
			{1564, "Sound\\Music\\cataclysm\\MUS_StranglethornVale_GU04.mp3", 102},
		},
	},
	{
		id = 137,
		name = L["TITLE_TANARIS"],
		files = {
			{1565, "Sound\\Music\\cataclysm\\MUS_Tanaris_GU01.mp3", 87},
			{1566, "Sound\\Music\\cataclysm\\MUS_Tanaris_GU02.mp3", 87},
			{1567, "Sound\\Music\\cataclysm\\MUS_Tanaris_GU03.mp3", 84},
			{1568, "Sound\\Music\\cataclysm\\MUS_Tanaris_GU04.mp3", 66},
			{1569, "Sound\\Music\\cataclysm\\MUS_Tanaris_GU05.mp3", 82},
			{1570, "Sound\\Music\\cataclysm\\MUS_Tanaris_GU06.mp3", 72},
			{1571, "Sound\\Music\\cataclysm\\MUS_Tanaris_GU07.mp3", 72},
			{1572, "Sound\\Music\\cataclysm\\MUS_Tanaris_GU08.mp3", 61},
			{1573, "Sound\\Music\\cataclysm\\MUS_Tanaris_GU09.mp3", 34},
			{1574, "Sound\\Music\\cataclysm\\MUS_Tanaris_GU10.mp3", 84},
		},
	},
	{
		id = 138,
		name = L["TITLE_UNDEAD"],
		files = {
			{1575, "Sound\\Music\\cataclysm\\MUS_Undead_UU01.mp3", 65},
			{1576, "Sound\\Music\\cataclysm\\MUS_Undead_UU02.mp3", 26},
			{1577, "Sound\\Music\\cataclysm\\MUS_Undead_UU03.mp3", 66},
			{1578, "Sound\\Music\\cataclysm\\MUS_Undead_UU04.mp3", 73},
			{1579, "Sound\\Music\\cataclysm\\MUS_Undead_UU05.mp3", 94},
		},
	},
	{
		id = 139,
		name = L["TITLE_WESTFALL"],
		files = {
			{1580, "Sound\\Music\\cataclysm\\MUS_Westfall_GU01.mp3", 122},
			{1581, "Sound\\Music\\cataclysm\\MUS_Westfall_GU02.mp3", 122},
			{1582, "Sound\\Music\\cataclysm\\MUS_Westfall_GU03.mp3", 122},
			{1583, "Sound\\Music\\cataclysm\\MUS_Westfall_GU04.mp3", 115},
			{1584, "Sound\\Music\\cataclysm\\MUS_Westfall_GU05.mp3", 48},
		},
	},
	{
		id = 140,
		name = L["TITLE_WESTPLAGUE"],
		files = {
			{1585, "Sound\\Music\\cataclysm\\MUS_WestPlagueA_GD01.mp3", 50},
			{1586, "Sound\\Music\\cataclysm\\MUS_WestPlagueA_GN01.mp3", 51},
			{1587, "Sound\\Music\\cataclysm\\MUS_WestPlagueA_GN02.mp3", 51},
			{1588, "Sound\\Music\\cataclysm\\MUS_WestPlagueB_GD01.mp3", 50},
			{1589, "Sound\\Music\\cataclysm\\MUS_WestPlagueB_GN01.mp3", 50},
			{1590, "Sound\\Music\\cataclysm\\MUS_WestPlagueB_GN02.mp3", 50},
			{1591, "Sound\\Music\\cataclysm\\MUS_WestPlagueB_GN03.mp3", 50},
			{1592, "Sound\\Music\\cataclysm\\MUS_WestPlagueC_GD01.mp3", 50},
			{1593, "Sound\\Music\\cataclysm\\MUS_WestPlagueC_GN01.mp3", 50},
			{1594, "Sound\\Music\\cataclysm\\MUS_WestPlagueC_GN02.mp3", 50},
		},
	},
	{
		id = 141,
		name = L["TITLE_WINTERSPRING"],
		files = {
			{1595, "Sound\\Music\\cataclysm\\MUS_Winterspring_GU01.mp3", 66},
			{1596, "Sound\\Music\\cataclysm\\MUS_Winterspring_GU02.mp3", 66},
			{1597, "Sound\\Music\\cataclysm\\MUS_Winterspring_GU03.mp3", 66},
			{1598, "Sound\\Music\\cataclysm\\MUS_Winterspring_GU04.mp3", 76},
			{1599, "Sound\\Music\\cataclysm\\MUS_Winterspring_GU05.mp3", 107},
		},
	},
}

GJB.musictable[GJB.EXP_CATA2] = music