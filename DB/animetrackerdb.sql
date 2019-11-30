-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema animetrackerdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `animetrackerdb` ;

-- -----------------------------------------------------
-- Schema animetrackerdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `animetrackerdb` DEFAULT CHARACTER SET utf8 ;
USE `animetrackerdb` ;

-- -----------------------------------------------------
-- Table `day_aired`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `day_aired` ;

CREATE TABLE IF NOT EXISTS `day_aired` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `day` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `season`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `season` ;

CREATE TABLE IF NOT EXISTS `season` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `season` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anime`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `anime` ;

CREATE TABLE IF NOT EXISTS `anime` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` TEXT(9999) NULL,
  `simulcast` TINYINT NULL DEFAULT 0,
  `interested_in` TINYINT NULL DEFAULT 0,
  `day_aired_id` INT NOT NULL,
  `season_id` INT NOT NULL,
  `release_year` VARCHAR(45) NULL,
  `image_url` TEXT(9999) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_anime_day_aired_idx` (`day_aired_id` ASC),
  INDEX `fk_anime_season1_idx` (`season_id` ASC),
  CONSTRAINT `fk_anime_day_aired`
    FOREIGN KEY (`day_aired_id`)
    REFERENCES `day_aired` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_anime_season1`
    FOREIGN KEY (`season_id`)
    REFERENCES `season` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anime_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `anime_category` ;

