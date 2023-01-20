-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 20, 2023 at 11:02 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nextg_mobileapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_access`
--

CREATE TABLE `tb_access` (
  `id_access` varchar(255) NOT NULL,
  `id_auth` varchar(255) NOT NULL,
  `management` int(11) NOT NULL,
  `warga` int(11) NOT NULL,
  `estate_manager` int(11) NOT NULL,
  `cordinator` int(11) NOT NULL,
  `landscape` int(11) NOT NULL,
  `otp` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_access`
--

INSERT INTO `tb_access` (`id_access`, `id_auth`, `management`, `warga`, `estate_manager`, `cordinator`, `landscape`, `otp`) VALUES
('027976bd-d388-4ab3-9672-2e1933e10144', 'd79915ac-449f-4013-9dc5-251aef168da4', 0, 0, 0, 0, 0, 0),
('4878c8b6-009d-4674-8d1b-fe9d9347e1bf', 'e9cd8a0f-0309-4f79-b40b-39e2a0b30291', 0, 0, 0, 0, 0, 0),
('77d487e8-fc2b-4d6f-ac89-36fa8bae3966', '2fea85f4-aa31-4727-8cf1-ad1245505f7a', 0, 0, 1, 0, 0, 1),
('79b3070d-fc61-4199-ac10-7a9ffa6a1918', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 0, 0, 0, 1, 0, 1),
('b4b54f73-7309-4600-a305-cb337d8e62ec', '538b399e-632b-489e-8ea9-0b1ecf5a3045', 0, 1, 0, 0, 0, 1),
('fb5f6459-281a-40f5-aeb0-b974dd370af0', 'ff5d78eb-dced-46b9-8230-0df6de9a9a73', 0, 0, 0, 0, 0, 0),
('fc7c087c-f05b-4df5-851f-6d858954ce42', 'e47b4e1b-ecd5-41aa-90fa-20ae88f2f44c', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_authorization`
--

CREATE TABLE `tb_authorization` (
  `id_auth` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_authorization`
--

INSERT INTO `tb_authorization` (`id_auth`, `status`) VALUES
('2fea85f4-aa31-4727-8cf1-ad1245505f7a', 'ESTATEMANAGER'),
('538b399e-632b-489e-8ea9-0b1ecf5a3045', 'WARGA'),
('5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'CORDINATOR'),
('d79915ac-449f-4013-9dc5-251aef168da4', 'CONTRACTOR'),
('e47b4e1b-ecd5-41aa-90fa-20ae88f2f44c', 'ADMIN'),
('e9cd8a0f-0309-4f79-b40b-39e2a0b30291', 'MANAGEMENT'),
('ff5d78eb-dced-46b9-8230-0df6de9a9a73', 'BETA TEST');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bill_event`
--

CREATE TABLE `tb_bill_event` (
  `id_event` int(11) NOT NULL,
  `tab_title` varchar(50) NOT NULL,
  `url_image_event` varchar(100) NOT NULL,
  `title_event` varchar(50) NOT NULL,
  `price` varchar(100) NOT NULL,
  `duedate` datetime NOT NULL,
  `background_color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bill_event`
--

INSERT INTO `tb_bill_event` (`id_event`, `tab_title`, `url_image_event`, `title_event`, `price`, `duedate`, `background_color`) VALUES
(1, 'Event Lomba', 'imageevent/even2.jpg', 'citizen dues for event contest', '150.000', '2022-06-25 13:00:00', 'Colors.green');

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

CREATE TABLE `tb_category` (
  `id_category` int(11) NOT NULL,
  `id_master_category` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`id_category`, `id_master_category`, `category`, `icon`) VALUES
(1, 1, 'Perawatan taman', 'perawatan-taman.png'),
(2, 1, 'Kebersihan Lingkungan', 'kebersihan-lingkungan.png'),
(3, 1, 'Kesehatan Lingkungan', 'kesehatan-lingkungan.png'),
(4, 2, 'Perawatan Mekanikal dan Elektrikal', 'perawatan-mekanikal-elektrikal.png'),
(5, 1, 'Perawatan Club house', 'perawatan-club-house.png'),
(6, 3, 'Building Controll', 'building-controll.png'),
(7, 2, 'Perawatan Kolam Renang', 'perawatan-kolam-renang.png'),
(8, 4, 'Pengurusan Administrasi', 'pengurusan-administrasi.png'),
(9, 3, 'Permasalahan Keamanan', 'permasalahan-keamanan.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_category_detail`
--

CREATE TABLE `tb_category_detail` (
  `id_category_detail` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `icon_detail` varchar(50) NOT NULL,
  `name_category_detail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_category_detail`
--

INSERT INTO `tb_category_detail` (`id_category_detail`, `id_category`, `icon_detail`, `name_category_detail`) VALUES
(1, 1, 'pohon_01_blue.png', 'Pemangkasan Pohon'),
(2, 1, 'pohon_01_blue.png', 'Pemangkasan Rumput'),
(3, 1, 'pohon_01_blue.png', 'Pemangkasan Semak'),
(4, 2, 'sampah 02_blue.png', 'Pembuangan Sampah Taman'),
(5, 2, 'sampah 02_blue.png', 'Penyapuan Jalan'),
(6, 2, 'sampah 02_blue.png', 'Pencabutan Rumput Liar'),
(7, 2, 'sampah 02_blue.png', 'Pembersihan Saluran'),
(8, 3, 'pest_ctrl_01_blue.png', 'Pest Controll'),
(9, 3, 'pest_ctrl_01_blue.png', 'Roden Controll'),
(10, 3, 'pest_ctrl_01_blue.png', 'Animal Controll'),
(11, 3, 'pest_ctrl_01_blue.png', 'Termite Controll'),
(12, 4, 'kabelistrik_01_blue.png', 'Perawatan Penerangan Jln Umum / Lampu'),
(13, 4, 'kabelistrik_01_blue.png', 'Perawatan Panel'),
(14, 4, 'kabelistrik_01_blue.png', 'Perawatan Barrier Gate'),
(15, 7, 'kolam_renang_01_blue.png', 'Perawatan Kolam Renang'),
(17, 6, 'pengawas_bgn_01_blue.png', 'Pengawan Proyek'),
(18, 1, 'pohon_01_blue.png', 'Pengendalian Hama'),
(19, 4, 'kabelistrik_01_blue.png', 'Perawatan CCTV'),
(20, 1, 'pohon_01_blue.png', 'Penyiraman Taman'),
(23, 1, 'pohon_01_blue.png', 'Pemupukan'),
(24, 1, 'pohon_01_blue.png', 'Weeding'),
(25, 2, 'sampah 02_blue.png', 'Kebersihan Brandgang\r\n'),
(26, 4, 'kabelistrik_01_blue.png', 'Perawatan Lampu Taman'),
(27, 1, 'clubhouse02_blue.png', 'Pembersihan Club House\r\n'),
(28, 1, 'clubhouse02_blue.png', 'Perawatan Rumah Pompa'),
(29, 6, 'pengawas_bgn_01_blue.png', 'Pengawasan Fungsi Bangunan'),
(30, 6, 'pengawas_bgn_01_blue.png', 'Perawatan Pos Jaga'),
(31, 6, 'pengawas_bgn_01_blue.png', 'Perawatan Jalan'),
(32, 6, 'pengawas_bgn_01_blue.png', 'Perawatan Pagar'),
(33, 8, 'keamanan_01_blue.png', 'Pengurusan izin perbaikan no deposit'),
(34, 8, '', 'Pengurusan izin renovasi Deposit'),
(35, 8, '', 'Pengurusan Id Card'),
(36, 8, '', 'Pengurusan izin kendaraan Proyek'),
(37, 8, '', 'Pengurusan refund deposit'),
(38, 8, '', 'Pengurusan refund deposit'),
(39, 8, '', 'Pengurusan kartu akses'),
(40, 8, '', 'Pengurusan izin Kegiatan'),
(41, 8, '', 'Pengurusan Izin Tinggal');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cluster`
--

CREATE TABLE `tb_cluster` (
  `id_cluster` varchar(255) NOT NULL,
  `code_cluster` varchar(100) NOT NULL,
  `cluster` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_cluster`
--

INSERT INTO `tb_cluster` (`id_cluster`, `code_cluster`, `cluster`) VALUES
('72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', 'AG1', 'AKASIA GOLF'),
('86775703-86c1-46a1-92fb-173e95609a8f', 'EG1', 'EBONY GOLF'),
('f32151ef-5d84-484d-b392-5bb224db4a4d', 'AG3', 'AKASIA GOLF');

-- --------------------------------------------------------

--
-- Table structure for table `tb_comment`
--

CREATE TABLE `tb_comment` (
  `id_comment` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_contractor`
--

CREATE TABLE `tb_contractor` (
  `id_contractor` varchar(255) NOT NULL,
  `id_estate_cordinator` varchar(255) NOT NULL,
  `name_contractor` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_contractor`
--

INSERT INTO `tb_contractor` (`id_contractor`, `id_estate_cordinator`, `name_contractor`, `email`, `no_telp`) VALUES
('088c42c7-5f9b-49cc-9dcc-f3ccc651f2f1', '', 'pt ham', 'iskandar@gmail.comas', ''),
('0d9d3571-448e-40ef-b6cc-9e2a0316cf45', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINassaasaaaa', 'delcoin@gmail.comsaaa2ssssaa', '08571434222322223ssssaa'),
('103eb37b-8d5a-40a5-bec1-7c1ab607d541', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINassaasaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaa', '08571434222322223ssssaaaaa'),
('10fad8cc-d24d-47f9-8df2-e044da5839b0', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaasasaaa', 'a@gmail.comsaaa2ssssaaasaasa', '08571434assaasasaaaaaasssassaasaaaa'),
('111ab08e-3d65-48b2-a539-4fed696e3c22', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaasassaaasaaaas', 'a@gmail.comsaaa2ssssaaasasasaaaaaas', ''),
('1d83b555-6731-4a6b-8ac9-353583875690', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassaassaas', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaasaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasasaa'),
('21eb61fe-d0ec-470a-ae66-87f20c1e8da4', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaasa', 'a@gmail.comsaaa2ssssaaas', '08571434assaasasaaaaaasssassaas'),
('22ebe832-e2cf-41c0-b1ab-811d05a45153', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINassaasaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaa', '08571434222322223ssssaaaaaaa'),
('2555c63a-be72-47a2-ba6c-095dae455116', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINassa', 'delcoin@gmail.comsaaa', '08571434222322223'),
('28b266c9-d883-4176-9486-463e90e2c4c3', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaasasaaasaaa', 'a@gmail.comsaaa2ssssaaasaasaaaaa', '08571434assaasasaaaaaasssassaasaaaaaaaa'),
('28e39cca-bf3b-4977-9864-e1c247816b60', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT TOLOL', 'delcoin@gmail.comsaaa2ssssaaaaaaa', '08571434222322223ssssaaaaaaa'),
('2bc85e1f-f42f-4966-aedb-e5815aeb933c', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassaass', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasa'),
('33a2aa71-209e-4de8-b629-30facc215e5e', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaaas', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaasaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasasaaaaaa'),
('344e468f-6d1b-48ff-a557-b2c22574873a', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT TOLOLaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaa'),
('35a0a4ca-cbd8-4e14-80b9-6eda31da10ca', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaa'),
('369c9549-7574-43cd-9959-bd480d4eba33', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaasasaaasa', 'a@gmail.comsaaa2ssssaaasaasaaa', '08571434assaasasaaaaaasssassaasaaaaaa'),
('393390a0-636b-4fb4-89ec-74f62311b5df', '50d3f165-e363-4aa4-a871-8a30af8a1251', 'sadasd', 'asdasdf@gmail.com', '085714342528'),
('3e4614dd-2b80-4dbf-9cce-2ab3980a1135', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassaassa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaas', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasas'),
('3f598593-a362-4ce4-a74e-0c2d5dd82236', '3dfc0f07-d3ac-4bf0-8609-a969929f17de', 'skdajsdkljkl', 'klasjdlasjdl@gmail.com', ''),
('419c6596-9331-4672-a4fa-f047a6c66cf6', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsa', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaasaaaaaassaaasaaaaaass', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaasassaasasaaaaaasss'),
('46a8b8b2-62f2-471c-8787-b90435907699', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINassaasaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaa', '08571434222322223ssssaaaa'),
('49297981-ee6b-49a6-b0c4-4a2717eac880', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaasasa', 'a@gmail.comsaaa2ssssaaasaa', '08571434assaasasaaaaaasssassaasaa'),
('4c6a3e4c-47f5-445b-a3d3-61849d86ea25', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaa'),
('4df2407d-bde2-42cf-a670-5d150ef5f087', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT TOLOL', 'delcoin@gmail.comsaaa2ssssaaaaaaa', '08571434222322223ssssaaaaaaa'),
('4e05f1b2-f955-4817-86a7-2e7c4bbb71d7', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaasaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasasaaaa'),
('54141134-e208-48b0-801f-511498270cc0', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOIN', 'delcoin@gmail.com', '0857143422232'),
('55c383c6-4081-4485-b545-98dab53ef501', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINassaasaaa', 'delcoin@gmail.comsaaa2ssssa', '08571434222322223ssssa'),
('565f4e51-71f3-4cc6-bee4-3efae513f9c5', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaasasaaasaaaa', 'a@gmail.comsaaa2ssssaaasaasaaaaaa', '08571434assaasasaaaaaasssassaasaaaaaaaaa'),
('5cd86542-06f9-4372-be8b-efbee17b17ab', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINassaasa', 'delcoin@gmail.comsaaa2sss', '08571434222322223sss'),
('5de72d36-822f-4cfb-973c-a7c1a4a3852a', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT TOLOL', 'delcoin@gmail.comsaaa2ssssaaaaaaa', '08571434222322223ssssaaaaaaa'),
('5e958f01-899e-4a4e-9ea2-c28690ca47d8', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT TOLOLaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaa'),
('5eaa875c-804d-4835-b932-4de20decb221', '', 'asdasd', '', ''),
('6533682f-6857-4ea4-a6ae-949d431565b4', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGO', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaasaaaaaaaaaassaaasaaaaaass', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasasaaaaaasss'),
('65a0df11-b365-485a-bcab-ad9cdb503aef', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINa', 'delcoin@gmail.coms', '08571434222322'),
('6607ff2e-807c-4b0f-8576-ce4a98eb3b7f', '23959258-39d6-425f-ae36-aa8243b1b3a0', 'asdasdsad', 'asdsada@gmail.com', ''),
('698055e8-65b6-4bfe-8223-031519cd1106', '46b10481-d274-41fe-9f39-03f8eeebf87a', 'asdasdad', 'asdasdsa@gmail.com', '07846554656'),
('6ac5d842-b5cc-4cdb-97cc-2cffa27bca60', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaa'),
('6ad9e1a6-a1b8-475e-af93-1cfdd8e05a64', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINas', 'delcoin@gmail.comsa', '085714342223222'),
('6c3caf2c-6fee-4361-9fea-6620c2b12fe8', '3dfc0f07-d3ac-4bf0-8609-a969929f17de', 'asdsadasd', 'asdsadsaalal@gmail.com', '085714342528'),
('6c85e81f-5abe-4d11-b3af-c07487249301', 'c56caaef-83be-4eb6-b880-c10268d1e9f8', 'jajang', '', ''),
('7057d79b-f41e-4b10-88c8-f960d61d63dc', '', 'pt ham', 'iskandar@gmail.comas', '085714342'),
('73cc6710-8243-49ea-892e-6618d1f40c46', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaa'),
('75f86371-eee3-4b05-8b2d-cf1d383877de', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaasaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasasaaaaa'),
('7a3d1255-a896-4952-9976-d462095eb5af', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaass', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaass', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaass'),
('7b873626-27a7-4802-a7ab-aac4e03df32b', '', 'pt ham', 'iskandar@gmail.comasa', '0857143422'),
('7fc5336e-c843-43d8-8717-1608216cec54', '3dfc0f07-d3ac-4bf0-8609-a969929f17de', 'dasdasdasd', 'isajdlasjd@gmail.com', '0857134564123'),
('8132f6d4-ae00-42fb-bd6c-2d16ba735d10', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaasaasaaaasaaaaasassaaasaaaaaassassa', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaassassaasasaaaaaasssassaa'),
('81b334d0-7fcf-4f2b-9e80-fc1e18c4ce93', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaa'),
('8391d074-0a88-4330-8969-d20336ec3569', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsas', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaasaaaaaassaaasaaaaaassa', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaasassaasasaaaaaasssa'),
('84c3a285-a4df-4a9f-8f05-2a89bcf0638e', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaa'),
('873f4ad8-a20b-4bb9-a9ae-3f685c04bd53', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT TOLOLaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaa', '08571434222322223ssssaaaaaaaaa'),
('88747b01-176f-4e7c-bf17-defbca98be81', '', 'pt ham', 'iskandar@gmail.comas', '085714342'),
('8a2902c6-8848-42f2-9f24-0c3a0be21b00', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINassaasaa', 'delcoin@gmail.comsaaa2ssss', '08571434222322223ssss'),
('8dd08eae-6d5f-494a-aa20-95892316acbc', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsass', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaasaaaaasassaaasaaaaaassa', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaassassaasasaaaaaasssa'),
('8e973b05-1e86-4957-ae2f-a2546dcc8fda', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaa'),
('8f8620b1-fea0-4882-b984-59e21ced5113', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaasas', 'a@gmail.comsaaa2ssssaaasa', '08571434assaasasaaaaaasssassaasa'),
('9087740a-0016-46a5-a280-be979e687848', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassaas', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaas'),
('92248286-f456-4a4a-9cf7-232a4746a65e', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaasaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasasaaa'),
('932a6ddf-ed0b-4796-9048-1f97337beee9', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaasasaa', 'a@gmail.comsaaa2ssssaaasaas', '08571434assaasasaaaaaasssassaasaaa'),
('94537842-9331-4b7d-92ea-2a5c1cc0f012', 'usdcfghi23ey823', 'iskandar', '', ''),
('9769ec67-48fe-4733-97d2-3c17c514e945', '23959258-39d6-425f-ae36-aa8243b1b3a0', 'asdasdasd', 'aasdsad@gmail.com', '08571434252829454'),
('985d6d03-73e1-46d6-bf5c-4498ff9f89ee', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOIN', 'delcoin@gmail.com', '0857143422232'),
('9b2f3e14-3a89-43ef-90d9-abe128884d56', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaaasss', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaasaaaaaaaaaassaaasaaaaaas', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasasaaaaaass'),
('a46a67f0-d7b0-48da-acda-344cc511dcac', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOs', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaaaaaaaassaaasaaaaaass', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaaassaasasaaaaaasss'),
('a4fa75ea-ddb9-4719-bc39-0dc217df7736', '', 'pt ham', 'iskandar@gmail.comas', '085714342'),
('a5302344-c1da-479f-9e35-b3459012ae08', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINassaasaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaa', '08571434222322223ssssaaaaaa'),
('a53d55e2-6dfd-4c89-bff2-3b80e33a0aab', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassaassaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaasa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasasa'),
('a7c1962c-4f1c-4f99-97d3-1481f00f5be1', '', 'pt ham', 'iskandar@gmail.comasaa', '08571434222'),
('aa62d355-8c3c-4bdf-9252-13d04949fd20', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaa'),
('aa717411-d3c1-4ebd-a219-d65b33ce35c7', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaaass', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaasaaaaaaaaaassaaasaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasasaaaaaas'),
('b162eb08-504f-47b0-9acb-d2d9eb258625', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaasasaaas', 'a@gmail.comsaaa2ssssaaasaasaa', '08571434assaasasaaaaaasssassaasaaaaa'),
('b3a1fac4-a715-47da-8f9d-d60e7529f814', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaasasaaasaaaas', 'a@gmail.comsaaa2ssssaaasaasaaaaaas', '08571434assaasasaaaaaasssassaasaaaaaaaaas'),
('b41ba46e-0382-4e24-8c7c-86f1a8ebdf7b', '23959258-39d6-425f-ae36-aa8243b1b3a0', 'asdasdasdaa', 'aasdsad@gmail.comsa', '0857143425282945482'),
('bd8ed9c5-ffcd-4254-96eb-700945e86dc4', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaa'),
('c15f7aa6-3594-423b-8a8a-c416b551c94d', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaasaaaaasassaaasaaaaaassassa', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaassassaasasaaaaaasssassa'),
('c1a82f78-2c58-4f0f-b2f9-a4ff973ab07a', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaas', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaas', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaas'),
('c41288d8-0103-4c3e-8181-17e47d05fee5', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINass', 'delcoin@gmail.comsaa', '0857143422232222'),
('c41a20ac-1a22-4c63-b40c-a0a4c0f7ba64', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT TOLOLa', 'delcoin@gmail.comsaaa2ssssaaaaaaaa', '08571434222322223ssssaaaaaaaa'),
('c4286c9c-9934-4400-98ff-f4b8ee22b94d', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINassaasaaaaa', 'delcoin@gmail.comsaaa2ssssaaa', '08571434222322223ssssaaa'),
('ce5ae67c-f7c3-4656-9671-a19b45b6484f', 'usdcfghi23ey823', 'jajang', '', ''),
('d111498a-6b37-456c-a871-2fce77402d71', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassa', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaasaaaaasassaaasaaaaaassas', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaassassaasasaaaaaasssas'),
('d20ed281-e4c9-45b2-83ee-a0d4e2e7163d', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaasaaaaasassaaasaaaaaassass', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaassassaasasaaaaaasssass'),
('dde9a58c-d222-4fab-b36b-23de0ef7e9a8', '', 'PT HAMA', 'iskandar@gmail.comasaas', '085714342223'),
('de349790-1b50-45b6-90ed-f51ce5e24fcf', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaasasaaasaa', 'a@gmail.comsaaa2ssssaaasaasaaaa', '08571434assaasasaaaaaasssassaasaaaaaaa'),
('e01edc99-7759-4ca5-a97b-0f3cd358f3b6', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT TOLOLaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaa'),
('e10f8944-87ab-4dfb-af5c-eb85c2dc3ac7', '23959258-39d6-425f-ae36-aa8243b1b3a0', 'asdasdasda', 'aasdsad@gmail.coms', '085714342528294548'),
('e16e6ab1-e8f1-4be7-b932-0fea95a9c7d0', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINassaas', 'delcoin@gmail.comsaaa2ss', '08571434222322223ss'),
('e1756172-d12c-42a5-aaeb-b8e14c00837f', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaa'),
('e530e25a-81d2-4aa8-9fc9-8df1958fe40b', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassa'),
('e5d9839c-7c48-4f88-a37b-e8fe2d9abeed', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'PT DELCOINassaa', 'delcoin@gmail.comsaaa2', '08571434222322223s'),
('e7554bf8-60a8-4a22-817f-c0d2417e0abc', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaaaaaaaassaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaa'),
('f551422e-9060-4411-9ec7-607c3341f7c1', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT BGOsassaaaaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaasaasaaaasaaaaasassaaasaaaaaassassas', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaassassaasasaaaaaasssassaas'),
('f6a7a4e5-b851-4a70-90aa-b29a1a599080', '23959258-39d6-425f-ae36-aa8243b1b3a0', 'asdasd', 'asdasd@gmail.com', ''),
('fce5d132-ce5d-4c7e-b50f-2cea2fb85a10', '1710e6f6-f54d-4726-872d-23cb56e65118', 'PT TOLOLaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaa');

-- --------------------------------------------------------

--
-- Table structure for table `tb_contractor_fcm_token`
--

CREATE TABLE `tb_contractor_fcm_token` (
  `id_token` varchar(255) NOT NULL,
  `id_estate_contractor` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_contractor_job`
--

CREATE TABLE `tb_contractor_job` (
  `id_contractor_job` varchar(255) NOT NULL,
  `id_contractor` varchar(255) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_contractor_job`
--

INSERT INTO `tb_contractor_job` (`id_contractor_job`, `id_contractor`, `id_category`) VALUES
('04fbfa93-d3a7-498c-9634-dcd01c60f148', '6c3caf2c-6fee-4361-9fea-6620c2b12fe8', 3),
('05153e7d-bc28-4bc2-82c9-e6caa6cb869e', '111ab08e-3d65-48b2-a539-4fed696e3c22', 1),
('05443701-ce4b-4d7f-a0f4-c0b3e74c71c5', '6c3caf2c-6fee-4361-9fea-6620c2b12fe8', 5),
('292d7d2e-1e40-4638-9b9f-01b0d8700f0c', 'e10f8944-87ab-4dfb-af5c-eb85c2dc3ac7', 1),
('31ecffba-6b3b-4dbe-9f00-1bbbf94fdf78', 'b41ba46e-0382-4e24-8c7c-86f1a8ebdf7b', 1),
('36018bc4-8a20-47f1-a4dd-25bbd7b3c0f4', '3f598593-a362-4ce4-a74e-0c2d5dd82236', 4),
('36fe3d15-124c-4bef-b853-a818504309fc', '7fc5336e-c843-43d8-8717-1608216cec54', 1),
('3a2eb608-5147-4219-8814-e008ba81172f', 'b3a1fac4-a715-47da-8f9d-d60e7529f814', 3),
('3cf45286-4ba0-461a-b2c3-b32482697593', '6607ff2e-807c-4b0f-8576-ce4a98eb3b7f', 1),
('3fd6924d-4580-412b-a644-d5e8859caf39', '5eaa875c-804d-4835-b932-4de20decb221', 1),
('40446068-e52b-4a4f-bd93-acc3849ea525', '393390a0-636b-4fb4-89ec-74f62311b5df', 1),
('4ddf3e56-820b-45b7-bcc9-f23893b7cb4c', '565f4e51-71f3-4cc6-bee4-3efae513f9c5', 1),
('5ada272f-ba1b-40a3-a486-17a1b69f66b5', '565f4e51-71f3-4cc6-bee4-3efae513f9c5', 3),
('5b5ec76b-dbc0-4ccc-a5d5-fe8604cfb8aa', '111ab08e-3d65-48b2-a539-4fed696e3c22', 3),
('5f14d9fd-e605-4fdb-bc9b-30642b1c883c', 'b3a1fac4-a715-47da-8f9d-d60e7529f814', 1),
('6f89f764-1ea4-4043-897c-9b53410d5bca', 'f6a7a4e5-b851-4a70-90aa-b29a1a599080', 2),
('70966622-2930-4193-9bf9-14159658b60b', '9769ec67-48fe-4733-97d2-3c17c514e945', 1),
('7ea39b72-2719-4b2d-8d7c-5020e3ecc89f', '698055e8-65b6-4bfe-8223-031519cd1106', 2),
('861e8593-0588-429e-9394-ab439dcaa1f0', '3f598593-a362-4ce4-a74e-0c2d5dd82236', 3),
('94dfae42-c30c-4d31-a704-1de5bacaad79', '393390a0-636b-4fb4-89ec-74f62311b5df', 2),
('b57f8879-51a7-45bf-ac24-0954f999cda8', '7fc5336e-c843-43d8-8717-1608216cec54', 2),
('d2ceb39c-7fea-493e-a4a1-7332568e3907', '5eaa875c-804d-4835-b932-4de20decb221', 2),
('e6fb998f-c900-47f0-83ab-f74bdf7b406b', '698055e8-65b6-4bfe-8223-031519cd1106', 1),
('eaf00f2e-8976-4ba2-9663-d36e6f34d060', 'f6a7a4e5-b851-4a70-90aa-b29a1a599080', 1),
('f4760ae8-fad8-4626-b1c8-c7673fe8117e', '6607ff2e-807c-4b0f-8576-ce4a98eb3b7f', 2),
('f904ea28-2541-4ebe-95cf-3a6e97858633', '6c3caf2c-6fee-4361-9fea-6620c2b12fe8', 4),
('fe9ee535-8f1f-4069-9a93-40daf47869ea', '6607ff2e-807c-4b0f-8576-ce4a98eb3b7f', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_cordinator_fcm_token`
--

CREATE TABLE `tb_cordinator_fcm_token` (
  `id_token` varchar(255) NOT NULL,
  `id_estate_cordinator` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_cordinator_fcm_token`
--

INSERT INTO `tb_cordinator_fcm_token` (`id_token`, `id_estate_cordinator`, `token`, `create_at`, `update_at`) VALUES
('29a6d2ec-f94d-42da-b27a-676b5273d8d0', '8088e6ab-7ea6-44e8-ad15-eb92f9158f49', 'asdjkl', '2022-12-30 16:13:09', '2022-12-30 16:13:33'),
('37ef305f-e924-4282-a969-ce279bc5bd5d', '', 'asdasdasdasd', '2023-01-06 15:43:38', '2023-01-06 15:43:38'),
('47dc55e9-1965-4ff8-833e-ef983c34ddc5', 'c56caaef-83be-4eb6-b880-c10268d1e9f8', 'fnJtpeI3Tc6C-t5oV9OZuE:APA91bG3M9ndQJO37nFcjFxyN2S-x4sFTkw3wgzvHUlXyoqUa7eJWtHH_5_4SEqcegXVDmgVXoK_Il1nswuH_QBwrVLfplbZo3fV0yi2LHruOwp0ua4fNs4M0VYY14fict0ow3dM0Dqi', '2023-01-03 09:27:18', '2023-01-03 10:35:14'),
('627e4899-d8d4-47f4-a80c-ebb2bf33abd8', '46b10481-d274-41fe-9f39-03f8eeebf87a', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bHYy-k7q6wk6Khzbocy46VK433XRspTSM1rkMKb4neRMje3LWUj9X2jpYGD0ohYZyzy8qxMcRnPLSOGa_ERMlhVlkG7BNlZ8i0xdXH0Cuz8YTfZaqcyar3H2RWxdkA8vwhUtBgB', '2023-01-06 15:45:36', '2023-01-06 10:50:39'),
('68d2639e-d8f6-4e56-ba56-c2fcf1491260', 'a3f9be31-8c16-4a7e-8854-4dc2ed91a261', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-20 13:02:07', '2023-01-20 10:46:59'),
('7b838252-87c8-415a-8c32-c688353fe772', '', 'asdasdasdasd', '2023-01-06 15:44:57', '2023-01-06 15:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_klasifikasi_category`
--

CREATE TABLE `tb_detail_klasifikasi_category` (
  `id_klasifikasi_detail` int(11) NOT NULL,
  `id_klasifikasi` int(11) NOT NULL,
  `id_report` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_klasifikasi_category`
--

INSERT INTO `tb_detail_klasifikasi_category` (`id_klasifikasi_detail`, `id_klasifikasi`, `id_report`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 5, 2),
(4, 1, 1),
(5, 1, 2),
(6, 2, 2),
(7, 9, 3),
(8, 1, 4),
(9, 1, 1),
(10, 1, 17),
(11, 2, 17),
(12, 1, 1),
(13, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee_attendance_contractor`
--

CREATE TABLE `tb_employee_attendance_contractor` (
  `id_absen` int(11) NOT NULL,
  `id_contractor` int(11) NOT NULL,
  `sign_in` datetime NOT NULL,
  `sign_out` datetime NOT NULL,
  `location_now_in` varchar(255) NOT NULL,
  `location_now_out` varchar(255) NOT NULL,
  `picture_proof_in` varchar(255) NOT NULL,
  `picture_proof_out` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee_attendance_cordinator`
--

CREATE TABLE `tb_employee_attendance_cordinator` (
  `id_absen` int(11) NOT NULL,
  `id_cordinator` int(11) NOT NULL,
  `sign_in` datetime NOT NULL,
  `sign_out` datetime NOT NULL,
  `location_now_in` varchar(255) NOT NULL,
  `location_now_out` varchar(255) NOT NULL,
  `picture_proof_in` varchar(255) NOT NULL,
  `picture_proof_out` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_estate_cordinator`
--

CREATE TABLE `tb_estate_cordinator` (
  `id_estate_cordinator` varchar(255) NOT NULL,
  `name_estate_cordinator` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_estate_cordinator`
--

INSERT INTO `tb_estate_cordinator` (`id_estate_cordinator`, `name_estate_cordinator`, `email`, `no_telp`) VALUES
('1710e6f6-f54d-4726-872d-23cb56e65118', 'as23', 'asdas@gmail.com', '0865464231313'),
('23959258-39d6-425f-ae36-aa8243b1b3a0', 'jajang', 'adasdsad', 'asdasdsad'),
('29f3057b-7fd3-448e-b8fc-f3b3cbc72f86', 'asdasdsadasdsaas', 'asdasdsad@gmail.comsaa', '0857143425288714'),
('2bdae07b-d966-4b26-aa35-2bd92fb4a8be', 'iskandar', 'iskandar@gmail.coma', '085714342528291'),
('3dfc0f07-d3ac-4bf0-8609-a969929f17de', 'iskandar', 'iskandar@gmail.coma', '0857143425289'),
('46b10481-d274-41fe-9f39-03f8eeebf87a', 'iskandar', 'iskandar@gmail.com', '08571434252829'),
('50d3f165-e363-4aa4-a871-8a30af8a1251', 'joko', 'adasdsad', 'asdasdsad'),
('5b1bf3e8-c138-4079-80f2-74db4705a35a', 'asdasd123', 'ihuaskjd@gmail.com', '089454545578'),
('63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 'iskandar', 'iskandar@gmail.com', '08571434252829'),
('8088e6ab-7ea6-44e8-ad15-eb92f9158f49', 'joko', '', ''),
('8aadac50-24d3-4fbd-9cd8-4d8d8e249a17', 'joko', 'adasdsad', 'asdasdsad'),
('9c750228-58bf-417a-89c9-5a44b91a65f8', 'joko', 'adasdsad', 'asdasdsad'),
('a1c1cbec-86f6-4e32-b9ed-7ac73bfa0bd5', 'iskandar', 'iskandar@gmail.com', '085714342528'),
('a66ff30a-77c5-45c7-a3a0-9dbf59fd2bbb', 'asdasdsadasdsa', 'asdasdsad@gmail.com', '08571434252887'),
('b753e293-4931-4af6-9341-dabc0d21eceb', 'asdasdsadasdsaassa', 'asdasdsad@gmail.coms2', '085714342528298'),
('c2e02007-56af-478f-ba03-08878f718ab0', 'iskandar', 'iskandar@gmail.com', '085714342528'),
('c56caaef-83be-4eb6-b880-c10268d1e9f8', 'iskandar', '', ''),
('cfae5407-08dc-4f86-93c0-b02d338704f5', 'joko', 'adasdsad', 'asdasdsad'),
('de837c36-f475-4e4d-bb2a-733979ccf120', 'asdasdsadasdsaa', 'asdasdsad@gmail.comsa', '0857143425288715'),
('e4c5b207-333d-4fc1-af2e-f6171d08eeb5', 'asdasdsadasdsaa', 'asdasdsad@gmail.coms', '085714342528871'),
('e7380f49-ea1c-4c6b-a79c-06b73103a169', 'asdasdsadasdsaassa', 'asdasdsad@gmail.coms1', '08571434252821'),
('f9c8d34b-eabe-4f97-b0d2-a619feedf095', 'asdasdsadasdsaass', 'asdasdsad@gmail.comsaa1', '0857143425288711');

-- --------------------------------------------------------

--
-- Table structure for table `tb_estate_cordinator_job`
--

CREATE TABLE `tb_estate_cordinator_job` (
  `id_estate_cordinator_job` varchar(255) NOT NULL,
  `id_estate_cordinator` varchar(255) NOT NULL,
  `id_master_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_estate_cordinator_job`
--

INSERT INTO `tb_estate_cordinator_job` (`id_estate_cordinator_job`, `id_estate_cordinator`, `id_master_category`) VALUES
('0388717c-074a-4e50-ba77-b2e817824da5', 'e7380f49-ea1c-4c6b-a79c-06b73103a169', 1),
('0ddfd2e5-24e0-4d77-8121-c22d93566537', '2bdae07b-d966-4b26-aa35-2bd92fb4a8be', 2),
('15ccf47b-d255-47f6-a998-b22d374c047e', 'de837c36-f475-4e4d-bb2a-733979ccf120', 2),
('1c55cec0-fc09-4db1-a8bd-8f24fbebf582', 'f9c8d34b-eabe-4f97-b0d2-a619feedf095', 1),
('1f4e47b1-5601-4c28-b72c-d79aa603b2bd', 'c56caaef-83be-4eb6-b880-c10268d1e9f8', 1),
('40ebaf05-9a77-4144-99cd-d2b8d30d74f9', '3dfc0f07-d3ac-4bf0-8609-a969929f17de', 1),
('55ae2ba5-c481-4d78-94a0-03151442d707', '1710e6f6-f54d-4726-872d-23cb56e65118', 1),
('6be697d7-786f-414f-9f2b-3106c7886304', 'a1c1cbec-86f6-4e32-b9ed-7ac73bfa0bd5', 1),
('72ee8d5b-00ef-4aab-9ee5-38859f4dcc5c', 'e4c5b207-333d-4fc1-af2e-f6171d08eeb5', 1),
('756e32f9-c186-42f1-8ad6-221b9d564d34', 'c2e02007-56af-478f-ba03-08878f718ab0', 1),
('788853c9-cd97-4e6e-9165-3e10fdece118', 'b753e293-4931-4af6-9341-dabc0d21eceb', 1),
('7c55daf1-62b0-4f8c-8fd5-f946811e9259', '8aadac50-24d3-4fbd-9cd8-4d8d8e249a17', 1),
('8b586d8a-70c8-47a8-99e4-332ff160d667', '23959258-39d6-425f-ae36-aa8243b1b3a0', 1),
('a29283cf-1550-450a-b0a2-5e48fb3b1e3b', '46b10481-d274-41fe-9f39-03f8eeebf87a', 1),
('c4663262-58ce-406b-ad1a-b3afd567a16c', 'a66ff30a-77c5-45c7-a3a0-9dbf59fd2bbb', 1),
('ce7afc58-0d80-4439-af40-5600057e7d03', '63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', 1),
('e4c7a3a2-0b99-41fb-9615-b2ef32775182', '8088e6ab-7ea6-44e8-ad15-eb92f9158f49', 1),
('e7ec1cc8-6d34-442a-9510-9ea5ac4cd67a', '29f3057b-7fd3-448e-b8fc-f3b3cbc72f86', 1),
('ecbf565c-5729-42f4-a294-aa791764b03c', '5b1bf3e8-c138-4079-80f2-74db4705a35a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_estate_manager`
--

CREATE TABLE `tb_estate_manager` (
  `id_estate_manager` varchar(255) NOT NULL,
  `name_estate_manager` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(100) NOT NULL,
  `job` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_estate_manager`
--

INSERT INTO `tb_estate_manager` (`id_estate_manager`, `name_estate_manager`, `email`, `no_telp`, `job`) VALUES
('5cc67ed9-2e2c-490c-92ab-251ab4e85957', 'DANU MARADEN', 'danu@gmail.com', '0857121313', ''),
('a3f9be31-8c16-4a7e-8854-4dc2ed91a261', 'wearedanu', 'danu@gmail.coms', '08571213132', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_klasifikasi_category`
--

CREATE TABLE `tb_klasifikasi_category` (
  `id_klasifikasi` int(11) NOT NULL,
  `id_category_detail` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `klasifikasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_klasifikasi_category`
--

INSERT INTO `tb_klasifikasi_category` (`id_klasifikasi`, `id_category_detail`, `id_category`, `klasifikasi`) VALUES
(1, 1, 1, 'Pohon terlalu tinggi'),
(2, 1, 1, 'Cabang pohon menggangu'),
(3, 1, 1, 'Pelepah pohon banyak yang kering'),
(5, 2, 1, 'Rumput Tinggi'),
(7, 3, 1, 'Tanaman Sudah Tinggi'),
(9, 4, 2, 'Sampah Belum di angkat'),
(11, 5, 2, 'Lingkungan kotor/banyak sampah'),
(13, 6, 2, 'Banyak rumput liar dijalan'),
(15, 7, 2, 'Saluran mamper/air tidak mengalir'),
(16, 8, 3, 'Banyak nyamuk'),
(17, 8, 3, 'Kasus demam berdarah'),
(18, 9, 3, 'Banyak tikus dihalaman'),
(19, 10, 3, 'Keluhan monyet liar'),
(20, 10, 3, 'Keluhan kucing liar'),
(21, 11, 3, 'Keluhan Banyak Rayap'),
(22, 12, 4, 'Pju padam'),
(23, 12, 4, 'Pju/Lampu sorot keropos/rusak'),
(24, 13, 4, 'Pju keropos'),
(26, 14, 4, 'Barier gate error'),
(27, 15, 7, 'air kolam keruh'),
(29, 17, 6, 'Proyek berisik'),
(32, 18, 1, 'Banyak semut/belalang/kutu/serangga'),
(34, 19, 5, 'CCTV rusak'),
(36, 15, 7, 'Pompa rusak'),
(37, 17, 6, 'Pelanggaran izin kerja'),
(42, 20, 1, 'Tanaman Kering'),
(43, 23, 1, 'Tanaman tidak sehat'),
(44, 24, 1, 'Banyak tanaman liar di taman'),
(45, 25, 2, 'Brandgang kotor'),
(46, 25, 2, 'Banyak material/barang bekas'),
(47, 8, 3, 'Banyak jentik nyamuk di saluran\r\n'),
(48, 10, 3, 'Keluhan anjing liar'),
(49, 10, 3, 'Keluhan kotoran anjing'),
(50, 10, 3, 'Keluhan ular/biawak'),
(51, 13, 4, 'Panel listrik terbakar'),
(52, 14, 4, 'Barier gate rusak'),
(53, 26, 4, 'Lampu taman padam'),
(54, 27, 5, 'Kamar mandi bau'),
(55, 27, 5, 'Toilet kotor'),
(56, 27, 5, 'Toilet bau'),
(57, 27, 5, 'Toilet mampet'),
(58, 28, 1, 'Rumah pompa kotor'),
(60, 29, 6, 'Rumah jadi kantor/catering/warung/gudang'),
(61, 30, 6, 'Pos jaga bocor/kotor/rusak'),
(62, 31, 6, 'Jalan bolong / bergelombang'),
(63, 31, 6, 'Pemasangan polisi tidur'),
(64, 32, 6, 'Pagar rusak / karatan'),
(65, 33, 8, 'Keterlambatan terbit izin perbaikan non deposit'),
(66, 34, 8, 'Keterlambatan terbit izin renovasi deposit\r\n'),
(67, 35, 8, 'Keterlambatan terbit id card'),
(68, 36, 8, 'Keterlambatan terbit izin kendaraan proyek'),
(69, 37, 8, 'Keterlambatan terbit refund deposit'),
(70, 38, 8, 'Keterlambatan terbit kartu akses'),
(71, 39, 8, 'Keterlambatan terbit izin kegiatan'),
(72, 40, 8, 'Keterlambatan terbit izin tinggal');

-- --------------------------------------------------------

--
-- Table structure for table `tb_like_status`
--

CREATE TABLE `tb_like_status` (
  `id_like` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_manpower_cordinator`
--

CREATE TABLE `tb_manpower_cordinator` (
  `id_manpower` int(11) NOT NULL,
  `cluster` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `current_day` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_manpower_cordinator`
--

INSERT INTO `tb_manpower_cordinator` (`id_manpower`, `cluster`, `total`, `current_day`) VALUES
(1, 'Akasia Golf', 12, '2022-11-01 09:45:29'),
(2, 'Cendana Golf', 20, '2022-11-01 09:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_category`
--

CREATE TABLE `tb_master_category` (
  `id_master_category` int(11) NOT NULL,
  `id_cordinator` int(11) NOT NULL,
  `unit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_category`
--

INSERT INTO `tb_master_category` (`id_master_category`, `id_cordinator`, `unit`) VALUES
(1, 0, 'Pertamanan, kebersihan, dan clubhouse'),
(2, 0, 'ME, INFRA dan kolam renang'),
(3, 0, 'Building Control dan security'),
(4, 0, 'Administrasi');

-- --------------------------------------------------------

--
-- Table structure for table `tb_news`
--

CREATE TABLE `tb_news` (
  `id_news` int(11) NOT NULL,
  `url_news_image` varchar(255) NOT NULL,
  `caption` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `writer` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_news`
--

INSERT INTO `tb_news` (`id_news`, `url_news_image`, `caption`, `content`, `time`, `writer`) VALUES
(1, 'imagenews/Group-36.jpg', 'IPL Perumahan Dihitung Berdasarkan Apa?', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Berita</title>\r\n</head>\r\n<body>\r\n\r\n<h1>TEST WEBSITE</h1>\r\n    \r\n</body>\r\n</html>', '2022-08-01 16:06:23', 'admin'),
(5, 'imagenews/Group-36.jpg', 'IPL Perumahan Dihitung Berdasarkan Apa?', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Berita</title>\r\n</head>\r\n<body>\r\n\r\n<h1>TEST WEBSITE</h1>\r\n    \r\n</body>\r\n</html>', '2022-08-01 16:06:23', 'admin'),
(6, 'imagenews/Group-36.jpg', 'IPL Perumahan Dihitung Berdasarkan Apa?', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Berita</title>\r\n</head>\r\n<body>\r\n\r\n<h1>TEST WEBSITE</h1>\r\n    \r\n</body>\r\n</html>', '2022-08-01 16:06:23', 'admin'),
(7, 'imagenews/Group-36.jpg', 'IPL Perumahan Dihitung Berdasarkan Apa?', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Berita</title>\r\n</head>\r\n<body>\r\n\r\n<h1>TEST WEBSITE</h1>\r\n    \r\n</body>\r\n</html>', '2022-08-01 16:06:23', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_notification`
--

CREATE TABLE `tb_notification` (
  `id_notification` varchar(255) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `id_appropriate` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_notification`
--

INSERT INTO `tb_notification` (`id_notification`, `id_user`, `id_appropriate`, `type`, `title`, `content`, `create_at`, `update_at`) VALUES
('15a3c8db-5bf3-47f5-8ccd-3723bb264c86', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'bb396d30-4f7c-4b56-9f9f-9459c8811023', 'COMMENT', 'LAURA MELDY Menanggapi Postinganmu', 'ini adalah komentarr', '2023-01-12 09:34:19', '2023-01-12 09:34:19'),
('15a3c8db-5bf3-47f5-8ccd-3723bb264c86a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'bb396d30-4f7c-4b56-9f9f-9459c8811023', 'COMMENT', 'LAURA MELDY Menanggapi Postinganmu', 'ini adalah komentarr', '2023-01-12 09:34:19', '2023-01-12 09:34:19'),
('21fb41cf-3db4-487c-9c0d-a081ef0d1bf3', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 09:05:25', '2023-01-12 09:05:25'),
('22d4eae4-826c-4318-8b88-927829a6dc22', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 09:05:08', '2023-01-12 09:05:08'),
('32250378-cca9-40f7-a389-8eca2918615a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:29:14', '2023-01-12 16:29:14'),
('3258f7b3-d2b3-454c-ac3e-66f552a0e73b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:07:07', '2023-01-12 16:07:07'),
('325ff8f3-3750-433e-b51c-2500872e5dde', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:06:01', '2023-01-12 16:06:01'),
('3f1ecd87-639b-4837-a22a-aceb2b403465', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:13:48', '2023-01-12 16:13:48'),
('480acdc8-d0e8-417f-9367-aaa596762708', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:04:58', '2023-01-12 16:04:58'),
('4dfdfed5-45b9-4477-a7bc-630076ae1188', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 11:43:10', '2023-01-12 11:43:10'),
('5c3108d6-a921-4967-b440-125be9efc63f', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:13:47', '2023-01-12 16:13:47'),
('5fd2f157-58be-4a45-b4ba-0616bccbd2ea', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:16:49', '2023-01-12 16:16:49'),
('68734551-3aa8-4c97-8f7d-2aeb4f1148d5', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'COMMENT', 'AKUN TEST DEVELOPER Menanggapi Postinganmu', 'test', '2023-01-12 15:30:56', '2023-01-12 15:30:56'),
('6930c47f-fe41-4767-9d13-87a5cc5c7654', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 15:30:29', '2023-01-12 15:30:29'),
('89d59d2c-1caa-49c3-a007-aa315138a2be', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:06:01', '2023-01-12 16:06:01'),
('95d38c61-6c84-4458-a787-557765082254', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'bb396d30-4f7c-4b56-9f9f-9459c8811023', 'LIKE STATUS', 'LAURA MELDY Menyukai Postinganmu', 'LAURA MELDY Menyukai Postinganmu', '2023-01-12 09:22:58', '2023-01-12 09:22:58'),
('963d6240-7fb0-407b-8534-0e5a373339f4', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:12:17', '2023-01-12 16:12:17'),
('98a153f9-8173-4c64-82b2-69e68e5c800c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:10:25', '2023-01-12 16:10:25'),
('9efcd0e4-c57b-423f-ba9c-25708819bfdc', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:16:51', '2023-01-12 16:16:51'),
('a467e446-15a5-4999-8580-26eb72bcf0df', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 15:30:45', '2023-01-12 15:30:45'),
('a4cc7ac0-42cb-4491-a914-1a2e30479f1b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 15:37:25', '2023-01-12 15:37:25'),
('b1de9d31-d028-4b22-b51e-c7299f04bf01', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 15:37:52', '2023-01-12 15:37:52'),
('ccee5574-937c-4cbe-a721-402653d5ac22', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:18:47', '2023-01-12 16:18:47'),
('d2539033-9c4c-405e-aba4-ca171e52e030', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:17:33', '2023-01-12 16:17:33'),
('d8c78cbe-61af-4e32-b2e7-f44c561e9404', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:20:37', '2023-01-12 16:20:37'),
('dceab4f9-f2ea-4034-86af-0cd4c688dbf2', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:20:31', '2023-01-12 16:20:31'),
('e2cf3b8f-8c8b-49c6-8e8c-37aafbad7057', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:10:17', '2023-01-12 16:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `tb_population`
--

CREATE TABLE `tb_population` (
  `id_population` varchar(255) NOT NULL,
  `id_warga` varchar(255) NOT NULL,
  `id_cluster` varchar(255) NOT NULL,
  `id_rt` varchar(255) NOT NULL,
  `house_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_population`
--

INSERT INTO `tb_population` (`id_population`, `id_warga`, `id_cluster`, `id_rt`, `house_number`) VALUES
('0cfa3e28-9a0d-464e-b3e7-6e07483dbaed', 'b912fff2-258b-4449-a82c-8b25e5e067d3', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '010'),
('1b2e3c84-d707-4b66-98d0-5ee928f15b2a', '21827ecc-16a5-4790-a7c4-ec80386fd02b', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '027'),
('c2f5b3f3-3a6b-4e51-9ccb-dceda9dfeac2', 'bb396d30-4f7c-4b56-9f9f-9459c8811023', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '005');

-- --------------------------------------------------------

--
-- Table structure for table `tb_process_report`
--

CREATE TABLE `tb_process_report` (
  `id_process_report` int(11) NOT NULL,
  `id_report` int(11) NOT NULL,
  `id_estate_cordinator` varchar(255) NOT NULL,
  `status_process` varchar(150) NOT NULL,
  `current_time_process` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_process_work_cordinator`
--

CREATE TABLE `tb_process_work_cordinator` (
  `id_process_work` int(11) NOT NULL,
  `id_report` int(11) NOT NULL,
  `id_estate_cordinator` varchar(255) NOT NULL,
  `photo_work_1` varchar(255) NOT NULL,
  `photo_work_2` varchar(255) NOT NULL,
  `photo_complete_1` varchar(255) NOT NULL,
  `photo_complete_2` varchar(255) NOT NULL,
  `current_time_work` datetime NOT NULL DEFAULT current_timestamp(),
  `finish_time` datetime NOT NULL,
  `duration` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_report`
--

CREATE TABLE `tb_report` (
  `id_report` int(255) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `no_ticket` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `date_post` date NOT NULL,
  `time_post` time NOT NULL,
  `category` varchar(255) NOT NULL,
  `id_category` int(100) NOT NULL,
  `url_image` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `star` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `comment_time` datetime NOT NULL,
  `urut` int(100) NOT NULL,
  `latitude` varchar(150) NOT NULL,
  `longitude` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_report`
--

INSERT INTO `tb_report` (`id_report`, `id_user`, `no_ticket`, `description`, `title`, `date_post`, `time_post`, `category`, `id_category`, `url_image`, `status`, `star`, `comment`, `comment_time`, `urut`, `latitude`, `longitude`, `address`, `type`, `create_at`) VALUES
(1, '26db0db8-af5e-44ea-8481-c8547f18e7b8', '202301/00001', '', '', '2023-01-19', '10:45:52', 'Perawatan taman', 1, 'imagereport/2e8f220087482797042e3e539e49f9d7811cce6f.jpg', 'Menunggu', 0, '', '0000-00-00 00:00:00', 1, '-6.1877329', '106.6935154', 'gondrong griya utama 1rt 002 rw002, Gondrong, Kec. Cipondoh, Kota Tangerang, Banten 15146, Indonesia', 'Anonim', '2023-01-19 10:45:52');

-- --------------------------------------------------------

--
-- Table structure for table `tb_request`
--

CREATE TABLE `tb_request` (
  `id_request` int(255) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `no_ticket` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `date_post` date NOT NULL,
  `time_post` time NOT NULL,
  `category` varchar(255) NOT NULL,
  `id_category` int(100) NOT NULL,
  `url_image` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `star` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `comment_time` datetime NOT NULL,
  `urut` int(100) NOT NULL,
  `latitude` varchar(150) NOT NULL,
  `longitude` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  `id_category_detail` int(11) NOT NULL,
  `id_klasifikasi_category` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rt`
--

CREATE TABLE `tb_rt` (
  `id_rt` varchar(255) NOT NULL,
  `code_rt` varchar(20) NOT NULL,
  `name_rt` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rt`
--

INSERT INTO `tb_rt` (`id_rt`, `code_rt`, `name_rt`) VALUES
('f749fd22-104a-42fe-80af-8a5ccb8f6a85', 'R-006', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_settings_maintenance`
--

CREATE TABLE `tb_settings_maintenance` (
  `id_maintenance` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_settings_maintenance`
--

INSERT INTO `tb_settings_maintenance` (`id_maintenance`, `status`) VALUES
(1, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `tb_settings_notification`
--

CREATE TABLE `tb_settings_notification` (
  `id_notification` varchar(255) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `report_received` int(11) NOT NULL DEFAULT 1,
  `report_done` int(11) NOT NULL DEFAULT 1,
  `report_completed` int(11) NOT NULL DEFAULT 1,
  `commentar` int(11) NOT NULL DEFAULT 1,
  `like_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_settings_notification`
--

INSERT INTO `tb_settings_notification` (`id_notification`, `id_user`, `report_received`, `report_done`, `report_completed`, `commentar`, `like_status`) VALUES
('6bb7812b-281f-461a-b77d-a23f3e021874', '21827ecc-16a5-4790-a7c4-ec80386fd02b', 1, 1, 1, 1, 1),
('8c956ae3-d40e-4534-9650-54e5004b21d1', 'bb396d30-4f7c-4b56-9f9f-9459c8811023', 1, 1, 1, 1, 1),
('a57fc661-e23b-4f12-a342-952c2b5c9ede', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 1, 1, 1, 1, 1),
('f9e35515-560b-4a73-8877-2bd36c044fe6', 'b912fff2-258b-4449-a82c-8b25e5e067d3', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_status`
--

CREATE TABLE `tb_status` (
  `id_status` int(255) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `upload_time` datetime NOT NULL DEFAULT current_timestamp(),
  `foto_profile` varchar(255) NOT NULL,
  `status_image` varchar(255) NOT NULL,
  `caption` text NOT NULL,
  `comment` int(11) NOT NULL,
  `like` int(11) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` varchar(255) NOT NULL,
  `id_auth` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_image` varchar(255) NOT NULL,
  `otp` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `id_auth`, `username`, `email`, `no_telp`, `name`, `password`, `profile_image`, `otp`) VALUES
('0d9d3571-448e-40ef-b6cc-9e2a0316cf45', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINassaasaaaa', 'delcoin@gmail.comsaaa2ssssaa', '08571434222322223ssssaa', 'PT DELCOINassaasaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('103eb37b-8d5a-40a5-bec1-7c1ab607d541', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINassaasaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaa', '08571434222322223ssssaaaaa', 'PT DELCOINassaasaaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('10fad8cc-d24d-47f9-8df2-e044da5839b0', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaassaaaaa', 'a@gmail.comsaaa2ssssaaasaasa', '08571434assaasasaaaaaasssassaasaaaa', 'PT BGOsassaaaaasasaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('111ab08e-3d65-48b2-a539-4fed696e3c22', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaassaaaaaaasaaas', 'a@gmail.comsaaa2ssssaaasasasaaaaaas', '', 'PT BGOsassaaaaasassaaasaaaas', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('1710e6f6-f54d-4726-872d-23cb56e65118', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'asdas', 'asdas@gmail.com', '0865464231313', 'as23', '6ebd3ce122f0b031a307829bd015eb1c', 'imageuser/7b2dd5f7b7e40b3de1bd78dc6ac4ac6d915a80c4.jpg', 0),
('1d83b555-6731-4a6b-8ac9-353583875690', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassaassaas', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaasaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasa', 'PT TOLOLaaaaaaaaaaaaaaaassaassaas', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('21827ecc-16a5-4790-a7c4-ec80386fd02b', '538b399e-632b-489e-8ea9-0b1ecf5a3045', 'BGM/RW/AG1/027', 'asda2sdsad@gmail.com', '0854564564546', 'YULIUS WIDJOJO', '4e30c951ea7c956c126389d6d911f3f8', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('21eb61fe-d0ec-470a-ae66-87f20c1e8da4', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaassa', 'a@gmail.comsaaa2ssssaaas', '08571434assaasasaaaaaasssassaas', 'PT BGOsassaaaaasa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('2555c63a-be72-47a2-ba6c-095dae455116', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINassa', 'delcoin@gmail.comsaaa', '08571434222322223', 'PT DELCOINassa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('26db0db8-af5e-44ea-8481-c8547f18e7b8', 'ff5d78eb-dced-46b9-8230-0df6de9a9a73', 'BGM/RW/TEST', 'feriwnarta26@gmail.com', '085714342528', 'AKUN TEST DEVELOPER', '4e30c951ea7c956c126389d6d911f3f8', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('28b266c9-d883-4176-9486-463e90e2c4c3', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaassaaaaaaaaa', 'a@gmail.comsaaa2ssssaaasaasaaaaa', '08571434assaasasaaaaaasssassaasaaaaaaaa', 'PT BGOsassaaaaasasaaasaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('29f3057b-7fd3-448e-b8fc-f3b3cbc72f86', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'asdasdasdasa', 'asdasdsad@gmail.comsaa', '0857143425288714', 'asdasdsadasdsaas', '9ad194d59e90ad0cfac6f47bd4a287d5', 'imageuser/39e28a7d672370e6c7d25dcaa28a4b1c108668e7.jpg', 0),
('2bc85e1f-f42f-4966-aedb-e5815aeb933c', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassaass', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasa', 'PT TOLOLaaaaaaaaaaaaaaaassaass', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('2bdae07b-d966-4b26-aa35-2bd92fb4a8be', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'iskandarr', 'iskandar@gmail.coma', '085714342528291', 'iskandar', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/ff91a86462fa0ad00945923d566653e93bee01b8.png', 0),
('33a2aa71-209e-4de8-b629-30facc215e5e', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaaas', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaasaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasa', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaaas', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('344e468f-6d1b-48ff-a557-b2c22574873a', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaa', 'PT TOLOLaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('35a0a4ca-cbd8-4e14-80b9-6eda31da10ca', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaa', 'PT TOLOLaaaaaaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('369c9549-7574-43cd-9959-bd480d4eba33', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaassaaaaaaa', 'a@gmail.comsaaa2ssssaaasaasaaa', '08571434assaasasaaaaaasssassaasaaaaaa', 'PT BGOsassaaaaasasaaasa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('393390a0-636b-4fb4-89ec-74f62311b5df', 'd79915ac-449f-4013-9dc5-251aef168da4', 'dsfdf', 'asdasdf@gmail.com', '085714342528', 'sadasd', '3a7db289fad7cc7d627b9f1a0e163bf6', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('3e4614dd-2b80-4dbf-9cce-2ab3980a1135', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassaassa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaas', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasa', 'PT TOLOLaaaaaaaaaaaaaaaassaassa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('3f598593-a362-4ce4-a74e-0c2d5dd82236', 'd79915ac-449f-4013-9dc5-251aef168da4', 'sabvdbansdv', 'klasjdlasjdl@gmail.com', '', 'skdajsdkljkl', '6faebca3dc79ce275f30f9920fde1503', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('419c6596-9331-4672-a4fa-f047a6c66cf6', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsa', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaasaaaaaassaaasaaaaaass', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaasassaa', 'PT BGOsa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('46a8b8b2-62f2-471c-8787-b90435907699', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINassaasaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaa', '08571434222322223ssssaaaa', 'PT DELCOINassaasaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('49297981-ee6b-49a6-b0c4-4a2717eac880', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaassaaa', 'a@gmail.comsaaa2ssssaaasaa', '08571434assaasasaaaaaasssassaasaa', 'PT BGOsassaaaaasasa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('4c6a3e4c-47f5-445b-a3d3-61849d86ea25', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaa', 'PT TOLOLaaaaaaaaaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('4df2407d-bde2-42cf-a670-5d150ef5f087', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOL', 'delcoin@gmail.comsaaa2ssssaaaaaaa', '08571434222322223ssssaaaaaaa', 'PT TOLOL', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('4e05f1b2-f955-4817-86a7-2e7c4bbb71d7', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaasaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasa', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('54141134-e208-48b0-801f-511498270cc0', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOIN', 'delcoin@gmail.com', '0857143422232', 'PT DELCOIN', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('55c383c6-4081-4485-b545-98dab53ef501', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINassaasaaa', 'delcoin@gmail.comsaaa2ssssa', '08571434222322223ssssa', 'PT DELCOINassaasaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('565f4e51-71f3-4cc6-bee4-3efae513f9c5', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaassaaaaaaaaaa', 'a@gmail.comsaaa2ssssaaasaasaaaaaa', '08571434assaasasaaaaaasssassaasaaaaaaaaa', 'PT BGOsassaaaaasasaaasaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('5b1bf3e8-c138-4079-80f2-74db4705a35a', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'asdasdasd12', 'ihuaskjd@gmail.com', '089454545578', 'asdasd123', '1fd2aa305f015b9d36fa9cf5257ff460', 'imageuser/87f4e3687fc627b87af16210258bb76a6b06fcb6.jpg', 0),
('5cc67ed9-2e2c-490c-92ab-251ab4e85957', '', 'danuestatemanager', 'danu@gmail.com', '0857121313', 'DANU MARADEN', 'bc3817aa8704cb51d4aeccdc38ab152b', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('5cd86542-06f9-4372-be8b-efbee17b17ab', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINassaasa', 'delcoin@gmail.comsaaa2sss', '08571434222322223sss', 'PT DELCOINassaasa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('5e958f01-899e-4a4e-9ea2-c28690ca47d8', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaa', 'PT TOLOLaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('5eaa875c-804d-4835-b932-4de20decb221', 'd79915ac-449f-4013-9dc5-251aef168da4', '', '', '', 'asdasd', '9d322562076b647168bf14de90da0232', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('63ab0b18-3ef9-4b09-aa0a-79ccde43ac69', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'iskandar', 'iskandar@gmail.com', '08571434252829', 'iskandar', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('6533682f-6857-4ea4-a6ae-949d431565b4', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGO', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaasaaaaaaaaaassaaasaaaaaass', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasa', 'PT BGO', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('65a0df11-b365-485a-bcab-ad9cdb503aef', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINa', 'delcoin@gmail.coms', '08571434222322', 'PT DELCOINa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('6607ff2e-807c-4b0f-8576-ce4a98eb3b7f', 'd79915ac-449f-4013-9dc5-251aef168da4', 'asdasdasd123', 'asdsada@gmail.com', '', 'asdasdsad', '9d322562076b647168bf14de90da0232', 'imageuser/9d730939c2fa6afb2de62dd786888d3fa43463a2.jpg', 0),
('698055e8-65b6-4bfe-8223-031519cd1106', 'd79915ac-449f-4013-9dc5-251aef168da4', 'asdsadasd', 'asdasdsa@gmail.com', '07846554656', 'asdasdad', '8924c7ace65b86c6ee1d69a835dbfd06', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('6ac5d842-b5cc-4cdb-97cc-2cffa27bca60', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaa', 'PT TOLOLaaaaaaaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('6ad9e1a6-a1b8-475e-af93-1cfdd8e05a64', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINas', 'delcoin@gmail.comsa', '085714342223222', 'PT DELCOINas', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('6c3caf2c-6fee-4361-9fea-6620c2b12fe8', 'd79915ac-449f-4013-9dc5-251aef168da4', 'asdasdsa', 'asdsadsaalal@gmail.com', '085714342528', 'asdsadasd', 'c01c6521f8f8ab999f71fc5d03e158f5', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('73cc6710-8243-49ea-892e-6618d1f40c46', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaa', 'PT TOLOLaaaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('75f86371-eee3-4b05-8b2d-cf1d383877de', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaasaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasa', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('7a3d1255-a896-4952-9976-d462095eb5af', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaass', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaass', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaass', 'PT TOLOLaaaaaaaaaaaaaaaass', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('7b873626-27a7-4802-a7ab-aac4e03df32b', 'd79915ac-449f-4013-9dc5-251aef168da4', 'pt hams', 'iskandar@gmail.comasa', '0857143422', 'pt ham', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/aadf2d1b9f17293af16baf66820f4ce4d90e1c3e.png', 0),
('7fc5336e-c843-43d8-8717-1608216cec54', 'd79915ac-449f-4013-9dc5-251aef168da4', 'asd1asdasd', 'isajdlasjd@gmail.com', '0857134564123', 'dasdasdasd', '21b5cc2c61696544ea843665dd89d0b9', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('8132f6d4-ae00-42fb-bd6c-2d16ba735d10', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaasaasaaaasaaaaasassaaasaaaaaassassa', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaassassa', 'PT BGOsassaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('81b334d0-7fcf-4f2b-9e80-fc1e18c4ce93', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaa', 'PT TOLOLaaaaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('8391d074-0a88-4330-8969-d20336ec3569', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsas', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaasaaaaaassaaasaaaaaassa', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaasassaa', 'PT BGOsas', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('84c3a285-a4df-4a9f-8f05-2a89bcf0638e', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaa', 'PT TOLOLaaaaaaaaaaaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('873f4ad8-a20b-4bb9-a9ae-3f685c04bd53', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaa', '08571434222322223ssssaaaaaaaaa', 'PT TOLOLaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('8a2902c6-8848-42f2-9f24-0c3a0be21b00', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINassaasaa', 'delcoin@gmail.comsaaa2ssss', '08571434222322223ssss', 'PT DELCOINassaasaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('8dd08eae-6d5f-494a-aa20-95892316acbc', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsass', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaasaaaaasassaaasaaaaaassa', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaassassa', 'PT BGOsass', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('8e973b05-1e86-4957-ae2f-a2546dcc8fda', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaa', 'PT TOLOLaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('8f8620b1-fea0-4882-b984-59e21ced5113', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaassaa', 'a@gmail.comsaaa2ssssaaasa', '08571434assaasasaaaaaasssassaasa', 'PT BGOsassaaaaasas', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('9087740a-0016-46a5-a280-be979e687848', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassaas', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaas', 'PT TOLOLaaaaaaaaaaaaaaaassaas', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('92248286-f456-4a4a-9cf7-232a4746a65e', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaasaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasa', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('932a6ddf-ed0b-4796-9048-1f97337beee9', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaassaaaa', 'a@gmail.comsaaa2ssssaaasaas', '08571434assaasasaaaaaasssassaasaaa', 'PT BGOsassaaaaasasaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('9769ec67-48fe-4733-97d2-3c17c514e945', 'd79915ac-449f-4013-9dc5-251aef168da4', 'askdjalksdj', 'aasdsad@gmail.com', '08571434252829454', 'asdasdasd', 'a997f17b6ede7272966fc2abe092f624', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('9b2f3e14-3a89-43ef-90d9-abe128884d56', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassaasssaasaaass', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaasaaaaaaaaaassaaasaaaaaas', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasa', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaaasss', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('a3f9be31-8c16-4a7e-8854-4dc2ed91a261', '2fea85f4-aa31-4727-8cf1-ad1245505f7a', 'danuasestatemanager', 'danu@gmail.coms', '08571213132', 'wearedanu', '78bc38b7ec465c7df97d62c825928d16', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('a46a67f0-d7b0-48da-acda-344cc511dcac', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOs', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaaaaaaaassaaasaaaaaass', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaaassaas', 'PT BGOs', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('a4fa75ea-ddb9-4719-bc39-0dc217df7736', 'd79915ac-449f-4013-9dc5-251aef168da4', 'pt ham', 'iskandar@gmail.comas', '085714342', 'pt ham', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/267585b31a076d17623d46374d3eb4659c909596.png', 0),
('a5302344-c1da-479f-9e35-b3459012ae08', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINassaasaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaa', '08571434222322223ssssaaaaaa', 'PT DELCOINassaasaaaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('a53d55e2-6dfd-4c89-bff2-3b80e33a0aab', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassaassaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaaasa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasa', 'PT TOLOLaaaaaaaaaaaaaaaassaassaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('a66ff30a-77c5-45c7-a3a0-9dbf59fd2bbb', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'asdasdasd', 'asdasdsad@gmail.com', '08571434252887', 'asdasdsadasdsa', '9ad194d59e90ad0cfac6f47bd4a287d5', 'imageuser/b0dfec5b294be1c801b1b7254d042c38ed24faf3.jpg', 0),
('a7c1962c-4f1c-4f99-97d3-1481f00f5be1', 'd79915ac-449f-4013-9dc5-251aef168da4', 'pt hamss', 'iskandar@gmail.comasaa', '08571434222', 'pt ham', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/544b727e85ace330b7a064efcac11efd2db3175a.png', 0),
('aa62d355-8c3c-4bdf-9252-13d04949fd20', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaa', 'PT TOLOLaaaaaaaaaaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('aa717411-d3c1-4ebd-a219-d65b33ce35c7', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassaasssaasaaas', 'a@gmail.comsaaa2ssssaaaaaaaaaaaaasaaaaaaaaaassaaasaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaasa', 'PT TOLOLaaaaaaaaaaaaaaaassaassaasaaass', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('b162eb08-504f-47b0-9acb-d2d9eb258625', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaassaaaaaa', 'a@gmail.comsaaa2ssssaaasaasaa', '08571434assaasasaaaaaasssassaasaaaaa', 'PT BGOsassaaaaasasaaas', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('b3a1fac4-a715-47da-8f9d-d60e7529f814', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaassaaaaaaaaaas', 'a@gmail.comsaaa2ssssaaasaasaaaaaas', '08571434assaasasaaaaaasssassaasaaaaaaaaas', 'PT BGOsassaaaaasasaaasaaaas', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('b41ba46e-0382-4e24-8c7c-86f1a8ebdf7b', 'd79915ac-449f-4013-9dc5-251aef168da4', 'askdjalksdjas', 'aasdsad@gmail.comsa', '0857143425282945482', 'asdasdasdaa', 'a997f17b6ede7272966fc2abe092f624', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('b753e293-4931-4af6-9341-dabc0d21eceb', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'asdasdas', 'asdasdsad@gmail.coms2', '085714342528298', 'asdasdsadasdsaassa', '9ad194d59e90ad0cfac6f47bd4a287d5', 'imageuser/a6b983b479fb16f8195f3f1ce8d55ecf4c89a143.jpg', 0),
('b912fff2-258b-4449-a82c-8b25e5e067d3', '538b399e-632b-489e-8ea9-0b1ecf5a3045', 'BGM/RW/AG1/010', 'asdasdjkhK@gmail.com', '085714342529', 'SRI KARTIKA JUWONO', '814c4e3dcdf41e594e526044767ed8b1', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('bb396d30-4f7c-4b56-9f9f-9459c8811023', '538b399e-632b-489e-8ea9-0b1ecf5a3045', 'BGM/RW/AG1/005', 'periwnarta26@gmail.com', '082110170910', 'LAURA MELDY', '4e30c951ea7c956c126389d6d911f3f8', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('bd8ed9c5-ffcd-4254-96eb-700945e86dc4', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaa', 'PT TOLOLaaaaaaaaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('c15f7aa6-3594-423b-8a8a-c416b551c94d', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaasaaaaasassaaasaaaaaassassa', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaassassa', 'PT BGOsassaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('c1a82f78-2c58-4f0f-b2f9-a4ff973ab07a', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaas', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaas', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaas', 'PT TOLOLaaaaaaaaaaaaaaaas', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('c41288d8-0103-4c3e-8181-17e47d05fee5', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINass', 'delcoin@gmail.comsaa', '0857143422232222', 'PT DELCOINass', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('c41a20ac-1a22-4c63-b40c-a0a4c0f7ba64', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLa', 'delcoin@gmail.comsaaa2ssssaaaaaaaa', '08571434222322223ssssaaaaaaaa', 'PT TOLOLa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('c4286c9c-9934-4400-98ff-f4b8ee22b94d', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINassaasaaaaa', 'delcoin@gmail.comsaaa2ssssaaa', '08571434222322223ssssaaa', 'PT DELCOINassaasaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('d111498a-6b37-456c-a871-2fce77402d71', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassa', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaasaaaaasassaaasaaaaaassas', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaassassa', 'PT BGOsassa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('d20ed281-e4c9-45b2-83ee-a0d4e2e7163d', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaa', 'a@gmail.comsaaa2ssssaaaaaaaaaaasaasaaaasaaaaasassaaasaaaaaassass', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaassassa', 'PT BGOsassaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('dde9a58c-d222-4fab-b36b-23de0ef7e9a8', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT HAMA', 'iskandar@gmail.comasaas', '085714342223', 'PT HAMA', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/2cc5aad337f044a203f644512bbde857c056d89b.png', 0),
('de349790-1b50-45b6-90ed-f51ce5e24fcf', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaassaaaaaaaa', 'a@gmail.comsaaa2ssssaaasaasaaaa', '08571434assaasasaaaaaasssassaasaaaaaaa', 'PT BGOsassaaaaasasaaasaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('de837c36-f475-4e4d-bb2a-733979ccf120', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'asdasdasdas', 'asdasdsad@gmail.comsa', '0857143425288715', 'asdasdsadasdsaa', '9ad194d59e90ad0cfac6f47bd4a287d5', 'imageuser/4f4d09e1eb36cc42410f27321e3bed53d0c569f2.jpg', 0),
('e01edc99-7759-4ca5-a97b-0f3cd358f3b6', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaa', 'PT TOLOLaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('e10f8944-87ab-4dfb-af5c-eb85c2dc3ac7', 'd79915ac-449f-4013-9dc5-251aef168da4', 'askdjalksdja', 'aasdsad@gmail.coms', '085714342528294548', 'asdasdasda', 'a997f17b6ede7272966fc2abe092f624', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('e16e6ab1-e8f1-4be7-b932-0fea95a9c7d0', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINassaas', 'delcoin@gmail.comsaaa2ss', '08571434222322223ss', 'PT DELCOINassaas', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('e1756172-d12c-42a5-aaeb-b8e14c00837f', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaa', 'PT TOLOLaaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', '', 0),
('e4c5b207-333d-4fc1-af2e-f6171d08eeb5', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'asdasdasda', 'asdasdsad@gmail.coms', '085714342528871', 'asdasdsadasdsaa', '9ad194d59e90ad0cfac6f47bd4a287d5', 'imageuser/37d320d9690915933bf40629c3ea65ace65dcc7f.jpg', 0),
('e530e25a-81d2-4aa8-9fc9-8df1958fe40b', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassa', 'PT TOLOLaaaaaaaaaaaaaaaassa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('e5d9839c-7c48-4f88-a37b-e8fe2d9abeed', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT DELCOINassaa', 'delcoin@gmail.comsaaa2', '08571434222322223s', 'PT DELCOINassaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('e7380f49-ea1c-4c6b-a79c-06b73103a169', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'asdasdasdasaass', 'asdasdsad@gmail.coms1', '08571434252821', 'asdasdsadasdsaassa', '9ad194d59e90ad0cfac6f47bd4a287d5', 'imageuser/c67251a82fccd8d334ea18563f9b34d95a4fa593.jpg', 0),
('e7554bf8-60a8-4a22-817f-c0d2417e0abc', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaaaaaaaassaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaaaaaaaassaa', '08571434222322223ssssaaaaaaaaaaaaaaaaaaaaaaassaa', 'PT TOLOLaaaaaaaaaaaaaaaassaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('f551422e-9060-4411-9ec7-607c3341f7c1', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT BGOsassaaaas', 'a@gmail.comsaaa2ssssaaaaaaaaaaaasaasaaaasaaaaasassaaasaaaaaassassas', '08571434222322223ssssaaaaaaaaaaaaasaaaaaaaaassassa', 'PT BGOsassaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('f6a7a4e5-b851-4a70-90aa-b29a1a599080', 'd79915ac-449f-4013-9dc5-251aef168da4', 'asdasd', 'asdasd@gmail.com', '', 'asdasd', 'add3a0b22caf5adad3eac4f992e41867', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('f9c8d34b-eabe-4f97-b0d2-a619feedf095', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'asdasdasdasaas', 'asdasdsad@gmail.comsaa1', '0857143425288711', 'asdasdsadasdsaass', '9ad194d59e90ad0cfac6f47bd4a287d5', 'imageuser/930d8d9f2a230a3631c821fe8e7a45703bd13242.jpg', 0),
('fce5d132-ce5d-4c7e-b50f-2cea2fb85a10', 'd79915ac-449f-4013-9dc5-251aef168da4', 'PT TOLOLaaaaaaaaaa', 'delcoin@gmail.comsaaa2ssssaaaaaaaaaaaaaaaaa', '08571434222322223ssssaaaaaaaaaaaaaaaaa', 'PT TOLOLaaaaaaaaaa', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/default_profile/blank_profile_picture.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_fcm_token`
--

CREATE TABLE `tb_user_fcm_token` (
  `id_fcm` int(11) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_fcm_token`
--

INSERT INTO `tb_user_fcm_token` (`id_fcm`, `id_user`, `token`, `create_at`) VALUES
(1, '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-09 15:41:17'),
(2, 'bb396d30-4f7c-4b56-9f9f-9459c8811023', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-10 15:14:36'),
(3, 'a3f9be31-8c16-4a7e-8854-4dc2ed91a261', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-20 14:46:07'),
(4, '21827ecc-16a5-4790-a7c4-ec80386fd02b', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-20 16:15:28');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_login_auth`
--

CREATE TABLE `tb_user_login_auth` (
  `id_login_auth` int(11) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `device_name` varchar(255) NOT NULL,
  `device_identifier` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_login_auth`
--

INSERT INTO `tb_user_login_auth` (`id_login_auth`, `id_user`, `device_name`, `device_identifier`, `create_at`) VALUES
(1, '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-09 15:41:17'),
(2, 'bb396d30-4f7c-4b56-9f9f-9459c8811023', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-10 15:14:36'),
(3, 'a3f9be31-8c16-4a7e-8854-4dc2ed91a261', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-20 14:46:07'),
(4, '21827ecc-16a5-4790-a7c4-ec80386fd02b', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-20 16:15:28');

-- --------------------------------------------------------

--
-- Table structure for table `tb_warga`
--

CREATE TABLE `tb_warga` (
  `id_warga` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number_bast` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_warga`
--

INSERT INTO `tb_warga` (`id_warga`, `name`, `number_bast`) VALUES
('03d112ac-3c49-46cb-866e-45e9744b5214', 'ANDRY JAYA', 'BGM/BAST/AG1/007'),
('0930f829-183d-45d8-9ee6-c64659668cdd', 'DESSELLY', 'BGM/BAST/AG1/028'),
('0d1c7933-9011-457a-a244-1b4d6878492a', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('19db2c25-13a8-4bc1-bd2c-88b432b2ef3f', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('1c4970f2-037b-4182-9733-738f9be36eaf', 'SOETRISNO', 'BGM/BAST/AG1/019'),
('1d298257-db85-45a8-89c1-62418542038f', 'PONIMAN ASNIM', 'BGM/BAST/AG1/002'),
('21827ecc-16a5-4790-a7c4-ec80386fd02b', 'YULIUS WIDJOJO', 'BGM/BAST/AG1/027'),
('25c93554-bcfa-4990-b06d-e74b4f682f70', 'DJUNA LAUJANTO', 'BGM/BAST/ET/020'),
('26db0db8-af5e-44ea-8481-c8547f18e7b8', 'SRI KARTIKA JUWONO', 'BGM/BAST/AG1/010'),
('37f3739f-e48e-42e8-a813-006599daa2cb', 'SRI KARTIKA JUWONO', 'BGM/BAST/AG1/010'),
('39b352e9-2ffc-4c9c-bf2c-ac116ea51ee8', 'ANDRY JAYA', 'BGM/BAST/AG1/001V'),
('3f14837d-bab6-463b-9c86-a792398d6e36', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('423274ee-e1f1-4f96-8491-bb51db5abba6', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('4d67b9a4-8475-419e-88d9-0a82c3644d0c', 'ANDRY JAYA', 'BGM/BAST/AG1/001V'),
('4ec29f71-8947-4842-b2bc-631af0fd3f09', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('520cb82b-0d9d-4882-86d3-81796204043b', 'LIN WEN LI', 'BGM/BAST/EG7/011'),
('53c9ced4-cb13-47aa-b0c5-e1c9fbc3e4b2', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('58bfd524-1892-46dc-94de-62a1c534fdb2', 'SRI KARTIKA JUWONO', 'BGM/BAST/AG1/010'),
('6691feaa-997e-4f1f-a47e-ec17a2073c3d', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('689ccfef-8bab-4c97-b88a-7c25f56ecdb1', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('7c6c9382-cd13-4476-bcbe-9614817551db', 'WIDODO HARIYANTO', 'BGM/BAST/AG1/006'),
('7cf65520-0626-419f-a3dc-f384b06c5d80', 'SRI KARTIKA JUWONO', 'BGM/BAST/AG1/010'),
('8567395b-d7ae-49c3-aad9-f97cdfdb2612', 'LAURA MELDY', 'BGM/BAST/AG1/005'),
('9957ee55-9ca8-40ba-a6d7-ccbcb93c41cf', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('9aeb5b6e-638b-47a2-be12-12e87e507896', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('9bd8d863-5260-45fd-bfed-c1a54e5814e2', '', 'BGM/BAST/AG1/021'),
('9e46f660-b735-45aa-9793-09a4941496c9', 'PONIMAN ASNIM', 'BGM/BAST/AG1/002'),
('a2934b6e-c6aa-4539-9be1-e68aa9d8897e', 'THIO KIM HWA', 'BGM/BAST/AG1/009'),
('a7d2124b-1db7-4e1a-8cb8-f01b83aa791c', 'HENDRA', 'BGM/BAST/AG1/029'),
('b00db451-524c-494a-a934-2085b3de6b46', 'ELYS KARIS', 'BGM/BAST/AG1/020'),
('b912fff2-258b-4449-a82c-8b25e5e067d3', 'SRI KARTIKA JUWONO', 'BGM/BAST/AG1/010'),
('bb396d30-4f7c-4b56-9f9f-9459c8811023', 'LAURA MELDY', 'BGM/BAST/AG1/005'),
('bb63813c-b7d0-4e85-ae1e-e5ef53328c35', 'TANTYWATI', 'BGM/BAST/AG1/008'),
('bf437f32-eda9-40d3-9f88-4a7f26811142', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('c1e81feb-ffa1-4d08-8c02-6088e1b07463', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('cad4395c-289a-4ac4-b92b-1883625e3bc5', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('cc7cbd36-f49e-42c9-a758-7447f1845016', 'LAURA MELDY', 'BGM/BAST/AG1/005'),
('d0c2ba87-abc0-4241-beae-3ab0eb12483b', 'BONNY PIRONO', 'BGM/BAST/EG7/008'),
('d3b50bfb-ee99-4da6-8a24-b559cbfb0cad', 'KWOK SIANG CING', 'BGM/BAST/AG1/012'),
('d40195d3-1d94-4c98-acae-08920d360b53', 'TJIOE SUI NGO', 'BGM/BAST/AG1/017'),
('d47c523e-02ff-44c1-8980-c666a8316874', 'RICHARD', 'BGM/BAST/EG7/012'),
('dc53186c-3099-4d7d-8db2-b4206f1b8b4b', 'LAURA MELDY', 'BGM/BAST/AG1/005'),
('dd01fe1a-04ba-4bb7-8b7f-22281da96658', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('e4e05105-4c26-4c73-91f3-8c6b7a4e6372', 'SRI KARTIKA JUWONO', 'BGM/BAST/AG1/010'),
('e73ea6e2-6045-4d71-9bd2-50c4d447231f', 'SANDRA INAWATY', 'BGM/BAST/AG3/007'),
('eb650bb6-e289-4994-ad7b-96253cdfddc7', 'ANDRY JAYA', 'BGM/BAST/AG1/007'),
('ec85981c-fb07-40e9-ae37-cbfa424633ff', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('f11bd64d-cf26-4135-932c-da8ff18d3c6e', 'MANGKO BEDJO', 'BGM/BAST/EG1/007'),
('f57a6b01-06df-4b26-bb41-8e45cb305702', 'MANGKO BEDJO', 'BGM/BAST/EG1/007'),
('fbea7a21-b860-4a2d-8480-578f2b1cb549', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_access`
--
ALTER TABLE `tb_access`
  ADD PRIMARY KEY (`id_access`);

--
-- Indexes for table `tb_authorization`
--
ALTER TABLE `tb_authorization`
  ADD PRIMARY KEY (`id_auth`);

--
-- Indexes for table `tb_bill_event`
--
ALTER TABLE `tb_bill_event`
  ADD PRIMARY KEY (`id_event`);

--
-- Indexes for table `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `tb_category_detail`
--
ALTER TABLE `tb_category_detail`
  ADD PRIMARY KEY (`id_category_detail`);

--
-- Indexes for table `tb_cluster`
--
ALTER TABLE `tb_cluster`
  ADD PRIMARY KEY (`id_cluster`);

--
-- Indexes for table `tb_comment`
--
ALTER TABLE `tb_comment`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indexes for table `tb_contractor`
--
ALTER TABLE `tb_contractor`
  ADD PRIMARY KEY (`id_contractor`);

--
-- Indexes for table `tb_contractor_fcm_token`
--
ALTER TABLE `tb_contractor_fcm_token`
  ADD PRIMARY KEY (`id_token`);

--
-- Indexes for table `tb_contractor_job`
--
ALTER TABLE `tb_contractor_job`
  ADD PRIMARY KEY (`id_contractor_job`);

--
-- Indexes for table `tb_cordinator_fcm_token`
--
ALTER TABLE `tb_cordinator_fcm_token`
  ADD PRIMARY KEY (`id_token`);

--
-- Indexes for table `tb_detail_klasifikasi_category`
--
ALTER TABLE `tb_detail_klasifikasi_category`
  ADD PRIMARY KEY (`id_klasifikasi_detail`);

--
-- Indexes for table `tb_employee_attendance_contractor`
--
ALTER TABLE `tb_employee_attendance_contractor`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indexes for table `tb_employee_attendance_cordinator`
--
ALTER TABLE `tb_employee_attendance_cordinator`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indexes for table `tb_estate_cordinator`
--
ALTER TABLE `tb_estate_cordinator`
  ADD PRIMARY KEY (`id_estate_cordinator`);

--
-- Indexes for table `tb_estate_cordinator_job`
--
ALTER TABLE `tb_estate_cordinator_job`
  ADD PRIMARY KEY (`id_estate_cordinator_job`);

--
-- Indexes for table `tb_estate_manager`
--
ALTER TABLE `tb_estate_manager`
  ADD PRIMARY KEY (`id_estate_manager`);

--
-- Indexes for table `tb_klasifikasi_category`
--
ALTER TABLE `tb_klasifikasi_category`
  ADD PRIMARY KEY (`id_klasifikasi`);

--
-- Indexes for table `tb_like_status`
--
ALTER TABLE `tb_like_status`
  ADD PRIMARY KEY (`id_like`);

--
-- Indexes for table `tb_manpower_cordinator`
--
ALTER TABLE `tb_manpower_cordinator`
  ADD PRIMARY KEY (`id_manpower`);

--
-- Indexes for table `tb_master_category`
--
ALTER TABLE `tb_master_category`
  ADD PRIMARY KEY (`id_master_category`);

--
-- Indexes for table `tb_news`
--
ALTER TABLE `tb_news`
  ADD PRIMARY KEY (`id_news`);

--
-- Indexes for table `tb_notification`
--
ALTER TABLE `tb_notification`
  ADD PRIMARY KEY (`id_notification`);

--
-- Indexes for table `tb_population`
--
ALTER TABLE `tb_population`
  ADD PRIMARY KEY (`id_population`,`id_warga`);

--
-- Indexes for table `tb_process_report`
--
ALTER TABLE `tb_process_report`
  ADD PRIMARY KEY (`id_process_report`);

--
-- Indexes for table `tb_process_work_cordinator`
--
ALTER TABLE `tb_process_work_cordinator`
  ADD PRIMARY KEY (`id_process_work`);

--
-- Indexes for table `tb_report`
--
ALTER TABLE `tb_report`
  ADD PRIMARY KEY (`id_report`);

--
-- Indexes for table `tb_request`
--
ALTER TABLE `tb_request`
  ADD PRIMARY KEY (`id_request`);

--
-- Indexes for table `tb_rt`
--
ALTER TABLE `tb_rt`
  ADD PRIMARY KEY (`id_rt`);

--
-- Indexes for table `tb_settings_maintenance`
--
ALTER TABLE `tb_settings_maintenance`
  ADD PRIMARY KEY (`id_maintenance`);

--
-- Indexes for table `tb_settings_notification`
--
ALTER TABLE `tb_settings_notification`
  ADD PRIMARY KEY (`id_notification`);

--
-- Indexes for table `tb_status`
--
ALTER TABLE `tb_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tb_user_fcm_token`
--
ALTER TABLE `tb_user_fcm_token`
  ADD PRIMARY KEY (`id_fcm`);

--
-- Indexes for table `tb_user_login_auth`
--
ALTER TABLE `tb_user_login_auth`
  ADD PRIMARY KEY (`id_login_auth`);

--
-- Indexes for table `tb_warga`
--
ALTER TABLE `tb_warga`
  ADD PRIMARY KEY (`id_warga`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_bill_event`
--
ALTER TABLE `tb_bill_event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_category_detail`
--
ALTER TABLE `tb_category_detail`
  MODIFY `id_category_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tb_comment`
--
ALTER TABLE `tb_comment`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_detail_klasifikasi_category`
--
ALTER TABLE `tb_detail_klasifikasi_category`
  MODIFY `id_klasifikasi_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_employee_attendance_contractor`
--
ALTER TABLE `tb_employee_attendance_contractor`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_employee_attendance_cordinator`
--
ALTER TABLE `tb_employee_attendance_cordinator`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_klasifikasi_category`
--
ALTER TABLE `tb_klasifikasi_category`
  MODIFY `id_klasifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `tb_like_status`
--
ALTER TABLE `tb_like_status`
  MODIFY `id_like` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_manpower_cordinator`
--
ALTER TABLE `tb_manpower_cordinator`
  MODIFY `id_manpower` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_master_category`
--
ALTER TABLE `tb_master_category`
  MODIFY `id_master_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_news`
--
ALTER TABLE `tb_news`
  MODIFY `id_news` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_process_report`
--
ALTER TABLE `tb_process_report`
  MODIFY `id_process_report` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_process_work_cordinator`
--
ALTER TABLE `tb_process_work_cordinator`
  MODIFY `id_process_work` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_report`
--
ALTER TABLE `tb_report`
  MODIFY `id_report` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_request`
--
ALTER TABLE `tb_request`
  MODIFY `id_request` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_settings_maintenance`
--
ALTER TABLE `tb_settings_maintenance`
  MODIFY `id_maintenance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_status`
--
ALTER TABLE `tb_status`
  MODIFY `id_status` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user_fcm_token`
--
ALTER TABLE `tb_user_fcm_token`
  MODIFY `id_fcm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_user_login_auth`
--
ALTER TABLE `tb_user_login_auth`
  MODIFY `id_login_auth` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
