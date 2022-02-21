CREATE TABLE "user" (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"username" VARCHAR(250) UNIQUE NOT NULL,
	"password" VARCHAR(250) NOT NULL,
	"isAdmin" BOOLEAN DEFAULT FALSE
);

CREATE TABLE characters (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"race" VARCHAR(255) NOT NULL,
	"level" INTEGER NOT NULL,
	"faction_id" INTEGER REFERENCES factions,
	"user_id" INTEGER REFERENCES "user"
);

CREATE TABLE factions (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"type" VARCHAR(255) NOT NULL
);

CREATE TABLE continents (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(255) NOT NULL
);

CREATE TABLE zones (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"max_level" INTEGER NOT NULL,
	"map_image_url" VARCHAR(255) NOT NULL,
	"min_level" INTEGER NOT NULL,
	"description" VARCHAR(1000) NOT NULL,
	"screenshot" VARCHAR(255) NOT NULL,
	"faction_id" INTEGER REFERENCES factions,
	"continent_id" INTEGER REFERENCES continents
);

CREATE TABLE quests (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"description" VARCHAR(500) NOT NULL,
	"level" INTEGER NOT NULL,
	"zone_id" INTEGER REFERENCES zones
);

CREATE TABLE quests_characters (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"isCompleted" BOOLEAN DEFAULT FALSE,
	"quest_id" INTEGER REFERENCES quests,
	"character_id" INTEGER REFERENCES characters
);

CREATE TABLE dungeons (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"max_level" INTEGER NOT NULL,
	"min_level" INTEGER NOT NULL,
	"description" VARCHAR(500) NOT NULL,
	"zone_id" INTEGER REFERENCES zones
);

CREATE TABLE settlements (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"description" VARCHAR(500) NOT NULL,
	"zone_id" INTEGER REFERENCES zones
);

CREATE TABLE capitalCities (
	"id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"description" VARCHAR(500) NOT NULL,
	"map_image_url" VARCHAR(255) NOT NULL,
	"zone_id" INTEGER REFERENCES zones,
	"faction_id" INTEGER REFERENCES factions
);

DROP TABLE capitalCities CASCADE;

DROP TABLE zones CASCADE;

DROP TABLE quests CASCADE;

DROP TABLE quests_characters CASCADE;

DROP TABLE characters CASCADE;

DROP TABLE factions CASCADE;

DROP TABLE settlements CASCADE;

DROP TABLE "user" CASCADE;

DROP TABLE dungeons CASCADE;

DROP TABLE continents CASCADE;

INSERT INTO factions ("type") 
VALUES ('Alliance'), ('Horde'), ('Contested');

INSERT INTO continents ("name") 
VALUES ('Eastern Kingdoms'), ('Kalimdor');

