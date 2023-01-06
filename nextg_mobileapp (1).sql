-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 06, 2023 at 10:52 AM
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
  `cordinator` int(11) NOT NULL,
  `landscape` int(11) NOT NULL,
  `otp` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_access`
--

INSERT INTO `tb_access` (`id_access`, `id_auth`, `management`, `warga`, `cordinator`, `landscape`, `otp`) VALUES
('027976bd-d388-4ab3-9672-2e1933e10144', 'd79915ac-449f-4013-9dc5-251aef168da4', 0, 0, 0, 0, 0),
('4878c8b6-009d-4674-8d1b-fe9d9347e1bf', 'e9cd8a0f-0309-4f79-b40b-39e2a0b30291', 0, 0, 0, 0, 0),
('79b3070d-fc61-4199-ac10-7a9ffa6a1918', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 0, 0, 1, 0, 1),
('b4b54f73-7309-4600-a305-cb337d8e62ec', '538b399e-632b-489e-8ea9-0b1ecf5a3045', 0, 1, 0, 0, 1),
('fb5f6459-281a-40f5-aeb0-b974dd370af0', 'ff5d78eb-dced-46b9-8230-0df6de9a9a73', 1, 1, 1, 1, 0),
('fc7c087c-f05b-4df5-851f-6d858954ce42', 'e47b4e1b-ecd5-41aa-90fa-20ae88f2f44c', 0, 0, 0, 0, 0);

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

--
-- Dumping data for table `tb_comment`
--

INSERT INTO `tb_comment` (`id_comment`, `id_status`, `id_user`, `comment`, `time`) VALUES
(1, 1, '3e9ea0be-cbc2-45ac-866b-1c2ec07a3fac', 'test1234', '2022-12-29 13:09:30'),
(2, 67, '6fdc27cf-4f77-4ebb-9a0d-a03a43e66515', 'tes', '2023-01-02 09:47:14');

-- --------------------------------------------------------

--
-- Table structure for table `tb_contractor`
--

CREATE TABLE `tb_contractor` (
  `id_contractor` varchar(255) NOT NULL,
  `id_estate_cordinator` varchar(255) NOT NULL,
  `name_contractor` varchar(150) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_contractor`
--

