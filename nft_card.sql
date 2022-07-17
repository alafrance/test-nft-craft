-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 17 juil. 2022 à 16:10
-- Version du serveur : 8.0.27
-- Version de PHP : 8.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nft_card`
--

-- --------------------------------------------------------

--
-- Structure de la table `addresses`
--

CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `announcements`
--

CREATE TABLE `announcements` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int NOT NULL,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `assetindexingsessions`
--

CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `assets`
--

CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `size` bigint UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES
(7, 1, 5, 1, 'image-avatar.png', 'image', NULL, 132, 132, 20308, NULL, NULL, NULL, '2022-07-17 11:46:41', '2022-07-17 11:46:41', '2022-07-17 11:46:41'),
(9, 1, 5, 1, 'image-avatar_2022-07-17-114858_qaol.png', 'image', NULL, 132, 132, 20308, NULL, NULL, NULL, '2022-07-17 11:48:58', '2022-07-17 11:48:58', '2022-07-17 11:48:58'),
(12, 1, 2, 1, 'image-equilibrium.jpg', 'image', NULL, 604, 604, 14558, NULL, NULL, NULL, '2022-07-17 11:50:12', '2022-07-17 11:50:12', '2022-07-17 11:50:12'),
(27, 1, 2, 1, 'text.png', 'image', NULL, 1024, 1024, 45664, NULL, NULL, NULL, '2022-07-17 16:05:00', '2022-07-17 16:05:00', '2022-07-17 16:05:00');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int NOT NULL,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `categorygroups`
--

INSERT INTO `categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `defaultPlacement`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 3, 'Nft Categories', 'nftCategories', 'end', '2022-07-17 09:48:00', '2022-07-17 09:48:00', NULL, '3b2c274d-1f6d-416f-805f-40e537ae16bc');

-- --------------------------------------------------------

--
-- Structure de la table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `categorygroups_sites`
--