INSERT INTO zones ("name", "max_level", "map_image_url", "min_level", "description", "screenshot", "faction_id", "continent_id") 
VALUES ('Stranglethorn Vale', '50', 'images/stv.jpg', '30', 'Stranglethorn Vale is a vast rainforest in southern Eastern Kingdoms. For millennia, Stranglethorn Vale has been the home of the jungle trolls, with the Gurubashi Empire having its seat of power in Zul''Gurub.', 'images/stv_screenshot.jpg', '3', '1'),
('The Hinterlands', '49', 'images/hlands.jpg', '41', 'The Hinterlands is a grassy mountainous zone in northern Eastern Kingdoms. Hinterlands is home to both tribes of Forest trolls, including the Horde-aligned Revantusk Tribe, as well as the Wildhammer Dwarves, staunch members of the Alliance who live and train gryphons in the settlement of Aerie Peak.', 'images/hlands_screenshot.jpg', '3', '1'),
('Hillsbrad Foothills', '31', 'images/hfhills.jpg', '20', 'Hillsbrad Foothills is a zone covered with hills in southern Lordaeron, central Eastern Kingdoms. This zone, covered in grassy hills and plenty of wildlife, is one of the only locations of Lordaeron that was left untouched by the Scourge, with the Alliance settlement of Southshore thriving here.', 'images/hfhills_screenshot.jpg', '3', '1'),
('Searing Gorge', '56', 'images/gorge.jpg', '43', 'Searing Gorge is a fiery and rocky zone in the Khaz Modan region, in the Eastern Kingdoms. This zone is mainly dominated by Dark Iron Dwarves, who control part of Blackrock Mountain.', 'images/gorge_screenshot.jpg', '3', '1'),
('Badlands', '45', 'images/blands.jpg', '36', 'Badlands is a desert region in the center of the Khaz Modan region. A harsh zone with dry earth, mountain ranges and many canyons, the zone is home to many conflicts, as the Dark Iron Dwarves wrestle with wildlife, the Horde maintains the fortress of Kargath, and dwarven explorers search for titan artifacts.', 'images/blands_screenshot.jpg', '3', '1'),
('Burning Steppes', '59', 'images/burn.jpg', '50', 'Burning Steppes is a rugged region full of crags and cliffs, and as harsh as the zone is, it serves as one of the only roads that connect Stormwind with the dwarven kingdom of Khaz Modan.', 'images/burn_screenshot.jpg', '3', '1'),
('Blasted Lands', '63', 'images/blast.jpg', '46', 'The Blasted Lands are a scorched zone in southwestern Eastern Kingdoms. The name of the zone is no mere coincidence, as it is home to the original Dark Portal, used by Medivh to unleash the Orcs into Azeroth for the first time.', 'images/blast_screenshot.jpg', '3', '1'),
('Swamp of Sorrows', '43', 'images/swamp.jpg', '36', 'The Swamp of Sorrows is a marshland in southern Eastern Kingdoms. As the ocean seeps into the land, the waters become brackish and in the ideal conditions for creatures such as raptors, crocolisks and alligators to thrive.', 'images/swamp_screenshot.jpg', '3', '1'),
('Eastern Plaguelands', '59', 'images/eplague.jpg', '54', 'Eastern Plaguelands is the more heavily devastated half of the Plaguelands, the remnants of the former kingdom of Lordaeron.', 'images/eplague_screenshot.jpg', '3', '1'),
('Arathi Highlands', '40', 'images/arathi.jpg', '30', 'Arathi Highlands is a plains region in Eastern Kingdoms. Formerly serving as the seat of power of the human nation of Arathor and their capital Stromgarde, nowadays fallen to a state of disrepair, Arathi Highlands serves today as a crossroads to Lordaeron, and a point of interest to both Horde and Alliance, who have settlements in Hammerfall and Refuge Pointe.', 'images/arathi_screenshot.jpg', '3', '1'),
('Western Plaguelands', '57', 'images/wplague.jpg', '46', 'Western Plaguelands is a plagued forest zone in northern Eastern Kingdoms. Together with Eastern Plaguelands, these zones form the Plaguelands, zones that were heavily affected by the Lich King''s influence.', 'images/wplague_screenshot.jpg', '3', '1'),
('Duskwood', '30', 'images/dusk.jpg', '10', 'Duskwood is forest in southern Eastern Kingdoms, twisted and warped thanks to the curse of the Scythe of Elune. Thanks to the Scythe that was lost there, Duskwood, previously a beautiful forest, became filled with a black fog, gnarled woods, and is now inhabited by both maddened undead and feral worgen.', 'images/dusk_screenshot.jpg', '3', '1'),
('Wetlands', '30', 'images/wet.jpg', '20', 'Wetlands is a large swamp region at the northern area of Khaz Modan, in central Eastern Kingdoms. As a classic swamp, Wetlands is covered in small lakes, rivers and ponds, and houses creatures usually found on a swamp such as crocolisks, murlocs, and bog lords.', 'images/wet_screenshot.jpg', '3', '1'),
('Westfall', '18', 'images/west.jpg', '9', 'Westfall is a low-level arid Alliance zone in southern Eastern Kingdoms. It used to be a tranquil farming area on the coast, but the Defias Brotherhood took the land from right under Stormwind''s nose.', 'images/west_screenshot.jpg', '1', '1'),
('Silverpine Forest', '20', 'images/silver.jpg', '10', 'Silverpine Forest is a vast forest region on the western coast of Lordaeron, in northern Eastern Kingdoms. The woods surrounding Silverpine Forest are sickly and haunted, and eerily silent, save the roars from the more feral inhabitants of the region.', 'images/silver_screenshot.jpg', '2', '1'),
('Redridge Mountains', '25', 'images/red.jpg', '15', 'Redridge Mountains is an idyllic region of rivers and and risen elevations in the southern part of the Eastern Kingdoms. Redridge Mountains remains one of the last truly peaceful zones in the Eastern Kingdoms, as their inhabitants, mostly settled in the small city of Lakeshire, are under the protection of Stormwind.', 'images/red_screenshot.jpg', '3', '1'),
('Elwynn Forest', '10', 'images/elwynn.jpg', '1', 'Elwynn Forest is a formerly peaceful forest in southern Eastern Kingdoms. Although the zone has a very peaceful feeling, it is not without its dangers: Defias Brotherhood bandits and Kobolds infest several areas in Elwynn Forest.', 'images/elwynn_screenshot.jpg', '1', '1'),
('Loch Modan', '18', 'images/loch.jpg', '10', 'Loch Modan is a rugged mountainous zone in the central part of Eastern Kingdoms, part of the Kingdom of Khaz Modan. Loch Modan is mainly known for its namesake lake and the Stonewrought Dam, a massive dam with dwarven faces etched onto its walls.', 'images/loch_screenshot.jpg', '1', '1'),
('Tirisfal Glades', '12', 'images/glade.jpg', '1', 'Tirisfal Glades is an eerie zone located in northern Lordaeron in Eastern Kingdoms. Formerly the seat of power of all of Lordaeron, nowadays the lands belong to the Forsaken, with the Lich King''s curse seeping through everything.', 'images/glade_screenshot.jpg', '2', '1'),
('Dun Morogh', '12', 'images/dun.jpg', '1', 'Dun Morogh is a snowy region at the heart of the Khaz Modan region, in Central Eastern Kingdoms. Dun Morogh is a very mountainous region, and as such, it is very secluded and only accessible by specific openings around the zone, and these openings are heavily guarded by dwarven troops.', 'images/dun_screenshot.jpg', '1', '1'),
('Deadwind Pass', '60', 'images/dead.jpg', '50', 'Deadwind Pass is a haunted forest and canyon on the edges of the Kingdom of Stormwind in the southern Eastern Kingdoms. Serving as borders between Duskwood and Swamp of Sorrows, evil magic can be felt all through the zone, the trees are all but dead, and very few wildlife and ogres can be found in the zone.', 'images/dead_screenshot.jpg', '3', '1'),
('Desolace', '39', 'images/deso.jpg', '30', 'Desolace is a barren zone located in western Kalimdor. Desolace is a rocky wasteland littered with bones, seemingly permeated by a curse, its skies always taken by storms, and very few sources of water, with lots of small lakes of yellow, polluted water all around the zone.', 'images/deso_screenshot.jpg', '3', '2'),
('Azshara', '55', 'images/azsh.jpg', '42', 'Azshara is a beautiful coastal zone, cloaked in eternal autumn located in the eastern coast of Kalimdor. Surrounded by plenty of flora and beautiful sandy beaches, Azshara was once part of Zin-Azshari, the capital of the Kaldorei Empire.', 'images/azsh_screenshot.jpg', '3', '2'),
('Ashenvale', '30', 'images/ashen.jpg', '19', 'Ashenvale is a beautiful forest and ancestral home of the Night Elves, who control several settlements over the zone such as Astranaar, Silverwind Refuge, Maestra''s Post and the Shrine of Aessina.', 'images/ashen_screenshot.jpg', '3', '2'),
('Dustwallow Marsh', '61', 'images/dust.jpg', '36', 'Dustwallow Marsh is a vast and ancient swamp in central Kalimdor. With the hot and fetid weather and lots of wild beasts permeating the swamp, navigation through Dustwallow Marsh is often difficult, although this has not stopped the Alliance from creating a stronghold at its very east, with the port city of Theramore, led by Jaina Proudmoore.', 'images/dust_screenshot.jpg', '3', '2'),
('Winterspring', '60', 'images/winter.jpg', '55', 'Winterspring is a frosty valley in northern Kalimdor. This frigid zone is littered with night elven ruins, and serves as the primary home of the Blue Dragonflight in Kalimdor.', 'images/winter_screenshot.jpg', '3', '2'),
('Feralas', '60', 'images/feral.jpg', '41', 'Feralas, unlike the zones that share a border with it, is a massive rainforest that piques the interest of both the Horde and the Alliance. With the Alliance town of Feathermoon Stronghold in one of the western islands (accessible by taking the Feathermoon Ferry boat on the coast of the island) and the Horde town of Camp Mojache to the east, Alliance and Horde are likely to clash in this lush jungle.', 'images/feral_screenshot.jpg', '3', '2'),
('Felwood', '54', 'images/fel.jpg', '47', 'Felwood is a corrupted forest filled with demons and satyrs, this corruption resulted from Archimonde, an eredar lord of the Burning Legion, ordering the corruption of the forests surrounding Mount Hyjal to weaken the Kaldorei defenses during the Third War.', 'images/fel_screenshot.jpg', '3', '2'),
('Tanaris', '50', 'images/tan.jpg', '40', 'Tanaris is a massive desert located in southern Kalimdor. Tanaris is an arid land, covered in sand dunes and under the constant threat of sandstorms.', 'images/tan_screenshot.jpg', '3', '2'),
('Un''Goro Crater', '55', 'images/crater.jpg', '48', 'Un''Goro Crater is a lush jungle in southern Kalimdor, isolated from the source as it shares borders with the deserts of Feralas and Silithus. Although its borders make Un''Goro Crater a rather isolated area, many challenges await players here as they explore the wide range of exotic fauna, from aggressive plant mobs to the mighty devilsaurs.', 'images/crater_screenshot.jpg', '3', '2'),
('Silithus', '59', 'images/sili.jpg', '55', 'Silithus is a rough desert in the southwest end of Kalimdor. While Silithus today acts as the main working place of the Cenarion Circle, it was once the seat of the Aqiri Empire, known to the world as Ahn''Qiraj.', 'images/sili_screenshot.jpg', '3', '2'),
('The Barrens', '33', 'images/barrens.jpg', '10', 'The Barrens is a massive savanna located in the center of Kalimdor. With arid plains and very few sources of water scattered across the zone, those brave enough to live in the zone have to contest resources with the local harpies, quillboar and centaur.', 'images/barrens_screenshot.jpg', '2', '2'),
('Thousand Needles', '35', 'images/needles.jpg', '24', 'Thousand Needles is a massive dry canyon filled with towering mesas located in southern Kalimdor. Although the area is harsh on its own, it has a feeling of serenity on its own. To the east, the mesas of Thousand Needles are replaced by a vast salt pan, known as the Shimmering Flats.', 'images/needles_screenshot.jpg', '3', '2'),
('Stonetalon Mountains', '25', 'images/stone.jpg', '15', 'Stonetalon Mountains is a mountainous region and home to the harpies and chimeras. Stonetalon Peak, to the north of the zone, serves as a sacred place to both Night Elves and Tauren, with the Kaldorei building a Barrow Den for their druids to slumber and commune with the Emerald Dream in.', 'images/stone_screenshot.jpg', '3', '2'),
('Darkshore', '19', 'images/dark.jpg', '11', 'Darkshore is a long strip of coast on the northwestern parts of Kalimdor. Darkshore was once brimming with kaldorei life, but it is now little more than a desolate beach, covered with ancient ruins and everlasting fog.', 'images/dark_screenshot.jpg', '1', '2'),
('Teldrassil', '11', 'images/teld.jpg', '1', 'Teldrassil is a zone located atop a massive World Tree off the northern coast of Kalimdor, the tree itself being hosted in an island of the same name. Teldrassil was grown by Archdruid Fandral Staghelm as a desperate measure after the second invasion of the Burning Legion, in an attempt to regain immortality for the Night Elves.', 'images/teld_screenshot.jpg', '1', '2'),
('Mulgore', '10', 'images/gore.jpg', '1', 'Mulgore is plains zone located in central Kalimdor. Mulgore is nestled by the hills of Stonetalon Mountains and protected by natural walls from pretty much all directions, which makes this zone full of grassy planes and littered with wild game a perfect haven for its inhabitants, the noble and formerly nomadic Tauren.', 'images/gore_screenshot.jpg', '2', '2'),
('Durotar', '10', 'images/durotar.jpg', '1', 'Durotar is a rugged zone located in the eastern coast of Kalimdor. Durotar is a very harsh zone to live in, with many rocky mountains, the desert-like soil making it hard to grow produce, and the access to drinkable water being difficult.', 'images/durotar_screenshot.jpg', '2', '2');

