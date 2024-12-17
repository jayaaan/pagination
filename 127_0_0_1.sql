-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 17 déc. 2024 à 19:38
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-commerce`
--
CREATE DATABASE IF NOT EXISTS `e-commerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `e-commerce`;

-- --------------------------------------------------------

--
-- Structure de la table `adress`
--

DROP TABLE IF EXISTS `adress`;
CREATE TABLE IF NOT EXISTS `adress` (
  `adress_id` int NOT NULL,
  `number_of_the_street` int DEFAULT NULL,
  `name_of_the_street` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mailing_address` int NOT NULL,
  PRIMARY KEY (`adress_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int NOT NULL,
  `id_command` int NOT NULL,
  `total price` int NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fk_command` (`id_command`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cart_products`
--

DROP TABLE IF EXISTS `cart_products`;
CREATE TABLE IF NOT EXISTS `cart_products` (
  `cart_product_id` int NOT NULL,
  `id_cart` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`cart_product_id`),
  KEY `fk_cart` (`id_cart`),
  KEY `fk_product` (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `command`
--

DROP TABLE IF EXISTS `command`;
CREATE TABLE IF NOT EXISTS `command` (
  `command_id` int NOT NULL,
  `payment_with_card` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `delivery` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`command_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `invoices_id` int NOT NULL,
  `user_id` int NOT NULL,
  `command_id` int NOT NULL,
  PRIMARY KEY (`invoices_id`),
  KEY `fk_user` (`user_id`),
  KEY `fk_command` (`command_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int NOT NULL,
  `name_of_product` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price_of_the_product` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int NOT NULL,
  `phone_number` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_address` (`address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`user_id`, `name`, `age`, `phone_number`, `address_id`) VALUES
(0, 'Mr. Ephraim Beier II', 38, 0, 0);
--
-- Base de données : `pagination`
--
CREATE DATABASE IF NOT EXISTS `pagination` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `pagination`;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1258 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`) VALUES
(8, 'Combat The Space', 'Action ', 19),
(9, 'Forklift Simulator 2023', 'Simulation ', 11),
(10, 'Formula Racing: Grand Prix League', 'Course ', 47),
(11, 'Turmoil', 'Stratégie ', 69),
(12, 'Bunny Mazes', 'Puzzle ', 94),
(13, 'Horror Adventure: Zombie Edition', 'Horreur ', 96),
(14, 'Paper Plane Arena - Shamans', 'Action ', 63),
(15, 'The Last of Us', 'Action-aventure', 65),
(16, 'Red Dead Redemption', 'Western, Monde ouvert', 58),
(17, 'God of War (2018)', 'Action-aventure', 30),
(18, 'Horizon Zero Dawn', 'RPG, Monde ouvert', 25),
(19, 'Uncharted 4', 'Action-aventure', 64),
(20, 'Marvel\'s Spider-Man: Miles Morales', 'Action-aventure', 80),
(21, 'Demon\'s Souls', 'Action-RPG', 13),
(22, 'Ratchet & Clank: Rift Apart', 'Plateforme, Action', 65),
(23, 'The Legend of Zelda: Tears of the Kingdom', 'Action-aventure', 48),
(24, 'Super Smash Bros. Ultimate', 'Combat ', 50),
(25, 'Animal Crossing: New Horizons', 'Simulation ', 93),
(26, 'Mario Kart 8 Deluxe', 'Course ', 38),
(27, 'Splatoon 3', ' Tir à la troisième personne', 73),
(28, 'Saepe et.', 'Sit ut rerum labore a quae dolor. Rem est ea magnam sunt qui voluptatem ratione. Non alias ipsa quia neque est.', 15),
(29, 'Doloribus aut.', 'Earum hic minus sit aperiam dolorum iste. Ut nisi architecto hic ipsam. Esse consequatur rerum ad quasi veritatis dolor est.', 42),
(30, 'Quo maxime.', 'Et hic recusandae deleniti voluptas. Perspiciatis voluptatum et quo earum iusto voluptatem. Aut iste qui eius quia et iste.', 100),
(31, 'Voluptates ut.', 'Dolor tempore ad sunt. Tenetur similique numquam temporibus quas. Dolores incidunt et qui cumque officia quos. Nesciunt et omnis ut unde.', 34),
(32, 'Numquam non.', 'Corporis ex voluptas sapiente accusamus. Possimus et et non enim suscipit iste quis. Est sapiente dolores in quos ut unde.', 21),
(1208, 'Id voluptatem.', 'Quisquam maxime id quidem tempore fugiat perspiciatis. Similique odio laboriosam non odio vel nisi. Rerum vitae nam quia ut quia.', 28),
(1209, 'Suscipit.', 'Voluptas dolorum et ut sint nobis. Officia perferendis temporibus a cumque. Aliquam atque quo et qui.', 59),
(1210, 'Hic culpa sed.', 'Aut recusandae a amet numquam vel porro. Fugiat unde voluptates corporis sit ducimus.', 23),
(1211, 'Est.', 'Qui eos unde aut ut impedit non. Qui assumenda dolores ut laborum. Modi laboriosam aut voluptatem sed vel molestiae consequatur sunt.', 85),
(1212, 'Quas.', 'Sed consequuntur in ea unde hic numquam recusandae reprehenderit. Voluptatem ut rem autem accusamus.', 46),
(1213, 'Ipsum.', 'Nihil est vel praesentium aut ex. Qui reiciendis consequatur et laudantium neque ducimus id.', 62),
(1214, 'Nobis.', 'Rerum ut architecto ab ducimus qui quibusdam voluptas. Consequatur suscipit voluptas quo illo quo natus. Qui quia fuga ut.', 5),
(1215, 'Qui dolorem.', 'Facere cum eius ipsam ipsum. Et aspernatur omnis debitis quis et voluptatum doloribus. Nulla id dolor totam nihil tempore soluta.', 3),
(1216, 'Cumque fugiat.', 'Sapiente sint qui vero possimus. Recusandae non suscipit earum fuga.', 81),
(1217, 'Ea neque.', 'Consequatur voluptatem ducimus qui. Culpa consequuntur laborum maxime beatae ipsa. Doloribus earum ut quaerat necessitatibus fuga magni.', 81),
(1218, 'Quo.', 'Atque dicta sapiente error eos recusandae. Non debitis dolorum dicta est cum. Quia consequatur provident sapiente et qui.', 34),
(1219, 'Perspiciatis.', 'Et eum praesentium temporibus. Accusamus sapiente voluptatem rem tempore qui est sequi blanditiis. Et aliquam quo odit nobis fuga.', 45),
(1220, 'Tempora.', 'Sunt suscipit qui inventore est non ut fugit. Veniam et iusto at ut exercitationem.', 72),
(1221, 'Consectetur.', 'Et non accusamus est quos. Alias eveniet doloribus impedit natus debitis est.', 93),
(1222, 'Et illo illum.', 'Fuga et id assumenda. Id accusantium soluta temporibus perspiciatis odit rerum. Quis labore eius non nobis sapiente nihil.', 70),
(1223, 'Ut recusandae.', 'Numquam et illum et. Voluptates voluptatum aut dolores sed praesentium. Mollitia dicta voluptas quae quia.', 63),
(1224, 'Consequatur.', 'Aliquid dolores optio aut est numquam. Sed doloribus cumque veniam eius. Fugit mollitia et accusamus.', 81),
(1225, 'Doloremque.', 'Sed exercitationem mollitia veritatis non praesentium sint voluptatum. Aut nisi nemo ut quia. Sed officiis at sit a beatae optio.', 12),
(1226, 'Numquam.', 'Est autem eius enim et ipsum omnis qui dolore. Voluptas doloribus esse ex distinctio. Iure rerum omnis rerum asperiores et.', 31),
(1227, 'Sit excepturi.', 'Ut tempore provident numquam eos eos voluptates. Qui vero laborum ab aut vero. In odio quae est illo autem ut natus.', 26),
(1228, 'Non.', 'Quidem itaque impedit in quo in. Voluptate vitae eaque quo eos error tenetur vel. Non harum porro illum voluptates id.', 39),
(1229, 'Aliquid.', 'Sed consectetur nemo laudantium animi amet quia. Ut rerum fuga officiis veritatis dolorem est. Tempore ex ut sed rem.', 90),
(1230, 'Suscipit et.', 'Qui sit repellat dolores nostrum eum. Quos quo fugiat occaecati nisi perferendis. Dolor nihil unde ipsum ex praesentium ea facilis.', 84),
(1231, 'Eveniet magni.', 'Natus ut omnis nulla rerum. Nihil excepturi ullam quasi quo officia. Blanditiis veritatis necessitatibus ut sunt nesciunt eius magni.', 74),
(1232, 'Aliquid et.', 'Deserunt in ut eum nostrum. Quaerat molestias itaque ea odio quae alias alias. Possimus et quo quibusdam earum natus aut ut.', 39),
(1233, 'Deleniti.', 'Rerum quis et id. Hic minus nobis cum veniam eos ea nisi.', 54),
(1234, 'Facere rerum.', 'Rerum qui modi minus aliquam amet quo. Nobis fuga sed suscipit. Qui sunt commodi commodi molestiae facilis repudiandae ipsa aut.', 65),
(1235, 'Molestiae.', 'Fugit et eum nostrum. Fugit dolorum explicabo sint illum quis esse accusantium. Sequi aspernatur qui corporis ea et culpa.', 86),
(1236, 'Molestias est.', 'Aliquam deleniti ut laudantium consequatur illo rerum. Vero eum dolore maxime dicta id.', 77),
(1237, 'Non ullam.', 'Fuga sunt vero quis qui eaque placeat voluptas. Voluptatem natus perspiciatis est recusandae. Pariatur neque ad qui est magni ut quod.', 23),
(1238, 'Odio illo.', 'Nobis magni ut est dicta. Est voluptas est et voluptate. Aliquid ut itaque neque aliquam recusandae.', 75),
(1239, 'Et eligendi.', 'Labore dolores officiis aut numquam. Magni qui odit suscipit sunt perspiciatis voluptatem.', 69),
(1240, 'Sunt quas.', 'Asperiores et maiores quos sit inventore. Architecto eum modi autem perspiciatis aut modi.', 26),
(1241, 'Omnis ex id.', 'Et reiciendis quaerat pariatur et temporibus. Velit doloribus et nobis. Neque aut aut molestiae eos saepe. Sed odit aut cum impedit eius.', 82),
(1242, 'Odio tempore.', 'Ut quis et quia dolorem a et illo asperiores. Doloremque ullam totam aperiam dolorem voluptatem id.', 89),
(1243, 'Et.', 'Eius unde earum a. Odio exercitationem consequatur officia optio error officia. Perspiciatis voluptatum repellat et et.', 86),
(1244, 'Corrupti est.', 'Voluptates consequatur ut voluptatum. Aut ut enim vitae totam dolore.', 1),
(1245, 'Molestias est.', 'Est ducimus sint quasi accusantium ut ut. Repellat impedit ut est aut quo quae. Eius possimus sint sit libero qui sed.', 71),
(1246, 'Autem cumque.', 'Nemo repudiandae repellat voluptates sint. Harum optio voluptatem sunt explicabo. Modi animi quasi in cum.', 57),
(1247, 'Porro in.', 'Natus et exercitationem quaerat consequatur. Ut officiis consequatur non rerum. Nobis dolorum sed officiis esse quia.', 26),
(1248, 'Qui aut alias.', 'Non dicta fugit reiciendis ducimus et. Atque nihil magni totam maxime. Assumenda qui exercitationem quam eligendi adipisci reiciendis.', 79),
(1249, 'Quasi optio.', 'Et fugit soluta cum numquam ex et aut. Sunt ab saepe quis. Autem enim quia ut vel. Tempore voluptatem hic molestiae et quo sed.', 22),
(1250, 'Laboriosam.', 'Labore consequatur ea laboriosam et aperiam. Doloremque eaque quisquam nihil dolor eius. Qui fuga exercitationem qui est.', 57),
(1251, 'Voluptates.', 'Repellat suscipit optio explicabo est est est. Mollitia suscipit consequatur eos architecto. In eveniet delectus enim doloribus doloremque.', 42),
(1252, 'Culpa non eum.', 'Facere vero fugiat voluptatem perspiciatis. Est temporibus voluptas nostrum laborum. Tempora nesciunt omnis quod veritatis.', 55),
(1253, 'Consequuntur.', 'Facere voluptatem a eos dolor minus qui doloremque. Est ab nihil ducimus minima odit.', 13),
(1254, 'Veritatis.', 'Sed alias quidem consequatur et quod consequatur repellat. Deserunt cupiditate illum unde asperiores at.', 69),
(1255, 'Consequatur a.', 'Animi doloremque fuga beatae sed iste. Quia deserunt eos saepe iste sunt recusandae. Labore consequatur tempore veritatis veniam.', 77),
(1256, 'Libero.', 'Est iste ducimus neque voluptatem. Beatae praesentium et autem ullam. Quas ab iste quidem dolores.', 2),
(1257, 'Et quia.', 'Magnam eos eum at incidunt nisi. Cumque dolor ut debitis ea et tenetur aut. Atque sit maxime exercitationem qui eos.', 49);
--
-- Base de données : `restaurant`
--
CREATE DATABASE IF NOT EXISTS `restaurant` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `restaurant`;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id_clients` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  PRIMARY KEY (`id_clients`),
  UNIQUE KEY `id_clients_UNIQUE` (`id_clients`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_clients`, `nom`, `prenom`, `email`, `telephone`) VALUES
(1, 'Ilan', 'jayan', 'jayan@gmail.com', NULL),
(2, 'jeremy', 'jerome', NULL, NULL),
(3, 'mathias', 'bryan', NULL, NULL),
(4, 'zakaria', 'nolan', NULL, NULL),
(5, 'sam', 'maghri', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int NOT NULL,
  `id_client` int DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `foreign_key to clients_idx` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_client`, `date_commande`) VALUES
(13, 2, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `commande_plat`
--

DROP TABLE IF EXISTS `commande_plat`;
CREATE TABLE IF NOT EXISTS `commande_plat` (
  `id_commande_plat` int NOT NULL,
  `id_commande` int DEFAULT NULL,
  `id_plat` int DEFAULT NULL,
  `quantite` int DEFAULT NULL,
  PRIMARY KEY (`id_commande_plat`),
  KEY `foreigne key vers commande_idx` (`id_commande`),
  KEY `foreign key vers plat _idx` (`id_plat`),
  KEY `Connection_idx` (`id_plat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande_plat`
--

INSERT INTO `commande_plat` (`id_commande_plat`, `id_commande`, `id_plat`, `quantite`) VALUES
(14, 13, 12, 2);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `id_plat` int NOT NULL,
  `nom_plat` varchar(45) DEFAULT NULL,
  `prix` int DEFAULT NULL,
  `categorie` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_plat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id_plat`, `nom_plat`, `prix`, `categorie`) VALUES
(6, 'steak lao ', NULL, 'plat '),
(7, 'riz cantonnais ', NULL, 'plat'),
(8, 'nems poulet ', NULL, 'entree'),
(9, 'dame blanche ', NULL, 'dessert'),
(10, 'nouille poulet', NULL, 'plat'),
(11, 'brochette poulet', NULL, 'entree'),
(12, 'riz loclac', NULL, 'plat');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `foreign_key to clients` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_clients`);

--
-- Contraintes pour la table `commande_plat`
--
ALTER TABLE `commande_plat`
  ADD CONSTRAINT `Connection` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id_plat`),
  ADD CONSTRAINT `foreigne key vers commande` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