CREATE TABLE IF NOT EXISTS `anime_category` (
  `category_id` INT NOT NULL,
  `anime_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `anime_id`),
  INDEX `fk_category_has_anime_anime1_idx` (`anime_id` ASC),
  INDEX `fk_category_has_anime_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_has_anime_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_anime_anime1`
    FOREIGN KEY (`anime_id`)
    REFERENCES `anime` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS animeuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'animeuser'@'localhost' IDENTIFIED BY 'animeuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'animeuser'@'localhost';
SET SQL_MODE = '';
DROP USER IF EXISTS anime@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'anime'@'localhost' IDENTIFIED BY 'anime';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'anime'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `day_aired`
-- -----------------------------------------------------
START TRANSACTION;
USE `animetrackerdb`;
INSERT INTO `day_aired` (`id`, `day`) VALUES (1, 'Monday');
INSERT INTO `day_aired` (`id`, `day`) VALUES (2, 'Tuesday');
INSERT INTO `day_aired` (`id`, `day`) VALUES (3, 'Wedensday');
INSERT INTO `day_aired` (`id`, `day`) VALUES (4, 'Thursday');
INSERT INTO `day_aired` (`id`, `day`) VALUES (5, 'Friday');
INSERT INTO `day_aired` (`id`, `day`) VALUES (6, 'Saturday');
INSERT INTO `day_aired` (`id`, `day`) VALUES (7, 'Sunday');
INSERT INTO `day_aired` (`id`, `day`) VALUES (8, 'Unknown');

COMMIT;


-- -----------------------------------------------------
-- Data for table `season`
-- -----------------------------------------------------
START TRANSACTION;
USE `animetrackerdb`;
INSERT INTO `season` (`id`, `season`) VALUES (1, 'Winter');
INSERT INTO `season` (`id`, `season`) VALUES (2, 'Spring');
INSERT INTO `season` (`id`, `season`) VALUES (3, 'Summer');
INSERT INTO `season` (`id`, `season`) VALUES (4, 'Fall');

COMMIT;


-- -----------------------------------------------------
-- Data for table `anime`
-- -----------------------------------------------------
START TRANSACTION;
USE `animetrackerdb`;
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (1, 'Haikyuu!!: To the Top', 'The fourth season of Haikyuu!!', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1782/103197.jpg?s=804643c5cebc6b1616d1ca4d4c2ec496');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (2, '5-toubun no Hanayome 2nd Season', 'Second season of 5-toubun no Hanayome. ', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1322/100904.jpg?s=5b260994d01c5689e8a9d38cb1a182f5');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (3, 'Toaru Kagaku no Railgun T', 'Third season of Toaru Kagaku no Railgun.', 1, 1, 5, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1819/103287.jpg?s=97b92b0642e398e409528f95b5d440bb');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (4, 'Magia Record: Mahou Shoujo Madoka☆Magica Gaiden', 'The new heroine of Magia Record is Iroha a magical girl on the hunt for her missing sister Ui in Kamihama. Also in Kamihama is Madoka who\'s searching for the similarly-missing Homura.', 1, 1, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1688/102993.jpg?s=336339642902fc4b6370e51353e4d648');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (5, 'Isekai Quartet 2nd Season', 'Second season of Isekai Quartet.', 1, 1, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1030/103383.jpg?s=481dd0a79ca1662808de2000dfd5bca1');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (6, 'Pet', ' There are people who can get into people\'s mind and control their memories. This power is used to eradicate mysteries and cases or worse to assassinate. The potential of the said power is strong enough that it is able to destroy people\'s mind however can backfire and eat up their own heart. To counter it chains are used to lock and protect each other\'s weak and dangerous heart. From one\'s growing fear and disdain they\'re consequently called as a Pet.\"\"', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1399/94794.jpg?s=80db39cfdf0f7fc129e8f4eba73a4319');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (7, 'Nekopara', 'What\'s NEKOPARA? Why it\'s a cat paradise! Kashou Minaduki the son of a long line of Japanese confection makers moved out to open his own shop La Soleil\" as a patisserie. \"', 1, 1, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1233/101696.jpg?s=5b870e2e2e774106e423313040c9bc8f');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (8, 'Kyokou Suiri', 'At the young age of 11 Kotoko Iwanaga was abducted by youkai for two weeks and asked to become their God of Wisdom a mediator between the spirit and human worlds to which the girl quickly agreed but at the cost of her right eye and left leg. Now six years later whenever youkai wish for their problems to be solved they make their way to Kotoko for consultation. ', 0, 0, 7, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1002/101302.jpg?s=8d62fc488c7eb26070c9293833419e71');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (9, 'Plunderer', 'In a post-apocalyptic world dominated by the so-called Numbers\" each human will have their identity branded with their own \"Count\" which could define any number related to their life. May it be one\'s walked distance or amount of compliments given to them by others this Count could lead them to the abyss when it has dropped to zero.  In the year 305 of the Alcian calendar Hina has inherited a mission from her Mother whose Count has depreciated to zero to search for the Legendary Red Baron. In her adventure she meets a half-masked swordsman named Licht who tries to hide his identity as he is known as a degenerate for having an incredibly low Count.\"', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1213/104420.jpg?s=7989b1746417affbfaaf472f61e1e66b');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (10, 'Somali to Mori no Kamisama', 'The world is ruled by spirits goblins and all manner of strange creatures. Human beings are persecuted to the very point of extinction. One day a golem and a lone human girl meet.  This is a record of the pair one a member of a ruined race the other a watchman of the forest. It tells of their travels together and of the bond between father and daughter.', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1938/102796.jpg?s=96b2ef6e35ebd2d570f32609ac93aa0b');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (11, 'Heya Camp', 'Spin off of Yuru Camp', 1, 0, 1, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1228/104364.jpg?s=855ba8b12050924fd26490108dcbf02b');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (12, 'Darwin\'s Game', 'An unknowing Sudou Kaname is invited to try out a new mysterious mobile app game called Darwin\'s Game but later realizes that he\'s in for more than he\'s bargained for when he finds out that there\'s no way to quit the game.', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1237/103493.jpg?s=22a30aa670b093a6f987cf0813a45525');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (13, 'Dorohedoro', 'Hole—a dark decrepit and disorderly district where the strong prey on the weak and death is an ordinary occurrence—is all but befitting of the name given to it. A realm separated from law and ethics it is a testing ground to the magic users who dominate it. As a race occupying the highest rungs of their society the magic users think of the denizens of Hole as no more than insects. Murdered mutilated and made experiments without a second thought the powerless Hole dwellers litter the halls of Hole\'s hospital on a daily basis.  Possessing free access to and from the cesspool and with little challenge to their authority the magic users appear indomitable to most—aside for a few. Kaiman more reptile than man is one such individual. He hunts them on a heedless quest for answers with only a trusted pair of bayonets and his immunity to magic. Cursed by his appearance and tormented by nightmares magic users are his only clue to restoring his life to normal. With his biggest obstacle being his stomach his female companion Nikaidou who runs the restaurant Hungry Bug is his greatest ally.  Set in a gritty world of hellish design Dorohedoro manages a healthy blend of comedy and lightheartedness with death and carnage. Taking plenty of twists and turns while following the lives of Hole\'s residents it weaves a unique world of unearthly origin and dreary appearance not for the squeamish or easily disturbed.', 0, 0, 1, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1953/103487.jpg?s=d1aafd39c1fa10411a2b653d950e5db6');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (14, 'Rikei ga Koi ni Ochita no de Shoumei shitemita.', 'Yukimura Shinya and Himuro Ayame are two scientists that want to find out if love can be solved by a scientific theory. These two scientists also have feelings for each other and want to be able to solve their feelings through similar theoretical facts. With this perfect opportunity these scientists will attempt to solve the theory of the love they express for each other.', 0, 0, 6, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1432/103533.jpg?s=20576a01bed9dbf0259106aa391bf134');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (15, 'Infinite Dendrogram', 'In the year 2043 <Infinite Dendrogram> the world\'s first successful full-dive VRMMO was released. In addition to its ability to perfectly simulate the five senses along with its many other amazing features the game promised to offer players a world full of infinite possibilities. Nearly two years later soon-to-be college freshman Reiji Mukudori is finally able to buy a copy of the game and start playing. With some help from his experienced older brother Shuu and his partner Embryo Reiji embarks on an adventure into the world of <Infinite Dendrogram>. Just what will he discover and encounter in this game world known for its incredible realism and infinite possibilities?', 0, 0, 4, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1764/104365.jpg?s=591de3c74fad46fabe710b17595992c9');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (16, 'Majutsushi Orphen Hagure Tabi', 'A sorcerer who was once the top student of the famous Tower of Fang now spends his time chasing around his hopeless clients as a moneylender at least until his client comes up with a plan to make money: marriage fraud. Unwillingly being dragged in to the plan Orphen encounters a monster who has long been his goal since the day he left the Tower of Fang. Between those who seek to kill the monster and Orphen giving everything to protect the monster his lousy but peaceful days end. Trying to turn back his sister Azalie back to her true form leads to many more mysteries and the key to the secret to the world.', 0, 1, 2, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1552/97864.jpg?s=7cfe796f6e49e080eaf9cf4f90520406');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (17, 'Kuutei Dragons', 'Dragons the rulers of the sky. To many people on the surface they are a dire threat but at the same time a valuable source of medicine oil and food. There are those who hunt the dragons. They travel the skies in dragon-hunting airships. This is the story of one of those ships the “Quin Zaza” and its crew. ', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1019/103606.jpg?s=ee73116bf41a8171de65aa36b2570f26');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (18, 'Jibaku Shounen Hanako-kun', 'Hanako-san Hanako-san...are you there?\" At Kamome Academy rumors abound about the school\'s Seven Mysteries one of which is Hanako-san. Said to occupy the third stall of the third floor girls\' bathroom in the old school building Hanako-san grants any wish when summoned. Nene Yashiro an occult-loving high school girl who dreams of romance ventures into this haunted bathroom...but the Hanako-san she meets there is nothing like she imagined! Kamome Academy\'s Hanako-san...is a boy!\"', 0, 0, 5, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1022/104208.jpg?s=c03b017486b57c8cd40afb187f56e6da');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (19, 'BanG Dream! 3rd Season', 'Third season of BanG Dream! series.', 1, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1362/92850.jpg?s=d59dee830349f8f8b0aaa91cef672e73');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (20, 'Ishuzoku Reviewers', 'In our world the human race constantly debates about several important issues such as: which girl is the best girl? How good is something as fapping material? Which fetish is the sexiest?  Accompany these great warriors as they present us with different girls different opinions different boners and show us that the fantasy world may not be all that different from ours.', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1877/104025.jpg?s=1422d304f76f827c8dc41367279b68ff');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (21, 'Koisuru Asteroid', 'When she was little Mira Kinohata met a boy named Ao at a campsite in town. While gazing at the starry sky together Mira learns that there\'s a star with the same name as herself but no star named Ao. The two then promised to one day explore asteroids together and find a star to name it after him.  Several years later Mira enrolls at the Hoshizaki high school and decides to join the astronomy club to fulfill her promise. However she learns that the astronomy club will be merged with the geological research society to form the earth science club. Reluctantly Mira goes to the club room and is reunited with Ao Manaka—the person she made the promise to explore asteroids with—and is shocked to learn that she is a girl!', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1191/104212.jpg?s=58ace2d3773fc583158684ce7d323510');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (22, 'Boku no Tonari ni Ankoku Hakaishin ga Imasu', 'Seri Koyuki is just trying to have a normal school life but instead he ends up acting as the straight man to his odd classmate Kabuto Hanadori. Kabuto is is a delusional high school student whose fantasies range from believing he is a knight on a journey to claiming that removing his eyepatch will release a darker alter-ego who he refers to as Michael Offenbarung Dunkelheit. Seri is determined not to let himself get pushed around by Kabuto but it seems that this will be easier said than done!', 0, 0, 5, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1848/103547.jpg?s=8f337499cf2c17bfdc2decc446d2cffa');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (23, 'Itai no wa Iya nano de Bougyoryoku ni Kyokufuri Shitai to Omoimasu.', 'After receiving an invitation from her friend Risa Shiromine Kaede Honjou begins playing the VRMMO game New World Online as the character Maple. Lacking knowledge of the game she allocates all her status points to defense. As a result her movements are slow she cannot use magic and even gets attacked by the rabbits. However she obtains a skill called Absolute Defense\" due to maxing out her vitality points and a counter skill that kills in a single hit. A \"mobile fortress style\" novice with a poisonous skill that makes all attacks invalid and overrides all obstacles she goes off to adventures disregarding her irregularities.\"', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1964/97035.jpg?s=3cd2bc474c4c541d218aa3bebdf46fec');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (24, 'Eizouken ni wa Te wo Dasu na!', ' Asakusa Midori wants to create an anime but she\'s too disheartened to make that first step by herself. By pure chance she meets Mizusaki Tsubame an up-and-coming socialite secretly dreaming of becoming an animator. Together with Midori\'s money-loving best friend Kanamori Sayaka the energetic trio slowly work towards making their ultimate world\" a reality! \"', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1608/101940.jpg?s=303c586d50d1011cc10182685fd57f37');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (25, 'ID:Invaded', '(No synopsis yet.)', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1347/103347.jpg?s=5e4340597abbfe9fd4d0c7ec8a958b77');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (26, 'Hatena Illusion', ' Ever since watching a magic show held by him and his wife Maeve Makoto Shiranui has always admired Mamoru Hoshisato—a world-class magician as well as friend of his parents—and came to Tokyo to become his apprentice. Kana nicknamed Hatena is the couple\'s daughter and his childhood friend. As the hustle and bustle activities in Tokyo catches Makoto off guard such as burglaries by a beautiful thief he depends on Hatena\'s comforting side. When he came to Hoshisato\'s now-haunted mansion to reunite with his childhood friend he is greeted by the family\'s butler and maid Jeeves and Emma along with Hatena only to discover that they are not as compatible anymore.', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1142/103878.jpg?s=405e9d6a01958a297ddc75dd5ca3b3ee');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (27, 'Runway de Waratte', 'Runway de Waratte starts with the story of Fujito Chiyuki an aspiring fashion model and daughter of a fledgling Modeling Agency Mille Neige. Ever since she was little Chiyuki\'s dream was to be the star model of her dad\'s agency and perform at Paris Fashion Week. With great looks and a gifted environment it seemed like she was on the right track to fulfill her dream but she soon found herself faced with a seemingly insurmountable wall when her height stopped growing at 158 cm; too short to be a professional model.   Although Chiyuki still kept on believing in herself for years despite everyone telling her it\'s impossible Chiyuki\'s resolve starts to crumble as she enters her last year of high school. This is when she meets Tsumura Ikuto a lame classmate with a surprising talent for designing clothes who is also considering giving up his dream due to unfortunate circumstances. Together they begin the journey of doing the impossible in order to realize their dreams.', 0, 0, 5, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1766/103102.jpg?s=bc285574d47b097cc01b49f3d3eec062');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (28, 'Oshi ga Budoukan Ittekuretara Shinu', 'A girl is obsessed with her favorite idol a minor member of a less popular group enough that she says she\'d die to see her play at Budoukan.', 0, 0, 5, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1515/103463.jpg?s=bbe3c81ba793bad759b3c4e2cbe471df');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (29, 'Housekishou Richard-shi no Nazo Kantei', ' The novel follows Richard Ranashinha Dvorpian a handsome British jewelry appraiser and Seigi Nakata a bright and upright Japanese college student. The duo solves various jewel-related cases by unraveling the hidden psychological aspects of their owners that lie within the gems.', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1001/102512.jpg?s=7a3f7b5b28860f11f4ce01349d5d80a0');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (30, 'number24', ' Natsusa Yuzuki entered university expecting to be the rugby club\'s ace but he can no longer play rugby due to certain circumstances. Ibuki Ueoka is a senior who also quit playing rugby. There is also Yasunari Tsuru Natsusa\'s junior who finds him disagreeable. On the other hand another junior Yuu Mashiro looks up to Natsusa and follows in his footsteps. Last there is Seiichirou Shingyouji Natsusa\'s childhood best friend. This is an original rugby anime of former teammates who fight together in matches of Kansai\'s university rugby league.', 0, 0, 3, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1885/102374.jpg?s=c5950a21da89b26be6d2872bc10023b5');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (31, '22/7', ' TV Anime Series for Idol Group 22/7 Slated for January 2020. ', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1883/103155.jpg?s=701c0c375fee50bfea0a98aa31020a07');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (32, 'Yatogame-chan Kansatsu Nikki 2nd Season', ' Second season of Yatogame-chan Kansatsu Nikki. ', 0, 0, 7, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1810/104387.jpg?s=657fcda3b97ca8be32d197a873aa7d1c');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (33, 'A3! Season Spring & Summer', 'In Tokyo there is a place called Velude Way. It is a district notorious for its performers and theatrical groups. Izumi Tachibana who was previously a stage actress arrives with a letter that reads Full of debt! Zero customers! Only one actor!\" It describes the current state of the once-popular theater group Mankai Company. Her task is to rebuild the company to its former glory as the new owner and chief director.\"', 0, 0, 2, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1814/103594.jpg?s=da60ea2f71bf6e659ef362342dab0f12');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (34, 'Uchi Tama?! Uchi no Tama Shirimasen ka?', '(No synopsis yet.)', 0, 0, 5, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1624/103162.jpg?s=e3983e6ba90cd7c589bda6f563dcbe98');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (35, 'Oda Cinnamon Nobunaga', 'In the one-of-a-kind samurai-general-reincarnated-as-a-canine comedy\" Nobunaga perishes at Honnouji as in history and reincarnates in modern-day Japan as a dog named Shinamon. Other Warring States era warlords such as Takeda Shingen eventually join him also as dogs.\"', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1584/103148.jpg?s=3be9134921fdd7cef1a64bdd9dd52415');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (36, 'Overflow', 'Brother are we really taking a bath together?\"  And so a forbidden bathing experience began. Me my sister and childhood friend—one man and two women—are sharing one bath. After involuntarily \"overflowing\" the sister\'s secret love come out?!  This is a young romantic comedy that won\'t let you say \"it\'s over!\"\"', 0, 0, 1, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1781/104461.jpg?s=33ac14ce80ad971cf7c66dc0ae7b8bd6');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (37, 'ARP Backstage Pass', '(No synopsis yet.)', 0, 0, 1, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1025/104231.jpg?s=5709e7b143f7dba8bf8f5709d6d74f42');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (38, 'Natsunagu!', 'Natsuna Kunugi a university student in Tokyo visits Kumamoto in search of friends who she could not contact following the Kumamoto earthquakes. There she meets local people who are full of compassion and uniqueness including the energetic junior high school student Izumi. A heartfelt coming-of-age story begins.  Natsuna Kunugi a university student in Tokyo visits Kumamoto in search of friends who she could not contact following the Kumamoto earthquakes. There she meets local people who are full of compassion and uniqueness including the energetic junior high school student Izumi. A heartfelt coming-of-age story begins.', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1327/104408.jpg?s=89ae62682bf81ab1fea4ede31066588a');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (39, 'Rebirth', '(No synopsis yet.)', 0, 0, 8, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1882/103235.jpg?s=2439a2227dbc1fd0acf1d2aa4441b323');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (40, 'Healin\' Good♡Precure', 'New Precure series.', 0, 0, 7, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1445/103643.jpg?s=e209cfc2888b3d13c0ce8efadd2b3088');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (41, 'Fate/Grand Order: Zettai Majuu Sensen Babylonia', 'A.D. 2016 the foundations of humanity have been incinerated by the Mage King Solomon. Chaldea a secret mages organization with the mission to preserve humanity\'s future foresaw mankind\'s extinction in 2015. Thus commenced the operation to repair the Singularities in history caused by Holy Grails dispersed across time and space—Operation Grand Order.   Using the Rayshift time travel technology Chaldea\'s last master Ritsuka Fujimaru and his demi-servant Mash Kyrielight have traveled to and resolved six Singularities. Now they depart for their most dangerous destination yet: a civilization in the Age of Gods B.C. 2655 Mesopotamia. Ritsuka and Mash soon discover that Demonic Beasts roam the land attacking people and towns. Amidst chaos and terror lies humanity\'s last defense—Uruk a fortress city that acts as the frontline for the battle against the beasts. The battlefront is commanded by none other than King Gilgamesh the King of Heroes who sought aid from Heroic Spirits and took on the role of a mage to protect his city.   Along with Gilgamesh and the summoned servants Ritsuka and Mash must protect Uruk against the magical beasts\' onslaught and defeat the Three Goddess Alliance who aims to eradicate humankind; all the while a greater threat looms over Uruk preparing for its awakening.', 1, 1, 6, 1, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1194/103420.jpg?s=5dae18a0a55476571a1c0034828705d9');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (42, 'Yahari Ore no Seishun Love Comedy wa Machigatteiru. Kan', 'Third season of Yahari Ore no Seishun Love Comedy wa Machigatteiru..', 1, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1969/104239.jpg?s=0abbd80ee9b53c9fa0dcb6ca3325c9fe');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (43, 'Otome Game no Hametsu Flag shika Nai Akuyaku Reijou ni Tensei shiteshimatta...', 'Eight-year-old Katarina Claes is the only daughter of a duke living her life peacefully and without incident until she hits her head on a rock... and then remembers that she is not actually the duke\'s daughter. She used to be an otaku who died on her way to school after spending the previous night playing Fortune Lover her favorite otome game. After noticing that her current surroundings seem oddly familiar she is shocked to discover that she has been reincarnated into the world of Fortune Lover as the villainess.  The villainess in the game usually winds up dead or exiled so Katarina decides to use her knowledge of the game and its routes to avoid any bad situations. But is it even possible for the villainess to reach a good ending? ', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1550/103612.jpg?s=e9bc9abccd5c7240d122e1d8e5e6e134');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (44, 'Jashin-chan Dropkick\'', 'Second season of Jashin-chan Dropkick.', 1, 1, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1963/101122.jpg?s=f345730d1187e8773cb041bccea89f19');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (45, 'IDOLiSH7 2', 'Second season of IDOLiSH7.', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1312/101939.jpg?s=95c05f0cbc1653a413da433facf655c2');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (46, 'Kingdom 3rd Season', 'Third season of Kingdom.', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1558/104184.jpg?s=0b8ff3537ddb890c52b73f87c673d49f');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (47, 'Yesterday wo Utatte', ' After college Rikuo Uozumi a boy without much ambition in life takes on a job at a convenience store. The days pass by uneventfully for Rikuo until he meets his former girlfriend and classmate but especially thanks to the unusual Haru Nonaka and her pet raven...', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1900/100568.jpg?s=6896087b971449ffb0a3fd6afe97c690');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (48, 'Shironeko Project: Zero Chronicle', ' In a world consisting of numerous isles a young hero from the Astora Isle encounters the adventurer Kyle and follows him on an expedition on the isle. They meet a mysterious girl named Iris and a talking white cat and together they make their way to the isle\'s ruins where they find a flying island. Kyle becomes consumed by darkness there and the party resolves to travel to the ends of the world on the flying island in order to find the seven Great Runes\" following Kyle\'s words before he disappeared. \"', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1733/103576.jpg?s=85fb51e17de05ee138bc930f814e2c75');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (49, 'Tamayomi', 'In her Junior High years the pitcher Yomi Takeda was not able to get very far in a cross-school baseball tournament. Since the catcher on her team wasn\'t at her level she couldn\'t use her signature move the Magic Throw\" and eventually regretted not being able to use it. After Junior High she decided to stop playing baseball and went to Shin Koshigaya High School a school without a baseball club.   There she found her long lost childhood friend Tamaki Yamazaki who used to play catchball with her when they were kids. Tamaki also played baseball during her Junior High years as a catcher and could even catch Yomi\'s \"Magic Throw!\"   Their promise with each other during their childhood could now be fulfilled! Walking together on the road of baseball once again...   The story of the girls who love baseball will begin!\"', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1909/102449.jpg?s=1f0332371c4f07c7bde33afa35ff7fd5');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (50, 'Major 2nd 2nd Season', 'Second season of Major 2nd.', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1152/103428.jpg?s=b0bfb22d2742dea689194af0cdb6c16e');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (51, 'Kitsutsuki Tanteidokoro', 'A ghost was seen on the 12th floor of the Asakusa Juunikai building. A newspaper article featuring the sighting brought together Takuboku Ishikawa who runs a private detective agency to support his family and his assistant Kyosuke Kindaichi to solve the case.', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1827/103380.jpg?s=bfcd82760b913a327a01fec95649e632');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (52, 'Nami yo Kiitekure', ' The stage is Sapporo Hokkaido. One night our heroine Minare Koda spills her heartbroken woes to a radio station worker she meets while out drinking one night. The next day she hears a recording of her pitiful grumbling being played live over the air. Minare storms into the station in a rage only to then be duped by the station director into doing an impromptu talk show explaining her harsh dialogue. With just one recording the many eccentric facets of Minare\'s life begin to pull every which direction as she falls ever deeper into the world of radio. ', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1572/103437.jpg?s=6e23e593cb9ad6cc03e13e716b2fcb0d');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (53, 'Houkago Teibou Nisshi', ' Hina Tsurugi is a first year student at a coastal high school and regards herself as an indoorsy sort of person. Walking along the embankment she runs into an older schoolmate Kuroiwa who invites her to join the “Teibou” club and start fishing! Surrounded by eccentric club members how will Hina’s high school life turn out?', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1214/103530.jpg?s=fde993db8ca4bab133ed8a06fca75034');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (54, 'Gal to Kyouryuu', ' One day Kaede a gyaru picks up a dinosaur and begins living with it. The short comedy depicts their daily lives together as the dinosaur consumes human food watches TV and enjoys fashionable things. Thus begins the story of a gal and a dinosaur cohabiting that transcends time.', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1428/102874.jpg?s=a1670c5e9ffa9bc8b3fe0860277ce8bb');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (55, 'Vlad Love', ' The slapstick comedy series revolves around Mai the vampire and her school friends. Oshii commented that there will be no handsome men and that it will have a serious take on the girl-meets-girl theme.', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1449/101644.jpg?s=1a04bf900fe4b285aa597ddbc99c931e');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (56, 'Tsukiuta. The Animation 2', 'Second season of Tsukiuta. The Animation.', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1149/104209.jpg?s=95d50dbb4327f5b0c57c78559f326009');
INSERT INTO `anime` (`id`, `title`, `description`, `simulcast`, `interested_in`, `day_aired_id`, `season_id`, `release_year`, `image_url`) VALUES (57, 'Argonavis from BanG Dream!', '(No synopsis yet.)', 0, 0, 8, 2, '2020', 'https://cdn.myanimelist.net/r/334x484/images/anime/1367/104178.jpg?s=1f83c895d8eb4770455dd32091ff0c9a');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `animetrackerdb`;
INSERT INTO `category` (`id`, `category`) VALUES (1, 'Comedy');
INSERT INTO `category` (`id`, `category`) VALUES (2, 'Sports');
INSERT INTO `category` (`id`, `category`) VALUES (3, 'Drama');
INSERT INTO `category` (`id`, `category`) VALUES (4, 'School');
INSERT INTO `category` (`id`, `category`) VALUES (5, 'Shonen');
INSERT INTO `category` (`id`, `category`) VALUES (32, 'Harem');
INSERT INTO `category` (`id`, `category`) VALUES (6, 'Romance');
INSERT INTO `category` (`id`, `category`) VALUES (7, 'Action');
INSERT INTO `category` (`id`, `category`) VALUES (8, 'Sci-Fi');
INSERT INTO `category` (`id`, `category`) VALUES (9, 'Super Power');
INSERT INTO `category` (`id`, `category`) VALUES (10, 'Psychological');
INSERT INTO `category` (`id`, `category`) VALUES (11, 'Magic');
INSERT INTO `category` (`id`, `category`) VALUES (12, 'Thriller');
INSERT INTO `category` (`id`, `category`) VALUES (13, 'Isekai');
INSERT INTO `category` (`id`, `category`) VALUES (14, 'Parody');
INSERT INTO `category` (`id`, `category`) VALUES (15, 'Fantasy');
INSERT INTO `category` (`id`, `category`) VALUES (16, 'Mystery');
INSERT INTO `category` (`id`, `category`) VALUES (17, 'Supernatural');
INSERT INTO `category` (`id`, `category`) VALUES (18, 'Seinen');
INSERT INTO `category` (`id`, `category`) VALUES (19, 'Demons');
INSERT INTO `category` (`id`, `category`) VALUES (20, 'Ecchi');
INSERT INTO `category` (`id`, `category`) VALUES (21, 'Adventure');
INSERT INTO `category` (`id`, `category`) VALUES (22, 'Slice of Life');
INSERT INTO `category` (`id`, `category`) VALUES (23, 'Horror');
INSERT INTO `category` (`id`, `category`) VALUES (24, 'Game');
INSERT INTO `category` (`id`, `category`) VALUES (25, 'Martial Arts');
INSERT INTO `category` (`id`, `category`) VALUES (26, 'Music');
INSERT INTO `category` (`id`, `category`) VALUES (27, 'Josei');
INSERT INTO `category` (`id`, `category`) VALUES (28, 'Historical');
INSERT INTO `category` (`id`, `category`) VALUES (29, 'Kids');
INSERT INTO `category` (`id`, `category`) VALUES (30, 'Shoujo');
INSERT INTO `category` (`id`, `category`) VALUES (31, 'Military');

COMMIT;


-- -----------------------------------------------------
-- Data for table `anime_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `animetrackerdb`;
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 1);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (2, 1);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (3, 1);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 1);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (5, 1);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 2);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (32, 2);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (6, 2);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 2);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (5, 2);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (7, 3);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (8, 3);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (9, 3);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (10, 4);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (3, 4);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (11, 4);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (12, 4);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (13, 5);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 5);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (14, 5);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 5);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (16, 6);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (10, 6);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (17, 6);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (18, 6);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 7);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (6, 7);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (20, 7);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 8);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (16, 8);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (19, 8);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (17, 8);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (6, 8);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (5, 8);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (7, 9);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (20, 9);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 9);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (5, 9);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (21, 10);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 10);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 10);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 11);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 11);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (7, 12);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (16, 12);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (5, 12);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (7, 13);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 13);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (18, 13);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (23, 13);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 13);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 14);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (6, 14);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 15);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (24, 15);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (7, 16);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (3, 16);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (21, 16);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 16);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (25, 16);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (11, 16);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 17);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (21, 17);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (18, 17);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 18);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (17, 18);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 18);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (5, 18);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (26, 19);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 19);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 20);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (20, 20);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 20);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 21);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 21);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 21);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 22);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 22);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 22);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (27, 22);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (7, 23);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (8, 23);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (21, 23);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 23);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 23);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (21, 24);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 24);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 24);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (18, 24);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (8, 25);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (16, 25);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 26);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (6, 26);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (20, 26);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (17, 26);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (3, 27);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 27);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (5, 27);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 27);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 28);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (26, 28);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (18, 28);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (16, 29);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (2, 30);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 30);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (26, 31);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 32);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 32);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (5, 32);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 32);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (26, 33);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 34);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (28, 35);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (18, 35);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 35);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 35);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (6, 36);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (20, 36);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (26, 37);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 38);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (3, 38);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (24, 39);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (7, 40);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (11, 40);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 40);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (30, 40);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (7, 41);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 41);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (11, 41);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (17, 41);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 42);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 42);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (3, 42);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 42);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (6, 42);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 43);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (3, 43);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 43);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (6, 43);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 43);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 44);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (17, 44);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (26, 45);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (7, 46);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (28, 46);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (18, 46);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (31, 46);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 47);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (3, 47);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (6, 47);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (18, 47);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (7, 48);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (21, 48);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (11, 48);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (15, 48);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (2, 49);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 49);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 50);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (2, 50);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (3, 50);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (5, 50);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (16, 51);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (28, 51);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 52);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (3, 52);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (6, 52);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (18, 52);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 53);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 53);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 53);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (18, 53);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 54);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (18, 54);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (22, 54);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (1, 55);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (17, 55);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (4, 55);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (26, 56);
INSERT INTO `anime_category` (`category_id`, `anime_id`) VALUES (26, 57);

COMMIT;