INSERT INTO capitalCities ("name", "description", "map_image_url", "zone_id", "faction_id") 
VALUES ('Darnassus', 'Darnassus is the capital town of the Night Elves of the Alliance. The high priestess of Elune, Tyrande Whisperwind, resides in the Temple of the Moon, surrounded by other sisters of Elune. Arch Druid Fandral Staghelm also resides here, atop the highest tree in the Cenarion Enclave. The city is arranged in a series of terraces around the central tree surrounded by a lake.', 'images/darn.jpg', '36', '1'),
('Ironforge', 'Ironforge is the capital city of the dwarves. It is an intricate circular cavern carved into the mountains of Dun Morogh, with a massive forge near flight paths at the center. It is primarily populated by dwarves, but there is a strong gnomish presence in Tinker Town, as well as humans traveling via the Deeprun Tram.', 'images/iron.jpg', '20', '1'),
('Stormwind City', 'Stormwind City is the capital city of the Alliance. It is located in the northwestern part of Elwynn Forest. Stormwind City is also home to The Stockade instance, where war criminals are imprisoned.', 'images/storm.jpg', '17', '1'),
('Orgrimmar', 'Orgrimmar is the capital city of the Horde, with large settlements of trolls, orcs and tauren. Orgrimmar is also home to the Ragefire Chasm instance, a network of volcanic tunnels taken by the Burning Blade.', 'images/org.jpg', '38', '2'),
('Thunder Bluff', 'Orgrimmar is the capital city of the Horde, with large settlements of trolls, orcs and tauren. Orgrimmar is also home to the Ragefire Chasm instance, a network of volcanic tunnels taken by the Burning Blade.', 'images/thunder.jpg', '37', '2'),
('Undercity', 'The Undercity is the capital city of the  Undead. It is built under the remains of the city of Lordaeron. It is foul and dark, with twisted gothic architecture and plague-green canals.', 'images/under.jpg', '19', '2');

