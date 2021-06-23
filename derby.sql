-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2021 at 11:25 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `derby`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add derby', 7, 'add_derby'),
(26, 'Can change derby', 7, 'change_derby'),
(27, 'Can delete derby', 7, 'delete_derby'),
(28, 'Can view derby', 7, 'view_derby'),
(29, 'Can add entry', 8, 'add_entry'),
(30, 'Can change entry', 8, 'change_entry'),
(31, 'Can delete entry', 8, 'delete_entry'),
(32, 'Can view entry', 8, 'view_entry'),
(33, 'Can add fight', 9, 'add_fight'),
(34, 'Can change fight', 9, 'change_fight'),
(35, 'Can delete fight', 9, 'delete_fight'),
(36, 'Can view fight', 9, 'view_fight'),
(37, 'Can add members', 10, 'add_members'),
(38, 'Can change members', 10, 'change_members'),
(39, 'Can delete members', 10, 'delete_members'),
(40, 'Can view members', 10, 'view_members');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$Aftrg1pqGux5TMFPC2lNOx$DmHE/yyp5GvqGq7cM80tYTQjl3Ug7WaOVQ1VK1YfpLQ=', '2021-06-23 09:20:30.545179', 0, 'benjack@gmail.com', 'Benjack', 'Sumilhig', 'benjack@gmail.com', 0, 1, '2021-06-06 00:22:25.332043');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `derby_derby`
--

CREATE TABLE `derby_derby` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `derby_type` varchar(100) NOT NULL,
  `no_entry` int(11) NOT NULL,
  `min_bet` double NOT NULL,
  `s_date` datetime(6) NOT NULL,
  `e_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `derby_derby`
--

INSERT INTO `derby_derby` (`id`, `user_id`, `name`, `location`, `derby_type`, `no_entry`, `min_bet`, `s_date`, `e_date`) VALUES
(1, 1, 'Cubao International Derby', 'Cubao', '2', 5, 3000, '2021-06-07 00:00:00.000000', '2021-06-12 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `derby_entry`
--

CREATE TABLE `derby_entry` (
  `id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `entry_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `is_member` tinyint(1) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `derby_entry`
--

INSERT INTO `derby_entry` (`id`, `tournament_id`, `user_id`, `owner`, `entry_name`, `email`, `contact_number`, `is_member`, `member_id`) VALUES
(1, 1, 1, 'Bogart Sumilhig', 'Boggart Gaming', 'benjack@gmail.com', '09393309038', 1, 1),
(2, 1, 1, 'Wyatt Tran', 'Wyatt Tran Gaming', 'Wyatt@gmail.com', '0910373269', 1, 12),
(3, 1, 1, 'Walker Schaefer', 'Walker Schaefer Gaming', 'Walker@gmail.com', '0910373269', 1, 7),
(4, 1, 1, 'Taniya English', 'Taniya English Gaming', 'Taniya@gmail.com', '0910373269', 1, 3),
(5, 1, 1, 'Sydney Oliver', 'Sydney Oliver Gaming', 'Sydney@gmail.com', '0910373269', 1, 11),
(6, 1, 1, 'Stephen Frazier', 'Stephen Frazier Gaming', 'Stephen@gmail.com', '0910373269', 1, 22),
(7, 1, 1, 'Preston Fleming', 'Preston Fleming Gaming', 'preston@gmail.com', '0910373269', 1, 2),
(8, 1, 1, 'Mike Mills', 'Mike Mills Gaming', 'Mike@gmail.com', '0910373269', 1, 15),
(9, 1, 1, 'Joselyn Carlson', 'Joselyn Carlson Gaming', 'Joselyn@gmail.com', '0910373269', 1, 4),
(10, 1, 1, 'John Malone', 'John Malone Gaming', 'Malone@gmail.com', '0910373269', 1, 18),
(11, 1, 1, 'Isiah Rice', 'Isiah Rice Gaming', 'Isiah@gmail.com', '0910373269', 1, 9),
(12, 1, 1, 'Herb Wallaker', 'Herb Wallaker Gaming', 'Herb@gmail.com', '0910373269', 1, 16),
(13, 1, 1, 'Herb Wallaker', 'Herb Wallaker Gaming', 'Herb@gmail.com', '0910373269', 1, 17),
(14, 1, 1, 'Ginger Howard', 'Ginger Howard Gaming', 'Ginger@gmail.com', '0910373269', 1, 21),
(15, 1, 1, 'Freddie Riley', 'Freddie Riley Gaming', 'Freddie@gmail.com', '0910373269', 1, 14),
(16, 1, 1, 'Elsa French', 'Elsa French Gaming', 'Elsa@gmail.com', '0910373269', 1, 13),
(17, 1, 1, 'Denton Poe', 'Denton Poe Gaming', 'Denton@gmail.com', '0910373269', 1, 20),
(18, 1, 1, 'Dennis Tillery', 'Dennis Tillery Gaming', 'Dennis@gmail.com', '0910373269', 1, 24),
(19, 1, 1, 'Dennis Tillery', 'Dennis Tillery Gaming', 'Dennis@gmail.com', '0910373269', 1, 24),
(20, 1, 1, 'Darryl Morales', 'Darryl Morales Gaming', 'Darryl@gmail.com', '0910373269', 1, 6),
(21, 1, 1, 'Corey Lozano', 'Corey Lozano Gaming', 'Corey@gmail.com', '0910373269', 1, 8),
(22, 1, 1, 'Camilla Velazquez', 'Camilla Velazquez Gaming', 'Camilla@gmail.com', '0910373269', 1, 5),
(23, 1, 1, 'Braedon Payne', 'Braedon Payne Gaming', 'Braedon@gmail.com', '0910373269', 1, 10),
(24, 1, 1, 'Bradley Shaw', 'Bradley Shaw Gaming', 'Bradley@gmail.com', '0910373269', 1, 23),
(25, 1, 1, 'Abe Blair', 'Abe Blair Gaming', 'Abe@gmail.com', '0910373269', 1, 19);

-- --------------------------------------------------------

--
-- Table structure for table `derby_fight`
--

CREATE TABLE `derby_fight` (
  `id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `leg_band` varchar(255) NOT NULL,
  `wing_band` varchar(255) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `bet` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `derby_fight`