INSERT INTO `categorygroups_sites` (`id`, `groupId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'nft-categories/{slug}', 'nft/_entry', '2022-07-17 09:48:00', '2022-07-17 09:48:00', '743065d5-5616-4433-bdc3-ed6e962fa5d2');

-- --------------------------------------------------------

--
-- Structure de la table `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 'postDate', '2022-07-17 10:11:28', 0, 1),
(2, 1, 'slug', '2022-07-17 10:11:27', 0, 1),
(2, 1, 'title', '2022-07-17 10:11:27', 0, 1),
(2, 1, 'uri', '2022-07-17 10:11:27', 0, 1),
(4, 1, 'fieldLayoutId', '2022-07-17 10:11:59', 0, 1),
(4, 1, 'slug', '2022-07-17 11:19:38', 0, 1),
(4, 1, 'title', '2022-07-17 11:19:38', 0, 1),
(4, 1, 'typeId', '2022-07-17 10:11:59', 0, 1),
(4, 1, 'uri', '2022-07-17 11:19:38', 0, 1),
(6, 1, 'fieldLayoutId', '2022-07-17 11:43:17', 0, 1),
(6, 1, 'slug', '2022-07-17 11:46:51', 0, 1),
(6, 1, 'title', '2022-07-17 11:46:51', 0, 1),
(6, 1, 'typeId', '2022-07-17 11:43:17', 0, 1),
(6, 1, 'uri', '2022-07-17 11:46:51', 0, 1),
(8, 1, 'fieldLayoutId', '2022-07-17 11:48:43', 0, 1),
(8, 1, 'postDate', '2022-07-17 11:49:08', 0, 1),
(8, 1, 'slug', '2022-07-17 11:49:07', 0, 1),
(8, 1, 'title', '2022-07-17 11:49:07', 0, 1),
(8, 1, 'typeId', '2022-07-17 11:48:43', 0, 1),
(8, 1, 'uri', '2022-07-17 11:49:07', 0, 1),
(11, 1, 'postDate', '2022-07-17 11:50:35', 0, 1),
(11, 1, 'slug', '2022-07-17 11:49:29', 0, 1),
(11, 1, 'title', '2022-07-17 14:14:02', 0, 1),
(11, 1, 'uri', '2022-07-17 11:49:29', 0, 1),
(26, 1, 'postDate', '2022-07-17 16:05:14', 0, 1),
(26, 1, 'slug', '2022-07-17 16:04:08', 0, 1),
(26, 1, 'title', '2022-07-17 16:04:08', 0, 1),
(26, 1, 'uri', '2022-07-17 16:04:08', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(4, 1, 1, '2022-07-17 11:19:38', 0, 1),
(4, 1, 2, '2022-07-17 11:19:38', 0, 1),
(4, 1, 3, '2022-07-17 11:19:38', 0, 1),
(4, 1, 4, '2022-07-17 11:19:38', 0, 1),
(4, 1, 5, '2022-07-17 11:19:38', 0, 1),
(4, 1, 6, '2022-07-17 11:19:38', 0, 1),
(4, 1, 7, '2022-07-17 11:19:38', 0, 1),
(4, 1, 8, '2022-07-17 11:19:38', 0, 1),
(6, 1, 6, '2022-07-17 11:46:42', 0, 1),
(6, 1, 7, '2022-07-17 11:46:42', 0, 1),
(6, 1, 8, '2022-07-17 11:46:42', 0, 1),
(8, 1, 6, '2022-07-17 11:48:59', 0, 1),
(8, 1, 7, '2022-07-17 11:48:59', 0, 1),
(8, 1, 8, '2022-07-17 11:48:59', 0, 1),
(11, 1, 1, '2022-07-17 11:49:58', 0, 1),
(11, 1, 2, '2022-07-17 11:49:33', 0, 1),
(11, 1, 3, '2022-07-17 11:50:13', 0, 1),
(11, 1, 4, '2022-07-17 12:43:15', 0, 1),
(11, 1, 5, '2022-07-17 11:50:28', 0, 1),
(11, 1, 9, '2022-07-17 11:49:38', 0, 1),
(11, 1, 10, '2022-07-17 11:50:32', 0, 1),
(26, 1, 1, '2022-07-17 16:04:26', 0, 1),
(26, 1, 2, '2022-07-17 16:04:16', 0, 1),
(26, 1, 3, '2022-07-17 16:05:01', 0, 1),
(26, 1, 4, '2022-07-17 16:04:28', 0, 1),
(26, 1, 5, '2022-07-17 16:05:08', 0, 1),
(26, 1, 9, '2022-07-17 16:04:19', 0, 1),
(26, 1, 10, '2022-07-17 16:05:12', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `content`
--

CREATE TABLE `content` (
  `id` int NOT NULL,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_summary_jmgdiezq` varchar(1020) DEFAULT NULL,
  `field_nftTitle_qzcpczut` varchar(400) DEFAULT NULL,
  `field_price_fsagtzih` decimal(15,5) DEFAULT NULL,
  `field_createdAt_xlyvuxbv` datetime DEFAULT NULL,
  `field_user_name_rznsdgey` varchar(400) DEFAULT NULL,
  `field_link_website_hwaovoir` varchar(255) DEFAULT NULL,
  `field_idNft_mfbtfiqq` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_summary_jmgdiezq`, `field_nftTitle_qzcpczut`, `field_price_fsagtzih`, `field_createdAt_xlyvuxbv`, `field_user_name_rznsdgey`, `field_link_website_hwaovoir`, `field_idNft_mfbtfiqq`) VALUES
(1, 1, 1, NULL, '2022-07-17 08:53:29', '2022-07-17 08:53:29', 'd2cd1568-501c-4258-8c9f-ab6d4a5138f0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, 'First nft', '2022-07-17 09:43:00', '2022-07-17 10:11:28', '88826561-d9fe-4bc1-ab11-50e253100f47', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 1, 'First nft', '2022-07-17 10:11:28', '2022-07-17 10:11:28', 'ee0893ee-b2a5-4e55-9d8e-22b2715ae053', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 1, 'Equilibrium', '2022-07-17 10:11:56', '2022-07-17 11:19:38', '34fa776c-db03-4b9c-add4-b91c3f25a0f5', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 1, NULL, '2022-07-17 11:42:33', '2022-07-17 11:42:33', '19eafd11-07d7-4f8a-8ad6-49681181f9b1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 1, 'Jules', '2022-07-17 11:43:11', '2022-07-17 11:46:51', '163ff279-6f76-49c1-ac1f-d817542f2586', NULL, NULL, NULL, NULL, 'Jules Wyvern', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley', NULL),
(7, 7, 1, 'Image avatar', '2022-07-17 11:46:41', '2022-07-17 11:46:41', 'fe8cc20f-07be-47db-a747-1b65b5f545e2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 8, 1, 'Jules', '2022-07-17 11:48:40', '2022-07-17 11:49:08', '6945d943-ee9b-431f-94be-66241ea21a01', NULL, NULL, NULL, NULL, 'Jules Wyvern', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley', NULL),
(9, 9, 1, 'Image avatar', '2022-07-17 11:48:58', '2022-07-17 11:48:58', '31f1d419-c490-4725-b3b9-55ef09139d29', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 10, 1, 'Jules', '2022-07-17 11:49:08', '2022-07-17 11:49:08', '07e6ca07-171e-4a04-823b-b2e235b2f47c', NULL, NULL, NULL, NULL, 'Jules Wyvern', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley', NULL),
(11, 11, 1, 'Equilibrium', '2022-07-17 11:49:11', '2022-07-17 14:14:02', 'a7b64def-1933-4b60-b962-bfa5f97cd70a', 'Our equilibrium collection promotes balances and calm', 'Equilibrium', '0.04100', '2022-07-14 07:00:00', NULL, NULL, 3429),
(12, 12, 1, 'Image equilibrium', '2022-07-17 11:50:12', '2022-07-17 11:50:12', 'e6bef440-2322-4f49-8d4e-2d32c8f5e2ce', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 13, 1, 'Equilibrium', '2022-07-17 11:50:35', '2022-07-17 11:50:35', 'eba37ae1-bb0d-43d9-9b8a-b6d42f8f7ce7', 'Our equilibrium collection promotes balances and calm', 'Equilibrium', '0.00000', '2022-07-14 07:00:00', NULL, NULL, 3429),
(15, 15, 1, 'Equilibrium', '2022-07-17 12:41:55', '2022-07-17 12:41:55', 'd451e125-5168-4008-a3ee-dd5d908eaf4d', 'Our equilibrium collection promotes balances and calm', 'Equilibrium', '0.00000', '2022-07-14 07:00:00', NULL, NULL, 3429),
(17, 17, 1, 'Equilibrium', '2022-07-17 12:43:15', '2022-07-17 12:43:15', 'f3e8eb2b-fe8d-40d5-8bbb-ab1eec60f8aa', 'Our equilibrium collection promotes balances and calm', 'Equilibrium', '0.04100', '2022-07-14 07:00:00', NULL, NULL, 3429),
(19, 19, 1, '3429', '2022-07-17 14:11:55', '2022-07-17 14:11:55', '3551842e-af8b-4c30-80e3-aa9783437bf0', 'Our equilibrium collection promotes balances and calm', 'Equilibrium', '0.04100', '2022-07-14 07:00:00', NULL, NULL, 3429),
(21, 21, 1, 'Equilibrium', '2022-07-17 14:14:02', '2022-07-17 14:14:02', 'b4ebfca1-cc6a-41c5-8a43-cb5461dfaf95', 'Our equilibrium collection promotes balances and calm', 'Equilibrium', '0.04100', '2022-07-14 07:00:00', NULL, NULL, 3429),
(22, 22, 1, 'Index', '2022-07-17 15:53:13', '2022-07-17 15:53:40', '1dd9752d-f79a-4aed-8f94-de9a0e086d1a', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 23, 1, 'Index', '2022-07-17 15:53:13', '2022-07-17 15:53:13', 'fd8f72f9-973d-418c-b731-34f40b84a3da', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 24, 1, 'Index', '2022-07-17 15:53:13', '2022-07-17 15:53:13', '684afa13-8065-42bd-a7dd-5a4598311457', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 25, 1, 'Index', '2022-07-17 15:53:40', '2022-07-17 15:53:40', '5cf2a325-2477-475c-9c7c-23e649a306c6', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 26, 1, 'Equilibrium 2', '2022-07-17 16:03:59', '2022-07-17 16:05:14', 'a17fa904-8323-4081-8b8c-b99de7eed95c', 'Blabla', 'Equilibrium', '0.00450', '2022-07-29 07:00:00', NULL, NULL, 3429),
(27, 27, 1, 'Text', '2022-07-17 16:05:00', '2022-07-17 16:05:00', 'c85df4db-f5d9-4686-ba31-c0fbc2f41a34', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 28, 1, 'Equilibrium 2', '2022-07-17 16:05:14', '2022-07-17 16:05:14', 'f24747d2-b2cc-4461-9d3b-b5d288d99979', 'Blabla', 'Equilibrium', '0.00450', '2022-07-29 07:00:00', NULL, NULL, 3429);

-- --------------------------------------------------------

--
-- Structure de la table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint UNSIGNED DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `drafts`
--

CREATE TABLE `drafts` (
  `id` int NOT NULL,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `drafts`
--

INSERT INTO `drafts` (`id`, `canonicalId`, `creatorId`, `provisional`, `name`, `notes`, `trackChanges`, `dateLastMerged`, `saved`) VALUES
(2, NULL, 1, 0, 'Premier brouillon', '', 0, NULL, 1),
(3, NULL, 1, 0, 'Premier brouillon', NULL, 0, NULL, 0),
(4, NULL, 1, 0, 'Premier brouillon', '', 0, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `elements`
--

CREATE TABLE `elements` (
  `id` int NOT NULL,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-07-17 08:53:29', '2022-07-17 08:53:29', NULL, NULL, 'cb61868a-2865-447c-acad-8f5c955c9b97'),
(2, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-07-17 09:43:00', '2022-07-17 10:11:28', NULL, '2022-07-17 11:48:35', '8443f4e6-9956-4b56-bcb2-8568d15c674c'),
(3, 2, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2022-07-17 10:11:28', '2022-07-17 10:11:28', NULL, '2022-07-17 11:48:35', '6eeb21a8-568d-4ceb-bbcb-e4add463275e'),
(4, NULL, 2, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2022-07-17 10:11:56', '2022-07-17 11:19:38', NULL, '2022-07-17 11:42:05', '434aaeb4-0ccd-432b-9be7-c3dd8e4d5082'),
(5, NULL, 3, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-07-17 11:42:33', '2022-07-17 11:42:33', NULL, '2022-07-17 11:48:35', 'ffd67d67-a239-420a-b297-d2c077fcc36a'),
(6, NULL, 4, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2022-07-17 11:43:11', '2022-07-17 11:46:51', NULL, '2022-07-17 11:47:29', '779b7f71-3717-4fa2-bb74-5b245bc71cdd'),
(7, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2022-07-17 11:46:41', '2022-07-17 11:46:41', NULL, NULL, '31fb046a-aac6-49aa-bd83-2c4db1a0e324'),
(8, NULL, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2022-07-17 11:48:40', '2022-07-17 11:49:08', NULL, NULL, 'ece42962-9984-400a-a501-5e39c536fbe0'),
(9, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2022-07-17 11:48:58', '2022-07-17 11:48:58', NULL, NULL, 'da337e58-24cd-4b3d-a4ae-b9f26aa8ee1f'),
(10, 8, NULL, 2, 6, 'craft\\elements\\Entry', 1, 0, '2022-07-17 11:49:08', '2022-07-17 11:49:08', NULL, NULL, 'e8de70e0-f32e-45de-8bbf-c846e083a566'),
(11, NULL, NULL, NULL, 5, 'craft\\elements\\Entry', 1, 0, '2022-07-17 11:49:11', '2022-07-17 14:14:02', NULL, NULL, '9149d3a7-308e-4c86-bb80-7c55b56411f4'),
(12, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2022-07-17 11:50:12', '2022-07-17 11:50:12', NULL, NULL, 'dc84d809-b28d-4bdd-82d5-e8aa8e9af890'),
(13, 11, NULL, 3, 5, 'craft\\elements\\Entry', 1, 0, '2022-07-17 11:50:35', '2022-07-17 11:50:35', NULL, NULL, '2a0e38ac-9af7-4a8a-98a1-5ce1b8dc83c7'),
(15, 11, NULL, 4, 5, 'craft\\elements\\Entry', 1, 0, '2022-07-17 12:41:55', '2022-07-17 12:41:55', NULL, NULL, 'a4991916-1405-438e-b6ad-5c2b53005738'),
(17, 11, NULL, 5, 5, 'craft\\elements\\Entry', 1, 0, '2022-07-17 12:43:15', '2022-07-17 12:43:15', NULL, NULL, 'd42217b5-5d02-45e9-8c77-2b4f5a393536'),
(19, 11, NULL, 6, 5, 'craft\\elements\\Entry', 1, 0, '2022-07-17 14:11:55', '2022-07-17 14:11:55', NULL, NULL, '666f23c1-73a7-4ed8-8ad7-ecbd198eeb63'),
(21, 11, NULL, 7, 5, 'craft\\elements\\Entry', 1, 0, '2022-07-17 14:14:02', '2022-07-17 14:14:02', NULL, NULL, '7bf32593-865a-475d-9b22-2351cf2c9137'),
(22, NULL, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2022-07-17 15:53:13', '2022-07-17 15:53:40', NULL, NULL, '00b46f2d-6e1c-47d2-8325-d12fbc6e6fcd'),
(23, 22, NULL, 8, 8, 'craft\\elements\\Entry', 1, 0, '2022-07-17 15:53:13', '2022-07-17 15:53:13', NULL, NULL, '731f608b-9826-4758-94e6-d0b5ba95e400'),
(24, 22, NULL, 9, 8, 'craft\\elements\\Entry', 1, 0, '2022-07-17 15:53:13', '2022-07-17 15:53:13', NULL, NULL, '5ec46fca-3f10-4246-adb6-5d00aee1d9a5'),
(25, 22, NULL, 10, 8, 'craft\\elements\\Entry', 1, 0, '2022-07-17 15:53:40', '2022-07-17 15:53:40', NULL, NULL, '6f5d70b4-1737-404e-b017-0da5e8910bc9'),
(26, NULL, NULL, NULL, 5, 'craft\\elements\\Entry', 1, 0, '2022-07-17 16:03:59', '2022-07-17 16:05:14', NULL, '2022-07-17 16:06:08', '8844798c-a9af-4342-bd67-1dcec3b78cb0'),
(27, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2022-07-17 16:05:00', '2022-07-17 16:05:00', NULL, NULL, 'a5422155-21a7-46bd-8c40-327828cd5962'),
(28, 26, NULL, 11, 5, 'craft\\elements\\Entry', 1, 0, '2022-07-17 16:05:14', '2022-07-17 16:05:14', NULL, '2022-07-17 16:06:08', '5880caba-178a-4de2-bc79-36dacf5fc795');

-- --------------------------------------------------------

--
-- Structure de la table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int NOT NULL,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2022-07-17 08:53:29', '2022-07-17 08:53:29', '644ebc32-88c9-4a30-908a-c859c49bb0b1'),
(2, 2, 1, 'first-nft', 'nft/first-nft', 1, '2022-07-17 09:43:00', '2022-07-17 10:11:27', 'a8c72f61-c40c-4058-8ce7-4d97c2ffab02'),
(3, 3, 1, 'first-nft', 'nft/first-nft', 1, '2022-07-17 10:11:28', '2022-07-17 10:11:28', '2bcb8b9a-18d0-45bb-b0ab-ab3fe0d8b619'),
(4, 4, 1, '__temp_zqxlagpatespfonebdurvbhzrjzsolneurso', 'nft/__temp_zqxlagpatespfonebdurvbhzrjzsolneurso', 1, '2022-07-17 10:11:56', '2022-07-17 11:19:38', 'bbff08c4-2e6a-45e4-afad-7ecde5d5fe6c'),
(5, 5, 1, '__temp_ubsdxsgkgcckqwcrzpxqsmsddpgbicirhzvb', 'nft/__temp_ubsdxsgkgcckqwcrzpxqsmsddpgbicirhzvb', 1, '2022-07-17 11:42:33', '2022-07-17 11:42:33', 'd3e32dfa-b2d8-4095-9dee-08970d830ec0'),
(6, 6, 1, 'jules', 'nft/jules', 1, '2022-07-17 11:43:11', '2022-07-17 11:46:51', 'a98f22f6-0435-4ae9-9eae-f41585c4e236'),
(7, 7, 1, NULL, NULL, 1, '2022-07-17 11:46:41', '2022-07-17 11:46:41', '8dc51b84-b3f3-4bec-87f4-02053219227b'),
(8, 8, 1, 'jules', 'nft/jules', 1, '2022-07-17 11:48:40', '2022-07-17 11:49:07', 'cafbf890-c22a-4936-b97d-7955eeeede22'),
(9, 9, 1, NULL, NULL, 1, '2022-07-17 11:48:58', '2022-07-17 11:48:58', 'e968aecc-198e-4f01-84f8-5e169d93f2a9'),
(10, 10, 1, 'jules', 'nft/jules', 1, '2022-07-17 11:49:08', '2022-07-17 11:49:08', '632e7b3b-d893-47ca-9362-490c1314bacf'),
(11, 11, 1, 'equilibrium', 'nft/equilibrium', 1, '2022-07-17 11:49:11', '2022-07-17 11:49:29', '4695bd13-20e1-4ad0-88d4-6025d18480df'),
(12, 12, 1, NULL, NULL, 1, '2022-07-17 11:50:12', '2022-07-17 11:50:12', 'cd4984de-937e-4bfb-b57f-3db13116472c'),
(13, 13, 1, 'equilibrium', 'nft/equilibrium', 1, '2022-07-17 11:50:35', '2022-07-17 11:50:35', '3661b163-c06d-4379-93ad-450253b196e9'),
(15, 15, 1, 'equilibrium', 'nft/equilibrium', 1, '2022-07-17 12:41:55', '2022-07-17 12:41:55', 'ef150943-dda8-4a1d-a327-8df7504a5716'),
(17, 17, 1, 'equilibrium', 'nft/equilibrium', 1, '2022-07-17 12:43:15', '2022-07-17 12:43:15', '0fea8382-7807-4eb9-b63b-cf8ae1f2bc4a'),
(19, 19, 1, 'equilibrium', 'nft/equilibrium', 1, '2022-07-17 14:11:55', '2022-07-17 14:11:55', 'dc2274f3-c835-439e-ae2c-a48edfa9fb4b'),
(21, 21, 1, 'equilibrium', 'nft/equilibrium', 1, '2022-07-17 14:14:02', '2022-07-17 14:14:02', '0a90ce05-5f56-4beb-b887-d5f60b7cdd2a'),
(22, 22, 1, 'index', '__home__', 1, '2022-07-17 15:53:13', '2022-07-17 15:53:13', 'a82ebdf6-a4b0-4e2e-b5b4-c8cee7c48990'),
(23, 23, 1, 'index', '__home__', 1, '2022-07-17 15:53:13', '2022-07-17 15:53:13', '586b4e2e-b409-46ce-9b35-5644a133516c'),
(24, 24, 1, 'index', '__home__', 1, '2022-07-17 15:53:13', '2022-07-17 15:53:13', 'a6f17847-1d97-4a0c-aec7-3c5151605a98'),
(25, 25, 1, 'index', '__home__', 1, '2022-07-17 15:53:40', '2022-07-17 15:53:40', '79cc7214-236f-4088-958c-8cc1537f84f8'),
(26, 26, 1, 'equilibrium-2', 'nft/equilibrium-2', 1, '2022-07-17 16:03:59', '2022-07-17 16:04:08', 'd9193ded-cbd3-4fca-804a-4b5dff6be1d7'),
(27, 27, 1, NULL, NULL, 1, '2022-07-17 16:05:00', '2022-07-17 16:05:00', 'c7132403-dbdd-48d2-9a79-45bce69189ff'),
(28, 28, 1, 'equilibrium-2', 'nft/equilibrium-2', 1, '2022-07-17 16:05:14', '2022-07-17 16:05:14', '29813a8e-194e-4d84-a7fc-94d1c0f402a7');

-- --------------------------------------------------------

--
-- Structure de la table `entries`
--

CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES
(2, 1, NULL, 1, 1, '2022-07-17 10:11:00', NULL, 1, '2022-07-17 09:43:00', '2022-07-17 10:11:28'),
(3, 1, NULL, 1, 1, '2022-07-17 10:11:00', NULL, NULL, '2022-07-17 10:11:28', '2022-07-17 10:11:28'),
(4, 1, NULL, 2, 1, '2022-07-17 10:11:56', NULL, 1, '2022-07-17 10:11:56', '2022-07-17 10:11:59'),
(5, 1, NULL, 1, 1, '2022-07-17 11:42:33', NULL, 1, '2022-07-17 11:42:33', '2022-07-17 11:42:33'),
(6, 1, NULL, 4, 1, '2022-07-17 11:43:11', NULL, 0, '2022-07-17 11:43:11', '2022-07-17 11:43:17'),
(8, 1, NULL, 4, 1, '2022-07-17 11:49:00', NULL, NULL, '2022-07-17 11:48:40', '2022-07-17 11:49:08'),
(10, 1, NULL, 4, 1, '2022-07-17 11:49:00', NULL, NULL, '2022-07-17 11:49:08', '2022-07-17 11:49:08'),
(11, 1, NULL, 3, 1, '2022-07-17 11:50:00', NULL, NULL, '2022-07-17 11:49:11', '2022-07-17 11:50:35'),
(13, 1, NULL, 3, 1, '2022-07-17 11:50:00', NULL, NULL, '2022-07-17 11:50:35', '2022-07-17 11:50:35'),
(15, 1, NULL, 3, 1, '2022-07-17 11:50:00', NULL, NULL, '2022-07-17 12:41:55', '2022-07-17 12:41:55'),
(17, 1, NULL, 3, 1, '2022-07-17 11:50:00', NULL, NULL, '2022-07-17 12:43:15', '2022-07-17 12:43:15'),
(19, 1, NULL, 3, 1, '2022-07-17 11:50:00', NULL, NULL, '2022-07-17 14:11:55', '2022-07-17 14:11:55'),
(21, 1, NULL, 3, 1, '2022-07-17 11:50:00', NULL, NULL, '2022-07-17 14:14:02', '2022-07-17 14:14:02'),
(22, 2, NULL, 6, NULL, '2022-07-17 15:53:00', NULL, NULL, '2022-07-17 15:53:13', '2022-07-17 15:53:13'),
(23, 2, NULL, 6, NULL, '2022-07-17 15:53:00', NULL, NULL, '2022-07-17 15:53:13', '2022-07-17 15:53:13'),
(24, 2, NULL, 6, NULL, '2022-07-17 15:53:00', NULL, NULL, '2022-07-17 15:53:13', '2022-07-17 15:53:13'),
(25, 2, NULL, 6, NULL, '2022-07-17 15:53:00', NULL, NULL, '2022-07-17 15:53:40', '2022-07-17 15:53:40'),
(26, 1, NULL, 3, 1, '2022-07-17 16:05:00', NULL, 0, '2022-07-17 16:03:59', '2022-07-17 16:05:14'),
(28, 1, NULL, 3, 1, '2022-07-17 16:05:00', NULL, NULL, '2022-07-17 16:05:14', '2022-07-17 16:05:14');

-- --------------------------------------------------------

--
-- Structure de la table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Par défaut', 'default', 1, 'site', NULL, NULL, 1, '2022-07-17 09:40:45', '2022-07-17 09:40:45', '2022-07-17 11:48:35', 'e57d8822-c2b3-421d-8d6d-c2498ecddf49'),
(2, 1, 4, 'nft + user', 'nftUser', 1, 'site', NULL, NULL, 2, '2022-07-17 10:05:13', '2022-07-17 10:05:13', '2022-07-17 11:42:05', 'e80f0307-2685-4edb-b0d9-2344a48f645d'),
(3, 1, 5, 'Nft', 'nft', 1, 'site', NULL, NULL, 3, '2022-07-17 11:21:44', '2022-07-17 11:21:44', NULL, 'd09afab7-de3f-4d51-ba36-990d4ac99897'),
(4, 1, 6, 'User', 'user', 1, 'site', NULL, NULL, 4, '2022-07-17 11:42:29', '2022-07-17 11:42:29', NULL, 'dcbafd02-7384-4490-b22e-3e7a7d088db8'),
(5, 1, 7, 'nftIndex', 'nftIndex', 1, 'site', NULL, NULL, 5, '2022-07-17 15:51:14', '2022-07-17 15:51:14', '2022-07-17 15:51:47', 'a3659717-d3c5-4d4e-b5b6-75cdb27924d4'),
(6, 2, 8, 'Index', 'index', 1, 'site', NULL, '{section.name|raw}', 1, '2022-07-17 15:53:13', '2022-07-17 15:53:40', NULL, '104db1cc-2572-4a13-b654-0cc201d5cc33');

-- --------------------------------------------------------

--
-- Structure de la table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2022-07-17 08:53:29', '2022-07-17 08:53:29', NULL, '4ea1e33c-b05e-4821-adfe-8a5bda2c66c1'),
(2, 'Nft', '2022-07-17 09:49:32', '2022-07-17 10:02:59', NULL, 'cef4e03d-69e6-4316-906a-24b1252e9b66'),
(3, 'User', '2022-07-17 09:59:00', '2022-07-17 10:03:05', NULL, '32207b74-0b22-4f2e-85a5-865e055cebe0');

-- --------------------------------------------------------

--
-- Structure de la table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(23, 4, 9, 9, 0, 1, '2022-07-17 11:40:42', '2022-07-17 11:40:42', '1abb6db8-f64e-46e7-b10d-131e8cb53f96'),
(24, 4, 9, 2, 0, 2, '2022-07-17 11:40:42', '2022-07-17 11:40:42', 'b1de1187-832f-4eb5-ad1a-60a2de729a89'),
(25, 4, 9, 1, 0, 3, '2022-07-17 11:40:42', '2022-07-17 11:40:42', 'badd19ea-cbb6-4016-8c7b-d64e7c8860cf'),
(26, 4, 9, 4, 0, 4, '2022-07-17 11:40:42', '2022-07-17 11:40:42', '81f5bb01-39df-456a-bcab-d382b1850a04'),
(27, 4, 9, 3, 0, 5, '2022-07-17 11:40:42', '2022-07-17 11:40:42', '12354ef0-b185-4b40-af29-81499f8cd8cb'),
(28, 4, 9, 5, 0, 6, '2022-07-17 11:40:42', '2022-07-17 11:40:42', '0aa1bed4-3a58-4337-87ca-84b20644e726'),
(29, 4, 9, 10, 0, 7, '2022-07-17 11:40:42', '2022-07-17 11:40:42', '1f0a3fde-735f-4c1c-acda-e870df36158e'),
(30, 4, 10, 6, 0, 0, '2022-07-17 11:40:42', '2022-07-17 11:40:42', '75ab4515-b586-4bda-a63e-260d393d51d9'),
(31, 4, 10, 8, 0, 1, '2022-07-17 11:40:42', '2022-07-17 11:40:42', '0ba96475-0916-4fa2-af3a-9f2ac892c8bc'),
(32, 4, 10, 7, 0, 2, '2022-07-17 11:40:42', '2022-07-17 11:40:42', '19ba52cd-f1b4-4105-b9c6-b7cdad6fb8be'),
(33, 5, 11, 2, 0, 1, '2022-07-17 11:40:48', '2022-07-17 11:40:48', '10a7c6a5-b62f-499a-a5eb-a3b9f0eb27ea'),
(34, 5, 11, 9, 0, 2, '2022-07-17 11:40:48', '2022-07-17 11:40:48', '353e9648-2b7f-4016-ab87-d0df468eb20b'),
(35, 5, 11, 1, 0, 3, '2022-07-17 11:40:48', '2022-07-17 11:40:48', '042e1c80-46de-4645-b0a8-ad74e9b31d3b'),
(36, 5, 11, 4, 0, 4, '2022-07-17 11:40:48', '2022-07-17 11:40:48', 'fde38897-5d4d-445d-96af-b1b4c154fc7f'),
(37, 5, 11, 3, 0, 5, '2022-07-17 11:40:48', '2022-07-17 11:40:48', '3c5c8cba-31a8-4824-9bff-d978d215d306'),
(38, 5, 11, 5, 0, 6, '2022-07-17 11:40:48', '2022-07-17 11:40:48', 'aff9cde2-fb1a-4a16-a593-764d84900f6b'),
(39, 5, 11, 10, 0, 7, '2022-07-17 11:40:48', '2022-07-17 11:40:48', 'ddbb1cdd-ba1c-4d24-97ae-9fb427eab072'),
(43, 6, 13, 6, 0, 0, '2022-07-17 11:48:30', '2022-07-17 11:48:30', 'c40994c6-7059-49da-894d-443dd100f89a'),
(44, 6, 13, 8, 0, 1, '2022-07-17 11:48:30', '2022-07-17 11:48:30', '0f6c56f3-8a25-47b2-944a-32f058098a86'),
(45, 6, 13, 7, 0, 2, '2022-07-17 11:48:30', '2022-07-17 11:48:30', 'ddb6f952-f486-4f8f-9b86-84c82d650b41'),
(46, 7, 14, 2, 0, 1, '2022-07-17 15:51:14', '2022-07-17 15:51:14', '4d9cd187-e11d-4c56-afc7-38de7cde7f02'),
(47, 7, 14, 9, 0, 2, '2022-07-17 15:51:14', '2022-07-17 15:51:14', '7441d0c3-059b-4ab6-8114-b91c808e3041'),
(48, 7, 14, 4, 0, 3, '2022-07-17 15:51:14', '2022-07-17 15:51:14', 'ed3dc54d-b58e-469e-b3f7-b47ac1c99c1e'),
(49, 7, 14, 3, 0, 4, '2022-07-17 15:51:14', '2022-07-17 15:51:14', 'bce2f314-6014-42ba-8774-dd6266413de7'),
(50, 7, 14, 5, 0, 5, '2022-07-17 15:51:14', '2022-07-17 15:51:14', 'e3f58a0b-647c-4d24-84f9-5b08ed2325dd'),
(51, 7, 14, 1, 0, 6, '2022-07-17 15:51:14', '2022-07-17 15:51:14', '74a5e7cd-b47d-44ca-965f-f23374268846'),
(52, 7, 14, 10, 0, 7, '2022-07-17 15:51:14', '2022-07-17 15:51:14', '8db6d817-e6f1-4186-8cff-adb1dfefffb5'),
(53, 7, 15, 7, 0, 0, '2022-07-17 15:51:14', '2022-07-17 15:51:14', '26745e29-28db-4517-8a33-c804e6a1439a'),
(54, 7, 15, 8, 0, 1, '2022-07-17 15:51:14', '2022-07-17 15:51:14', 'e5197d09-20d4-4a75-bdda-4d75f31bcbd6'),
(55, 7, 15, 6, 0, 2, '2022-07-17 15:51:14', '2022-07-17 15:51:14', '6919b21a-3742-4093-ba78-75b58c8e1f5c'),
(56, 8, 17, 2, 0, 1, '2022-07-17 15:53:40', '2022-07-17 15:53:40', '59a039aa-caec-41f2-a7c7-27ee3b499e6a'),
(57, 8, 17, 4, 0, 2, '2022-07-17 15:53:40', '2022-07-17 15:53:40', '5b944283-02c7-4956-8c47-e4d848cd69ec'),
(58, 8, 17, 1, 0, 3, '2022-07-17 15:53:40', '2022-07-17 15:53:40', 'f7dcbbaf-4f7b-44cd-a6cb-4d42a2982192'),
(59, 8, 17, 5, 0, 4, '2022-07-17 15:53:40', '2022-07-17 15:53:40', '55b17ee4-869e-49ac-aa03-d5edca3a3aa3'),
(60, 8, 17, 3, 0, 5, '2022-07-17 15:53:40', '2022-07-17 15:53:40', '8c0d05c1-d0e1-4046-804c-68ea029ede74'),
(61, 8, 17, 10, 0, 6, '2022-07-17 15:53:40', '2022-07-17 15:53:40', '56ffd85c-ee11-46cc-9aaf-7f72e58b694f'),
(62, 8, 17, 9, 0, 7, '2022-07-17 15:53:40', '2022-07-17 15:53:40', '4c100b0b-773b-4d0d-bb0d-249ae452a547');

-- --------------------------------------------------------

--
-- Structure de la table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2022-07-17 09:40:45', '2022-07-17 09:40:45', '2022-07-17 11:48:35', '5d522123-8be9-4afd-a644-bbe9ca24ea53'),
(2, 'craft\\elements\\Asset', '2022-07-17 09:45:46', '2022-07-17 09:45:46', NULL, '4e616811-9a89-4a9d-94db-e7b8877fcf6a'),
(3, 'craft\\elements\\Category', '2022-07-17 09:48:00', '2022-07-17 09:48:00', NULL, '4f57d17a-efdb-44cc-8ed9-4114e45d69a0'),
(4, 'craft\\elements\\Entry', '2022-07-17 10:05:13', '2022-07-17 10:05:13', '2022-07-17 11:42:05', 'a8299576-4a43-473e-8fa2-0ca2c5a881f9'),
(5, 'craft\\elements\\Entry', '2022-07-17 11:21:44', '2022-07-17 11:21:44', NULL, '0bba0059-87a7-49d6-8e34-29da73185ae9'),
(6, 'craft\\elements\\Entry', '2022-07-17 11:42:29', '2022-07-17 11:42:29', NULL, 'a1975f2f-37d0-4920-9eb1-acfd3b2f1c76'),
(7, 'craft\\elements\\Entry', '2022-07-17 15:51:14', '2022-07-17 15:51:14', '2022-07-17 15:51:47', '77991524-d339-4181-b04e-abbe2cb5647a'),
(8, 'craft\\elements\\Entry', '2022-07-17 15:53:13', '2022-07-17 15:53:13', NULL, '0d791a5a-3bac-4a52-adaf-dad737fd2b92');

-- --------------------------------------------------------

--
-- Structure de la table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL,
  `layoutId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `settings`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Contenu', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"950c6ed6-ca3d-48d1-8e94-fe88e594e113\",\"userCondition\":null,\"elementCondition\":null}]', 1, '2022-07-17 09:40:45', '2022-07-17 09:40:45', '645a0312-5988-4220-b591-2d134ccbf9ee'),
(2, 2, 'Contenu', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"54de9ce9-93e4-44b7-9d55-80123d636854\",\"userCondition\":null,\"elementCondition\":null}]', 1, '2022-07-17 09:45:46', '2022-07-17 09:45:46', '5c8d90f0-9af5-412f-88ef-db01d93340f9'),
(3, 3, 'Contenu', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"0b9c3033-decb-4459-9206-cb96d8b7dac2\",\"userCondition\":null,\"elementCondition\":null}]', 1, '2022-07-17 09:48:00', '2022-07-17 09:48:00', 'c7f070f4-2042-43c8-b937-e1d54786a3ed'),
(9, 4, 'nft', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"0bdcd95b-9c8e-4397-8424-a53100fd5c39\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"43854395-4280-4f29-bbde-d0ba0786cecd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"02d47f4e-e0c2-4e11-919b-e28fbec6c6cd\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5789afb5-9084-4fe6-92d2-283cf4ac1163\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"66b2de03-b9c2-4921-b712-b1f055b89d84\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"c36d0a44-f510-40a3-8ab9-7dedeac24ba0\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2ef9a91c-9a2a-4294-ba86-f07fbeaeb948\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"402f66a1-3a2e-4a60-846c-cdddcbc44a3e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2f711dd2-95ae-4aea-ae80-192cdd36586a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"69f74acd-cff1-4406-a8e5-2793e870a2bc\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d80e8b5c-68c7-4457-a2c2-3e0129571223\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"f53fa1d7-0a8b-4534-b407-d2e13343e650\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"017b7839-3240-4850-91b5-6ccf0b24b62c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"54594fba-a35a-4f3b-b010-556934fa317e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7c883bb3-613b-4fe9-afdb-29b1c42267aa\"}]', 1, '2022-07-17 11:40:42', '2022-07-17 11:40:42', 'cd7e5d8b-81b8-463e-90b4-ca9c055ec883'),
(10, 4, 'user', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"80401f1d-e116-43ab-81a4-d0f8ea02efa1\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"92b24058-4b01-4961-a1dd-6457076d917c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"c81caad6-8d79-4904-bed8-dddf82023ed6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"06c8692e-c9c9-4d70-a2c0-f7676000a036\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"710875d0-a9ef-4942-86ce-05fd4ae50d54\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8d7d41c0-c1cb-4103-a4cb-91ad103a54c1\"}]', 2, '2022-07-17 11:40:42', '2022-07-17 11:40:42', '70d7d5d6-e8ad-449c-8b3f-bc3c6c9dfb2a'),
(11, 5, 'Nft', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"c7a020a3-c321-4b9b-95ad-0cb06c883413\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"fc10f89c-d96e-479e-85f9-98c367b982f2\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"66b2de03-b9c2-4921-b712-b1f055b89d84\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"599df65f-4eb9-4339-86b6-ea6bfe41c9b4\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"02d47f4e-e0c2-4e11-919b-e28fbec6c6cd\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b01a0a45-63df-44f0-96c2-1aedcc1525f8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2ef9a91c-9a2a-4294-ba86-f07fbeaeb948\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"3525e884-9f4c-486f-91a7-dd0103f00600\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2f711dd2-95ae-4aea-ae80-192cdd36586a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"64891482-e5c9-4296-91b3-f8a6b460457f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d80e8b5c-68c7-4457-a2c2-3e0129571223\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"016a387f-4c89-4640-911c-80d3b5987a2c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"017b7839-3240-4850-91b5-6ccf0b24b62c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"72a1608f-2bee-4ff4-b2aa-226378c6e5fd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7c883bb3-613b-4fe9-afdb-29b1c42267aa\"}]', 1, '2022-07-17 11:40:48', '2022-07-17 11:40:48', 'd38d89be-ea25-46aa-8b82-d776ff25bfdb'),
(13, 6, 'User', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"ae4fb7d4-c920-42fa-9970-495b1cbc67df\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"92b24058-4b01-4961-a1dd-6457076d917c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"016f2622-7b31-42f4-81aa-2d1c68839cc3\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"06c8692e-c9c9-4d70-a2c0-f7676000a036\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"54fd96dd-3052-4ec9-a642-7f415dc83d7e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8d7d41c0-c1cb-4103-a4cb-91ad103a54c1\"}]', 1, '2022-07-17 11:48:30', '2022-07-17 11:48:30', '04b57bce-fb4b-4689-9946-428d39ef0e5c'),
(14, 7, 'Contenu', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"00f91c7b-08af-47c4-874a-7d4855e7181d\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"34dbb0dd-7dd0-48c9-ad77-79a23fdafa4d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"66b2de03-b9c2-4921-b712-b1f055b89d84\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5b5a2fb5-eea5-4f71-b623-341129ba7530\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"02d47f4e-e0c2-4e11-919b-e28fbec6c6cd\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"a59c907c-d9ae-4e63-8179-3793f5fb612c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2f711dd2-95ae-4aea-ae80-192cdd36586a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"86c49d25-58b9-4ff6-98b9-2c13969dc8cc\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d80e8b5c-68c7-4457-a2c2-3e0129571223\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"613711ef-d1d0-4824-b6c5-4574e5649500\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"017b7839-3240-4850-91b5-6ccf0b24b62c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"45e4b332-1319-4a92-be00-ab44466c197a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2ef9a91c-9a2a-4294-ba86-f07fbeaeb948\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"29dd3e55-2b73-4bba-9ccd-3dbfdbdcf706\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7c883bb3-613b-4fe9-afdb-29b1c42267aa\"}]', 1, '2022-07-17 15:51:14', '2022-07-17 15:51:14', 'ac460e7d-e131-4da6-9314-c7ec12462749'),
(15, 7, 'user', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"de18682f-9b52-45e9-942a-c4ee54415415\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8d7d41c0-c1cb-4103-a4cb-91ad103a54c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"a18c7705-c70b-4980-a019-70c4becdae46\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"06c8692e-c9c9-4d70-a2c0-f7676000a036\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"e1eb18c7-0c7c-46d3-8f21-540f0f838a02\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"92b24058-4b01-4961-a1dd-6457076d917c\"}]', 2, '2022-07-17 15:51:14', '2022-07-17 15:51:14', '9f9e63c7-6906-4842-be6b-77fe611930fa'),
(17, 8, 'Contenu', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"a387a610-2914-47ff-8c56-faab48e8ba90\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"750102cc-701c-4332-9fe9-eb492ec4c652\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"66b2de03-b9c2-4921-b712-b1f055b89d84\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"1144e677-e2b1-455a-ad37-396f0b0cce8b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2f711dd2-95ae-4aea-ae80-192cdd36586a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"d644430a-5f34-428a-a64d-317f3486a85c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2ef9a91c-9a2a-4294-ba86-f07fbeaeb948\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"79af322a-e0ab-4219-955f-a61862b8025e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"017b7839-3240-4850-91b5-6ccf0b24b62c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"783f2713-cd0e-457c-a5f2-a844c41215da\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d80e8b5c-68c7-4457-a2c2-3e0129571223\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"8420c060-a98c-4b4d-af09-89fa21b65f39\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7c883bb3-613b-4fe9-afdb-29b1c42267aa\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"eb40576e-44b4-4e03-899c-08298d0572ed\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"02d47f4e-e0c2-4e11-919b-e28fbec6c6cd\"}]', 1, '2022-07-17 15:53:40', '2022-07-17 15:53:40', '88de2926-545f-41a4-9a45-4dd4d52cd6e2');

-- --------------------------------------------------------

--
-- Structure de la table `fields`
--

CREATE TABLE `fields` (
  `id` int NOT NULL,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 'Summary', 'summary', 'global', 'jmgdiezq', 'Enter a brief, one or two sentences nft summary', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":255,\"code\":false,\"columnType\":null,\"initialRows\":1,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}', '2022-07-17 09:51:33', '2022-07-17 09:51:33', '2ef9a91c-9a2a-4294-ba86-f07fbeaeb948'),
(2, 2, 'Nft Title', 'nftTitle', 'global', 'qzcpczut', NULL, 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":100,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":\"Title to your nft\",\"uiMode\":\"normal\"}', '2022-07-17 09:52:36', '2022-07-17 09:52:36', '66b2de03-b9c2-4921-b712-b1f055b89d84'),
(3, 2, 'Feature Image', 'featureImage', 'global', NULL, NULL, 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:01d308de-4063-483b-89c4-5cb334f6cf97\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:01d308de-4063-483b-89c4-5cb334f6cf97\",\"restrictedLocationSubpath\":\"nft\",\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2022-07-17 09:54:37', '2022-07-17 09:54:37', 'd80e8b5c-68c7-4457-a2c2-3e0129571223'),
(4, 2, 'Price', 'price', 'global', 'fsagtzih', 'Eth Price of your nft', 0, 'none', NULL, 'craft\\fields\\Number', '{\"decimals\":5,\"defaultValue\":null,\"max\":null,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"suffix\":null}', '2022-07-17 09:55:40', '2022-07-17 12:43:03', '2f711dd2-95ae-4aea-ae80-192cdd36586a'),
(5, 2, 'created_at', 'createdAt', 'global', 'xlyvuxbv', NULL, 0, 'none', NULL, 'craft\\fields\\Date', '{\"max\":null,\"min\":null,\"minuteIncrement\":30,\"showDate\":true,\"showTime\":false,\"showTimeZone\":false}', '2022-07-17 09:56:54', '2022-07-17 09:56:54', '017b7839-3240-4850-91b5-6ccf0b24b62c'),
(6, 3, 'User name', 'user_name', 'global', 'rznsdgey', NULL, 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":100,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2022-07-17 09:59:45', '2022-07-17 09:59:45', '92b24058-4b01-4961-a1dd-6457076d917c'),
(7, 3, 'Image', 'image', 'global', NULL, NULL, 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:01d308de-4063-483b-89c4-5cb334f6cf97\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:01d308de-4063-483b-89c4-5cb334f6cf97\",\"restrictedLocationSubpath\":\"user\",\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2022-07-17 10:02:10', '2022-07-17 10:02:10', '8d7d41c0-c1cb-4103-a4cb-91ad103a54c1'),
(8, 3, 'link_website', 'link_website', 'global', 'hwaovoir', NULL, 0, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":255,\"types\":[\"url\"]}', '2022-07-17 10:02:40', '2022-07-17 10:02:40', '06c8692e-c9c9-4d70-a2c0-f7676000a036'),
(9, 2, 'Id nft', 'idNft', 'global', 'mfbtfiqq', 'Number nft', 0, 'none', NULL, 'craft\\fields\\Number', '{\"decimals\":0,\"defaultValue\":null,\"max\":null,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"suffix\":null}', '2022-07-17 11:20:41', '2022-07-17 12:41:16', '02d47f4e-e0c2-4e11-919b-e28fbec6c6cd'),
(10, 2, 'User info', 'userInfo', 'global', NULL, NULL, 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\TextFieldConditionRule\",\"uid\":\"1b77ce48-21a4-4742-aeb7-cea25b03afea\",\"operator\":\"=\",\"value\":\"\",\"fieldUid\":\"92b24058-4b01-4961-a1dd-6457076d917c\"},{\"class\":\"craft\\\\fields\\\\conditions\\\\TextFieldConditionRule\",\"uid\":\"581f8598-42b9-4403-b1e9-3a0230b5b2bb\",\"operator\":\"=\",\"value\":\"\",\"fieldUid\":\"06c8692e-c9c9-4d70-a2c0-f7676000a036\"},{\"class\":\"craft\\\\fields\\\\conditions\\\\RelationalFieldConditionRule\",\"uid\":\"f5cb1cc1-6653-4953-b756-984a54ff6821\",\"operator\":\"relatedTo\",\"fieldUid\":\"8d7d41c0-c1cb-4103-a4cb-91ad103a54c1\"}]},\"selectionLabel\":null,\"showSiteMenu\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2022-07-17 11:39:52', '2022-07-17 11:39:52', '7c883bb3-613b-4fe9-afdb-29b1c42267aa');

-- --------------------------------------------------------

--
-- Structure de la table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `imagetransformindex`
--

CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `imagetransformindex`
--

INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 7, 'craft\\imagetransforms\\ImageTransformer', 'image-avatar.png', NULL, '_34x34_crop_center-center_none', 1, 0, 0, NULL, '2022-07-17 11:46:41', '2022-07-17 11:46:41', '2c166a71-8ee7-4a35-81be-ca9811b2f0a3'),
(2, 7, 'craft\\imagetransforms\\ImageTransformer', 'image-avatar.png', NULL, '_68x68_crop_center-center_none', 1, 0, 0, NULL, '2022-07-17 11:46:41', '2022-07-17 11:46:41', '0c6e6017-0249-4ceb-baf9-e0263265b4b0'),
(3, 9, 'craft\\imagetransforms\\ImageTransformer', 'image-avatar_2022-07-17-114858_qaol.png', NULL, '_34x34_crop_center-center_none', 1, 0, 0, NULL, '2022-07-17 11:48:58', '2022-07-17 11:48:58', 'd7b6a22e-4ca9-4ee2-b048-1df098c19428'),
(4, 9, 'craft\\imagetransforms\\ImageTransformer', 'image-avatar_2022-07-17-114858_qaol.png', NULL, '_68x68_crop_center-center_none', 1, 0, 0, NULL, '2022-07-17 11:48:58', '2022-07-17 11:48:58', '96c6a593-2664-4b48-8015-ddb389c6cf48'),
(5, 12, 'craft\\imagetransforms\\ImageTransformer', 'image-equilibrium.jpg', NULL, '_34x34_crop_center-center_none', 1, 0, 0, NULL, '2022-07-17 11:50:12', '2022-07-17 11:50:12', 'aefc6ca1-1622-47dd-ad5d-a62e5b119553'),
(6, 12, 'craft\\imagetransforms\\ImageTransformer', 'image-equilibrium.jpg', NULL, '_68x68_crop_center-center_none', 1, 0, 0, NULL, '2022-07-17 11:50:12', '2022-07-17 11:50:12', '0f7c69de-4c08-4bbf-acde-b01cf87c630b'),
(7, 27, 'craft\\imagetransforms\\ImageTransformer', 'text.png', NULL, '_34x34_crop_center-center_none', 1, 0, 0, NULL, '2022-07-17 16:05:00', '2022-07-17 16:05:01', 'e26c9148-3387-40fa-951f-5fd10cd9bcc3'),
(8, 27, 'craft\\imagetransforms\\ImageTransformer', 'text.png', NULL, '_68x68_crop_center-center_none', 1, 0, 0, NULL, '2022-07-17 16:05:00', '2022-07-17 16:05:01', '66fe8386-407e-461f-997a-58588bad4ff9');

-- --------------------------------------------------------

--
-- Structure de la table `imagetransforms`
--

CREATE TABLE `imagetransforms` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `info`
--

CREATE TABLE `info` (
  `id` int NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '4.1.4.1', '4.0.0.9', 0, 'qfmkpxmlwcnl', '3@uzjzdvhuvw', '2022-07-17 08:53:29', '2022-07-17 15:53:40', 'ef00209d-d33c-4886-be4d-61c069c53171');

-- --------------------------------------------------------

--
-- Structure de la table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `matrixblocks_owners`
--

CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int NOT NULL,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '03ec2304-e712-4934-b9c8-039a84fcc82a'),
(2, 'craft', 'm210121_145800_asset_indexing_changes', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', 'dab48a64-28fe-4805-bddd-b434002936a9'),
(3, 'craft', 'm210624_222934_drop_deprecated_tables', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '45f21fa5-9775-42bf-b333-e97249c49276'),
(4, 'craft', 'm210724_180756_rename_source_cols', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '3048ff00-e3e6-4650-9155-01cdc2c95f9a'),
(5, 'craft', 'm210809_124211_remove_superfluous_uids', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', 'c09b50fc-8fd6-4dec-9daa-759d85b05d28'),
(6, 'craft', 'm210817_014201_universal_users', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', 'b534abcd-399f-4ef3-be42-53758b18d68e'),
(7, 'craft', 'm210904_132612_store_element_source_settings_in_project_config', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '31cc5d98-3ef8-469e-a7cb-dfee8336597a'),
(8, 'craft', 'm211115_135500_image_transformers', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '22660b0e-1862-4ac3-8b34-b7d20f9d2b7b'),
(9, 'craft', 'm211201_131000_filesystems', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '55251e22-ee56-4f55-af7b-435be726c3b8'),
(10, 'craft', 'm220103_043103_tab_conditions', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', 'd69e1b5a-79ba-4bc8-8f3c-d9952c0149f8'),
(11, 'craft', 'm220104_003433_asset_alt_text', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '862a2ba6-aa56-40f1-8c37-71c9d3858db5'),
(12, 'craft', 'm220123_213619_update_permissions', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', 'cd6fe790-8671-465a-b1e1-c829815a360d'),
(13, 'craft', 'm220126_003432_addresses', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '0ff742ea-9a54-42d8-81c5-f35b45058ca5'),
(14, 'craft', 'm220209_095604_add_indexes', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '49ef36e1-5e3f-433b-abdd-40875fd45ac6'),
(15, 'craft', 'm220213_015220_matrixblocks_owners_table', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', 'dfbb6a74-e920-4606-895a-12845c8fed3a'),
(16, 'craft', 'm220214_000000_truncate_sessions', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '68afe8cf-0153-40e1-b39a-e507ead03b35'),
(17, 'craft', 'm220222_122159_full_names', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', 'b7961c13-dac0-4dd6-813e-140e79de0b53'),
(18, 'craft', 'm220223_180559_nullable_address_owner', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2714e788-0ffe-4e46-8259-4a3f143da66d'),
(19, 'craft', 'm220225_165000_transform_filesystems', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', 'ec3ea38c-9b25-494f-b666-6b5dd156431e'),
(20, 'craft', 'm220309_152006_rename_field_layout_elements', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', 'cef4b68c-512e-4fe8-99f1-c265405e0491'),
(21, 'craft', 'm220314_211928_field_layout_element_uids', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '3459f5c7-7c4d-4fc6-9890-c09953416fa1'),
(22, 'craft', 'm220316_123800_transform_fs_subpath', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '5cc52670-5122-421f-8153-c89c682fae3b'),
(23, 'craft', 'm220317_174250_release_all_jobs', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '7707cf48-2eb1-4e83-8212-780b35493947'),
(24, 'craft', 'm220330_150000_add_site_gql_schema_components', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', 'c75eb9a9-ddf7-445e-aae3-8e6bef2f8b00'),
(25, 'craft', 'm220413_024536_site_enabled_string', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 08:53:30', '3be25f87-36de-4023-97d6-3b2b8a1825a8');

-- --------------------------------------------------------

--
-- Structure de la table `plugins`
--

CREATE TABLE `plugins` (
  `id` int NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.defaultPlacement', '\"end\"'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elementCondition', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.autocapitalize', 'true'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.autocomplete', 'false'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.autocorrect', 'true'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.class', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.disabled', 'false'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.elementCondition', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.id', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.instructions', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.label', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.max', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.min', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.name', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.orientation', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.placeholder', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.readonly', 'false'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.requirable', 'false'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.size', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.step', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.tip', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.title', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.uid', '\"0b9c3033-decb-4459-9206-cb96d8b7dac2\"'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.userCondition', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.warning', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.elements.0.width', '100'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.name', '\"Contenu\"'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.uid', '\"c7f070f4-2042-43c8-b937-e1d54786a3ed\"'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.fieldLayouts.4f57d17a-efdb-44cc-8ed9-4114e45d69a0.tabs.0.userCondition', 'null'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.handle', '\"nftCategories\"'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.name', '\"Nft Categories\"'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.siteSettings.083ec8b5-3a63-4e14-a498-44f7083bed08.hasUrls', 'true'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.siteSettings.083ec8b5-3a63-4e14-a498-44f7083bed08.template', '\"nft/_entry\"'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.siteSettings.083ec8b5-3a63-4e14-a498-44f7083bed08.uriFormat', '\"nft-categories/{slug}\"'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.structure.maxLevels', '1'),
('categoryGroups.3b2c274d-1f6d-416f-805f-40e537ae16bc.structure.uid', '\"569b41b7-1dda-4889-97eb-6c73a1f2569b\"'),
('dateModified', '1658073220'),
('email.fromEmail', '\"alexislafrances-laf@outlook.fr\"'),
('email.fromName', '\"nft_card\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elementCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.class', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.disabled', 'false'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.id', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.instructions', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.label', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.max', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.min', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.name', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.orientation', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.readonly', 'false'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.requirable', 'false'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.size', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.step', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.tip', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.title', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.uid', '\"a387a610-2914-47ff-8c56-faab48e8ba90\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.warning', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.0.width', '100'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.1.fieldUid', '\"66b2de03-b9c2-4921-b712-b1f055b89d84\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.1.instructions', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.1.label', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.1.required', 'false'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.1.tip', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.1.uid', '\"750102cc-701c-4332-9fe9-eb492ec4c652\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.1.warning', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.1.width', '100'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.2.elementCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.2.fieldUid', '\"2f711dd2-95ae-4aea-ae80-192cdd36586a\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.2.instructions', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.2.label', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.2.required', 'false'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.2.tip', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.2.uid', '\"1144e677-e2b1-455a-ad37-396f0b0cce8b\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.2.userCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.2.warning', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.2.width', '100'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.3.elementCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.3.fieldUid', '\"2ef9a91c-9a2a-4294-ba86-f07fbeaeb948\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.3.instructions', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.3.label', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.3.required', 'false'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.3.tip', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.3.uid', '\"d644430a-5f34-428a-a64d-317f3486a85c\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.3.userCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.3.warning', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.3.width', '100'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.4.elementCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.4.fieldUid', '\"017b7839-3240-4850-91b5-6ccf0b24b62c\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.4.instructions', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.4.label', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.4.required', 'false'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.4.tip', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.4.uid', '\"79af322a-e0ab-4219-955f-a61862b8025e\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.4.userCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.4.warning', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.4.width', '100'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.5.elementCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.5.fieldUid', '\"d80e8b5c-68c7-4457-a2c2-3e0129571223\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.5.instructions', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.5.label', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.5.required', 'false'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.5.tip', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.5.uid', '\"783f2713-cd0e-457c-a5f2-a844c41215da\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.5.userCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.5.warning', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.5.width', '100'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.6.elementCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.6.fieldUid', '\"7c883bb3-613b-4fe9-afdb-29b1c42267aa\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.6.instructions', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.6.label', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.6.required', 'false'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.6.tip', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.6.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.6.uid', '\"8420c060-a98c-4b4d-af09-89fa21b65f39\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.6.userCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.6.warning', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.6.width', '100'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.7.elementCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.7.fieldUid', '\"02d47f4e-e0c2-4e11-919b-e28fbec6c6cd\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.7.instructions', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.7.label', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.7.required', 'false'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.7.tip', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.7.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.7.uid', '\"eb40576e-44b4-4e03-899c-08298d0572ed\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.7.userCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.7.warning', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.elements.7.width', '100'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.name', '\"Contenu\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.uid', '\"88de2926-545f-41a4-9a45-4dd4d52cd6e2\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.fieldLayouts.0d791a5a-3bac-4a52-adaf-dad737fd2b92.tabs.0.userCondition', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.handle', '\"index\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.hasTitleField', 'true'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.name', '\"Index\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.section', '\"f1bbc2dd-91ff-4f33-9b56-d5543bbca379\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.sortOrder', '1'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.titleTranslationKeyFormat', 'null'),
('entryTypes.104db1cc-2572-4a13-b654-0cc201d5cc33.titleTranslationMethod', '\"site\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elementCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.class', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.disabled', 'false'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.id', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.instructions', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.label', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.max', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.min', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.name', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.orientation', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.readonly', 'false'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.requirable', 'false'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.size', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.step', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.tip', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.title', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.uid', '\"c7a020a3-c321-4b9b-95ad-0cb06c883413\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.warning', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.0.width', '100'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.1.fieldUid', '\"66b2de03-b9c2-4921-b712-b1f055b89d84\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.1.instructions', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.1.label', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.1.required', 'false'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.1.tip', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.1.uid', '\"fc10f89c-d96e-479e-85f9-98c367b982f2\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.1.warning', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.1.width', '100'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.2.elementCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.2.fieldUid', '\"02d47f4e-e0c2-4e11-919b-e28fbec6c6cd\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.2.instructions', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.2.label', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.2.required', 'false'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.2.tip', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.2.uid', '\"599df65f-4eb9-4339-86b6-ea6bfe41c9b4\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.2.userCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.2.warning', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.2.width', '100'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.3.elementCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.3.fieldUid', '\"2ef9a91c-9a2a-4294-ba86-f07fbeaeb948\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.3.instructions', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.3.label', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.3.required', 'false'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.3.tip', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.3.uid', '\"b01a0a45-63df-44f0-96c2-1aedcc1525f8\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.3.userCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.3.warning', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.3.width', '100'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.4.elementCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.4.fieldUid', '\"2f711dd2-95ae-4aea-ae80-192cdd36586a\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.4.instructions', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.4.label', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.4.required', 'false'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.4.tip', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.4.uid', '\"3525e884-9f4c-486f-91a7-dd0103f00600\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.4.userCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.4.warning', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.4.width', '100'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.5.elementCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.5.fieldUid', '\"d80e8b5c-68c7-4457-a2c2-3e0129571223\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.5.instructions', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.5.label', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.5.required', 'false'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.5.tip', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.5.uid', '\"64891482-e5c9-4296-91b3-f8a6b460457f\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.5.userCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.5.warning', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.5.width', '100'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.6.elementCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.6.fieldUid', '\"017b7839-3240-4850-91b5-6ccf0b24b62c\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.6.instructions', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.6.label', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.6.required', 'false'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.6.tip', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.6.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.6.uid', '\"016a387f-4c89-4640-911c-80d3b5987a2c\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.6.userCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.6.warning', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.6.width', '100'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.7.elementCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.7.fieldUid', '\"7c883bb3-613b-4fe9-afdb-29b1c42267aa\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.7.instructions', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.7.label', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.7.required', 'false'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.7.tip', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.7.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.7.uid', '\"72a1608f-2bee-4ff4-b2aa-226378c6e5fd\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.7.userCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.7.warning', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.elements.7.width', '100'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.name', '\"Nft\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.uid', '\"d38d89be-ea25-46aa-8b82-d776ff25bfdb\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.fieldLayouts.0bba0059-87a7-49d6-8e34-29da73185ae9.tabs.0.userCondition', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.handle', '\"nft\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.hasTitleField', 'true'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.name', '\"Nft\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.section', '\"72910ad4-fa3a-48af-bdc5-e10bd89c85af\"'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.sortOrder', '3'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.titleFormat', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.titleTranslationKeyFormat', 'null'),
('entryTypes.d09afab7-de3f-4d51-ba36-990d4ac99897.titleTranslationMethod', '\"site\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elementCondition', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.0.fieldUid', '\"92b24058-4b01-4961-a1dd-6457076d917c\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.0.instructions', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.0.label', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.0.required', 'false'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.0.tip', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.0.uid', '\"ae4fb7d4-c920-42fa-9970-495b1cbc67df\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.0.warning', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.0.width', '100'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.1.fieldUid', '\"06c8692e-c9c9-4d70-a2c0-f7676000a036\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.1.instructions', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.1.label', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.1.required', 'false'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.1.tip', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.1.uid', '\"016f2622-7b31-42f4-81aa-2d1c68839cc3\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.1.warning', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.1.width', '100'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.2.elementCondition', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.2.fieldUid', '\"8d7d41c0-c1cb-4103-a4cb-91ad103a54c1\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.2.instructions', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.2.label', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.2.required', 'false'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.2.tip', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.2.uid', '\"54fd96dd-3052-4ec9-a642-7f415dc83d7e\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.2.userCondition', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.2.warning', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.elements.2.width', '100'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.name', '\"User\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.uid', '\"04b57bce-fb4b-4689-9946-428d39ef0e5c\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.fieldLayouts.a1975f2f-37d0-4920-9eb1-acfd3b2f1c76.tabs.0.userCondition', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.handle', '\"user\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.hasTitleField', 'true'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.name', '\"User\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.section', '\"72910ad4-fa3a-48af-bdc5-e10bd89c85af\"'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.sortOrder', '4'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.titleFormat', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.titleTranslationKeyFormat', 'null'),
('entryTypes.dcbafd02-7384-4490-b22e-3e7a7d088db8.titleTranslationMethod', '\"site\"'),
('fieldGroups.32207b74-0b22-4f2e-85a5-865e055cebe0.name', '\"User\"'),
('fieldGroups.4ea1e33c-b05e-4821-adfe-8a5bda2c66c1.name', '\"Common\"'),
('fieldGroups.cef4e03d-69e6-4316-906a-24b1252e9b66.name', '\"Nft\"'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.columnSuffix', '\"xlyvuxbv\"'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.contentColumnType', '\"datetime\"'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.fieldGroup', '\"cef4e03d-69e6-4316-906a-24b1252e9b66\"'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.handle', '\"createdAt\"'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.instructions', 'null'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.name', '\"created_at\"'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.searchable', 'false'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.settings.max', 'null'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.settings.min', 'null'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.settings.minuteIncrement', '30'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.settings.showDate', 'true'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.settings.showTime', 'false'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.settings.showTimeZone', 'false'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.translationKeyFormat', 'null'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.translationMethod', '\"none\"'),
('fields.017b7839-3240-4850-91b5-6ccf0b24b62c.type', '\"craft\\\\fields\\\\Date\"'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.columnSuffix', '\"mfbtfiqq\"'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.contentColumnType', '\"integer(10)\"'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.fieldGroup', '\"cef4e03d-69e6-4316-906a-24b1252e9b66\"'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.handle', '\"idNft\"'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.instructions', '\"Number nft\"'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.name', '\"Id nft\"'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.searchable', 'false'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.settings.decimals', '0'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.settings.defaultValue', 'null'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.settings.max', 'null'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.settings.min', '0'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.settings.prefix', 'null'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.settings.previewCurrency', 'null'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.settings.previewFormat', '\"decimal\"'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.settings.size', 'null'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.settings.suffix', 'null'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.translationKeyFormat', 'null'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.translationMethod', '\"none\"'),
('fields.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd.type', '\"craft\\\\fields\\\\Number\"'),
('fields.06c8692e-c9c9-4d70-a2c0-f7676000a036.columnSuffix', '\"hwaovoir\"'),
('fields.06c8692e-c9c9-4d70-a2c0-f7676000a036.contentColumnType', '\"string(255)\"'),
('fields.06c8692e-c9c9-4d70-a2c0-f7676000a036.fieldGroup', '\"32207b74-0b22-4f2e-85a5-865e055cebe0\"'),
('fields.06c8692e-c9c9-4d70-a2c0-f7676000a036.handle', '\"link_website\"'),
('fields.06c8692e-c9c9-4d70-a2c0-f7676000a036.instructions', 'null'),
('fields.06c8692e-c9c9-4d70-a2c0-f7676000a036.name', '\"link_website\"'),
('fields.06c8692e-c9c9-4d70-a2c0-f7676000a036.searchable', 'false'),
('fields.06c8692e-c9c9-4d70-a2c0-f7676000a036.settings.maxLength', '255'),
('fields.06c8692e-c9c9-4d70-a2c0-f7676000a036.settings.types.0', '\"url\"'),
('fields.06c8692e-c9c9-4d70-a2c0-f7676000a036.translationKeyFormat', 'null'),
('fields.06c8692e-c9c9-4d70-a2c0-f7676000a036.translationMethod', '\"none\"'),
('fields.06c8692e-c9c9-4d70-a2c0-f7676000a036.type', '\"craft\\\\fields\\\\Url\"'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.columnSuffix', '\"jmgdiezq\"'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.contentColumnType', '\"string(1020)\"'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.fieldGroup', '\"cef4e03d-69e6-4316-906a-24b1252e9b66\"'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.handle', '\"summary\"'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.instructions', '\"Enter a brief, one or two sentences nft summary\"'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.name', '\"Summary\"'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.searchable', 'false'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.settings.byteLimit', 'null'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.settings.charLimit', '255'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.settings.code', 'false'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.settings.columnType', 'null'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.settings.initialRows', '1'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.settings.multiline', 'true'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.settings.placeholder', 'null'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.settings.uiMode', '\"normal\"'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.translationKeyFormat', 'null'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.translationMethod', '\"none\"'),
('fields.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.columnSuffix', '\"fsagtzih\"'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.contentColumnType', '\"decimal(15,5)\"'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.fieldGroup', '\"cef4e03d-69e6-4316-906a-24b1252e9b66\"'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.handle', '\"price\"'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.instructions', '\"Eth Price of your nft\"'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.name', '\"Price\"'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.searchable', 'false'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.settings.decimals', '5'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.settings.defaultValue', 'null'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.settings.max', 'null'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.settings.min', '0'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.settings.prefix', 'null'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.settings.previewCurrency', 'null'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.settings.previewFormat', '\"decimal\"'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.settings.size', 'null'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.settings.suffix', 'null'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.translationKeyFormat', 'null'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.translationMethod', '\"none\"'),
('fields.2f711dd2-95ae-4aea-ae80-192cdd36586a.type', '\"craft\\\\fields\\\\Number\"'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.columnSuffix', '\"qzcpczut\"'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.contentColumnType', '\"string(400)\"'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.fieldGroup', '\"cef4e03d-69e6-4316-906a-24b1252e9b66\"'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.handle', '\"nftTitle\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.instructions', 'null'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.name', '\"Nft Title\"'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.searchable', 'false'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.settings.byteLimit', 'null'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.settings.charLimit', '100'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.settings.code', 'false'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.settings.columnType', 'null'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.settings.initialRows', '4'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.settings.multiline', 'false'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.settings.placeholder', '\"Title to your nft\"'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.settings.uiMode', '\"normal\"'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.translationKeyFormat', 'null'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.translationMethod', '\"none\"'),
('fields.66b2de03-b9c2-4921-b712-b1f055b89d84.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.columnSuffix', 'null'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.contentColumnType', '\"string\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.fieldGroup', '\"cef4e03d-69e6-4316-906a-24b1252e9b66\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.handle', '\"userInfo\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.instructions', 'null'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.name', '\"User info\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.searchable', 'false'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.allowSelfRelations', 'false'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.localizeRelations', 'false'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.maxRelations', 'null'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.minRelations', 'null'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.0.0', '\"elementType\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.0.1', '\"craft\\\\elements\\\\Entry\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.1.0', '\"fieldContext\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.1.1', '\"global\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.2.0', '\"class\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.2.1', '\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.0', '\"conditionRules\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.0.__assoc__.0.0', '\"class\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.0.__assoc__.0.1', '\"craft\\\\fields\\\\conditions\\\\TextFieldConditionRule\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.0.__assoc__.1.0', '\"uid\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.0.__assoc__.1.1', '\"1b77ce48-21a4-4742-aeb7-cea25b03afea\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.0.__assoc__.2.0', '\"operator\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.0.__assoc__.2.1', '\"=\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.0.__assoc__.3.0', '\"value\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.0.__assoc__.3.1', '\"\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.0.__assoc__.4.0', '\"fieldUid\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.0.__assoc__.4.1', '\"92b24058-4b01-4961-a1dd-6457076d917c\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.1.__assoc__.0.0', '\"class\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.1.__assoc__.0.1', '\"craft\\\\fields\\\\conditions\\\\TextFieldConditionRule\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.1.__assoc__.1.0', '\"uid\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.1.__assoc__.1.1', '\"581f8598-42b9-4403-b1e9-3a0230b5b2bb\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.1.__assoc__.2.0', '\"operator\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.1.__assoc__.2.1', '\"=\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.1.__assoc__.3.0', '\"value\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.1.__assoc__.3.1', '\"\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.1.__assoc__.4.0', '\"fieldUid\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.1.__assoc__.4.1', '\"06c8692e-c9c9-4d70-a2c0-f7676000a036\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.2.__assoc__.0.0', '\"class\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.2.__assoc__.0.1', '\"craft\\\\fields\\\\conditions\\\\RelationalFieldConditionRule\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.2.__assoc__.1.0', '\"uid\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.2.__assoc__.1.1', '\"f5cb1cc1-6653-4953-b756-984a54ff6821\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.2.__assoc__.2.0', '\"operator\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.2.__assoc__.2.1', '\"relatedTo\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.2.__assoc__.4.0', '\"fieldUid\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionCondition.__assoc__.3.1.2.__assoc__.4.1', '\"8d7d41c0-c1cb-4103-a4cb-91ad103a54c1\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.selectionLabel', 'null'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.showSiteMenu', 'false'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.source', 'null'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.sources', '\"*\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.targetSiteId', 'null'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.validateRelatedElements', 'false'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.settings.viewMode', 'null'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.translationKeyFormat', 'null'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.translationMethod', '\"site\"'),
('fields.7c883bb3-613b-4fe9-afdb-29b1c42267aa.type', '\"craft\\\\fields\\\\Entries\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.columnSuffix', 'null'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.contentColumnType', '\"string\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.fieldGroup', '\"32207b74-0b22-4f2e-85a5-865e055cebe0\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.handle', '\"image\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.instructions', 'null'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.name', '\"Image\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.searchable', 'false'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.allowedKinds', 'null'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.allowSelfRelations', 'false'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.allowSubfolders', 'false'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.allowUploads', 'true'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.defaultUploadLocationSource', '\"volume:01d308de-4063-483b-89c4-5cb334f6cf97\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.defaultUploadLocationSubpath', 'null'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.localizeRelations', 'false'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.maxRelations', 'null'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.minRelations', 'null'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.previewMode', '\"full\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.restrictedDefaultUploadSubpath', 'null'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.restrictedLocationSource', '\"volume:01d308de-4063-483b-89c4-5cb334f6cf97\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.restrictedLocationSubpath', '\"user\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.restrictFiles', 'false'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.restrictLocation', 'true'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.selectionCondition.__assoc__.0.0', '\"elementType\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.selectionCondition.__assoc__.0.1', '\"craft\\\\elements\\\\Asset\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.selectionCondition.__assoc__.1.0', '\"fieldContext\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.selectionCondition.__assoc__.1.1', '\"global\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.selectionCondition.__assoc__.2.0', '\"class\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.selectionCondition.__assoc__.2.1', '\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.selectionLabel', 'null'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.showSiteMenu', 'false'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.showUnpermittedFiles', 'false'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.showUnpermittedVolumes', 'false'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.source', 'null'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.sources', '\"*\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.targetSiteId', 'null'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.validateRelatedElements', 'false'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.settings.viewMode', '\"list\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.translationKeyFormat', 'null'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.translationMethod', '\"site\"'),
('fields.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.columnSuffix', '\"rznsdgey\"'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.contentColumnType', '\"string(400)\"'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.fieldGroup', '\"32207b74-0b22-4f2e-85a5-865e055cebe0\"'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.handle', '\"user_name\"'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.instructions', 'null'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.name', '\"User name\"'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.searchable', 'false'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.settings.byteLimit', 'null'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.settings.charLimit', '100'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.settings.code', 'false'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.settings.columnType', 'null'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.settings.initialRows', '4'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.settings.multiline', 'false'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.settings.placeholder', 'null'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.settings.uiMode', '\"normal\"'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.translationKeyFormat', 'null'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.translationMethod', '\"none\"'),
('fields.92b24058-4b01-4961-a1dd-6457076d917c.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.columnSuffix', 'null'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.contentColumnType', '\"string\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.fieldGroup', '\"cef4e03d-69e6-4316-906a-24b1252e9b66\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.handle', '\"featureImage\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.instructions', 'null'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.name', '\"Feature Image\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.searchable', 'false'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.allowedKinds', 'null'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.allowSelfRelations', 'false'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.allowSubfolders', 'false'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.allowUploads', 'true'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.defaultUploadLocationSource', '\"volume:01d308de-4063-483b-89c4-5cb334f6cf97\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.defaultUploadLocationSubpath', 'null'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.localizeRelations', 'false'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.maxRelations', 'null'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.minRelations', 'null'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.previewMode', '\"full\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.restrictedDefaultUploadSubpath', 'null'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.restrictedLocationSource', '\"volume:01d308de-4063-483b-89c4-5cb334f6cf97\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.restrictedLocationSubpath', '\"nft\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.restrictFiles', 'false'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.restrictLocation', 'true'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.selectionCondition.__assoc__.0.0', '\"elementType\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.selectionCondition.__assoc__.0.1', '\"craft\\\\elements\\\\Asset\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.selectionCondition.__assoc__.1.0', '\"fieldContext\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.selectionCondition.__assoc__.1.1', '\"global\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.selectionCondition.__assoc__.2.0', '\"class\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.selectionCondition.__assoc__.2.1', '\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.selectionLabel', 'null'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.showSiteMenu', 'false'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.showUnpermittedFiles', 'false'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.showUnpermittedVolumes', 'false'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.source', 'null'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.sources', '\"*\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.targetSiteId', 'null'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.validateRelatedElements', 'false'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.settings.viewMode', '\"list\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.translationKeyFormat', 'null'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.translationMethod', '\"site\"'),
('fields.d80e8b5c-68c7-4457-a2c2-3e0129571223.type', '\"craft\\\\fields\\\\Assets\"'),
('fs.nft.hasUrls', 'true'),
('fs.nft.name', '\"nft\"'),
('fs.nft.settings.path', '\"@webroot/assets/nft\"'),
('fs.nft.type', '\"craft\\\\fs\\\\Local\"'),
('fs.nft.url', '\"@web/assets/nft\"'),
('fs.userPicture.hasUrls', 'true'),
('fs.userPicture.name', '\"User Picture\"'),
('fs.userPicture.settings.path', '\"@webroot/assets/user\"'),
('fs.userPicture.type', '\"craft\\\\fs\\\\Local\"'),
('fs.userPicture.url', '\"@web/assets/user\"'),
('meta.__names__.017b7839-3240-4850-91b5-6ccf0b24b62c', '\"created_at\"'),
('meta.__names__.01d308de-4063-483b-89c4-5cb334f6cf97', '\"Nft\"'),
('meta.__names__.02d47f4e-e0c2-4e11-919b-e28fbec6c6cd', '\"Id nft\"'),
('meta.__names__.06c8692e-c9c9-4d70-a2c0-f7676000a036', '\"link_website\"'),
('meta.__names__.083ec8b5-3a63-4e14-a498-44f7083bed08', '\"nft_card\"'),
('meta.__names__.104db1cc-2572-4a13-b654-0cc201d5cc33', '\"Index\"'),
('meta.__names__.2ef9a91c-9a2a-4294-ba86-f07fbeaeb948', '\"Summary\"'),
('meta.__names__.2f711dd2-95ae-4aea-ae80-192cdd36586a', '\"Price\"'),
('meta.__names__.32207b74-0b22-4f2e-85a5-865e055cebe0', '\"User\"'),
('meta.__names__.3b2c274d-1f6d-416f-805f-40e537ae16bc', '\"Nft Categories\"'),
('meta.__names__.4ea1e33c-b05e-4821-adfe-8a5bda2c66c1', '\"Common\"'),
('meta.__names__.66b2de03-b9c2-4921-b712-b1f055b89d84', '\"Nft Title\"'),
('meta.__names__.679b73ff-16a4-475f-9d1b-86a5fb0ef79b', '\"nft_card\"'),
('meta.__names__.72910ad4-fa3a-48af-bdc5-e10bd89c85af', '\"nft\"'),
('meta.__names__.7c883bb3-613b-4fe9-afdb-29b1c42267aa', '\"User info\"'),
('meta.__names__.8d7d41c0-c1cb-4103-a4cb-91ad103a54c1', '\"Image\"'),
('meta.__names__.92b24058-4b01-4961-a1dd-6457076d917c', '\"User name\"'),
('meta.__names__.cef4e03d-69e6-4316-906a-24b1252e9b66', '\"Nft\"'),
('meta.__names__.d09afab7-de3f-4d51-ba36-990d4ac99897', '\"Nft\"'),
('meta.__names__.d80e8b5c-68c7-4457-a2c2-3e0129571223', '\"Feature Image\"'),
('meta.__names__.dcbafd02-7384-4490-b22e-3e7a7d088db8', '\"User\"'),
('meta.__names__.f1bbc2dd-91ff-4f33-9b56-d5543bbca379', '\"Index\"'),
('sections.72910ad4-fa3a-48af-bdc5-e10bd89c85af.defaultPlacement', '\"end\"'),
('sections.72910ad4-fa3a-48af-bdc5-e10bd89c85af.enableVersioning', 'true'),
('sections.72910ad4-fa3a-48af-bdc5-e10bd89c85af.handle', '\"nft\"'),
('sections.72910ad4-fa3a-48af-bdc5-e10bd89c85af.name', '\"nft\"'),
('sections.72910ad4-fa3a-48af-bdc5-e10bd89c85af.propagationMethod', '\"all\"'),
('sections.72910ad4-fa3a-48af-bdc5-e10bd89c85af.siteSettings.083ec8b5-3a63-4e14-a498-44f7083bed08.enabledByDefault', 'true'),
('sections.72910ad4-fa3a-48af-bdc5-e10bd89c85af.siteSettings.083ec8b5-3a63-4e14-a498-44f7083bed08.hasUrls', 'true'),
('sections.72910ad4-fa3a-48af-bdc5-e10bd89c85af.siteSettings.083ec8b5-3a63-4e14-a498-44f7083bed08.template', '\"nft/_entry\"'),
('sections.72910ad4-fa3a-48af-bdc5-e10bd89c85af.siteSettings.083ec8b5-3a63-4e14-a498-44f7083bed08.uriFormat', '\"nft/{slug}\"'),
('sections.72910ad4-fa3a-48af-bdc5-e10bd89c85af.type', '\"channel\"'),
('sections.f1bbc2dd-91ff-4f33-9b56-d5543bbca379.defaultPlacement', '\"end\"'),
('sections.f1bbc2dd-91ff-4f33-9b56-d5543bbca379.enableVersioning', 'true'),
('sections.f1bbc2dd-91ff-4f33-9b56-d5543bbca379.handle', '\"index\"'),
('sections.f1bbc2dd-91ff-4f33-9b56-d5543bbca379.name', '\"Index\"'),
('sections.f1bbc2dd-91ff-4f33-9b56-d5543bbca379.propagationMethod', '\"all\"'),
('sections.f1bbc2dd-91ff-4f33-9b56-d5543bbca379.siteSettings.083ec8b5-3a63-4e14-a498-44f7083bed08.enabledByDefault', 'true'),
('sections.f1bbc2dd-91ff-4f33-9b56-d5543bbca379.siteSettings.083ec8b5-3a63-4e14-a498-44f7083bed08.hasUrls', 'true'),
('sections.f1bbc2dd-91ff-4f33-9b56-d5543bbca379.siteSettings.083ec8b5-3a63-4e14-a498-44f7083bed08.template', '\"/\"'),
('sections.f1bbc2dd-91ff-4f33-9b56-d5543bbca379.siteSettings.083ec8b5-3a63-4e14-a498-44f7083bed08.uriFormat', '\"__home__\"'),
('sections.f1bbc2dd-91ff-4f33-9b56-d5543bbca379.type', '\"single\"'),
('siteGroups.679b73ff-16a4-475f-9d1b-86a5fb0ef79b.name', '\"nft_card\"'),
('sites.083ec8b5-3a63-4e14-a498-44f7083bed08.baseUrl', '\"@web\"'),
('sites.083ec8b5-3a63-4e14-a498-44f7083bed08.enabled', 'true'),
('sites.083ec8b5-3a63-4e14-a498-44f7083bed08.handle', '\"default\"'),
('sites.083ec8b5-3a63-4e14-a498-44f7083bed08.hasUrls', 'true'),
('sites.083ec8b5-3a63-4e14-a498-44f7083bed08.language', '\"fr-FR\"'),
('sites.083ec8b5-3a63-4e14-a498-44f7083bed08.name', '\"nft_card\"'),
('sites.083ec8b5-3a63-4e14-a498-44f7083bed08.primary', 'true'),
('sites.083ec8b5-3a63-4e14-a498-44f7083bed08.siteGroup', '\"679b73ff-16a4-475f-9d1b-86a5fb0ef79b\"'),
('sites.083ec8b5-3a63-4e14-a498-44f7083bed08.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"nft_card\"'),
('system.schemaVersion', '\"4.0.0.9\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elementCondition', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.autocomplete', 'false'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.autocorrect', 'true'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.class', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.disabled', 'false'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.elementCondition', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.id', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.instructions', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.label', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.max', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.min', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.name', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.orientation', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.placeholder', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.readonly', 'false'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.requirable', 'false'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.size', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.step', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.tip', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.title', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.uid', '\"54de9ce9-93e4-44b7-9d55-80123d636854\"'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.userCondition', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.warning', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.elements.0.width', '100'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.name', '\"Contenu\"'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.uid', '\"5c8d90f0-9af5-412f-88ef-db01d93340f9\"'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fieldLayouts.4e616811-9a89-4a9d-94db-e7b8877fcf6a.tabs.0.userCondition', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.fs', '\"nft\"'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.handle', '\"nft\"'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.name', '\"Nft\"'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.sortOrder', '1'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.titleTranslationKeyFormat', 'null'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.titleTranslationMethod', '\"site\"'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.transformFs', '\"\"'),
('volumes.01d308de-4063-483b-89c4-5cb334f6cf97.transformSubpath', '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `queue`
--

CREATE TABLE `queue` (
  `id` int NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `relations`
--

CREATE TABLE `relations` (
  `id` int NOT NULL,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 7, 6, NULL, 7, 1, '2022-07-17 11:46:42', '2022-07-17 11:46:42', '47a8424a-6351-4291-bfe1-1e02965a3e46'),
(2, 7, 8, NULL, 9, 1, '2022-07-17 11:48:59', '2022-07-17 11:48:59', '7690a41c-c09d-49bb-936f-fca8dbd83e21'),
(3, 7, 10, NULL, 9, 1, '2022-07-17 11:49:08', '2022-07-17 11:49:08', 'e19445f6-2c86-420e-94b2-452aea69ed28'),
(4, 3, 11, NULL, 12, 1, '2022-07-17 11:50:13', '2022-07-17 11:50:13', '3a742fd7-0692-484e-bfd2-e4de5c30dd64'),
(5, 10, 11, NULL, 8, 1, '2022-07-17 11:50:32', '2022-07-17 11:50:32', 'c000fba9-9026-4726-9eb7-125e35a40406'),
(6, 3, 13, NULL, 12, 1, '2022-07-17 11:50:35', '2022-07-17 11:50:35', '99c8b473-005c-42c0-83db-5f38d15a51ca'),
(7, 10, 13, NULL, 8, 1, '2022-07-17 11:50:35', '2022-07-17 11:50:35', 'b39ec261-cb8f-46a3-be26-4cacd3eeeb09'),
(10, 3, 15, NULL, 12, 1, '2022-07-17 12:41:55', '2022-07-17 12:41:55', 'bac2f2ad-e046-4e7c-97c8-0db28a9f7c9f'),
(11, 10, 15, NULL, 8, 1, '2022-07-17 12:41:55', '2022-07-17 12:41:55', 'd8202324-f936-49c3-9785-8d769456460e'),
(14, 3, 17, NULL, 12, 1, '2022-07-17 12:43:15', '2022-07-17 12:43:15', 'ab86b552-81b5-4a88-befb-62a2f6707ebf'),
(15, 10, 17, NULL, 8, 1, '2022-07-17 12:43:15', '2022-07-17 12:43:15', 'f3a95222-8f51-490d-bc74-f907d3833a5a'),
(18, 3, 19, NULL, 12, 1, '2022-07-17 14:11:55', '2022-07-17 14:11:55', '976a1319-212d-477d-ba60-f864fa04a0f7'),
(19, 10, 19, NULL, 8, 1, '2022-07-17 14:11:55', '2022-07-17 14:11:55', '97c95abb-3a69-40a6-a6f3-819a3d30b110'),
(22, 3, 21, NULL, 12, 1, '2022-07-17 14:14:02', '2022-07-17 14:14:02', '26368e6b-8158-4562-8307-a81f66a9a770'),
(23, 10, 21, NULL, 8, 1, '2022-07-17 14:14:02', '2022-07-17 14:14:02', '6e879b94-4e75-4d33-89c2-9ed45a51d267'),
(24, 3, 26, NULL, 27, 1, '2022-07-17 16:05:01', '2022-07-17 16:05:01', '30687a49-f235-473d-8398-fed474cb2c28'),
(25, 10, 26, NULL, 8, 1, '2022-07-17 16:05:12', '2022-07-17 16:05:12', '5192c9ec-7060-4007-ad12-fc052c51c1a0'),
(26, 3, 28, NULL, 27, 1, '2022-07-17 16:05:14', '2022-07-17 16:05:14', 'c16db929-63a1-4ef1-9aeb-903d734b675f'),
(27, 10, 28, NULL, 8, 1, '2022-07-17 16:05:14', '2022-07-17 16:05:14', '0d6366b4-8b53-42c7-964d-65c96bfaa2f8');

-- --------------------------------------------------------

--
-- Structure de la table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('11d5097d', '@craft/web/assets/fieldsettings/dist'),
('15b97e7f', '@craft/web/assets/generalsettings/dist'),
('17bcdc4b', '@craft/web/assets/iframeresizer/dist'),
('1c962a24', '@craft/web/assets/updateswidget/dist'),
('1cddd5fc', '@craft/web/assets/d3/dist'),
('21ab001e', '@craft/web/assets/conditionbuilder/dist'),
('222c684a', '@craft/web/assets/recententries/dist'),
('3ad9fd13', '@craft/web/assets/axios/dist'),
('413402e', '@craft/web/assets/focusvisible/dist'),
('42c2595c', '@craft/web/assets/sites/dist'),
('4c305d41', '@craft/web/assets/fabric/dist'),
('54306309', '@craft/web/assets/tablesettings/dist'),
('5bf9315f', '@craft/web/assets/queuemanager/dist'),
('5c1acb7f', '@craft/web/assets/utilities/dist'),
('64826a56', '@craft/web/assets/garnish/dist'),
('6e8f3b5', '@craft/web/assets/cp/dist'),
('80b6e5f0', '@craft/web/assets/datepickeri18n/dist'),
('842fe169', '@craft/web/assets/feed/dist'),
('84896b97', '@craft/web/assets/assetindexes/dist'),
('8b2a6e80', '@craft/web/assets/velocity/dist'),
('8ebd6c37', '@craft/web/assets/jquerypayment/dist'),
('8eeeb355', '@craft/web/assets/jquerytouchevents/dist'),
('9f0ab6db', '@craft/web/assets/vue/dist'),
('9f524684', '@craft/web/assets/editsection/dist'),
('aa051fd', '@craft/web/assets/selectize/dist'),
('b1adfb21', '@craft/web/assets/dbbackup/dist'),
('b2e6b6e9', '@craft/web/assets/picturefill/dist'),
('b95e0be9', '@craft/web/assets/xregexp/dist'),
('bb3adc2d', '@craft/web/assets/craftsupport/dist'),
('bd944655', '@craft/web/assets/timepicker/dist'),
('c707a22b', '@craft/web/assets/prismjs/dist'),
('cc8f8142', '@craft/web/assets/fileupload/dist'),
('d2f457e9', '@craft/web/assets/jqueryui/dist'),
('d813c7ff', '@bower/jquery/dist'),
('db5ebdf', '@craft/web/assets/tailwindreset/dist'),
('ddf3d817', '@craft/web/assets/elementresizedetector/dist'),
('e9ba452d', '@craft/web/assets/htmx/dist'),
('f93c3c8', '@craft/web/assets/pluginstore/dist'),
('fd6cc7a2', '@craft/web/assets/dashboard/dist');

-- --------------------------------------------------------

--
-- Structure de la table `revisions`
--

CREATE TABLE `revisions` (
  `id` int NOT NULL,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `revisions`
--

INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, ''),
(2, 8, 1, 1, ''),
(3, 11, 1, 1, ''),
(4, 11, 1, 2, '« Brouillon 1 » appliqué'),
(5, 11, 1, 3, '« Brouillon 1 » appliqué'),
(6, 11, 1, 4, '« Brouillon 1 » appliqué'),
(7, 11, 1, 5, '« Brouillon 1 » appliqué'),
(8, 22, 1, 1, NULL),
(9, 22, 1, 2, NULL),
(10, 22, 1, 3, NULL),
(11, 26, 1, 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'email', 0, 1, ' alexislafrances laf outlook fr '),
(1, 'firstname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'slug', 0, 1, ''),
(1, 'username', 0, 1, ' admin '),
(2, 'slug', 0, 1, ' first nft '),
(2, 'title', 0, 1, ' first nft '),
(4, 'slug', 0, 1, ' temp zqxlagpatespfonebdurvbhzrjzsolneurso '),
(4, 'title', 0, 1, ' equilibrium '),
(5, 'slug', 0, 1, ' temp ubsdxsgkgcckqwcrzpxqsmsddpgbicirhzvb '),
(5, 'title', 0, 1, ''),
(6, 'slug', 0, 1, ' jules '),
(6, 'title', 0, 1, ' jules '),
(7, 'extension', 0, 1, ' png '),
(7, 'filename', 0, 1, ' image avatar png '),
(7, 'kind', 0, 1, ' image '),
(7, 'slug', 0, 1, ''),
(7, 'title', 0, 1, ' image avatar '),
(8, 'slug', 0, 1, ' jules '),
(8, 'title', 0, 1, ' jules '),
(9, 'extension', 0, 1, ' png '),
(9, 'filename', 0, 1, ' image avatar 2022 07 17 114858 qaol png '),
(9, 'kind', 0, 1, ' image '),
(9, 'slug', 0, 1, ''),
(9, 'title', 0, 1, ' image avatar '),
(11, 'slug', 0, 1, ' equilibrium '),
(11, 'title', 0, 1, ' equilibrium '),
(12, 'extension', 0, 1, ' jpg '),
(12, 'filename', 0, 1, ' image equilibrium jpg '),
(12, 'kind', 0, 1, ' image '),
(12, 'slug', 0, 1, ''),
(12, 'title', 0, 1, ' image equilibrium '),
(22, 'slug', 0, 1, ' index '),
(22, 'title', 0, 1, ' index '),
(26, 'slug', 0, 1, ' equilibrium 2 '),
(26, 'title', 0, 1, ' equilibrium 2 '),
(27, 'extension', 0, 1, ' png '),
(27, 'filename', 0, 1, ' text png '),
(27, 'kind', 0, 1, ' image '),
(27, 'slug', 0, 1, ''),
(27, 'title', 0, 1, ' text ');

-- --------------------------------------------------------

--
-- Structure de la table `sections`
--

CREATE TABLE `sections` (
  `id` int NOT NULL,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'nft', 'nft', 'channel', 1, 'all', 'end', NULL, '2022-07-17 09:40:45', '2022-07-17 09:47:36', NULL, '72910ad4-fa3a-48af-bdc5-e10bd89c85af'),
(2, NULL, 'Index', 'index', 'single', 1, 'all', 'end', NULL, '2022-07-17 15:53:13', '2022-07-17 15:53:13', NULL, 'f1bbc2dd-91ff-4f33-9b56-d5543bbca379');

-- --------------------------------------------------------

--
-- Structure de la table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'nft/{slug}', 'nft/_entry', 1, '2022-07-17 09:40:45', '2022-07-17 09:47:36', 'bd557274-dbd7-4166-ae56-209d66b8ebb8'),
(2, 2, 1, 1, '__home__', '/', 1, '2022-07-17 15:53:13', '2022-07-17 15:53:13', '3ddc4b67-556d-4a7c-a68b-5d9d520b4359');

-- --------------------------------------------------------

--
-- Structure de la table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'OvIQOd1DQzzeh9tIR7y-p5VS9s7wlQZjH3LlhS9v4Gwm-cK0w5suqrIneeIVKEsZq8f1U8u3UMCocXLPM3NLmxdARN86bhNSzUbe', '2022-07-17 09:14:08', '2022-07-17 14:45:00', 'c8408a86-fc1f-4895-b695-6f5ec37f6daf'),
(2, 1, 'JdzW9E9yOQn0cDIkuDlZ03gb7HQxG3UNizHJh49EZm-2ov_Sb97JbVyaWibudYyirvXU1ob8qK6h8MiOcqTSf1ccRaxvKin0jWq5', '2022-07-17 15:38:06', '2022-07-17 16:01:02', '090bedd1-34b5-4af8-acdf-d270c40f6863'),
(4, 1, 'ONwVYqNTeKWEizEFcE4gbk2MQuE0Fj602MnvnOYJj3T0MOY1v7N3zV3wE-TBLlhkLvC_w26oh4syeEXfUgvyY8tLZwEOA8bXku-M', '2022-07-17 16:02:23', '2022-07-17 16:09:14', 'f9f7a1bf-8308-49b0-b27c-a3b318e62cee');

-- --------------------------------------------------------

--
-- Structure de la table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'nft_card', '2022-07-17 08:53:29', '2022-07-17 08:53:29', NULL, '679b73ff-16a4-475f-9d1b-86a5fb0ef79b');

-- --------------------------------------------------------

--
-- Structure de la table `sites`
--

CREATE TABLE `sites` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, '1', 'nft_card', 'default', 'fr-FR', 1, '@web', 1, '2022-07-17 08:53:29', '2022-07-17 14:14:30', NULL, '083ec8b5-3a63-4e14-a498-44f7083bed08');

-- --------------------------------------------------------

--
-- Structure de la table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int NOT NULL,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int UNSIGNED DEFAULT NULL,
  `lft` int UNSIGNED NOT NULL,
  `rgt` int UNSIGNED NOT NULL,
  `level` smallint UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `structures`
--

CREATE TABLE `structures` (
  `id` int NOT NULL,
  `maxLevels` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `structures`
--

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, '2022-07-17 09:48:00', '2022-07-17 09:48:00', NULL, '569b41b7-1dda-4889-97eb-6c73a1f2569b');

-- --------------------------------------------------------

--
-- Structure de la table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `tokens`
--

CREATE TABLE `tokens` (
  `id` int NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint UNSIGNED DEFAULT NULL,
  `usageCount` tinyint UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"fr-FR\"}');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `photoId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`) VALUES
(1, NULL, 1, 0, 0, 0, 1, 'admin', NULL, NULL, NULL, 'alexislafrances-laf@outlook.fr', '$2y$13$i.mJYFJo6KDPOW4tLxNBaOkkHc5in4zoZC2KWRzSIkf.1Uwytdecu', '2022-07-17 16:02:23', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2022-07-17 08:53:30', '2022-07-17 08:53:30', '2022-07-17 16:02:23');

-- --------------------------------------------------------

--
-- Structure de la table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Nft', '', '2022-07-17 09:45:46', '2022-07-17 09:45:46', 'da5eb7ab-71bc-453e-8fc3-eb0839091775'),
(2, 1, 1, 'nft', 'nft/', '2022-07-17 10:11:59', '2022-07-17 10:11:59', '23bfd50d-8dc7-4816-bf7b-64a78766cac8'),
(3, NULL, NULL, 'Système de fichiers temporaire', NULL, '2022-07-17 10:11:59', '2022-07-17 10:11:59', 'cb86684f-57e1-497f-a792-acad8a853fd3'),
(4, 3, NULL, 'user_1', 'user_1/', '2022-07-17 10:11:59', '2022-07-17 10:11:59', '2777b905-6e4d-4f75-8642-199d0b47edce'),
(5, 1, 1, 'user', 'user/', '2022-07-17 10:11:59', '2022-07-17 10:11:59', '4e1d1d04-c82e-428c-979f-5876f055b373');

-- --------------------------------------------------------

--
-- Structure de la table `volumes`
--

CREATE TABLE `volumes` (
  `id` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `fs`, `transformFs`, `transformSubpath`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 2, 'Nft', 'nft', 'nft', '', '', 'site', NULL, 1, '2022-07-17 09:45:46', '2022-07-17 09:45:46', NULL, '01d308de-4063-483b-89c4-5cb334f6cf97');

-- --------------------------------------------------------

--
-- Structure de la table `widgets`
--

CREATE TABLE `widgets` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2022-07-17 09:14:08', '2022-07-17 09:14:08', '98873e2d-e00c-4a93-9952-672a30a01de1'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2022-07-17 09:14:08', '2022-07-17 09:14:08', '3b5a7b76-cfea-4fd7-bb5c-c4b702aa75f1'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2022-07-17 09:14:08', '2022-07-17 09:14:08', '7a1999ec-98e6-442e-ae3c-9848068c9b1f'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2022-07-17 09:14:08', '2022-07-17 09:14:08', '9c5a5572-400e-402e-b22e-eea1cd69f0dd');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_neovmbssdzuryhtdkvousoguhlknembpbhdj` (`ownerId`);

--
-- Index pour la table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tjtyomjebamkkxkloqlwvqiohhudqqifznvt` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `idx_bsakvwmhbaqglmgickktohcxxstjmplnkhbc` (`dateRead`),
  ADD KEY `fk_iadutwlxrbipasuyegtscethgjqukfbzesus` (`pluginId`);

--
-- Index pour la table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bvgyfkwfuzcufiwmxqeebfghabsxdlxftexh` (`sessionId`,`volumeId`),
  ADD KEY `idx_agheeygekemsxsieylqzmyimkersoolcnpkm` (`volumeId`);

--
-- Index pour la table `assetindexingsessions`
--
ALTER TABLE `assetindexingsessions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qystnoerarggbtlfqxhdmozncourmaijdces` (`filename`,`folderId`),
  ADD KEY `idx_zbpfxfrlxjgdumeqvteucysxcjgydymljtfn` (`folderId`),
  ADD KEY `idx_ueyjleyfbrclfilinrlskxkrvuhuqjbkkais` (`volumeId`),
  ADD KEY `fk_zywsjmwhevdvmeoozzfiqfhmvmaaeiggqqgg` (`uploaderId`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_slaklkcseowcdvudmnavwsouocdkfksdgbcp` (`groupId`),
  ADD KEY `fk_ehcjpgjublntmrlyhmgxsgbmcxcjllxmvsoa` (`parentId`);

--
-- Index pour la table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_enhpzbjwnmnsjecizofeftjvpqhwqffnnumn` (`name`),
  ADD KEY `idx_thdqtlqedeqakrjnrjwejpbvjytdfglkztrj` (`handle`),
  ADD KEY `idx_mtyyhtebsudmraiqhnxggbmvkwujaqxelcdl` (`structureId`),
  ADD KEY `idx_oohxlvfclsqtqvszaxosxftrjvfbyavbmiqr` (`fieldLayoutId`),
  ADD KEY `idx_tseqsjklnxpztegaxzfxqebaelmpocalkupp` (`dateDeleted`);

--
-- Index pour la table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_xdmndfvoedoymammgmphvdoqcoctgefxwmtp` (`groupId`,`siteId`),
  ADD KEY `idx_ncaroidwumjeuylxovhlhycyksehjcagiexo` (`siteId`);

--
-- Index pour la table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `idx_gshlygfxluqiouqzwosiyvfbgftkymqvxlkr` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_pxyofenjlaijflvckgllabtdjppcorasrsae` (`siteId`),
  ADD KEY `fk_hbnfjdwgunojgfvedjincluuipwxplpzwbla` (`userId`);

--
-- Index pour la table `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `idx_oeilyfnsddvuuujtyqdsnryyyouhlollvolo` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_gqetcthwrzvsrkipezycfbdropblawfnjeim` (`siteId`),
  ADD KEY `fk_aguufrgjnwgupcewaaoanzmmamganhlbmbuv` (`fieldId`),
  ADD KEY `fk_fmhndilzuqumrlllvgaqcijzrimomemchsdd` (`userId`);

--
-- Index pour la table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_engfnskqsciburkzddqvaxtifasedwqscdzu` (`elementId`,`siteId`),
  ADD KEY `idx_ydmzyvbzgjwadijfzrtjbjnfrojoamdwchua` (`siteId`),
  ADD KEY `idx_ihzbvcxovpnjhmbfmwvvsqmnetuidzitkksv` (`title`);

--
-- Index pour la table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cjwtfnknewourzfuvowsgmllltzghzzraezg` (`userId`);

--
-- Index pour la table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ocbecyfgyyedzqnhuhmiidjtzeqiecfwbwru` (`key`,`fingerprint`);

--
-- Index pour la table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kccszdsdagebxocjkqnipqkvrnsfdzqamuzl` (`creatorId`,`provisional`),
  ADD KEY `idx_pzclgcgsaldrtszzuobeqwespcirwfqnntbo` (`saved`),
  ADD KEY `fk_gpfobynjohauzqamkwzwldiuwbhpsvmguyji` (`canonicalId`);

--
-- Index pour la table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jlorawbztrkjxbcauinsomlkwyvapwmvcebt` (`dateDeleted`),
  ADD KEY `idx_chevwwlgvuwlifqqgtoulwfwgsgzenrngpzu` (`fieldLayoutId`),
  ADD KEY `idx_zdpqgfoxivvifmqrwwwxvlypxsuhuzebkkei` (`type`),
  ADD KEY `idx_caruqpgglaodnwezpgzhmerqnblcugiuvuzk` (`enabled`),
  ADD KEY `idx_bomimirrknbfewpinoavsjfmhjpfhsmxffjh` (`archived`,`dateCreated`),
  ADD KEY `idx_qthqzssmipcxrjwlezuvprqswzkjytvfqxop` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  ADD KEY `idx_hikspdgjytuuikeeqqgxaeowxmpcljtuncvp` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  ADD KEY `fk_uhvbkqlwehgayejjvvtjudvhwqjdzeaonevx` (`canonicalId`),
  ADD KEY `fk_kvglzkpqzgpgbishwwwulmnrevhlbjwmfepp` (`draftId`),
  ADD KEY `fk_ckhuuhzoexekicovyfjxoejyokfrahrlgcmh` (`revisionId`);

--
-- Index pour la table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_jvtmigzxqqmdpowkrcozwlwtjloupzhhqudp` (`elementId`,`siteId`),
  ADD KEY `idx_crovfprqpmlerqzayjqpkxumhbrocukzzpfv` (`siteId`),
  ADD KEY `idx_uydpuyajckfupqemzwefybnxfuahpiggqtjf` (`slug`,`siteId`),
  ADD KEY `idx_scaalvndhcgvgnysikvlojicrxkhfuwvprwb` (`enabled`),
  ADD KEY `idx_zzhpzrzfjoxaeduwngcgefgcexlqguvxmjqm` (`uri`,`siteId`);

--
-- Index pour la table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jpzjwccbuxazhjtjdvbmmxtcgscjgttgcscs` (`postDate`),
  ADD KEY `idx_wrqyhdanmlpomwuiagaaewbgtroxfjpojtas` (`expiryDate`),
  ADD KEY `idx_dbboagezskdgjtgrudzyczyliugdfrbedkul` (`authorId`),
  ADD KEY `idx_trerelrwpxxpyxjluevkjatltbwyhvnkmkwn` (`sectionId`),
  ADD KEY `idx_orzoqouioheiqazhwoehbvcsevftpezeqtyc` (`typeId`),
  ADD KEY `fk_rzszbehdctevwmnrojldudotiwoardgfjooj` (`parentId`);

--
-- Index pour la table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qqxncxmbtgvynirzharnjjjvnobmnyzmncbd` (`name`,`sectionId`),
  ADD KEY `idx_lpzskkidemsguasgpambbefolurgqwbbhadu` (`handle`,`sectionId`),
  ADD KEY `idx_theprvokavjgoilwnymkkvovgvvfddwptukt` (`sectionId`),
  ADD KEY `idx_hzrosnazfhwojmllpgyojjcqzqwviygrrxnw` (`fieldLayoutId`),
  ADD KEY `idx_wgdeszrhclhwvccmerpyseamzewxnpclgfyc` (`dateDeleted`);

--
-- Index pour la table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cmvdlkdhglpncbbpzkhtsmxpkcdpfnyhzsta` (`name`),
  ADD KEY `idx_cavoldjlklurtkplefnecgvjsvqadaqqtfet` (`dateDeleted`,`name`);

--
-- Index pour la table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_yrfapsphxwpwdkcvhuayajrhgdqatyfgbhhe` (`layoutId`,`fieldId`),
  ADD KEY `idx_evqwheeysfuxodjfpbrnjpxqmiimbflhblcd` (`sortOrder`),
  ADD KEY `idx_icqqtwzefcreodidrohmcupvfbjlglfybaww` (`tabId`),
  ADD KEY `idx_mvwgmonyquxrsoebzowegnknytpfszlknyxe` (`fieldId`);

--
-- Index pour la table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dshapspmrsjonscliucdhkmcvutpaosvdnco` (`dateDeleted`),
  ADD KEY `idx_eojramsrpvvvopyrgqcgfjcueftvewikwomf` (`type`);

--
-- Index pour la table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jwifvgehpgpxrtwkvjucyqzwkeymylemmidh` (`sortOrder`),
  ADD KEY `idx_mtdfmqclkazmrclpujwzgossavylwymzjzls` (`layoutId`);

--
-- Index pour la table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vkfobslejcoubjromafmadsnfaqxnzfuipjr` (`handle`,`context`),
  ADD KEY `idx_inhhuvzesdjcjwbbmykpgdqnzxhjwkqnkuah` (`groupId`),
  ADD KEY `idx_bvgjmsqamcfanuvmaypdljeruixpygjkvlwa` (`context`);

--
-- Index pour la table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dlrynpqwcedjhedwdcfghigqpyusxtpbdadl` (`name`),
  ADD KEY `idx_rgpsruudoqaqlttgzbkmrdcxbdrgguohwgja` (`handle`),
  ADD KEY `idx_vyhltkvbaypxcieqdmtqrjugoglsbsghfwkc` (`fieldLayoutId`),
  ADD KEY `idx_hietusobgfhzhtykdarywzschfvoawsrcgzu` (`sortOrder`);

--
-- Index pour la table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_otibrdatqfidgdjgkjbtgyrzjljcrkhuyxqm` (`accessToken`),
  ADD UNIQUE KEY `idx_ermfvpfwdnfbrbxhfbhqmxkuvektpfzqpblw` (`name`),
  ADD KEY `fk_oyrdwqdqodcbywhzrzvhfkftfozobgtfjhno` (`schemaId`);

--
-- Index pour la table `imagetransformindex`
--
ALTER TABLE `imagetransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_yiihrkqqeacuhitkcetkkdfvdvzyxrtjbsxl` (`assetId`,`transformString`);

--
-- Index pour la table `imagetransforms`
--
ALTER TABLE `imagetransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_izbfhzkrqjmfuqgsoycbftsxonjgmeksoogu` (`name`),
  ADD KEY `idx_fxoiszkikoerwdesxhmzndqruyubpiessvhy` (`handle`);

--
-- Index pour la table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tdfuizujioyxmxcxmkkepinzpeuxnhhinhfe` (`primaryOwnerId`),
  ADD KEY `idx_ninwhlhlssiijlcvgjvgcgcgmqgdzrnfvcqn` (`fieldId`),
  ADD KEY `idx_zntvjrlxsfmklpletzxtuxmxyeiromarylpt` (`typeId`);

--
-- Index pour la table `matrixblocks_owners`
--
ALTER TABLE `matrixblocks_owners`
  ADD PRIMARY KEY (`blockId`,`ownerId`),
  ADD KEY `fk_aemvcppqooqaxtkklctzjslzowojkpykgjgf` (`ownerId`);

--
-- Index pour la table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qjffveqfmlaxsljabfnfjomiagjleuuzeywa` (`name`,`fieldId`),
  ADD KEY `idx_qfxwiaaqqqifdinezgpcxlxfascpkwhuqgwo` (`handle`,`fieldId`),
  ADD KEY `idx_ebfhxevxpzqtrmwpkjkkdezwcrsivhhoaybn` (`fieldId`),
  ADD KEY `idx_jahdcazpgfcwxkcgbrwmmtrvntnuvxzmhotj` (`fieldLayoutId`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_yrhzxpdavwmbryojkdclnbozqbcrgsfostun` (`track`,`name`);

--
-- Index pour la table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_rtuxlkeozrlndvrhscreywgjjprjnuegsvab` (`handle`);

--
-- Index pour la table `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Index pour la table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dtleooafjjlahbuqyolqmlxaizveinmvambt` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `idx_pvgmtssolcpwuytwdljqneakjaebwkckhkjr` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Index pour la table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_fxlvycvtfkcgascdxjpfmycqepxmzohsipra` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `idx_rzzswdbwnleumevmvmyxrqxodxphokuygfoe` (`sourceId`),
  ADD KEY `idx_myyjnvjspykomwgypnawzzcealmeuaiwhmdk` (`targetId`),
  ADD KEY `idx_qofztkawthnkzorhrwxztuogqevchukvjrtw` (`sourceSiteId`);

--
-- Index pour la table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Index pour la table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_iertpjebrsszmggrwrsmryjihuugbniunyov` (`canonicalId`,`num`),
  ADD KEY `fk_ktddfoqqvhdohcahlisbsakahlxuwhhuddwl` (`creatorId`);

--
-- Index pour la table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_epteurnotagonmzuwpixcsicklkzajucndwb` (`keywords`);

--
-- Index pour la table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tpjunoegmqfwqmrqefgwxzqkoqfevuuqkbou` (`handle`),
  ADD KEY `idx_nyuiarfgweswjrkkpvrcmxjcoisqxfkozuuf` (`name`),
  ADD KEY `idx_ssiklyhedwmeaogqyvivjgxyzodutsiwlmeo` (`structureId`),
  ADD KEY `idx_wogqmqfdtzufpqipvjdpkelndicxofvubwxm` (`dateDeleted`);

--
-- Index pour la table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_jzsnjbdjvqlzjnehpwysrtlooyxdaumvuaxo` (`sectionId`,`siteId`),
  ADD KEY `idx_wtvekvtjgggqbbcogbkcahiwfixlywvqhohw` (`siteId`);

--
-- Index pour la table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_drprandckizdfltdgpulpiusscypwyqojzco` (`uid`),
  ADD KEY `idx_ipchhizctvcmgvthlsuwdjgnahdwkepxpief` (`token`),
  ADD KEY `idx_ayzuvgzyqwskcemzfavqdygfgkjtixnhvhww` (`dateUpdated`),
  ADD KEY `idx_vnzynhjvcgtwthxnugosbletvteewqwwpdlt` (`userId`);

--
-- Index pour la table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_yhvoylnbuwiohjwzsamhytxwcwaaobkdydcu` (`userId`,`message`);

--
-- Index pour la table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rkyylqyrenvwifgwpebdvwhaxhjrlbrqjpwv` (`name`);

--
-- Index pour la table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xytabtsjfpmkpfqlaooegbsuknztyknecurt` (`dateDeleted`),
  ADD KEY `idx_yzkiyhwdmmbgwfbsenmtsqjbffgogtxuzgtb` (`handle`),
  ADD KEY `idx_wmtautnypxggqrulrtitukoacrnziimuhdzt` (`sortOrder`),
  ADD KEY `fk_waewihpxhtkkhlfxndigqybujouknmqgflye` (`groupId`);

--
-- Index pour la table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_btqjolusoazzcoyyldvuvufrpvowwotwjuep` (`structureId`,`elementId`),
  ADD KEY `idx_hhzpyqwmecczcwxdlakypurotijopgpcbugl` (`root`),
  ADD KEY `idx_evpveaecxxfvquxhqyldewjdrqoomwdzlfdm` (`lft`),
  ADD KEY `idx_muwjtdmxirmzzxyirfdgrapmvuuvlihtzjij` (`rgt`),
  ADD KEY `idx_jiyzsdmsxstuxpprykgzqcsjnjbgjtovnjnn` (`level`),
  ADD KEY `idx_ffbkliwujymvadnazglokpkduzhnfamfqila` (`elementId`);

--
-- Index pour la table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_yucxyqilfzxbusdpwlkvrbiayniwlbqvhvsp` (`dateDeleted`);

--
-- Index pour la table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_rzmmyjtflrehneiacaljgpsovaexfoxobldr` (`key`,`language`),
  ADD KEY `idx_cclveqovelouqbupuujwfuecezvuhmwpexmy` (`language`);

--
-- Index pour la table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rbvzxzfcyvfavbgifqtsqbklgcdvepxpebsz` (`name`),
  ADD KEY `idx_xyxaenzthxaznijqqvohqklxglazbzfaozss` (`handle`),
  ADD KEY `idx_qigkbpnrzrqkqqogprwugnvuguzxncevbzdq` (`dateDeleted`),
  ADD KEY `fk_dwjbmgzdywcrmuuvndrvkawbfvdlnhhridsb` (`fieldLayoutId`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wifghbwejhialkuziioaqohgyjbdnjbtyqce` (`groupId`);

--
-- Index pour la table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_agiyntzolrqhbyaypcjutlqaxpkutsdcxmwb` (`token`),
  ADD KEY `idx_kkjxcupgqfvoebeeqjmazdpevytduwwbwgev` (`expiryDate`);

--
-- Index pour la table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lrzivhcrkcctjgbzyfzmyvugxspdxzpnyqbd` (`handle`),
  ADD KEY `idx_pydonoeyypftjczwqdrvyyaskjvhnvmbvmck` (`name`);

--
-- Index pour la table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_sjpvapiwarxsxhfunpqdbjzneigsklbbqzds` (`groupId`,`userId`),
  ADD KEY `idx_dxkrsdmvhhkzxrguhdhjcrxkpnjgpwsuxgrc` (`userId`);

--
-- Index pour la table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_rtrqyenhrkooiytfnhucetbysbesdcnbucnv` (`name`);

--
-- Index pour la table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_lquhhyjksqcgecefovqahslrntqachdrkhya` (`permissionId`,`groupId`),
  ADD KEY `idx_dldcdewfvnenerwtoyqdtvaazvrjxrpbwbgw` (`groupId`);

--
-- Index pour la table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_pxawlmhhubvffulenvwjqqfcgcuapmoeghuv` (`permissionId`,`userId`),
  ADD KEY `idx_crkrkyyybxajnbwojoyfocawaubqcwurmuwx` (`userId`);

--
-- Index pour la table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vgyufgnrssmfbkzpwyqpkyzmsbwieymxtjtc` (`active`),
  ADD KEY `idx_bdcymgtchgudbimuaqfljalhmaeullcsrtem` (`locked`),
  ADD KEY `idx_rnrlyxynpejaaxsklefukphjlkskvmtrkwts` (`pending`),
  ADD KEY `idx_thhzowcxmywihldkuygpewsvaricnipagcpi` (`suspended`),
  ADD KEY `idx_oedrvhseyaxfyeasivetukwygbekvgolzxao` (`verificationCode`),
  ADD KEY `idx_vbyzsaloeezietzzcrjsjvwrsmlekakgfvsu` (`email`),
  ADD KEY `idx_bebucmheipstexxrbqynhwkpmwcadfxxbibe` (`username`),
  ADD KEY `fk_yhnyfnpuousvjhdxlcnvrnwnqadscipacwhb` (`photoId`);

--
-- Index pour la table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_jwpubyiweiemkgzqedwmukxmndgxdulhaxza` (`name`,`parentId`,`volumeId`),
  ADD KEY `idx_cjshhoiyzectwjzoypoggcbkhbewkmrxmerf` (`parentId`),
  ADD KEY `idx_tdumtyruaolmznhxejqgmtumvrcmmjxcvfja` (`volumeId`);

--
-- Index pour la table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mrbgwxuwhukgaoekbxdqurdcxbtynrjygdgb` (`name`),
  ADD KEY `idx_lsswrsxbmsblxyxrlznnhszvabckzcryfmsc` (`handle`),
  ADD KEY `idx_llnokkflkyhahlwfoieibieawlrpjnalwawx` (`fieldLayoutId`),
  ADD KEY `idx_jfnmhlpnuzklesrtusefzhhqamzshfpkrnbw` (`dateDeleted`);

--
-- Index pour la table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ssulzenjrnwoqnpkowwtergetafjzdyqqdml` (`userId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `assetindexingsessions`
--
ALTER TABLE `assetindexingsessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `content`
--
ALTER TABLE `content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `imagetransformindex`
--
ALTER TABLE `imagetransformindex`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `imagetransforms`
--
ALTER TABLE `imagetransforms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `info`
--
ALTER TABLE `info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT pour la table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_neovmbssdzuryhtdkvousoguhlknembpbhdj` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rconbngzyztchvrbhzmpazfzwdrsnuxzeljd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_boeixrlsyvusuhaxdqoyzxyelfubutaurogi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_iadutwlxrbipasuyegtscethgjqukfbzesus` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_mdfxcefimuecyxluchndvmlahxifmhsrrrjo` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rgkrklqmeeshebtytlaxtfvolwmppokrftca` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_cpqlpqfwvmsqdhrxsjltklrjuvqorhmoeqoj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mclnmbdhqpmwucahhcokcekidtbyowhnimvq` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uejderrxzgrpuyfaicxdrlhblpffhbpzqyxa` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zywsjmwhevdvmeoozzfiqfhmvmaaeiggqqgg` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_ehcjpgjublntmrlyhmgxsgbmcxcjllxmvsoa` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_uzhbylrwmqxtujnrgmgxelhlbtoqrrudkfwl` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xarymkvujidpuclaktbyrmdhdtioktqilrzi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_fctweizknnylfaqkgazaknwtznfnkjmrcggf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_foeqcqyxsylgrgmuifcrjudbrilnjnkpfxgr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_bqdjksmbdqmvyewmteddgnyxsswvxhzetfcx` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pjrezhjflilhyxogcztnbtnzufyxseloautz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_hbnfjdwgunojgfvedjincluuipwxplpzwbla` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lhzgbochnyfzeamsldchcfujgpnhuggufgew` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pxyofenjlaijflvckgllabtdjppcorasrsae` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_aguufrgjnwgupcewaaoanzmmamganhlbmbuv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fmhndilzuqumrlllvgaqcijzrimomemchsdd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_gqetcthwrzvsrkipezycfbdropblawfnjeim` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_srqktmofbemphceymoyphheubqnslbjevfjk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk_bbxixxtqqwqvxgrezvnioffbkxdmuzpglrem` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sqjizuicgtnmrwnvwiwsyhostghfjrmdzyxo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_cjwtfnknewourzfuvowsgmllltzghzzraezg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_gpfobynjohauzqamkwzwldiuwbhpsvmguyji` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_luycdmvqhoxgbxcuwymllwlkzzbrkzpnskwt` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_ckhuuhzoexekicovyfjxoejyokfrahrlgcmh` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_kvglzkpqzgpgbishwwwulmnrevhlbjwmfepp` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uhvbkqlwehgayejjvvtjudvhwqjdzeaonevx` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ybgkforuplrkvxijkoyxlnskluvucaebbhtp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_isidlgbuppywjyzxcojdnkomqisbqamnonme` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_veclvbsxsqyvhunvatnrfdxgabfrsbfvutvy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_itsvhoqidjwnvlweldrhmujyanekdisxzshc` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jvuggrtqgckesulpzsssukvsxrvvzafbjufw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mqnwqjrhnqckirpgxxwzdwwffqgrwlvjlkas` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_qebbeetypuepboeavqozudooxpepcefmophu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rzszbehdctevwmnrojldudotiwoardgfjooj` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_qifzenbtqjpoixlavljlgjidvykwozyxlkmy` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vephwcdefhpaetdgherisiotykktnnonatlp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fk_czsfikfecckkadgtxwnglngsnhldyflsghdi` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xmejcxmecbexmzisonajzgplsxvzwhxxcgds` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yyueavkftsvqtuzsorkluhquumnbcducivfx` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fk_rmpnhphddwewcrrfibqynsjrxrglukodcsjv` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fk_gilqbhwlgsybkmcwqtjwgljumdmdfblpgefd` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_ablvprtkgmkukvdutsgrbmitlulnrooqoaqy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fpuyocojsqlrmfoarvjtxiealxkoezzedutx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_oyrdwqdqodcbywhzrzvhfkftfozobgtfjhno` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `fk_hhmxondxzgtytyyvvzbvqajwxntlocufkuvg` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hjqyoqpmxjfeeidjfpxbydbmhzgrzdpuemcb` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jaisvnshfnuzijerboxuyhjmvgrrpgvqwrsz` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_trwiqrfgojcsvcuvyuprmdljuyycotvuvhma` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `matrixblocks_owners`
--
ALTER TABLE `matrixblocks_owners`
  ADD CONSTRAINT `fk_aemvcppqooqaxtkklctzjslzowojkpykgjgf` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_axheoiwvwdqjbpdyggyjkqavdjttowcmauuu` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `fk_gmelhsmomctagpqrpojpjivpaxxsbgiwpikw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_mdbfgptililpjvrghyvjcirkbyfbddzlshsu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_aqbfanxyechgemwquwczevnzqvefjhyxaryp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ombsrsipeorfjnsicmlfvqmuyviiwrugqjod` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_uyqldwrqhlwdtbddxewtpdxwpvkmphtavkce` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ywfyakcprtalzgdfmpztwdxgyawirmbjijnp` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_ktddfoqqvhdohcahlisbsakahlxuwhhuddwl` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_xkyolugihfsbctbyoibrdtzokgabicdvhsoh` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_xalayyynrnkbyzryybjwontdsmbcgryjklbz` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_pfgbdqcjnhasdstwwmercizvvxkoacvwiqit` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zoexxuzsqfnswzkereammxvychcuuoemrvpi` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_qtfrtnpsotocsbflsyfkrhjxwtzepcjiqtqw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_dgpkrcigghivfjereanfrpnfqvoibkkbtorw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_waewihpxhtkkhlfxndigqybujouknmqgflye` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_bictcrxawjbpsnvkmwvtvjpvwtnjaysgrgue` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ocduguxptvgmykzehzwwilwnkvwhgvxgsocf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_dwjbmgzdywcrmuuvndrvkawbfvdlnhhridsb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_afoclyhwbibbnjjzhpzcbgiqzfbiokdurbpb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_btpcwvtwmzdljkuemuuqkljofibgmvzipuvt` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_fxkovgsmifjpbojspxreafbywbkqatveityo` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uuyazlgurgnmbunmiryuuxszjndsqwkalxbo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_ganesxqqypudxmbimxsbfsrspipynvphcroc` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gnpluldwhfwbxbynmznafzlyindzpydwzbsu` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_mpdfsmupoqpzterimhtnuotlirrfgzecmrvq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sfomkawkhewyewgmlfhzblytgaetdwlhcary` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_ojqkwtwomygpohgikaypadaluhygroiseadm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_nzzkzulbbdfaxdynvubprqgqgydxfmfownjr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yhnyfnpuousvjhdxlcnvrnwnqadscipacwhb` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_coktzkasujliaedrqeqsnwojuqgfyrdzjjff` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jtoevltffnxdkqdjgbbnvpqtsvyefepiiudg` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_jbjfbvzpmypvhoslpcxrpmyvlxecqnoofeyr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_mooghcxbdtqjsvuevkvkypdrzszqeuflxsqc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