INSERT INTO dungeons ("name", "max_level", "min_level", "description", "zone_id") 
VALUES ('Ragefire Chasm', '25', '15', 'Ragefire Chasm consists of a network of volcanic caverns that lie below the orcs'' new capital city of Orgrimmar. Recently, rumors have spread that a cult loyal to the demonic Shadow Council has taken up residence within the Chasm''s fiery depths.', '38'),
('The Deadmines', '25', '15', 'Once the greatest gold production center in the human lands, the Deadmines were abandoned when the Horde razed Stormwind city during the First War. Now the Defias Brotherhood has taken up residence and turned the dark tunnels into their private sanctum.', '14'),
('Wailing Caverns', '27', '17', 'Recently, a night elf druid named Naralex discovered a network of underground caverns within the heart of the Barrens. Dubbed the ''Wailing Caverns'', these natural caves were filled with steam fissures which produced long, mournful wails as they vented. Naralex believed he could use the caverns'' underground springs to restore lushness and fertility to the Barrens - but to do so would require siphoning the energies of the fabled Emerald Dream.', '32'),
('Shadowfang Keep', '30', '22', 'Shadowfang Keep is a haunted keep in southern Silverpine Forest, near Pyrewood Village. It is the base of operations for the evil archmage Arugal and his worgen progeny.', '15'),
('Blackfathon Deeps', '32', '22', 'Situated along the Zoram Strand of Ashenvale, Blackfathom Deeps was once a glorious temple dedicated to the night elves'' moon-goddess, Elune. However, the great Sundering shattered the temple - sinking it beneath the waves of the Veiled Sea.', '24'),
('The Stockade', '32', '22', 'The Stockades are a high-security prison complex, hidden beneath the canal district of Stormwind city. Presided over by Warden Thelwater, the Stockades are home to petty crooks, political insurgents, murderers and a score of the most dangerous criminals in the land.', '17'),
('Gnomeregan', '36', '26', 'Located in Dun Morogh, the technological wonder known as Gnomeregan has been the gnomes'' capital city for generations. Recently, a hostile race of mutant troggs infested several regions of Dun Morogh - including the great gnome city.', '20'),
('Scarlet Monastery', '45', '26', 'The Monastery was once a proud bastion of Lordaeron''s priesthood - a center for learning and enlightenment. With the rise of the undead Scourge during the Third War, the peaceful Monastery was converted into a stronghold of the fanatical Scarlet Crusade.', '19'),
('Razorfen Kraul', '42', '32', 'Razorfen Kraul is the ancestral home of the quilboar, heavily entrenched within the thorns that supposedly sprang from the corpse of the demigod Agamaggan.', '32'),
('Razorfen Downs', '47', '37', 'Crafted from the same mighty vines as Razorfen Kraul, Razorfen Downs is the traditional capital city of the quillboar race. The sprawling, thorn-ridden labyrinth houses a veritable army of loyal quillboar as well as their high priests - the Death''s Head tribe.', '33'),
('Maraudon', '52', '42', 'Protected by the fierce Maraudine centaur, Maraudon is one of the most sacred sites within Desolace. The great temple/cavern is the burial place of Zaetar, one of two immortal sons born to the demigod, Cenarius.', '22'),
('Uldaman', '52', '42', 'Uldaman is an ancient Titan vault that has laid buried deep within the earth since the world''s creation. Dwarven excavations have recently penetrated this forgotten city, releasing the Titans'' first failed creations: the Troggs.', '5'),
('Dire Maul', '54', '44', 'Dire Maul is a three-wing dungeon found in north-central Feralas. It was once a proud Highborne city, but now lies in ruins, overrun by ogres, satyrs, and undead.', '27'),
('Zul''Farrak', '56', '46', 'Tanaris used to be a jungle and territory of the Gurubashi Empire, and Zul''Farrak was a city there. When the Great Sundering shattered the ancient landmass, the area swiftly became the desert of Tanaris. The Farraki tribe of trolls were stranded here and eventually adapted to their harsh new environment, becoming sand trolls.', '29'),
('Stratholme', '58', '48', 'Once the jewel of northern Lordaeron, the city of Stratholme is where Prince Arthas turned against his mentor, Uther Lightbringer, and slaughtered hundreds of his own subjects who were believed to have contracted the dreaded plague of undeath.', '9'),
('Sunken Temple', '60', '50', 'Temple of Atal''Hakkar (also known as Sunken Temple and more rarely, Lost Temple) is a shrine erected by the Atal''ai trolls, led by their master Jammal''an the Prophet, to the nefarious Blood God — Hakkar the Soulflayer.', '8'),
('Blackrock Depths', '60', '52', 'Once the capital city of the Dark Iron dwarves, this volcanic labyrinth now serves as the seat of power for Ragnaros the Firelord.', '6'),
('Scholomance', '60', '55', 'The Scholomance is housed within a series of crypts that lie beneath the ruined keep of Caer Darrow. Once owned by the noble Barov family, Caer Darrow fell to ruin following the Second War.', '11');