--

INSERT INTO `derby_fight` (`id`, `tournament_id`, `user_id`, `owner_id`, `leg_band`, `wing_band`, `weight`, `bet`) VALUES
(1, 1, 1, 25, 'WB:MZKXNZOD', 'LB:GE3LXYTC', '2311', 3000),
(2, 1, 1, 25, 'WB:YIGHH5EX', 'LB:NOZQN1EE', '2333', 3000),
(3, 1, 1, 25, 'WB:3TWYER0M', 'LB:S0TP6ZBH', '2304', 3000),
(4, 1, 1, 25, 'WB:LSGIT57I', 'LB:PYU2QM92', '2319', 3000),
(5, 1, 1, 25, 'WB:TIGDY62Z', 'LB:OAHOQUQL', '2320', 3000),
(6, 1, 1, 24, 'WB:O863CGMD', 'LB:W8NWSA0A', '2318', 3000),
(7, 1, 1, 24, 'WB:AHH9O5KR', 'LB:EIIBSVQK', '2328', 3000),
(8, 1, 1, 24, 'WB:TPWT3VGU', 'LB:4GUYNJ5J', '2317', 3000),
(9, 1, 1, 24, 'WB:1M2T0P3L', 'LB:33UMXOJY', '2331', 3000),
(10, 1, 1, 24, 'WB:1YB9U3JA', 'LB:JMCJSH34', '2340', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'derby', 'derby'),
(8, 'derby', 'entry'),
(9, 'derby', 'fight'),
(10, 'member', 'members'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-06-06 00:21:16.210744'),
(2, 'auth', '0001_initial', '2021-06-06 00:21:17.355273'),
(3, 'admin', '0001_initial', '2021-06-06 00:21:23.255232'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-06-06 00:21:26.036440'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-06-06 00:21:26.091124'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-06-06 00:21:26.648133'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-06-06 00:21:27.569324'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-06-06 00:21:27.681633'),
(9, 'auth', '0004_alter_user_username_opts', '2021-06-06 00:21:27.719470'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-06-06 00:21:28.176953'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-06-06 00:21:28.205458'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-06-06 00:21:28.281479'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-06-06 00:21:28.397292'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-06-06 00:21:28.506413'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-06-06 00:21:28.638888'),
(16, 'auth', '0011_update_proxy_permissions', '2021-06-06 00:21:28.698961'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-06-06 00:21:28.880050'),
(18, 'derby', '0001_initial', '2021-06-06 00:21:29.522054'),
(19, 'derby', '0002_entry_is_member', '2021-06-06 00:21:29.666345'),
(20, 'derby', '0003_entry_member_id', '2021-06-06 00:21:29.940405'),
(21, 'member', '0001_initial', '2021-06-06 00:21:30.158989'),
(22, 'sessions', '0001_initial', '2021-06-06 00:21:30.387567'),
(23, 'derby', '0004_fight_entry_id', '2021-06-18 15:00:30.907975'),
(24, 'derby', '0005_remove_fight_entry_id', '2021-06-18 15:06:38.672216');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('a4q6yutdf7133ilkndkk8hyqvyzt3kl3', '.eJxVjDsOwjAQRO_iGlms_F1Kes5g7fqDA8iW4qRC3J1ESgHlzHszbxFoXWpYR57DlMRFgDj9dkzxmdsO0oPavcvY2zJPLHdFHnTIW0_5dT3cv4NKo25rr8hA8cDIzrstWbIlFqsAMRqF7AmLLxogccGstbX57BUYVhmjU-LzBdpiN5s:1lvdRp:UXCrQXmkh0afqGr6rOvWC81iemTcqcZVPph68RBosAc', '2021-07-06 10:16:01.777552'),
('g78d3tmqvtxhws2nhe1mg03iar0fmv67', '.eJxVjEsOwjAMBe-SNYpihzQyS_acIbIdlxZQK_Wzqrg7VOoCtm9m3uYKr0tX1tmm0ld3ceBOv5uwPm3YQX3wcB-9jsMy9eJ3xR909rex2ut6uH8HHc_dt24aTCooQKIQSTIkBiRsQbnGlCQB5EznYJwNMzE1AaLFNigaqbn3B8lhN2Q:1lvz3e:Q_JjcIRcl9y5ZiMjK_qQm3x-N7JPpM0sQhuJ1uJ96_c', '2021-07-07 09:20:30.573189'),
('lrkeyktc6cjtp53bd6h1gaoglf824sm9', '.eJxVjDsOwjAQRO_iGlms_F1Kes5g7fqDA8iW4qRC3J1ESgHlzHszbxFoXWpYR57DlMRFgDj9dkzxmdsO0oPavcvY2zJPLHdFHnTIW0_5dT3cv4NKo25rr8hA8cDIzrstWbIlFqsAMRqF7AmLLxogccGstbX57BUYVhmjU-LzBdpiN5s:1ls3zP:CuvD9r6JZNdEguUpBRxcx6BdDVYNbUtfwzpOUL5tmn4', '2021-06-26 13:47:55.779445'),
('trnronl0mipc8qbqo5905o0eryz9vzk7', '.eJxVjDsOwjAQRO_iGlms_F1Kes5g7fqDA8iW4qRC3J1ESgHlzHszbxFoXWpYR57DlMRFgDj9dkzxmdsO0oPavcvY2zJPLHdFHnTIW0_5dT3cv4NKo25rr8hA8cDIzrstWbIlFqsAMRqF7AmLLxogccGstbX57BUYVhmjU-LzBdpiN5s:1lvGKX:K78jhQyYpJYJ6A0V6bNdIa9Ezt63YHsI0hlGqaLTHYI', '2021-07-05 09:34:57.171859');

-- --------------------------------------------------------

--
-- Table structure for table `member_members`
--

CREATE TABLE `member_members` (
  `id` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `farm_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member_members`
--

INSERT INTO `member_members` (`id`, `user_id`, `owner`, `farm_name`, `location`, `email`, `contact_number`) VALUES
(1, '1', 'Bogart Sumilhig', 'BS Winning Game Farm', 'Malitbog', 'benjack@gmail.com', '09393309038'),
(2, '1', 'Preston Fleming', 'Preston Game Farm', 'Cubao', 'preston@gmail.com', '0910373269'),
(3, '1', 'Taniya English', 'Taniya Game Farm', 'Ortigas', 'Taniya@gmail.com', '0910373269'),
(4, '1', 'Joselyn Carlson', 'Joselyn Game Farm', 'Manila', 'Joselyn@gmail.com', '0910373269'),
(5, '1', 'Camilla Velazquez', 'Camilla Game Farm', 'Bulacan', 'Camilla@gmail.com', '0910373269'),
(6, '1', 'Darryl Morales', 'Darryl Game Farm', 'Valenzeula', 'Darryl@gmail.com', '0910373269'),
(7, '1', 'Walker Schaefer', 'Walker Game Farm', 'Bacoor', 'Walker@gmail.com', '0910373269'),
(8, '1', 'Corey Lozano', 'Corey Game Farm', 'Dasmarinas', 'Corey@gmail.com', '0910373269'),
(9, '1', 'Isiah Rice', 'Isiah Game Farm', 'Tagaytay', 'Isiah@gmail.com', '0910373269'),
(10, '1', 'Braedon Payne', 'Braedon Game Farm', 'Bataan', 'Braedon@gmail.com', '0910373269'),
(11, '1', 'Sydney Oliver', 'Sydney Game Farm', 'Quezon', 'Sydney@gmail.com', '0910373269'),
(12, '1', 'Wyatt Tran', 'Wyatt Game Farm', 'Bagon bayan', 'Wyatt@gmail.com', '0910373269'),
(13, '1', 'Elsa French', 'Elsa Game Farm', 'Caloocan', 'Elsa@gmail.com', '0910373269'),
(14, '1', 'Freddie Riley', 'Freddie Game Farm', 'Pasig', 'Freddie@gmail.com', '0910373269'),
(15, '1', 'Mike Mills', 'Mike Game Farm', 'Santa Maria', 'Mike@gmail.com', '0910373269'),
(16, '1', 'Herb Wallaker', 'Herb@gmail.com', 'Laguna', 'Herb@gmail.com', '0910373269'),
(17, '1', 'Herb Wallaker', 'Herb@gmail.com', 'Laguna', 'Herb@gmail.com', '0910373269'),
(18, '1', 'John Malone', 'Malone Game Farm', 'Malvar', 'Malone@gmail.com', '0910373269'),
(19, '1', 'Abe Blair', 'Abe Game Farm', 'Las Pinas', 'Abe@gmail.com', '0910373269'),
(20, '1', 'Denton Poe', 'Denton Game Farm', 'Cubao', 'Denton@gmail.com', '0910373269'),
(21, '1', 'Ginger Howard', 'Ginger Game Farm', 'Albay', 'Ginger@gmail.com', '0910373269'),
(22, '1', 'Stephen Frazier', 'Stephen@gmail.com', 'Ermita', 'Stephen@gmail.com', '0910373269'),
(23, '1', 'Bradley Shaw', 'Bradley Game Farm', 'Cubao', 'Bradley@gmail.com', '0910373269'),
(24, '1', 'Dennis Tillery', 'Dennis Game Farm', 'Manila', 'Dennis@gmail.com', '0910373269');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `derby_derby`
--
ALTER TABLE `derby_derby`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `derby_entry`
--
ALTER TABLE `derby_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `derby_fight`
--
ALTER TABLE `derby_fight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `member_members`
--
ALTER TABLE `member_members`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `derby_derby`
--
ALTER TABLE `derby_derby`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `derby_entry`
--
ALTER TABLE `derby_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `derby_fight`
--
ALTER TABLE `derby_fight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `member_members`
--
ALTER TABLE `member_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