INSERT INTO `tb_contractor` (`id_contractor`, `id_estate_cordinator`, `name_contractor`, `username`, `password`) VALUES
('6c85e81f-5abe-4d11-b3af-c07487249301', 'c56caaef-83be-4eb6-b880-c10268d1e9f8', 'jajang', 'jajang', '73e429635207dd3b96163d75750f4de4'),
('94537842-9331-4b7d-92ea-2a5c1cc0f012', 'usdcfghi23ey823', 'iskandar', 'iskandar', '73e429635207dd3b96163d75750f4de4'),
('ce5ae67c-f7c3-4656-9671-a19b45b6484f', 'usdcfghi23ey823', 'jajang', 'jaj2ansg', '73e429635207dd3b96163d75750f4de4');

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
('140b1319-41dd-4d71-8914-7659e19b0aa3', '94537842-9331-4b7d-92ea-2a5c1cc0f012', 2),
('1d131ab4-41cf-422e-b46f-b67593afa980', '94537842-9331-4b7d-92ea-2a5c1cc0f012', 3),
('3416f3c0-f038-406e-8479-0841ba1449c5', 'ce5ae67c-f7c3-4656-9671-a19b45b6484f', 4),
('422b1a70-288e-4b5d-8a31-5ec35ed2bc08', 'ce5ae67c-f7c3-4656-9671-a19b45b6484f', 2),
('607f7d73-395a-4d14-917f-06bc5e11e048', 'ce5ae67c-f7c3-4656-9671-a19b45b6484f', 1),
('6cbd043d-c204-46f3-9ac9-e731d1d6faf6', 'ce5ae67c-f7c3-4656-9671-a19b45b6484f', 3),
('7b6ffce1-6df1-4f69-bd86-d46eae7dc33e', 'ce5ae67c-f7c3-4656-9671-a19b45b6484f', 3),
('85679384-4a5a-462e-a2bf-c3f6391cf37c', '94537842-9331-4b7d-92ea-2a5c1cc0f012', 1),
('921158e6-3266-4f6b-ae54-fe19752d0e21', 'ce5ae67c-f7c3-4656-9671-a19b45b6484f', 4),
('998b0cf2-132f-4594-8aff-0f3fe712a087', '94537842-9331-4b7d-92ea-2a5c1cc0f012', 4),
('9c88200d-ab65-4635-83ad-b2c0e4b686d4', 'ce5ae67c-f7c3-4656-9671-a19b45b6484f', 1),
('e82dd0a9-9e9f-48ce-aeca-29e09d2acbe5', 'ce5ae67c-f7c3-4656-9671-a19b45b6484f', 2);

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
(3, 5, 2);

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
('23959258-39d6-425f-ae36-aa8243b1b3a0', 'jajang', 'adasdsad', 'asdasdsad'),
('3dfc0f07-d3ac-4bf0-8609-a969929f17de', 'iskandar', 'iskandar@gmail.coma', '0857143425289'),
('46b10481-d274-41fe-9f39-03f8eeebf87a', 'iskandar', 'iskandar@gmail.com', '08571434252829'),
('50d3f165-e363-4aa4-a871-8a30af8a1251', 'joko', 'adasdsad', 'asdasdsad'),
('8088e6ab-7ea6-44e8-ad15-eb92f9158f49', 'joko', '', ''),
('8aadac50-24d3-4fbd-9cd8-4d8d8e249a17', 'joko', 'adasdsad', 'asdasdsad'),
('9c750228-58bf-417a-89c9-5a44b91a65f8', 'joko', 'adasdsad', 'asdasdsad'),
('a1c1cbec-86f6-4e32-b9ed-7ac73bfa0bd5', 'iskandar', 'iskandar@gmail.com', '085714342528'),
('c2e02007-56af-478f-ba03-08878f718ab0', 'iskandar', 'iskandar@gmail.com', '085714342528'),
('c56caaef-83be-4eb6-b880-c10268d1e9f8', 'iskandar', '', ''),
('cfae5407-08dc-4f86-93c0-b02d338704f5', 'joko', 'adasdsad', 'asdasdsad');

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
('1f4e47b1-5601-4c28-b72c-d79aa603b2bd', 'c56caaef-83be-4eb6-b880-c10268d1e9f8', 1),
('40ebaf05-9a77-4144-99cd-d2b8d30d74f9', '3dfc0f07-d3ac-4bf0-8609-a969929f17de', 1),
('6be697d7-786f-414f-9f2b-3106c7886304', 'a1c1cbec-86f6-4e32-b9ed-7ac73bfa0bd5', 1),
('756e32f9-c186-42f1-8ad6-221b9d564d34', 'c2e02007-56af-478f-ba03-08878f718ab0', 1),
('7c55daf1-62b0-4f8c-8fd5-f946811e9259', '8aadac50-24d3-4fbd-9cd8-4d8d8e249a17', 1),
('8b586d8a-70c8-47a8-99e4-332ff160d667', '23959258-39d6-425f-ae36-aa8243b1b3a0', 1),
('a29283cf-1550-450a-b0a2-5e48fb3b1e3b', '46b10481-d274-41fe-9f39-03f8eeebf87a', 1),
('e4c7a3a2-0b99-41fb-9615-b2ef32775182', '8088e6ab-7ea6-44e8-ad15-eb92f9158f49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_estate_manager`
--

CREATE TABLE `tb_estate_manager` (
  `id_estate_manager` int(11) NOT NULL,
  `name_estate_manager` varchar(150) NOT NULL,
  `job` varchar(150) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('038e9004-10df-4ada-93c7-72f4d9b8e851', '9957ee55-9ca8-40ba-a6d7-ccbcb93c41cf', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('061c1840-67f0-45bb-8a32-e491cfd4e997', 'f11bd64d-cf26-4135-932c-da8ff18d3c6e', '86775703-86c1-46a1-92fb-173e95609a8f', 'c74c0393-01c3-4207-84f1-5216c9055cae', '007'),
('0bf1a38c-827d-428c-8344-7986cea18fdb', '4d67b9a4-8475-419e-88d9-0a82c3644d0c', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '001V'),
('17766b79-a939-4658-9b1f-e310d5b3dc93', '7c6c9382-cd13-4476-bcbe-9614817551db', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '006'),
('1e691abc-57ee-414a-8f34-cdb3dbb6071f', 'e4e05105-4c26-4c73-91f3-8c6b7a4e6372', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '010'),
('262fe125-2ea5-4370-a8fd-d0c1d828378d', 'd3b50bfb-ee99-4da6-8a24-b559cbfb0cad', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '012'),
('2a3176cd-95b1-4d6c-8625-40078b904159', 'c1e81feb-ffa1-4d08-8c02-6088e1b07463', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('425e0a06-32eb-4ca1-99b0-fb732249d213', '689ccfef-8bab-4c97-b88a-7c25f56ecdb1', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('4b04316b-1370-452b-a6f5-f9626ba5c147', '37f3739f-e48e-42e8-a813-006599daa2cb', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '010'),
('4c27b88a-611d-4b7e-9899-40f91e8910dc', '4ec29f71-8947-4842-b2bc-631af0fd3f09', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('4ee25132-1511-4cf1-a1d2-6dce15e67810', '58bfd524-1892-46dc-94de-62a1c534fdb2', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '13'),
('52a2f8ae-d84f-4e64-8f3f-3c7f65b3bb24', '53c9ced4-cb13-47aa-b0c5-e1c9fbc3e4b2', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('5c7bf14d-2b3d-490c-a692-e1dea2575553', 'dc53186c-3099-4d7d-8db2-b4206f1b8b4b', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '005'),
('6420642b-bc53-441e-afd1-5dbfa72630d8', '7cf65520-0626-419f-a3dc-f384b06c5d80', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '010'),
('7589eb2a-6c7e-4918-a14a-29c564881167', '0d1c7933-9011-457a-a244-1b4d6878492a', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('897ef64c-ee4a-483f-b076-687183047435', 'f57a6b01-06df-4b26-bb41-8e45cb305702', '86775703-86c1-46a1-92fb-173e95609a8f', '5ace18b9-4de7-4cf6-a1c8-279dbfbdfa43', '007'),
('8d538382-2b19-4b3d-b01d-dcfefb5b6e39', '8567395b-d7ae-49c3-aad9-f97cdfdb2612', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '005'),
('906a8d20-d6b7-4126-8017-60cea86b5c7f', '3f14837d-bab6-463b-9c86-a792398d6e36', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('a3df980d-5d3f-404e-8bfe-d6542659e412', '423274ee-e1f1-4f96-8491-bb51db5abba6', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('a41dc759-8930-4d7e-aef9-03be148f4b30', '9e46f660-b735-45aa-9793-09a4941496c9', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '002'),
('bfe626ab-e40e-496f-bd56-296bc7b81764', 'ec85981c-fb07-40e9-ae37-cbfa424633ff', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('cafc2089-b255-452c-a1a7-b90b2cf1dee9', 'fbea7a21-b860-4a2d-8480-578f2b1cb549', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('d6d97526-9687-4357-842c-c991d6ee7291', '03d112ac-3c49-46cb-866e-45e9744b5214', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '007'),
('d875cb10-d180-45b2-b67d-eec99b7d8fa1', 'cad4395c-289a-4ac4-b92b-1883625e3bc5', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('da37db20-d42e-4513-b56c-72f95192e92d', 'bf437f32-eda9-40d3-9f88-4a7f26811142', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('da7e2bf1-b4e9-40b5-8824-c8bf94429837', 'dd01fe1a-04ba-4bb7-8b7f-22281da96658', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('da81a861-0b94-4ce6-b544-4ccf32fd4c3b', '39b352e9-2ffc-4c9c-bf2c-ac116ea51ee8', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '001V'),
('e91c3855-5ba7-4ecf-bdd6-ee1478237407', '19db2c25-13a8-4bc1-bd2c-88b432b2ef3f', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('e99306f2-fd47-44a5-a3b6-6d89f7b43843', '6691feaa-997e-4f1f-a47e-ec17a2073c3d', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('eca18ce1-b71e-4e6a-9eea-1bf0c116f12c', '9aeb5b6e-638b-47a2-be12-12e87e507896', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '023'),
('f4b5d3e0-4e5f-40a5-ab13-425ac1ee81f2', 'e73ea6e2-6045-4d71-9bd2-50c4d447231f', 'f32151ef-5d84-484d-b392-5bb224db4a4d', 'f749fd22-104a-42fe-80af-8a5ccb8f6a85', '007'),
('fe712141-f985-4760-b10a-67b47fb09467', 'd40195d3-1d94-4c98-acae-08920d360b53', '72322b81-f2ad-4c8d-b27c-f8c57b9fc6f4', '', '017');

-- --------------------------------------------------------

--
-- Table structure for table `tb_process_report`
--

CREATE TABLE `tb_process_report` (
  `id_process_report` int(11) NOT NULL,
  `id_report` int(11) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `id_estate_cordinator` int(11) NOT NULL,
  `status_process` varchar(150) NOT NULL,
  `current_time_process` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_process_report`
--

INSERT INTO `tb_process_report` (`id_process_report`, `id_report`, `id_user`, `id_estate_cordinator`, `status_process`, `current_time_process`) VALUES
(1, 1, 'e73ea6e2-6045-4d71-9bd2-50c4d447231f', 0, 'Laporan diteruskan ke bagian Perawatan taman dan kebersihan', '2023-01-03 10:21:32'),
(2, 1, '', 0, 'Laporan sedang dikerjakan', '2023-01-03 10:25:56'),
(3, 1, '', 0, 'Laporan telah selesai, divalidasi oleh estate cordinator (iskandar)', '2023-01-03 10:26:56'),
(4, 2, 'e73ea6e2-6045-4d71-9bd2-50c4d447231f', 0, 'Laporan diteruskan ke bagian Perawatan taman dan kebersihan', '2023-01-03 10:38:55'),
(5, 2, '', 0, 'Laporan sedang dikerjakan', '2023-01-03 10:40:19'),
(6, 2, '', 0, 'Laporan telah selesai, divalidasi oleh estate cordinator (iskandar)', '2023-01-03 10:42:56');

-- --------------------------------------------------------

--
-- Table structure for table `tb_process_work_cordinator`
--

CREATE TABLE `tb_process_work_cordinator` (
  `id_process_work` int(11) NOT NULL,
  `id_report` int(11) NOT NULL,
  `id_estate_cordinator` int(11) NOT NULL,
  `photo_work_1` varchar(255) NOT NULL,
  `photo_work_2` varchar(255) NOT NULL,
  `photo_complete_1` varchar(255) NOT NULL,
  `photo_complete_2` varchar(255) NOT NULL,
  `current_time_work` datetime NOT NULL DEFAULT current_timestamp(),
  `finish_time` datetime NOT NULL,
  `duration` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_process_work_cordinator`
--

INSERT INTO `tb_process_work_cordinator` (`id_process_work`, `id_report`, `id_estate_cordinator`, `photo_work_1`, `photo_work_2`, `photo_complete_1`, `photo_complete_2`, `current_time_work`, `finish_time`, `duration`) VALUES
(1, 1, 0, 'imagecordinatorwork/efc41886eebd2e97f1d1c488881b4b21db8f624d.jpg', 'imagecordinatorwork/1fcb6257527737422e0375e0d73880489a99fa8e.jpg', 'imagecordinatorwork/bec5ec9698fef7824780fdd6b64bebe5b3fcbdd7.jpg', 'imagecordinatorwork/11cd887b10e6637ec25996c98712ce66875ae42d.jpg', '2023-01-03 10:25:56', '2023-01-03 10:26:54', '00:00:58'),
(2, 2, 0, 'imagecordinatorwork/9979e7041bd870abecd9be90bbdf7a638ebca593.jpg', '', 'imagecordinatorwork/8a8ec74e316408f2adbfbcf33d475a18332fcb29.jpg', '', '2023-01-03 10:40:19', '2023-01-03 10:42:57', '00:02:38');

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
  `id_category_detail` int(11) NOT NULL,
  `id_klasifikasi_category` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_report`
--

INSERT INTO `tb_report` (`id_report`, `id_user`, `no_ticket`, `description`, `title`, `date_post`, `time_post`, `category`, `id_category`, `url_image`, `status`, `star`, `comment`, `comment_time`, `urut`, `latitude`, `longitude`, `address`, `id_category_detail`, `id_klasifikasi_category`, `type`, `create_at`) VALUES
(1, 'e73ea6e2-6045-4d71-9bd2-50c4d447231f', '202301/00001', 'tolong dikerjakan', '', '2023-01-03', '10:21:32', 'Perawatan taman', 1, 'imagereport/5866cd9b1643aaebcc97394b46001d1d542ebaf7.jpg', 'finish', 5, '', '0000-00-00 00:00:00', 1, '-6.1113799', '106.7479501', 'Jl. Marina Indah Rukan Exclusive Blk. F No.7, RT.7/RW.2, Kamal Muara, Kec. Penjaringan, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta 14470, Indonesia', 0, '', 'Anonim', '2023-01-03 10:21:32'),
(2, 'e73ea6e2-6045-4d71-9bd2-50c4d447231f', '202301/00002', 'tolong di proses', '', '2023-01-03', '10:38:55', 'Perawatan taman', 1, 'imagereport/477dbc6540a043922aeb69fe33fea3a63b7f143f.jpg', 'finish', 0, '', '0000-00-00 00:00:00', 2, '-6.1113794', '106.7479466', 'Jl. Marina Indah Rukan Exclusive Blk. F No.7, RT.7/RW.2, Kamal Muara, Kec. Penjaringan, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta 14470, Indonesia', 0, '', 'Anonim', '2023-01-03 10:38:55');

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
('03d112ac-3c49-46cb-866e-45e9744b5214', '538b399e-632b-489e-8ea9-0b1ecf5a3045', 'BGM/RW/AG1/007', 'jashdksa@gmail.coms', '0821101709101', 'ANDRY JAYA', '814c4e3dcdf41e594e526044767ed8b1', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('46b10481-d274-41fe-9f39-03f8eeebf87a', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'iskandar', 'iskandar@gmail.com', '08571434252829', 'iskandar', '109f58c64949f3ed8bd632b2a6d3973f', 'imageuser/0c65bdf673c723a090e283c8f8ced26e417b41d9.png', 0),
('58bfd524-1892-46dc-94de-62a1c534fdb2', '538b399e-632b-489e-8ea9-0b1ecf5a3045', 'BGM/RW/AG1/010', 'feriwnarta26@gmail.com', '089603264483', 'sriwahyu', '814c4e3dcdf41e594e526044767ed8b1', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('8567395b-d7ae-49c3-aad9-f97cdfdb2612', 'ff5d78eb-dced-46b9-8230-0df6de9a9a73', 'BGM/RW/TEST', 'asdasdas@gmail.com', '085714342528', 'LAURA MELDY', '814c4e3dcdf41e594e526044767ed8b1', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('9e46f660-b735-45aa-9793-09a4941496c9', '538b399e-632b-489e-8ea9-0b1ecf5a3045', 'BGM/RW/AG1/002', 'jashdksa@gmail.comsa', '082110170910197', 'PONIMAN ASNIM', '814c4e3dcdf41e594e526044767ed8b1', 'imageuser/default_profile/blank_profile_picture.jpg', 0);

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
(1, '4677b734-f60d-45a4-a92f-c8b91f88469a', 'e4gPUIkqRqS-1XZ9QTCMLx:APA91bFu0d9psJYz19pNWk2VJcmEZXSCH5BKphnqKGz3hnxBpWMjqB0nctclnuY-m5YnPLwSpFd6tdwaQsxse8npAL2TwlsJgHWppVx15ojQz0a5Mq6JD56-kSsATKLnIfyYyye34b71', '2022-10-07 14:37:44'),
(2, '4252cf61-3960-48de-b81b-aa4c1e112a3a', 'cfne2YJ-Qlu7GiiOPK8PWX:APA91bHe265fry9U4_EH9lcTHTLdI7ypN1tMDDsaIaFrO4LcC0uCHwqsDsrAJzHRS4lTqgRlM2inF4fToDIdzXYcfdY_tW4ZdB9Kovgrjfn5Fcp1s6OWet574wGuLph118E94Ma0Un6K', '2022-11-07 09:44:38'),
(3, 'e017d6b4-24e0-4c5a-9f31-47c803f3ff04', 'e4gPUIkqRqS-1XZ9QTCMLx:APA91bFu0d9psJYz19pNWk2VJcmEZXSCH5BKphnqKGz3hnxBpWMjqB0nctclnuY-m5YnPLwSpFd6tdwaQsxse8npAL2TwlsJgHWppVx15ojQz0a5Mq6JD56-kSsATKLnIfyYyye34b71', '2022-11-17 15:50:37'),
(4, 'ea35f75b-8d76-40a8-beed-b17bc562eb23', 'dsXRMdpASPqzoxNsQAIGVC:APA91bE5j_9SAzvTBtcJH_jdoomTuORxQXDyyBqQqGmZAW6aJKqQh52pX7alPH5-zrm4-8J_8MkEVIhz-fAxh0z6x8qAwjI9XykXx2wDUQcWR-qgrtPIHVdCT_D-N6k-14K-hUR8ipnf', '2022-11-24 08:50:27'),
(5, 'cb7ed91a-d297-4da6-9e10-ef68f85f68d8', 'cM2qjGHKTq674owbnJPUpk:APA91bH7shJPWafLsouTj1bvQ-SKFk2FFQ6PZeeFNh5zfnC-RYIws8_S5p6tDritWLLiK8-_pgqIIE4mBuqnMC79MioFwktLEVfjOcsJ80FxR0-WhF_iw1B78eEc8ehZDYXeLoePN-iG', '2022-11-25 13:54:24'),
(6, 'd10d73e1-88a3-4cf0-8fa3-3d4cc2c39790', 'eaSqVqXrTrOPPpeF-E7BH_:APA91bEhoGbg0gwtw8Ffcf2lgIl9q6wO1kS8wcn0-cS5KgyudW77DAVisVpHC4ALYlzFVRKQ8y8VXt3Ud8aY-xyt21tKWQ2pQ6hdLYj5k8qZFD4QMdE6HVUC_qdBkQANvF-cS5fhEOZ9', '2022-11-25 14:07:49'),
(7, '7a884975-498f-434c-9139-5d6ed679774b', 'e_Y-I2T2TzKKAF0MgxlcxF:APA91bGCTAMnneF16vPLfINgRsfqVlHkZXEHaiO9qqRupulQyi1Spr7K86WVAaj6b_EJqI0uQCM31KMjCvS45P2w8kIJY4srG78fkU0ru35cvGtAlMYg5fC8AxC-_NREI7gP4xQYPyDz', '2022-11-25 14:14:13'),
(8, '06c03d32-06c3-447a-977b-0315f5bca144', 'cyBbgkdYTO-AdAzGBaSl8c:APA91bFBPbIRXyHIBSH2IaU0uTtOYPMgG2nh17LNFDHMioMiICh5QewGs1nsU8zXbatZLu9PTh9NnnFN3790fOe6NxWRC0v7xbxZIZ-VZ_j82O-9Tu-f_HzRSASWCAQz-3D_fQkOBr7L', '2022-11-25 14:19:39'),
(9, 'fc87c5ad-1049-4ed2-8ea3-e154b9873f10', 'ewqHgtmIS1-PM8yJCSnkQi:APA91bFd57RL_qgHwKrSadE9MObN9IHMwtnnEjkLdvELO1nxhHo-AwQGXE_ns6SqSKjF39xRR_lRP0L1oBK14YpwztsabJWh1BXeINFfV_yKoQOfemAeMq8B22WKzuqitqZn_U-uCBtn', '2022-11-25 14:48:38'),
(10, 'e33f3392-1e9e-417d-9600-a5e904e2bc99', 'fDCogKdVTgylLs4r3gnDF_:APA91bGVYR-zZDSvkVA9yLvw4a39NejvIaMp1TwQrRUPjFCIFHtGKW5uXffqlWr6JFvkHyp6DQOrK17IfswntkFoCmatZBmmyzfUv6dDCYO5OM-V2c2mtm3Z9ncSXVB5R34_AoP5Nwzx', '2022-11-25 15:01:25'),
(11, '43482ce9-7986-4e9f-885f-f6ce92d46a5a', 'fjbWJA7JTaaDOa4Bcevn6L:APA91bGlP8-l756xRaoWYwIaCnOwofc4LMFd_3Yw6gpJg8MP90lsOmJinwh6ug9CSyEiq6zd3glIChlgdSooQBu1I2DnZ01F1cqFXNCmeA9lU_ZvVF4EGXcPmQU8FOcCULUoJ1DFHuxd', '2022-11-25 15:05:24'),
(12, '7b1cbf3d-6ce4-47a1-b302-b38706c54fcb', 'cg7jhUwYQdW4opYxWd6C2b:APA91bEbJ1uPme0y5ohDzeIioQFeaF2VLqqXgRlTBy2ms5DJUqs5PqbyaJGIxmU4S9m4HB4Q_heba68iSQD3hkrvYombIw4Z3cNyf2tuaDUNltgqcGN1tLC39YeQfEv4EN0_X1KU2bZB', '2022-11-25 15:15:20'),
(13, '3966d309-fd10-4a41-bc94-ba603222c351', 'asdjasjdhbkj1234', '2022-11-25 15:19:47'),
(14, '5afa636a-2294-4483-87a5-2b7aa5b56bc4', 'asdjasjdhbkj1234', '2022-11-28 11:04:04'),
(15, 'caebc066-cf81-4e3b-bfaa-d8698ae5f4a8', 'dsXRMdpASPqzoxNsQAIGVC:APA91bE5j_9SAzvTBtcJH_jdoomTuORxQXDyyBqQqGmZAW6aJKqQh52pX7alPH5-zrm4-8J_8MkEVIhz-fAxh0z6x8qAwjI9XykXx2wDUQcWR-qgrtPIHVdCT_D-N6k-14K-hUR8ipnf', '2022-11-28 11:27:39'),
(16, '72b0a8ff-2b68-4d8b-a85f-097d7bd61a54', 'asdjasjdhbkj1234', '2022-12-05 15:46:10'),
(17, 'c0a8fa2e-c823-44fd-9f04-3bcaa06cdab5', 'asdjasjdhbkj1234', '2022-12-05 15:48:33'),
(18, '98d64518-36b9-4fbb-867b-7b5c94fb1a68', 'asdjasjdhbkj1234', '2022-12-05 15:54:38'),
(19, '71b26cd7-6f36-4b31-b69a-7bbe7232acca', 'asdjasjdhbkj1234', '2022-12-05 16:02:18'),
(20, 'fc52db74-bef2-4699-b662-9092e01877ea', 'asdjasjdhbkj1234', '2022-12-05 16:16:40'),
(21, '6317e426-8bc5-419b-b9db-f0912a1126f5', 'asdjasjdhbkj1234', '2022-12-05 16:35:59'),
(22, '7fae11cb-01ec-43ac-930b-3f923f7d88fe', 'asdjasjdhbkj1234', '2022-12-05 16:41:36'),
(23, '8b81c2d2-c06e-4068-9488-8b8150e2882c', 'asdjasjdhbkj1234', '2022-12-06 09:17:27'),
(24, 'dd754d1a-f96a-4966-a3a0-bc423e6dcd2f', 'asdjasjdhbkj1234', '2022-12-06 09:24:54'),
(25, '0caac56e-c8d4-4093-b134-abe7ae4144f1', 'asdjasjdhbkj1234', '2022-12-06 09:30:58'),
(26, '37c3eb49-901e-4a3c-9321-43ad025b60fe', 'asdjasjdhbkj1234', '2022-12-06 09:37:57'),
(27, 'b5df8901-2df8-42a2-8e80-f2ead3ae85e9', 'asdjasjdhbkj1234', '2022-12-06 09:44:25'),
(28, 'aa312b1f-7d75-4488-88a7-fb9b51f6287e', 'asdjasjdhbkj1234', '2022-12-06 09:49:52'),
(29, 'bc04383b-25ff-4d2b-95e1-99db48e15766', 'asdjasjdhbkj1234', '2022-12-06 09:55:50'),
(30, '1d94ebe6-45fd-41c4-93e8-977d1acf05f2', 'asdjasjdhbkj1234', '2022-12-06 10:05:44'),
(31, '9af9c7d5-a9cc-4c37-9ef6-0be1a6fe6cf6', 'asdjasjdhbkj1234', '2022-12-06 10:18:18'),
(32, 'bffbbf66-3827-496f-ba14-b2e611d25603', 'asdjasjdhbkj1234', '2022-12-06 10:23:37'),
(33, '5c907693-b357-40a0-b6ac-9ce296eb3d3c', 'asdjasjdhbkj1234', '2022-12-06 10:26:53'),
(34, '1e26943f-46ea-43f5-85a6-1ef8c9b6a462', 'asdjasjdhbkj1234', '2022-12-06 10:39:06'),
(35, '7ffe2caa-a79f-4b8a-9cf0-0c3de4a385a4', 'asdjasjdhbkj1234', '2022-12-06 10:41:11'),
(36, 'd44f78a0-59ac-4709-b730-c425fa4fe54b', 'asdjasjdhbkj1234', '2022-12-06 10:44:36'),
(37, '259f93e9-9d49-4558-9436-efe6169b0f8f', 'dIhIjxCrR5Kj7q749VdolE:APA91bE5o_gk-NZ5hE2ZcbOGv0i0myBd-YhYByEltZZfvGFgWQY9MDUnjOsUtb6jGr2YLhy4TvOWlpPuU7TgE3UwJ9XYDgcgFMthoQW7T8XO6_1Y7NcTX-o3no8y0Si4hkZIBrOLl-9t', '2022-12-06 14:26:08'),
(38, 'cb3a8975-c7af-4914-a1ca-05762db61a34', 'dx96q4X5QASSDFqTHa4Tt9:APA91bE2Z4lpcSOcCOv560BG_Y80vuN2n2fg1h2nIJ0eUcFchFZJE5kx0BR0Podtp1ME6mQflvhqsEvdSPirEu9eweHek_vEppt_5E1rFiss1T6XaC5ZRCeOoojXHpgC-otFp1rQhhdl', '2022-12-06 14:31:19'),
(39, 'eea3854e-2410-4e0d-b9a7-c8e208e690f1', 'dFo9RTv_S9esPFOBFVtKjG:APA91bEviaT5bHXC1ZLddLhoq1FkVD4EMqDteacbAU3bzVHrPtbfAvxa1miFuX0TwBMsZDTtm-1l9GmQ8UAh8mK09BLUqyGie-TUpDZDzfHajBnPF2DmAeek4jUFrhuq7yzP_VHJWQpn', '2022-12-13 14:40:48'),
(40, 'af8efe2e-1529-49d1-84eb-4aeec4a07c85', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bE-QBRRapw-2_ko-EdI8WEeVjaFOgutVLqiaVBPe-6EdkGVNGwUm-pfwPWsa9eOKNyTa9iVMSEHSbuXw32mdSLu0xCs1C8PMdKIua0tLHu9sKj4bWPJgKi9H2gZETEeVnanglkL', '2022-12-15 10:12:19'),
(41, '7e4b7c9b-c2d8-485d-b13e-fe72f2a7f1cd', 'dub4xeVaSTyDKFFVbIRL-o:APA91bGSXex5vVeTcMAZTO6acW4rAf4V0N6kPIiuqqyPUMDSBIYuP0leI8Z_Yk5m9rdeFZOazbYfEKfEwVqslzzSBrUlhxZ949xG_Wh1ehkWnRgBQv3VoTfnw6KmTEAPuqPIpB9ibFp0', '2022-12-22 11:44:47'),
(42, 'a8b6b5b0-8c5e-4542-a02f-5dc211d7ab7e', 'exZtZI0UTkKA1Qy8T0vmhm:APA91bHznoL9mZBgOsUPHsUVLwBqJfQjYFo_IMeePoZU5DMee-og8cVAcZEFI0F6_YVw5LSPbOfSYAURXwDcWJJpo6e2l0OvM0qEZsV-GoEUByErg1FWSAFhwS8NC4m2asLNLP6-e6Mw', '2022-12-22 11:49:56'),
(43, '6fdc27cf-4f77-4ebb-9a0d-a03a43e66515', 'dxmLCx5MTL6FCIXO8-7EP1:APA91bEBhXxzsPmrJMlTDDOv0bPqIMDYd2s2UqIv5wBIg4bA3dHtFn-e6K-Cos85ZzBEan9sFnYuUElz_aSNobGU8hf1evFnTCjtYY1kLTkkue2liYEKX9z14POzfXGpKUGXRGvw8Ww2', '2022-12-22 13:10:08'),
(44, 'e73588d3-2e9e-4d79-b6e8-811a68821360', 'dE84kBa8Ri2IbEVceDECSL:APA91bEZXO3ZoD-sEBWs8s52pZeII4eVZASwYleaSaMewf025pSiTGmAHY-YlLLkm5ARB4DUWr1K79YvoSt7cS2GrD8o2Ch76ODlOvUWD9Q9xV_O3wyYvMthTgeW9jocsDfBvVQMa3cP', '2022-12-26 11:05:46'),
(45, '3e9ea0be-cbc2-45ac-866b-1c2ec07a3fac', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bF_RcKRMG_dTOIY7idnZRS3Hx5XxFWV1BYrVYRRdGw5OIa8BmoRJfUyVBtBuJhzWRWOgyYgJb4MVLI8tZxcFwgeAb378FVXykh10Xruz7n6y7yz_oVE2DDI7EbZeuyAlto4AvBo', '2022-12-29 09:28:25'),
(46, '7c6c9382-cd13-4476-bcbe-9614817551db', '1234asd', '2023-01-02 13:31:41'),
(47, 'e73ea6e2-6045-4d71-9bd2-50c4d447231f', 'eCgzMmmoQF2l8_gxUEHyox:APA91bGOsBPDAK4JDJVPrjBwJOtOpQQ1xUrN5Hpas_sziOC8AxErqPU0xaMJtsqHVEH2txhOQTBXZuLgPNq9b-94yDErgzLVpNtj8JFzyUQlx-vFQ9bI2-Ac8ytmuZGDmghO_ZZH8uiC', '2023-01-03 10:08:00'),
(48, '23959258-39d6-425f-ae36-aa8243b1b3a0', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bHYy-k7q6wk6Khzbocy46VK433XRspTSM1rkMKb4neRMje3LWUj9X2jpYGD0ohYZyzy8qxMcRnPLSOGa_ERMlhVlkG7BNlZ8i0xdXH0Cuz8YTfZaqcyar3H2RWxdkA8vwhUtBgB', '2023-01-06 08:52:11'),
(49, '37f3739f-e48e-42e8-a813-006599daa2cb', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bHYy-k7q6wk6Khzbocy46VK433XRspTSM1rkMKb4neRMje3LWUj9X2jpYGD0ohYZyzy8qxMcRnPLSOGa_ERMlhVlkG7BNlZ8i0xdXH0Cuz8YTfZaqcyar3H2RWxdkA8vwhUtBgB', '2023-01-06 09:40:08'),
(50, '58bfd524-1892-46dc-94de-62a1c534fdb2', 'asdadasdasdas', '2023-01-06 09:59:46'),
(51, 'dc53186c-3099-4d7d-8db2-b4206f1b8b4b', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bHYy-k7q6wk6Khzbocy46VK433XRspTSM1rkMKb4neRMje3LWUj9X2jpYGD0ohYZyzy8qxMcRnPLSOGa_ERMlhVlkG7BNlZ8i0xdXH0Cuz8YTfZaqcyar3H2RWxdkA8vwhUtBgB', '2023-01-06 10:58:54'),
(52, '8567395b-d7ae-49c3-aad9-f97cdfdb2612', 'asdadasdasdas', '2023-01-06 11:11:28'),
(53, '03d112ac-3c49-46cb-866e-45e9744b5214', 'dZc_xwF0QNq4bxBFX8-4WW:APA91bEGyYnYDK-E0RYEfx6VNIIgWfktxOKnYaIsoW2wdi69wd-Z1pXF8SD4urT6n0JbMSOYd5fEaP_zSojBjrULzh56H4Qfe_6_xTdBzdye20adk18aj_TmEmzcVX9VMT07f05EZ_v_', '2023-01-06 15:02:12'),
(54, '46b10481-d274-41fe-9f39-03f8eeebf87a', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bHYy-k7q6wk6Khzbocy46VK433XRspTSM1rkMKb4neRMje3LWUj9X2jpYGD0ohYZyzy8qxMcRnPLSOGa_ERMlhVlkG7BNlZ8i0xdXH0Cuz8YTfZaqcyar3H2RWxdkA8vwhUtBgB', '2023-01-06 15:47:35'),
(55, '9e46f660-b735-45aa-9793-09a4941496c9', 'asdadasdasdas', '2023-01-06 16:08:02');

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
(23, '8b81c2d2-c06e-4068-9488-8b8150e2882c', 'iPhone X', '625B6AE2-BC6F-4322-BD79-F020E06CD3C9', '2022-12-06 09:17:27'),
(24, 'dd754d1a-f96a-4966-a3a0-bc423e6dcd2f', 'iPhone X', 'A9AE5D12-3584-40E2-BDB8-C017EDE9FC06', '2022-12-06 09:24:54'),
(25, '0caac56e-c8d4-4093-b134-abe7ae4144f1', 'iPhone X', '8D70D7CE-149B-4828-8F3A-501F8935F1F9', '2022-12-06 09:30:58'),
(26, '37c3eb49-901e-4a3c-9321-43ad025b60fe', 'iPhone X', '1779E815-4B70-4FEE-B473-D4855D405D26', '2022-12-06 09:37:57'),
(27, 'b5df8901-2df8-42a2-8e80-f2ead3ae85e9', 'iPhone X', '93D9D822-5DA1-4B2E-A6FC-2EEECE328B40', '2022-12-06 09:44:25'),
(28, 'aa312b1f-7d75-4488-88a7-fb9b51f6287e', 'iPhone X', 'ABB56A6F-E5D3-4039-AB2A-A6373F80FB81', '2022-12-06 09:49:52'),
(29, 'bc04383b-25ff-4d2b-95e1-99db48e15766', 'iPhone X', 'EF5EB244-BEB1-460B-82C8-7F4C515BD6DC', '2022-12-06 09:55:50'),
(30, '1d94ebe6-45fd-41c4-93e8-977d1acf05f2', 'iPhone X', '1D5731F6-EF60-4CD0-9068-548D0584D5A5', '2022-12-06 10:05:44'),
(31, '9af9c7d5-a9cc-4c37-9ef6-0be1a6fe6cf6', 'iPhone X', '5AE51F98-1681-4AB1-9117-22BDD1CC6C05', '2022-12-06 10:18:18'),
(32, 'bffbbf66-3827-496f-ba14-b2e611d25603', 'iPhone X', 'CDC7BFBF-4DC3-4BEE-B67A-565396FCA65F', '2022-12-06 10:23:37'),
(33, '5c907693-b357-40a0-b6ac-9ce296eb3d3c', 'iPhone X', '679E94EC-54B8-4783-A539-B00DFF609AAC', '2022-12-06 10:26:53'),
(34, '1e26943f-46ea-43f5-85a6-1ef8c9b6a462', 'iPhone X', '7703A6C5-267C-46B5-9B8F-02CAE595EBE8', '2022-12-06 10:39:06'),
(35, '7ffe2caa-a79f-4b8a-9cf0-0c3de4a385a4', 'iPhone X', '6888CF87-C3D0-4B31-BFF1-3468A88193C0', '2022-12-06 10:41:11'),
(36, 'd44f78a0-59ac-4709-b730-c425fa4fe54b', 'iPhone X', '0A4EF75A-79CA-486B-8B54-F38D5AFD6175', '2022-12-06 10:44:36'),
(37, '259f93e9-9d49-4558-9436-efe6169b0f8f', 'Redmi 5 Plus', 'N2G47H', '2022-12-06 14:26:08'),
(38, 'cb3a8975-c7af-4914-a1ca-05762db61a34', 'sdk_gphone64_arm64', 'SE1A.220630.001', '2022-12-06 14:31:19'),
(39, 'eea3854e-2410-4e0d-b9a7-c8e208e690f1', 'sdk_gphone64_x86_64', 'SE1A.220630.001', '2022-12-13 14:40:48'),
(40, 'af8efe2e-1529-49d1-84eb-4aeec4a07c85', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2022-12-15 10:12:19'),
(41, '7e4b7c9b-c2d8-485d-b13e-fe72f2a7f1cd', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2022-12-22 11:44:47'),
(42, 'a8b6b5b0-8c5e-4542-a02f-5dc211d7ab7e', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2022-12-22 11:49:56'),
(43, '6fdc27cf-4f77-4ebb-9a0d-a03a43e66515', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2022-12-22 13:10:08'),
(44, 'e73588d3-2e9e-4d79-b6e8-811a68821360', 'MIX', 'MXB48T', '2022-12-26 11:05:46'),
(45, '3e9ea0be-cbc2-45ac-866b-1c2ec07a3fac', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2022-12-29 09:28:25'),
(46, '7c6c9382-cd13-4476-bcbe-9614817551db', '', '', '2023-01-02 13:31:41'),
(47, 'e73ea6e2-6045-4d71-9bd2-50c4d447231f', 'MIX', 'MXB48T', '2023-01-03 10:08:00'),
(48, '23959258-39d6-425f-ae36-aa8243b1b3a0', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-06 08:52:11'),
(49, '37f3739f-e48e-42e8-a813-006599daa2cb', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-06 09:40:08'),
(50, '58bfd524-1892-46dc-94de-62a1c534fdb2', 'redmi', 'asdasdsad', '2023-01-06 09:59:46'),
(51, 'dc53186c-3099-4d7d-8db2-b4206f1b8b4b', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-06 10:58:54'),
(52, '8567395b-d7ae-49c3-aad9-f97cdfdb2612', 'redmis', 'asdasdsad', '2023-01-06 11:11:28'),
(53, '03d112ac-3c49-46cb-866e-45e9744b5214', 'Redmi 5 Plus', 'N2G47H', '2023-01-06 15:02:12'),
(54, '46b10481-d274-41fe-9f39-03f8eeebf87a', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-06 15:47:35'),
(55, '9e46f660-b735-45aa-9793-09a4941496c9', 'redmis', 'asdasdsad', '2023-01-06 16:08:02');

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
('25c93554-bcfa-4990-b06d-e74b4f682f70', 'DJUNA LAUJANTO', 'BGM/BAST/ET/020'),
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
('a7d2124b-1db7-4e1a-8cb8-f01b83aa791c', 'HENDRA', 'BGM/BAST/AG1/029'),
('b00db451-524c-494a-a934-2085b3de6b46', 'ELYS KARIS', 'BGM/BAST/AG1/020'),
('bb63813c-b7d0-4e85-ae1e-e5ef53328c35', 'TANTYWATI', 'BGM/BAST/AG1/008'),
('bf437f32-eda9-40d3-9f88-4a7f26811142', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('c1e81feb-ffa1-4d08-8c02-6088e1b07463', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
('cad4395c-289a-4ac4-b92b-1883625e3bc5', 'OEY JIMMY GOUTAMA', 'BGM/BAST/AG1/023'),
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
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_detail_klasifikasi_category`
--
ALTER TABLE `tb_detail_klasifikasi_category`
  MODIFY `id_klasifikasi_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `tb_estate_manager`
--
ALTER TABLE `tb_estate_manager`
  MODIFY `id_estate_manager` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_process_report` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_process_work_cordinator`
--
ALTER TABLE `tb_process_work_cordinator`
  MODIFY `id_process_work` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_report`
--
ALTER TABLE `tb_report`
  MODIFY `id_report` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id_fcm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tb_user_login_auth`
--
ALTER TABLE `tb_user_login_auth`
  MODIFY `id_login_auth` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