INSERT INTO settlements ("name", "description", "zone_id") 
VALUES ('Booty Bay', 'Booty Bay is a large pirate port city nestled into the cliffs surrounding a beautiful blue lagoon on the southern tip of Stranglethorn Vale.', '1'),
('Aerie Peak', 'Aerie Peak (or the Aerie (s)) is the capital of the Wildhammer clan of dwarves affiliated with the Alliance.', '2'),
('Revantusk Village', 'Revantusk Village is the only visitable settlement of the Revantusk tribe of forest trolls.', '2'),
('Tarren Mill', 'Tarren Mill is a Forsaken town located in northern Hillsbrad Foothills, near the Alterac Mountains. Prior to the Third War, Tarren Mill was a simple Lordaeronian town.', '3'),
('Dun Garok', 'Dun Garok is a dwarven keep nestled into the southeastern hills of Hillsbrad Foothills. Led by Captain Ironhill, the dwarves help protect the humans of Hillsbrad as well as the Azurelode Mine.', '3'),
('Thorium Point', 'Thorium Point is a small, neutral town in northern Searing Gorge inhabited by the Thorium Brotherhood.', '4'),
('Kargath', 'Kargath is a small, functional Horde base where orcs and their allies regroup and resupply when adventuring in this part of the world.', '5'),
('Dreadmaul Rock', 'Dreadmaul Rock, also known as Dreadmaul Peak, is the base of operations for the Firegut ogres. It is a large structure, with paths leading to the top and a complicated cave system of ogre mounds within.', '6'),
('Surwich', 'Surwich is a Gilnean-controlled Alliance port and fishing village in the Blasted Lands. Most of its citizens came to the area following the dream of an idealistic druid named Marl Wormthorn.', '7'),
('Stonard', 'Stonard is the lone Horde outpost located in the Swamp of Sorrows. Regular patrols are sent out, and a number of small orcish encampments have been established nearby to further strengthen the Horde''s control over the region.', '8'),
('Marshtide Watch', 'Marshtide Watch is an Alliance port outpost north of the Temple of Atal''Hakkar. Alliance troops have amassed here following its establishment, intending to drive the Horde out of the Swamp of Sorrows by targeting their main outpost of Stonard.', '8'),
('Light''s Hope Chapel', 'Light''s Hope Chapel is the Argent Crusade base of operations in the Eastern Plaguelands, and a place of comfort for those who make the journey here.', '9'),
('Tyr''s Hand', 'Tyr''s Hand is a fortified human city and was one of the last holdouts of the living against the Scourge in the region. Located in the southeast of the Eastern Plaguelands, its surroundings are in a much better condition than the rest of the Plaguelands, although the trees and other flora are decaying.', '9'), 
('Go''Shek Farm', 'Go''Shek Farm is a farmstead in the eastern part of the Arathi Highlands, near Witherbark Village.', '10'),
('Newstead', 'Newstead is a farmstead located in the road to Thoradin''s Wall, in western Arathi Highlands.', '10'),
('Caer Darrow', 'Caer Darrow is an island and a ruined keep located on Darrowmere Lake in the Western Plaguelands. Kel''Thuzad established the headquarters of the Cult of the Damned under this ancient human fortress, in the catacombs that became Scholomance, a school of necromancy.', '11'), 
('Raven Hill', 'Raven Hill is an abandoned town located in western Duskwood, north of Addle''s Stead and south of the Raven Hill Cemetery. Though once all but empty, several worgen have taken up residence here in their search for a cure to the worgen curse.', '12'),
('Darkshire', 'Darkshire (formerly known as Grand Hamlet) is a once-quaint little woodland village located in Duskwood, but it has fallen on literally dark times. The surrounding forests have been filled with an evil malaise that cloaks the land in constant darkness.', '12'), 
('Menethil Harbor', 'Menethil Harbor (men-a-thill) is a dwarven port town on the western shore of the Wetlands, on a small island.', '13'),
('Dun Modr', 'Dun Modr is a fortified middle-sized dwarven city that sits along the road just south of Thandol Span, in the north of the Wetlands.', '13'),
('Sentinel Hill', 'Sentinel Hill is an Alliance outpost in Westfall and their last stronghold in the region. It is here that the men and women of the People''s Militia make their final stand against the Defias Brotherhood in a desperate last attempt to reclaim their homes.', '14'),
('The Sepulcher', 'The Sepulcher, also known as the Silverpine Sepulcher, is a Forsaken base located in the western side of Silverpine Forest. The area itself lies above the Lordaeronian coastline, nestled within the surrounding hills.', '15'),
('Lakeshire', 'Lakeshire (or Lakewood) is a human town that sits on the banks of the majestic and large Lake Everstill. It is located in the Redridge Mountains, and its citizens are under the watchful and often worried eye of elected Magistrate Solomon. Recently, after many years, the bridge to Lakeshire was finally repaired.', '16'),
('Camp Everstill', 'Camp Everstill is a very small Alliance camp on the shores of Lake Everstill in Redridge Mountains.', '16'),
('Goldshire', 'Goldshire is the second human town that most human characters visit during their adventures, sometime after level five. Goldshire is centrally located just southwest of Northshire and has most low level class trainers and some profession trainers.', '17'),
('Northshire Abbey', 'Northshire Abbey is the home of the human religious order of clerics known as the Brotherhood of Northshire. It is located in Northshire Valley in the foothills of Elwynn Forest of the Kingdom of Stormwind.', '17'),
('Thelsamar', 'Thelsamar is a dwarven town on the west side of Loch Modan, located north of Grizzlepaw Ridge and northeast of Stonesplinter Valley. The town has a gryphon roost, an inn, and several vendors and profession trainers.', '18'),
('Brill', 'Brill is a small town in Tirisfal Glades of northern Lordaeron. Like Tirisfal itself, the town is controlled by the Forsaken.', '19'),
('Kharanos', 'Kharanos is a bustling little town nestled among the mountain peaks of Dun Morogh. The town is surrounded by the stark wintry wilds of Dun Morogh, so adventure is a common commodity and some of the less tenacious folk in town might pay good coin to complete various tasks in the surrounding region.', '20'),
('Anvilmar', 'Anvilmar (also known as building A3) is the first settlement of significance encountered by starting dwarves. It lies to the north in Coldridge Valley and has a set of trainers and some quest givers, as well as a few vendors.', '20'),
('Grosh''gok Compound', 'The Grosh''gok Compound is a cavern located in the Vice inhabited by Deadwind Brutes and Ogre-Magi. It is the southernmost and largest of the multiple caves in the Vice.', '21'),
('Nijel''s Point', 'Nijel''s Point is an Alliance outpost located in the northern mountains of Desolace. It features both human and night elven population and structures, and holds flight paths to Feathermoon Stronghold, Theramore Isle, and Lor''danel.', '22'), 
('Shadowprey Village', 'Shadowprey Village is a port located on the southern end of the coast of Desolace. Primarily a troll fishing village, Shadowprey is also a travel node for Horde adventurers.', '22'),
('Valormok', 'Valormok is an orc-controlled Horde outpost in Azshara. It is fairly unprotected and bare. It is interesting to note that any Alliance player can go into Valormok without being attacked because there are no guards.', '23'),
('Talrendis Point', 'Talrendis Point is a large night elven outpost located in southwestern Azshara. It has two guard towers (the northern one occupying the area of the former Shadowsong Shrine), a moonwell in the southern part, and a building in the western area.', '23'),
('Astranaar', 'Astranaar is a night elven town located in central Ashenvale. It is the largest settlement in the region. It lies on an island within a lake, straddling the main road through Ashenvale, connected to the mainland with only a pair of bridges.', '24'),
('Splintertree Post', 'Splintertree Post is a Horde outpost in Ashenvale, lying just north-west of Felfire Hill. Like most Horde outposts, Splintertree is mainly populated by orcs and tauren, all whom are primarily scouts and guards.', '24'),
('Theramore', 'Theramore Isle (a.k.a. Theramore Keep, Theramore City or simply Theramore) was a human city and port town located in a rocky island east of Dustwallow Marsh, and was the capital of the kingdom of the same name.', '25'),
('Starfall Village', 'Starfall Village (or just Starfall) is a small night elven settlement of Alliance vendors and quest givers in Winterspring, the only Alliance settlement in the region.', '26'),
('Camp Mojache', 'Camp Mojache is a tauren village in eastern Feralas overlooking the scenic Wildwind Lake. The camp straddles a swift-flowing stream that feeds the lake. Tauren refugees have started flooded into the village from Thousand Needles, mostly from Freewind Post, due to the destruction.', '27'),
('Feathermoon Stronghold', 'Feathermoon Stronghold, also known as New Feathermoon, is a Night elf port settlement on the Forgotten Coast in Feralas.', '27'),
('Bloodvenom Post', 'Bloodvenom Post is a tiny Horde outpost in Felwood near the Bloodvenom River. It sits on the cliffs overlooking Darkshore and consists of only a single hut (an inn) with a mailbox, a wind rider master, a few guards, and several NPCs.', '28'),
('Gadgetzan', 'Rising out of the northern Tanaris desert, Gadgetzan is the capital city of the Steamwheedle Cartel, the largest of the goblin cartels.', '29'), 
('Marshal''s Stand', 'Marshal''s Stand is a fortified base near the road leading from the Marshlands in Un''Goro Crater. To the north is Fire Plume Ridge, a volcano in the center of the crater.', '30'),
('Cenarion Hold', 'Cenarion Hold is a location of strategic importance in Silithus. The Cenarion Circle has taken over the duty of defending the ancient night elf settlement against the increasingly hostile and aggressive silithid and other forces.', '31'),
('Crossroads', 'Crossroads is the largest Horde town in the Barrens, aptly named for the crossing of the main north-south road (from the Gold Road) and the road from Ratchet in the east all the way to the Stonetalon Mountains in the west.', '32'),
('Darkcloud Pinnacle', 'East of the Great Lift, atop three small mesas (and several smaller, not inhabited mesas), is Darkcloud Pinnacle, a settlement that the Grimtotem tauren call home.', '33'),
('Stonetalon Peak', 'Stonetalon Peak is an Alliance settlement at the far northwestern end of the Stonetalon Mountains. It is built within a verdant mountain valley and is maintained by the druids of the nearby Talon Den.', '34'),
('Sun Rock Retreat', 'Sun Rock Retreat (also spelled Sunrock Retreat) is a Horde settlement centrally-located in the Stonetalon Mountains, hidden amid the peaks south of Mirkfallon Lake. It was once the area''s primary hub of activity and trade, hosting a contingent of predominantly orcish and tauren forces devoted to repairing the damage done to the mountains by the Venture Company and other malignant forces.', '34'),
('Auberdine', 'Auberdine is a port city, with boats to Rut''theran Village in Teldrassil (The Moonspray) and Menethil Harbor in the Wetlands (The Bravery).', '35'),
('Dolanaar', 'Dolanaar is a night elven village located in the central-eastern part of Teldrassil. Found just southwest of Shadowglen, it can be reached in about a three-minute run east from Darnassus.', '36'),
('Bloodhoof Village', 'Bloodhoof Village is a tauren settlement named in honor of the Bloodhoof tribe, located in central Mulgore, around the waters of Stonebull Lake.', '37'),
('Camp Narache', 'Camp Narache is the starting town for the tauren, which is located in southern Mulgore at the northern edge of the Red Cloud Mesa.', '37'),
('Razor Hill', 'Razor Hill is an orcish settlement built on a crossroads in central Durotar. The southern road eventually leads to Sen''jin Village and the Valley of Trials.', '38'),
('Sen''jin Village', 'Sen''jin Village is a settlement of the Darkspear tribe located on the southern coast of Durotar.', '38');

