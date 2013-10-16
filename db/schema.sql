

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `id` varchar(50)  NOT NULL,
  `name_fr` varchar(50)  NOT NULL,
  `name_en` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `generals`
--

CREATE TABLE IF NOT EXISTS `generals` (
  `id` varchar(50)  NOT NULL,
  `name` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `personnalities`
--

CREATE TABLE IF NOT EXISTS `personnalities` (
  `id` varchar(50)  NOT NULL,
  `name_fr` varchar(50)  NOT NULL,
  `name_en` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `powers`
--

CREATE TABLE IF NOT EXISTS `powers` (
  `id` varchar(50)  NOT NULL,
  `name_fr` varchar(50)  NOT NULL,
  `name_en` varchar(50)  NOT NULL,
  `text_fr` text  NOT NULL,
  `text_en` text  NOT NULL,
  `is_special_attack` tinyint(1) NOT NULL DEFAULT '0',
  `min_range` int(11) NOT NULL DEFAULT '0',
  `max_range` int(11) NOT NULL DEFAULT '0',
  `min_attack` int(11) NOT NULL DEFAULT '0',
  `max_attack` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `races`
--

CREATE TABLE IF NOT EXISTS `races` (
  `id` varchar(50)  NOT NULL,
  `name_fr` varchar(50)  NOT NULL,
  `name_en` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `size_classes`
--

CREATE TABLE IF NOT EXISTS `size_classes` (
  `id` varchar(50) NOT NULL,
  `name_fr` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);

-- --------------------------------------------------------

--
-- Structure de la table `uniqueness`
--

CREATE TABLE IF NOT EXISTS `uniqueness` (
  `id` varchar(50)  NOT NULL,
  `name_fr` varchar(50)  NOT NULL,
  `name_en` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `worlds`
--

CREATE TABLE IF NOT EXISTS `worlds` (
  `id` varchar(50)  NOT NULL,
  `name_fr` varchar(50)  NOT NULL,
  `name_en` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `systems`
--

CREATE TABLE IF NOT EXISTS `systems` (
  `id` varchar(50)  NOT NULL,
  `name_fr` varchar(50)  NOT NULL,
  `name_en` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `army_cards` (
  `id` varchar(50) NOT NULL,
  `name_fr` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `general_id` varchar(50) NOT NULL,
  `race_id` varchar(50) NOT NULL,
  `uniqueness_id` varchar(50) NOT NULL,
  `hero` tinyint(1) NOT NULL,
  `class_id` varchar(50) NOT NULL,
  `personnality_id` varchar(50) NOT NULL,
  `size_class_id` varchar(50) NOT NULL,
  `world_id` varchar(50) NOT NULL,
  `system_id` varchar(50) NOT NULL,
  `size` int(11) NOT NULL,
  `life` int(11) NOT NULL,
  `move` int(11) NOT NULL,
  `range` int(11) NOT NULL,
  `attack` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `number_figures` int(11) NOT NULL,
  `base_size` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `general_id` (`general_id`),
  KEY `race_id` (`race_id`),
  KEY `uniqueness_id` (`uniqueness_id`),
  KEY `personnality_id` (`personnality_id`),
  KEY `size_class_id` (`size_class_id`)
);

-- --------------------------------------------------------

--
-- Structure de la table `army_cards_powers`
--

CREATE TABLE IF NOT EXISTS `army_cards_powers` (
  `army_card_id` varchar(50)  NOT NULL,
  `power_id` varchar(50)  NOT NULL,
  `order` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`army_card_id`,`power_id`),
  KEY `power_id` (`power_id`)
) ;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `army_cards`
--
ALTER TABLE `army_cards`
  ADD CONSTRAINT `army_cards_ibfk_1` FOREIGN KEY (`general_id`) REFERENCES `generals` (`id`),
  ADD CONSTRAINT `army_cards_ibfk_2` FOREIGN KEY (`race_id`) REFERENCES `races` (`id`),
  ADD CONSTRAINT `army_cards_ibfk_3` FOREIGN KEY (`uniqueness_id`) REFERENCES `uniqueness` (`id`),
  ADD CONSTRAINT `army_cards_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `army_cards_ibfk_5` FOREIGN KEY (`personnality_id`) REFERENCES `personnalities` (`id`),
  ADD CONSTRAINT `army_cards_ibfk_6` FOREIGN KEY (`size_class_id`) REFERENCES `size_classes` (`id`),
  ADD CONSTRAINT `army_cards_ibfk_7` FOREIGN KEY (`world_id`) REFERENCES `worlds` (`id`),
  ADD CONSTRAINT `army_cards_ibfk_8` FOREIGN KEY (`system_id`) REFERENCES `systems` (`id`);

--
-- Contraintes pour la table `army_cards_powers`
--
ALTER TABLE `army_cards_powers`
  ADD CONSTRAINT `army_cards_powers_ibfk_1` FOREIGN KEY (`army_card_id`) REFERENCES `army_cards` (`id`),
  ADD CONSTRAINT `army_cards_powers_ibfk_2` FOREIGN KEY (`power_id`) REFERENCES `powers` (`id`);