INSERT INTO quests ("name", "description", "level", "zone_id") 
VALUES ('The Green Hills of Stranglethorn', 'Collect the missing pages from The Green Hills of Stranglethorn manuscript. Once all four chapters are complete, return them to Barnil.', '40', '1'),
('The Bloodsail Buccaneers', 'Fleet Master Seahorn in Booty Bay wants you to kill 10 Bloodsail Swashbucklers and bring back the Bloodsail Charts and the Bloodsail Orders.', '43', '1'),
('Singing Blue Shards', 'Bring 10 Singing Crystal Shards to Crank Fizzlebub.', '35', '1'),
('Rescue OOX-09/HL!', 'Escort OOX-09/HL to the shoreline beyond Overlook Cliff, then report to Oglethorpe Obnoticus in Booty Bay.', '48', '2'),
('The Ancient Egg', 'Bring the Ancient Egg to Yeh''kinya in Tanaris.', '50', '2'),
('Find OOX-09/HL!', 'Take the distress beacon to Oglethorpe''s homing robot at the head of the river in the Hinterlands, near Skulk Rock.', '48', '2'),
('Dangerous!', 'High Executor Darthalia of Tarren Mill is offering a bounty on Clerk Horrace Whitesteed, Citizen Wilkes, Miner Hackett and Farmer Kalaba.', '28', '3'),
('The Hammer May Fall', 'Kill 8 Boulderfist Ogres and 10 Boulderfist Enforcers, then find Drum Fel in the Hammerfall outpost in Arathi Highlands.', '32', '3'),
('WANTED: Syndicate Personnel', 'Kill 10 Syndicate Rogues and 10 Syndicate Watchmen. Return to High Executor Darthalia in Tarren Mill for your reward.', '22', '3'),
('Suntara Stones', 'Help Dorius get back to Ironforge.', '48', '4'),
('The Horn of the Beast', 'Take Margol''s Gigantic Horn to Mountaineer Pebblebitty.', '48', '4'),
('Fiery Menace!', 'Hansel Heavyhands wants you to kill 20 Greater Lava Spiders in the Searing Gorge. You can find Greater Lava Spiders in the plateaus and lava pools of the Searing Gorge.', '49', '4'),
('Gyro... What?', 'Bring a Gyrochronatom to Lotwil Veriatus in the Badlands.', '37', '5'),
('This is Going to be Hard', 'Bring Cog #5 to Lotwil Veriatus.', '42', '5'),
('Coolant Heads Prevail', 'Find Frost Oil and bring it to Lotwil Veriatus in Badlands.', '37', '5'),
('The True Masters', 'Speak with Ragged John to learn of Marshal Windsor''s fate and return to Marshal Maxwell when you have completed this task.', '54', '6'),
('Gor''tesh the Brute Lord', 'Find Gor''tesh, somewhere to the west of Dreadmaul Rock. Kill Gor''tesh and then take Gor''tesh''s Lopped Off Head back to Oralius in Burning Steppes.', '53', '6'),
('Extinguish the Firegut', 'Slay 15 Firegut Ogre-Mages, 7 Firegut Ogres, and 7 Firegut Ogre Brutes, and return to Oralius when you are finished.', '52', '6'),
('A Boar''s Vitality', 'Bring three Blasted Boar Lungs, two Scorpok Pincers, and one Basilisk Brain to Bloodmage Drazial.', '50', '7'),
('The Stones that Bind Us', 'Free nine Servants of Razelikh, three Servants of Sevine, three Servants of Allistarj, and three Servants of Grol. Return to the Fallen Hero when your task is complete. You must remain within close proximity of the stones or the process will fail.', '57', '7'),
('The Basilisk''s Bite', 'Bring ten Basilisk Brains and two Vulture Gizzards to Bloodmage Lynnore.', '50', '7'),
('Lack of Surplus', 'Bring 6 Sawtooth Snapper Claws to Tok''Kar in the Swamp of Sorrows.', '42', '8'),
('Neeka Bloodscar', 'Speak with Neeka Bloodscar.', '35', '8'),
('Continued Threat', 'Kill 10 Marsh Inkspewers, 10 Marsh Flesheaters, and 10 Marsh Oracles, then return to Katar in the Swamp of Sorrows.', '45', '8'),
('Villains of Darrowshire', 'Bring the Skull of Horgus and the Shattered Sword of Marduk to Carlin Redpath at Light''s Hope Chapel.', '57', '9'),
('Sister Pamela', 'Find Pamela Redpath in Darrowshire.', '55', '9'),
('Of Forgotten Memories', 'Travel to the Undercroft - at the southernmost section of the Eastern Plaguelands - and recover Taelan''s Hammer. Return to Tirion Fordring upon completion of your objective.', '57', '9'),
('The Princess Trapped', 'Gather 12 Motes of Myzrael, then bring them to the Iridescent Shards in Drywhisker Gorge.', '37', '10'),
('Sunken Treasure', 'Doctor Draxlegauge in Faldir''s Cove wants you to collect 10 Elven Gems and return the Goggles of Gem Hunting once you are done.', '40', '10'),
('Death from Below', 'Protect Shakes O''Breen during the attack.', '44', '10'),
('Good Luck Charm', 'Return to Janice Felstone in Western Plaguelands her Good Luck Half-Charm.', '52', '11'),
('Find Myranda', 'Travel to Uther''s Tomb, located in the southern Plaguelands. Show Myranda the Hag Tirion''s Gift.', '60', '11'),
('The Annals of Darrowshire', 'Bring the Annals of Darrowshire to Chromie in Andorhal.', '56', '11'),
('The Legend of Stalvan', 'Retrieve Stalvan''s Undelivered Letter from the chest and deliver it to the Canal District in Stormwind.', '28', '12'),
('Proving your Worth', 'Kill 15 Skeletal Raiders, 3 Skeletal Healers and 3 Skeletal Warders, and then return to Sven.', '28', '12'),
('Gather Rot Blossoms', 'Gather 8 Rot Blossoms and bring them to Tavernkeep Smitts in Darkshire.', '24', '12'),
('Fall of Dun Modr', 'Search for Longbraid near the town of Dun Modr.', '25', '13'),
('The Search Continues', 'Search for the Menethil Statuette.', '25', '13'),
('Digging Through the Ooze', 'One of the oozes at Ironbeard''s Tomb has Sida''s bag, retrieve it and bring it back to her in Menethil Harbor.', '24', '13'),
('Captain Sander''s Hidden Treasure', 'Find Captain Sanders'' footlocker and search it for the next clue.', '16', '14'),
('Furlbrow''s Deed', 'Bring Furlbrow''s Deed to Farmer Furlbrow.', '9', '14'),
('Goretusk Liver Pie', 'Salma Saldean needs 8 Goretusk livers to make a Goretusk Liver Pie.', '12', '14'),
('Arugal''s Folly', 'Retrieve the Remedy of Arugal for Dalar Dawnweaver at the Sepulcher.', '11', '15'),
('Ivar the Foul', 'Kill Ivar the Foul, and bring Ivar''s Head to Rane Yorick at the Ivar Patch.', '12', '15'),
('Maps and Runes', 'Bring the strange pendant to Shadow Priest Allister at the Sepulcher.', '14', '15'),
('The Price of Shoes', 'Take Verner''s Note to Smith Argus in Goldshire.', '18', '16'),
('A Free Lunch', 'Bring Parker''s lunch to Guard Parker. He patrols the road leading to Darkshire.', '15', '16'),
('Delivering Daffodils', 'Give Darcy the Daffodil Bouquet.', '15', '16'),
('Bounty on Garrick Padfoot', 'Kill Garrick Padfoot and bring his head to Deputy Willem at Northshire Abbey.', '5', '17'),
('Eagan Peltskinner', 'Speak with Eagan Peltskinner.', '2', '17'),
('Brotherhood of Thieves', 'Bring 12 Red Burlap Bandanas to Deputy Willem outside the Northshire Abbey.', '4', '17'),
('Bingles'' Missing Supplies', 'Find and return Bingles'' supplies', '15', '18'),
('In Defense of the King''s Lands', 'Mountaineer Cobbleflint of the southern guard tower wants you to kill 10 Stonesplinter Troggs and 10 Stonesplinter Scouts.', '12', '18'),
('Powder to Ironband', 'Speak with Jern Hornhelm in Thelsamar.', '15', '18'),
('Marla''s Last Wish', 'Bring Samuel Fipps'' Remains to Marla''s Grave, then return to Novice Elreth.', '5', '19'),
('Scavenging Deathknell', 'Search Deathknell and the vicinity for 6 pieces of Scavenged Goods, and return them to Deathguard Saltain.', '3', '19'),
('A New Plague', 'Apothecary Johaan of the town of Brill needs 5 Vile Fin Scales from Murlocs in Tirisfal Glades.', '9', '19'),
('The Grizzled Den', 'Gather 8 Wendigo Manes and bring them to Pilot Stonegear.', '7', '20'),
('The Stolen Journal', 'Grelin Whitebeard wants you to kill Grik''nir the Cold, and retrieve his journal.', '5', '20'),
('A New Threat', 'Balir Frosthammer wants you to kill 6 Rockjaw Troggs and 6 Burly Rockjaw Troggs.', '2', '20'),
('Gizmo for Warug', 'Maintain your reputation with the Magram, and bring an Advanced Target Dummy to Warug in the Magram Village in Desolace.', '35', '22'),
('Sceptre of Light', 'Get the Sceptre of Light and then return it to Azore Aldamort at the tower in Ethel Rethor.', '33', '22'),
('Book of the Ancients', 'Get the Book of the Ancients and return it to Azore Aldamort at the tower in Ethel Rethor.', '38', '22'),
('A Crew Under Fire', 'Defend Captain Vanessa Beltis, her crew and the Horizon Scout''s passengers against the naga attack. Captain Vanessa Beltis must survive.', '57', '23'),
('Spiritual Unrest', 'Destroy 6 Highborne Apparitions and 6 Highborne Lichlings before returning to Loh''atu in Azshara.', '47', '23'),
('Poisoned Water', 'Use the Aspect of Neptulon on poisoned elementals of Eastern Plaguelands. Bring 12 Discordant Bracers and the Aspect of Neptulon to Duke Hydraxis in Azshara.', '56', '23'),
('Raene''s Cleansing', 'Find Teronis in Ashenvale.', '19', '24'),
('Bathran''s Hair', 'Bring 5 Bathran''s Hair to Orendil Broadleaf in Ashenvale.', '20', '24'),
('The Zoram Strand', 'Bring 20 Wrathtail Heads to Shindrell Swiftfire in Astranaar.', '19', '24'),
('Jarl Needs Eyes', 'Bring 40 Unpopped Darkmist Eyes to "Swamp Eye" Jarl at the Swamplight Manor.', '35', '25'),
('Soothing Spices', 'Bring 3 Soothing Spices to "Swamp Eye" Jarl in Dustwallow Marsh.', '35', '25'),
('Hungry!', 'Mudcrush Durtfeet in northern Dustwallow wants 12 Mirefin Heads.', '36', '25'),
('Trouble in Winterspring!', 'Find Donova Snowden near the hot springs in Winterspring.', '56', '26'),
('Toxic Horrors', 'Collect 3 Toxic Horror Droplets for Donova Snowden in Winterspring.', '56', '26'),
('Winterfall Firewater', 'Bring the Empty Firewater Flask to Donova Snowden in Winterspring.', '56', '26'),
('Find OOX-22/FE!', 'Take the distress beacon to Oglethorpe''s homing robot in a cave near Feral Scar Vale.', '45', '27'),
('Zapped Giants', 'Use Zorbin''s Ultra-Shrinker to zap any kind of giant found in Feralas into a more manageable form. Bring 15 Miniaturization Residues found on the zapped versions of these giants to Zorbin Fandazzle at the docks of the Forgotten Coast, Feralas.', '48', '27'),
('Again with the Zapped Giants', 'Use Zorbin''s Ultra-Shrinker to zap any kind of giant found in Feralas into a more manageable form. Bring 10 Miniaturization Residues found on the zapped versions of these giants to Zorbin Fandazzle at the docks of the Forgotten Coast, Feralas.', '55', '27'),
('Seeking Spiritual Aid', 'Take the Corrupt Moon Well Water to Islen Waterseer in the Barrens.', '52', '28'),
('Timbermaw Ally', 'Grazle wants you to prove yourself by killing 6 Deadwood Warriors, 6 Deadwood Pathfinders, and 6 Deadwood Gardeners. Return to him in southern Felwood near the Emerald Sanctuary when you are done.', '48', '28'),
('Forces of Jaedenar', 'Enter Jaedenar and slay 4 Jaedenar Hounds, 4 Jaedenar Guardsmen, 6 Jaedenar Adepts, and 6 Jaedenar Cultists before returning to Greta Mosshoof in Felwood.', '51', '28'),
('Screecher Spirits', 'Capture the spirits of 3 screechers in Feralas, then return to Yeh''kinya in Steamwheedle Port.', '44', '29'),
('Noggenfogger Elixir', 'Marin Noggenfogger wants you to speak to him again after he creates his elixir.', '49', '29'),
('WANTED: Andre Firebeard', 'Bring Andre''s Head to Security Chief Bilgewhizzle in Steamwheedle Port.', '45', '29'),
('Alien Ecology', 'Use the Scraping Vial to collect a Hive Wall Sample from one of the Gorishi hive hatcheries in Un''Goro Crater. Look for the chambers with the hanging larval spawns.', '52', '30'),
('Expedition Salvation', 'Bring a Crate of Foodstuffs and Research Equipment to Williden Marshal in Un''Goro Crater.', '53', '30'),
('A Grave Situation', 'Resurrect, then look for the gravestone that Gaeriyan told you to find.', '52', '30'),
('Cenarion Battlegear', 'Talk to Vargus at Cenarion Hold in Silithus.', '60', '31'),
('Hive in the Tower', 'Scale the tower of Southwind Village and locate a means to stir the silithid hive into activity. Bring back anything unusual you may uncover when doing so to Layo Starstrike at the Valor''s Rest graveyard of Silithus.', '57', '31'),
('Noggle''s Lost Satchel', 'Retrieve Noggle''s Satchel from the mountains in the south of Silithus and return it to him at Cenarion Hold.', '58', '31'),
('Chen''s Empty Keg', 'Find someone who knows about Chen''s Empty Keg.', '15', '32'),
('Wenikee Boltbucket', 'Bring the Broken Samophlange to Wenikee Boltbucket.', '14', '32'),
('Altered Beings', 'Bring 8 Altered Snapjaw Shells to Tonga Runetotem at the Crossroads.', '16', '32'),
('Grimtotem Spying', 'Locate and retrieve the three Secret Notes in Darkcloud Pinnacle.', '28', '33'),
('Free at Last', 'Escort Lakota Windsong from the Darkcloud Pinnacle, and then talk to Thalia Amberhide at Freewind Post.', '29', '33'),
('Pacify the Centaur', 'Kill 12 Galak Scouts, 10 Galak Wranglers, and 6 Galak Windchasers, and then return to Cliffwatcher Longhorn in Freewind Post.', '25', '33'),
('Gerenzo''s Orders', 'Get the mysterious ore from Piznik after he finishes mining it.', '22', '34'),
('Further Instructions', 'Bring the new orders to Ziz Fizziks in the Stonetalon Mountains.', '27', '34'),
('Gerenzo Wrenchwhistle', 'Bring Gerenzo Wrenchwhistle''s Mechanical Arm to Ziz Fizziks in the Stonetalon Mountains.', '27', '34'),
('How Big a Threat?', 'Find a corrupt furbolg camp in Darkshore and return to Terenthis in Auberdine.', '14', '35'),
('Buzzbox 411', 'Collect 3 Thresher Eyes from Darkshore Threshers in the deep sea near Buzzbox 411.', '12', '35'),
('Deep Ocean, Vast Sea', 'Recover the Silver Dawning''s Lockbox and the Mist Veil''s Lockbox for Gorbold Steelhand in Auberdine. Both items should be found aboard the wreckage of the ships to the north of the village.', '17', '35'),
('Crown of the Earth', 'Bring the Partially Filled Vessel to Corithras Moonrage in Dolanaar.', '5', '36'),
('The Road to Darnassus', 'Slay 6 Gnarlpine Ambushers and return to Sentinel Amara Nightwalker outside of Dolanaar.', '8', '36'),
('The Balance of Nature', 'Conservator Ilthalaine needs you to kill 7 Mangy Nightsabers and 7 Thistle Boars.', '3', '36'),
('Rites of the Earthmother', 'Take the Totem of Hawkwind to Baine Bloodhoof in Bloodhoof Village. Follow the road out of Camp Narache.', '5', '37'),
('The Hunt Begins', 'Grull Hawkwind in Camp Narache wants you to bring him 7 Plainstrider Feathers and 7 pieces of Plainstrider Meat.', '2', '37'),
('Mazzranache', 'Bring a Prairie Wolf Heart, Flatland Cougar Femur, Plainstrider Scale and Swoop Gizzard to Maur Raincaller at Bloodhoof Village.', '8', '37'),
('Cutting Teeth', 'Kill 10 Mottled Boars then return to Gornek at the Den.', '2', '38'),
('Minshina''s Skull', 'Retrieve Minshina''s skull from the circle of power on the Echo Isles.', '9', '38'),
('Burning Blade Medallion', 'Bring the Burning Blade Medallion to Zureetha Fargaze, outside The Den.', '5', '38');

-- Updates the first created user to Admin status, which will be the user representing myself
UPDATE "user"
SET "user"."isAdmin" = 'true'
WHERE "user"."id" = 1;

-- Grabs user when they log in

SELECT * FROM "user"
WHERE "user"."id" = $1;

-- Adds a new user when they register account

INSERT INTO "user" ("username", "password", "isAdmin")
VALUES ($1, $2, $3);

-- Grabs capital city for display on its page

SELECT capitalcities."name", capitalcities."map_image_url", capitalcities."description", factions."type", zones."name" FROM capitalcities 
JOIN factions ON factions."id" = capitalcities."faction_id" 
JOIN zones ON zones."id" = capitalcities."zone_id"
WHERE capitalcities."id" = $1;

-- Adds character to table when the user clicks submit in the character form

INSERT INTO characters ("name", "race", "level", "faction_id", "user_id")
VALUES ($1, $2, $3, $4, $5);

-- Grabs character information for display on the DOM in the character table

SELECT characters."id", characters."name", characters."race", characters."level", factions."type" FROM characters 
JOIN factions ON factions."id" = characters."faction_id"
WHERE "user"."id" = $1;

-- Deletes a character when the user clicks the delete button

DELETE * FROM characters 
WHERE characters."id" = $1;

-- Grabs a character for determining what zone to go to when a character clicks the select button

SELECT * FROM characters 
WHERE characters."id" = $1;

-- Grabs a zone after it is determined which one to grab based on the selected character's information

SELECT zones."id", zones."name", zones."description", zones."map_image_url", zones."screenshot", zones."max_level", zones."min_level", factions."type", continents."name" FROM zones
JOIN factions ON factions."id" = zones."faction_id"
JOIN continents ON continents."id" = zones."continent_id"
WHERE zones."id" = $1;

-- Grabs all settlements for the targeted zone

SELECT * FROM settlements 
WHERE settlements."zone_id" = $1;

-- Grabs all dungeons for the targeted zone

SELECT * FROM dungeons
WHERE dungeons."zone_id" = $1;

-- Grabs quests for display in a table on the DOM

SELECT quests."id", quests."name", quests."description", quests."level", quests_characters."isCompleted" FROM quests
JOIN quests_characters ON quests_characters."quest_id" = quests."id"
JOIN characters ON characters."id" = quests_characters."character_id"
WHERE characters."id" = $1 AND quests."zone_id" = $2;

-- Updates status of quest in the table when the checkbox/button for that quest is clicked

UPDATE quests_characters 
SET quests_characters."isCompleted" = $1
WHERE quests_characters."character_id" = $2 AND quests_characters."quest_id" = $3;

-- Grabs all users except for the Admin for display on the Admin page

SELECT * FROM "user"
WHERE "user"."isAdmin" = 'false';