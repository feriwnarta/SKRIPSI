-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 27, 2023 at 08:11 AM
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
  `manager_kontraktor` int(11) NOT NULL DEFAULT 0,
  `kepala_contractor` int(11) NOT NULL DEFAULT 0,
  `cordinator` int(11) NOT NULL,
  `landscape` int(11) NOT NULL,
  `otp` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_access`
--

INSERT INTO `tb_access` (`id_access`, `id_auth`, `management`, `warga`, `estate_manager`, `manager_kontraktor`, `kepala_contractor`, `cordinator`, `landscape`, `otp`) VALUES
('027976bd-d388-4ab3-9672-2e1933e10144', 'd79915ac-449f-4013-9dc5-251aef168da4', 0, 0, 0, 0, 1, 0, 0, 0),
('4878c8b6-009d-4674-8d1b-fe9d9347e1bf', 'e9cd8a0f-0309-4f79-b40b-39e2a0b30291', 0, 0, 0, 0, 0, 0, 0, 0),
('77d487e8-fc2b-4d6f-ac89-36fa8bae3966', '2fea85f4-aa31-4727-8cf1-ad1245505f7a', 0, 0, 1, 0, 0, 0, 0, 0),
('79b3070d-fc61-4199-ac10-7a9ffa6a1918', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 0, 0, 0, 0, 0, 1, 0, 0),
('b4b54f73-7309-4600-a305-cb337d8e62ec', '538b399e-632b-489e-8ea9-0b1ecf5a3045', 0, 1, 0, 0, 0, 0, 0, 1),
('c6c4996f-e951-4222-a046-640e3c7734e0', 'ac309780-cd2b-4b15-9478-ec8ae48ce593', 0, 0, 0, 1, 0, 0, 0, 0),
('fb5f6459-281a-40f5-aeb0-b974dd370af0', 'ff5d78eb-dced-46b9-8230-0df6de9a9a73', 1, 1, 1, 1, 1, 1, 1, 0),
('fc7c087c-f05b-4df5-851f-6d858954ce42', 'e47b4e1b-ecd5-41aa-90fa-20ae88f2f44c', 0, 0, 0, 0, 0, 0, 0, 0);

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
('ac309780-cd2b-4b15-9478-ec8ae48ce593', 'MANAGER KONTRAKTOR'),
('d79915ac-449f-4013-9dc5-251aef168da4', 'KEPALA CONTRACTOR'),
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
('26db0db8-af5e-44ea-8481-c8547f18e7b8', '', 'TEST AKUN DEVELOPER', 'sadasd@gmial.com', '08912321321312'),
('c0de3420-be0d-4ae8-94e1-b2e3cbeace55', 'a1e5a7d6-5c63-4bd4-a36f-d9c79e74f907', 'ptham', 'ptham@gmail.com', '08888888888');

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
('26db0db8-af5e-44ea-8481-c8547f18e723-a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 2),
('80a9d7a6-f126-4e57-9b7b-73addbdd3c49', 'c0de3420-be0d-4ae8-94e1-b2e3cbeace55', 2),
('81c9027d-935a-4d62-9d3f-21cd5965af75', 'c0de3420-be0d-4ae8-94e1-b2e3cbeace55', 1);

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
('68d2639e-d8f6-4e56-ba56-c2fcf1491260', 'a3f9be31-8c16-4a7e-8854-4dc2ed91a261', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-20 13:02:07', '2023-01-24 08:08:51'),
('7b838252-87c8-415a-8c32-c688353fe772', '', 'asdasdasdasd', '2023-01-06 15:44:57', '2023-01-06 15:44:57'),
('836f8820-dda2-4d82-98df-5ff524aa43c1', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-24 11:17:02', '2023-01-24 05:17:31'),
('8865eaaa-4584-4a93-b3a9-c91b56f02831', 'd1b6d525-7a7f-4408-8f18-735259230574', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-24 10:45:12', '2023-01-24 04:46:31');

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
(3, 5, 2),
(5, 1, 2);

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
('a1e5a7d6-5c63-4bd4-a36f-d9c79e74f907', 'iskandar', 'iskandar@gmail.com', '088888888888');

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
('354fef66-b45b-40ae-aa30-beee5a228a1a', 'a1e5a7d6-5c63-4bd4-a36f-d9c79e74f907', 1);

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
('f71d8564-7899-445d-b317-0353bb35f39e', 'Danu Maraden', 'danumaraden@gmail.com', '08888888888888888', '');

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
-- Table structure for table `tb_manager_contractor`
--

CREATE TABLE `tb_manager_contractor` (
  `id_manager_contractor` varchar(255) NOT NULL,
  `id_estate_cordinator` varchar(255) NOT NULL,
  `id_contractor` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_telp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_manager_contractor`
--

INSERT INTO `tb_manager_contractor` (`id_manager_contractor`, `id_estate_cordinator`, `id_contractor`, `name`, `email`, `no_telp`) VALUES
('a7e58e83-57ac-471d-a169-2999c8af2153', 'a1e5a7d6-5c63-4bd4-a36f-d9c79e74f907', 'c0de3420-be0d-4ae8-94e1-b2e3cbeace55', 'joko', 'joko@gmail.com', '088888888888');

-- --------------------------------------------------------

--
-- Table structure for table `tb_manager_contractor_job`
--

CREATE TABLE `tb_manager_contractor_job` (
  `id_manager_contractor_job` varchar(255) NOT NULL,
  `id_manager_contractor` varchar(255) NOT NULL,
  `id_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_manager_contractor_job`
--

INSERT INTO `tb_manager_contractor_job` (`id_manager_contractor_job`, `id_manager_contractor`, `id_category`) VALUES
('4bc01099-bb62-4c2f-b616-05cf8725e91b', 'a7e58e83-57ac-471d-a169-2999c8af2153', '1'),
('70038667-808b-4a22-9052-465bcd111e5f', 'a7e58e83-57ac-471d-a169-2999c8af2153', '2');

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
('00817adb-f902-41a0-b159-e98f2c8d5875', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:36:08', '2023-01-25 13:36:08'),
('01ec085c-2ba1-46ad-b854-0d08affe8305', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 09:29:15', '2023-01-26 09:29:15'),
('030a14a7-9cd3-486e-9e19-2e8ff37fb39b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:35:46', '2023-01-25 13:35:46'),
('0381204b-a04d-427b-a027-483f2e58e263', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 11:36:32', '2023-01-26 11:36:32'),
('03f1796f-e25a-4aa5-967c-580d1581055a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 10:42:23', '2023-01-25 10:42:23'),
('04744f01-9a5e-4798-a61b-6f470a80a8d9', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:44:07', '2023-01-25 11:44:07'),
('04e7c6f6-01cb-4ead-b133-593b2320ada3', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 09:31:33', '2023-01-26 09:31:33'),
('061a2e70-de38-4ed1-8075-aaed04ad8393', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-27 09:10:23', '2023-01-27 09:10:23'),
('0862999e-304b-4142-bb71-ab1218cd6e5b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 09:38:36', '2023-01-26 09:38:36'),
('092bbabd-078d-4d10-a8b6-3a9257a310b5', '', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang  sedang dikerjakan', '2023-01-27 09:00:54', '2023-01-27 09:00:54'),
('09f8708d-f7d7-4314-9c16-1f4540a5043c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:03:20', '2023-01-25 13:03:20'),
('0a6103e0-6e6c-4c67-b284-a1fda49340e8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-27 08:56:46', '2023-01-27 08:56:46'),
('0bfe1274-23b6-4616-9585-5026e4b6e471', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:00:59', '2023-01-25 11:00:59'),
('0c03597a-fbaa-48b7-a68f-44de88a999a5', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 13:39:48', '2023-01-25 13:39:48'),
('0e18e04c-6d58-41ab-9885-e3ca40edbf04', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 13:31:31', '2023-01-25 13:31:31'),
('0fa2704e-1b77-45d6-9e60-0f1fde84516b', '', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang  sedang dikerjakan', '2023-01-27 09:02:59', '2023-01-27 09:02:59'),
('14570488-b866-4a19-9edf-b9446b901955', '', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang  sedang dikerjakan', '2023-01-27 09:01:28', '2023-01-27 09:01:28'),
('158c8b9f-ab2d-4e5e-ae96-cbec036a12b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 10:24:23', '2023-01-26 10:24:23'),
('15a3c8db-5bf3-47f5-8ccd-3723bb264c86', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'bb396d30-4f7c-4b56-9f9f-9459c8811023', 'COMMENT', 'LAURA MELDY Menanggapi Postinganmu', 'ini adalah komentarr', '2023-01-12 09:34:19', '2023-01-12 09:34:19'),
('15a3c8db-5bf3-47f5-8ccd-3723bb264c86a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'bb396d30-4f7c-4b56-9f9f-9459c8811023', 'COMMENT', 'LAURA MELDY Menanggapi Postinganmu', 'ini adalah komentarr', '2023-01-12 09:34:19', '2023-01-12 09:34:19'),
('15dd6456-adb5-42ab-bcf1-fa8d80036e32', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 15:19:00', '2023-01-25 15:19:00'),
('17f057f1-437b-4901-adb7-857feadc23d0', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 14:09:20', '2023-01-25 14:09:20'),
('186bb7c5-9b64-46d3-959e-fab762ab8f8b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 16:06:01', '2023-01-26 16:06:01'),
('18811bec-c44e-42b4-bced-2faec2f5a915', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu 202301/00001telah selesai dikerjakan', '2023-01-26 10:22:28', '2023-01-26 10:22:28'),
('194fec6a-a258-42db-a4e7-2492887e97c8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:36:08', '2023-01-25 13:36:08'),
('1a41b035-4267-40e8-a236-13b8de24d8b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 14:23:27', '2023-01-25 14:23:27'),
('1ae5dbe6-301f-40a7-9f4a-0e364f89166b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:33:19', '2023-01-25 11:33:19'),
('1b394d6c-9af3-4a1d-a1b1-15dba098af68', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:37:04', '2023-01-25 11:37:04'),
('1b58bd32-17f9-4fcf-8904-b7c7755b38a9', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 10:29:22', '2023-01-26 10:29:22'),
('1cbd045c-19e9-4805-bd40-59124bbcadb8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:04:10', '2023-01-25 11:04:10'),
('1cff27fc-f402-4c62-9807-bd489f615bb6', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-27 08:52:40', '2023-01-27 08:52:40'),
('1e847ab6-ff8f-421b-a22e-495949cb2eab', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 09:39:16', '2023-01-26 09:39:16'),
('1ffc5a37-54bd-4392-8071-76f4e495b8fa', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 14:22:29', '2023-01-25 14:22:29'),
('218292d3-5623-49c9-952a-1451d0e6daa7', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:39:02', '2023-01-25 13:39:02'),
('21fb41cf-3db4-487c-9c0d-a081ef0d1bf3', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 09:05:25', '2023-01-12 09:05:25'),
('22d4eae4-826c-4318-8b88-927829a6dc22', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 09:05:08', '2023-01-12 09:05:08'),
('22d9ba0e-0ccd-41e8-a363-96f09e0b5954', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-27 09:04:47', '2023-01-27 09:04:47'),
('2333c0b1-8f0f-4651-bcce-735bdfe32db4', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:40:31', '2023-01-25 11:40:31'),
('24f5bdb2-01a6-44e0-9d6b-97264405aa04', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu 202301/00001telah selesai dikerjakan', '2023-01-26 10:36:06', '2023-01-26 10:36:06'),
('25da70e8-3f72-465f-8610-f53fef57c97a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 13:53:00', '2023-01-25 13:53:00'),
('265c9e97-64e9-4338-9ce6-6b810cab7277', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:27:46', '2023-01-25 11:27:46'),
('266c6786-29dd-4fb3-bf99-35f9969b984c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu 202301/00001telah selesai dikerjakan', '2023-01-27 11:02:54', '2023-01-27 11:02:54'),
('28c1497d-119e-4b5f-b64f-843b25894b2e', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:37:51', '2023-01-25 11:37:51'),
('2a4bc02a-79c9-4712-b9ae-bd7a675cf7b2', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:10:17', '2023-01-25 11:10:17'),
('2f3f1047-dfa0-4af8-a125-e3689865c1b7', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 10:34:14', '2023-01-26 10:34:14'),
('305d5759-2322-4acd-920e-2e0040200d13', '', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang  telah diterima dan akan segera diproses', '2023-01-27 08:59:27', '2023-01-27 08:59:27'),
('315bc2e7-1353-480c-9ece-fd41f7026368', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 10:57:01', '2023-01-25 10:57:01'),
('32250378-cca9-40f7-a389-8eca2918615a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:29:14', '2023-01-12 16:29:14'),
('3258f7b3-d2b3-454c-ac3e-66f552a0e73b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:07:07', '2023-01-12 16:07:07'),
('325ff8f3-3750-433e-b51c-2500872e5dde', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:06:01', '2023-01-12 16:06:01'),
('33707722-523d-4c31-9b77-27ea265d7f77', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 09:30:07', '2023-01-26 09:30:07'),
('3449b173-fc27-457b-a32c-8fbdc1f975b3', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 15:37:52', '2023-01-25 15:37:52'),
('34eabdc9-589e-4b05-8538-cf7b4509bf28', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 15:30:50', '2023-01-25 15:30:50'),
('35ca521f-ee5a-4eb1-a4fa-e2cedb695671', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 09:56:54', '2023-01-26 09:56:54'),
('37231aca-54fc-41e3-8a71-f4b763072a6c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-27 09:11:54', '2023-01-27 09:11:54'),
('38a6777c-1332-4e3f-843f-0c6efb2f1fff', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:11:11', '2023-01-25 11:11:11'),
('3b6cb3b1-7de1-41a5-9abd-6681427e340f', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-27 10:24:51', '2023-01-27 10:24:51'),
('3c027365-f93e-485a-bee3-9c769d8c6b5f', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 10:33:34', '2023-01-26 10:33:34'),
('3cb6959b-d69f-4400-a8f8-d5820a4d668c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu 202301/00001telah selesai dikerjakan', '2023-01-26 11:36:49', '2023-01-26 11:36:49'),
('3cc96741-0448-47fd-bb2c-f879bbabece6', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 09:31:51', '2023-01-26 09:31:51'),
('3e99220d-7bec-4a8a-8991-37e7ffd34b6c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 13:51:42', '2023-01-25 13:51:42'),
('3f1ecd87-639b-4837-a22a-aceb2b403465', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:13:48', '2023-01-12 16:13:48'),
('3f5ea62e-413f-4f74-a6a4-8b5b4d7fca95', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:20:42', '2023-01-25 13:20:42'),
('3fbc6bab-6e24-4faf-84ba-69cb333d6cdd', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 10:57:12', '2023-01-25 10:57:12'),
('4026c218-9f92-42f5-aea1-507b10e2e9e7', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 09:29:01', '2023-01-26 09:29:01'),
('411584e2-0c65-42ed-bbe4-18adeb5cc787', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 15:11:49', '2023-01-25 15:11:49'),
('4236596d-073b-4739-b280-baadc9831c2f', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 10:48:50', '2023-01-25 10:48:50'),
('449d5c57-5217-428d-9d81-ffed0e885d7f', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu 202301/00001telah selesai dikerjakan', '2023-01-26 10:35:02', '2023-01-26 10:35:02'),
('45463863-b717-4f27-a41c-dc3c2a04c275', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 16:00:52', '2023-01-25 16:00:52'),
('480acdc8-d0e8-417f-9367-aaa596762708', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:04:58', '2023-01-12 16:04:58'),
('49686d21-5b1d-462a-af3f-4e12f5ab8119', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 10:44:20', '2023-01-25 10:44:20'),
('4aa694e8-2ae4-4842-80d2-0718c51346e9', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 13:35:53', '2023-01-25 13:35:53'),
('4b83e991-78d5-4299-af3d-99fc1ec75017', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:26:06', '2023-01-25 13:26:06'),
('4bd36679-320a-4d1a-96e2-446bf05a7dc8', '', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang  sedang dikerjakan', '2023-01-27 09:00:46', '2023-01-27 09:00:46'),
('4dfdfed5-45b9-4477-a7bc-630076ae1188', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 11:43:10', '2023-01-12 11:43:10'),
('4ec352c1-bf93-40d2-bb4c-1b062bc043a2', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-27 09:04:00', '2023-01-27 09:04:00'),
('4f9d3908-24fb-4cbf-a1d6-78574e63f55a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-27 08:52:50', '2023-01-27 08:52:50'),
('53467285-d1e4-4283-a3f9-481ae82727d1', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:01:15', '2023-01-25 11:01:15'),
('56292f97-d2d6-4d3f-9505-b00653a685ea', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 13:25:50', '2023-01-25 13:25:50'),
('567aa2bc-8713-4bde-be8d-3e5e0f6bdb2c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 14:22:23', '2023-01-25 14:22:23'),
('57de699d-d172-411d-a007-b2d7a83bfabf', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:27:20', '2023-01-25 11:27:20'),
('581ecef9-ac21-4e89-9bdf-3c3e259dd54a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:33:20', '2023-01-25 11:33:20'),
('592223b5-9e34-4bb4-b6b7-576ac6175869', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 11:32:01', '2023-01-25 11:32:01'),
('59db75d2-1043-42c5-b75c-8658ca9c2266', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 13:39:37', '2023-01-25 13:39:37'),
('5a6d3d47-a545-40be-9634-0799197a1f9f', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 13:33:04', '2023-01-25 13:33:04'),
('5bd52749-c957-4ce0-955a-66c68b5879a7', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 16:41:39', '2023-01-25 16:41:39'),
('5c3108d6-a921-4967-b440-125be9efc63f', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:13:47', '2023-01-12 16:13:47'),
('5d496842-80e9-457f-8a54-30b6c81c4556', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:40:55', '2023-01-25 11:40:55'),
('5deb9dcb-0c75-4bd4-802c-c76436a4df82', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 10:31:32', '2023-01-26 10:31:32'),
('5e734699-8680-4cf8-ac31-2fd1b8b8cbab', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 10:21:53', '2023-01-26 10:21:53'),
('5e83ff75-f504-4c62-85f9-c67b0bf61c8c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 09:24:54', '2023-01-26 09:24:54'),
('5fd2f157-58be-4a45-b4ba-0616bccbd2ea', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:16:49', '2023-01-12 16:16:49'),
('61fbd77b-5272-4b55-9e7b-7cda1afa9c7c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 09:31:23', '2023-01-26 09:31:23'),
('62d653f7-6f01-4500-a1ce-ebf18b6bf573', '', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang  telah diterima dan akan segera diproses', '2023-01-27 08:55:57', '2023-01-27 08:55:57'),
('62d880f7-d15c-437b-8aa5-f132e8d44b63', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 09:30:55', '2023-01-26 09:30:55'),
('6409662a-5f1f-4abf-bf5d-35f2a9e94362', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:20:00', '2023-01-25 13:20:00'),
('64dc1432-3f2c-416b-bf68-4b6f5eb1c7e8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 10:21:47', '2023-01-26 10:21:47'),
('6522cdd3-af59-4e33-8a62-f7f8dbf9612e', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 15:03:48', '2023-01-25 15:03:48'),
('668d0bd7-752a-43c8-a8b0-51b76f212be8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-27 09:11:20', '2023-01-27 09:11:20'),
('6863aaf9-e049-4296-97a9-4ac84d4afb32', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu 202301/00001telah selesai dikerjakan', '2023-01-27 09:04:20', '2023-01-27 09:04:20'),
('68734551-3aa8-4c97-8f7d-2aeb4f1148d5', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'COMMENT', 'AKUN TEST DEVELOPER Menanggapi Postinganmu', 'test', '2023-01-12 15:30:56', '2023-01-12 15:30:56'),
('68ef4c40-015b-47ee-ac8b-85fd41ed14b2', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:21:12', '2023-01-25 13:21:12'),
('6930c47f-fe41-4767-9d13-87a5cc5c7654', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 15:30:29', '2023-01-12 15:30:29'),
('698aaaf0-8bd9-4103-9e1c-bee9aa2f51cc', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-27 09:03:28', '2023-01-27 09:03:28'),
('6aed5edb-f30a-4618-9244-19a8ab8faf29', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 15:26:51', '2023-01-25 15:26:51'),
('6b34e2df-913c-41c9-a00c-0743612e2d89', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 10:59:06', '2023-01-25 10:59:06'),
('6bf55438-4242-4b22-b2ce-73b0d5d2163a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 13:36:16', '2023-01-25 13:36:16'),
('6cc610b6-06fb-425d-9594-63d392c6498e', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:09:45', '2023-01-25 11:09:45'),
('6f95db10-a6b4-40f3-8cdc-4d64b8f80760', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 16:41:10', '2023-01-25 16:41:10'),
('71358576-c0b1-440c-b788-374acaa6d4a3', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu 202301/00001telah selesai dikerjakan', '2023-01-26 16:06:39', '2023-01-26 16:06:39'),
('71622aa6-4638-4808-b585-7e59587ec2e8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 14:11:52', '2023-01-25 14:11:52'),
('7637cd6c-578d-4a7f-93b6-7e258d1c89cd', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:25:37', '2023-01-25 11:25:37'),
('78ca9166-077d-4cea-9b33-d62f5d4c07f9', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 11:03:58', '2023-01-25 11:03:58'),
('7ab89c02-aa14-4401-ae79-f32866803d09', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 15:01:38', '2023-01-25 15:01:38'),
('7b202af4-ab95-44cd-95d5-0a72959a8dd4', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 16:01:55', '2023-01-25 16:01:55'),
('7b722fac-772a-4660-aa8e-9c3b448d3c34', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:40:55', '2023-01-25 11:40:55'),
('7c7e3440-23e4-4d1b-a079-a8259371a70b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 14:07:10', '2023-01-25 14:07:10'),
('7d6a3423-d93a-44ed-b6c6-da10d6dfdb9b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 14:22:51', '2023-01-25 14:22:51'),
('7efbcc1f-7f8d-42be-9170-576597dd8bac', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:00:34', '2023-01-25 11:00:34'),
('7f22c710-3b95-476f-92c9-a508f542f49b', '', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang  telah diterima dan akan segera diproses', '2023-01-27 09:02:02', '2023-01-27 09:02:02'),
('7f8db3e4-8845-4610-99c7-0a52db88377a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-27 09:04:07', '2023-01-27 09:04:07'),
('800661a1-2e3e-46ad-b6f4-de2de4558730', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 10:48:50', '2023-01-25 10:48:50'),
('8074300f-5963-48fa-8174-ae4763cbc715', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 10:30:48', '2023-01-26 10:30:48'),
('81b52f28-f97e-4cd8-8aa0-5dcd1485d11c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:34:54', '2023-01-25 13:34:54'),
('854c210f-b8fd-4640-a1b2-907394430871', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-27 09:13:35', '2023-01-27 09:13:35'),
('856c41ec-ad8a-4a18-8fbd-c94dd57c8559', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-27 08:52:50', '2023-01-27 08:52:50'),
('863476c1-3b62-4b69-ac84-3daee217f80a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:41:43', '2023-01-25 13:41:43'),
('8851d219-32cf-4f47-baf2-c37696709caa', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu 202301/00001telah selesai dikerjakan', '2023-01-26 09:39:33', '2023-01-26 09:39:33'),
('892118e4-fa34-405d-a7c4-8c42a66bd1af', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-27 09:10:41', '2023-01-27 09:10:41'),
('89d59d2c-1caa-49c3-a007-aa315138a2be', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:06:01', '2023-01-12 16:06:01'),
('8b792a54-3f3e-4b64-b3e4-cf3528e2c8ad', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 10:41:48', '2023-01-25 10:41:48'),
('8c9e584a-651c-46fd-8f17-df7a4557b2fe', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 15:00:57', '2023-01-25 15:00:57'),
('8f528b31-6817-4afd-ab59-a1ce8a6d27eb', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 15:04:35', '2023-01-25 15:04:35'),
('8fdb64be-70bc-4a59-8e57-4acb79d73cbe', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 09:30:45', '2023-01-26 09:30:45'),
('91c17099-a952-4d08-a661-8f9f9cf975ae', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 14:15:05', '2023-01-25 14:15:05'),
('93aff67b-10b6-42d9-a1ba-277e8623bf46', '', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang  telah diterima dan akan segera diproses', '2023-01-27 08:59:07', '2023-01-27 08:59:07'),
('93c0794d-d81b-45c2-8b27-8a40f50d68c4', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 11:36:12', '2023-01-26 11:36:12'),
('94ef990c-411f-452d-8547-63d786c9a214', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:38:27', '2023-01-25 11:38:27'),
('95d38c61-6c84-4458-a787-557765082254', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'bb396d30-4f7c-4b56-9f9f-9459c8811023', 'LIKE STATUS', 'LAURA MELDY Menyukai Postinganmu', 'LAURA MELDY Menyukai Postinganmu', '2023-01-12 09:22:58', '2023-01-12 09:22:58'),
('963d6240-7fb0-407b-8534-0e5a373339f4', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:12:17', '2023-01-12 16:12:17'),
('9842dbec-ab8a-4b2f-b469-b72364ab22e5', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:39:10', '2023-01-25 11:39:10'),
('98a153f9-8173-4c64-82b2-69e68e5c800c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:10:25', '2023-01-12 16:10:25'),
('9acc795b-a293-4899-bea2-7c728e721d57', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:19:35', '2023-01-25 13:19:35'),
('9b5203e0-0fb3-4390-9d95-eb54d08c22ca', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 10:34:45', '2023-01-26 10:34:45'),
('9bc5944a-a827-4838-bd7b-7af6d700e787', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 13:51:42', '2023-01-25 13:51:42'),
('9efcd0e4-c57b-423f-ba9c-25708819bfdc', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:16:51', '2023-01-12 16:16:51'),
('a0c2f4e4-8182-48df-97dc-f139d956b576', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 14:04:49', '2023-01-25 14:04:49'),
('a0c346ca-e42d-4d2a-b14d-b53f1a04ced7', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-27 09:05:08', '2023-01-27 09:05:08'),
('a243acd3-024c-478d-92e4-f0ec6ad6b97c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 10:35:32', '2023-01-26 10:35:32'),
('a28ed42b-9827-4053-9ad2-13200114c9a9', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:23:43', '2023-01-25 11:23:43'),
('a2a328e4-16f5-40c6-b12f-47bdc00a7131', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 11:19:42', '2023-01-25 11:19:42'),
('a3491c9b-cdad-411a-be4e-51c69833bf80', '', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang  telah diterima dan akan segera diproses', '2023-01-27 09:04:58', '2023-01-27 09:04:58'),
('a413c136-ec5a-49fb-a56c-0e0273801849', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 10:57:53', '2023-01-25 10:57:53'),
('a467e446-15a5-4999-8580-26eb72bcf0df', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 15:30:45', '2023-01-12 15:30:45'),
('a4cc7ac0-42cb-4491-a914-1a2e30479f1b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 15:37:25', '2023-01-12 15:37:25'),
('a6a309c7-d9ff-4b1a-a297-316728e7de45', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 11:27:11', '2023-01-25 11:27:11'),
('a7cfca9e-c6b7-4b4c-a3bb-e02dc74974c7', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 11:24:30', '2023-01-25 11:24:30'),
('a7d8da7a-5d61-4f85-86b6-4d1e4ba2bff7', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 13:38:57', '2023-01-25 13:38:57'),
('a810e91d-f0b6-45b2-a2e6-852317e3ed39', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:00:59', '2023-01-25 11:00:59'),
('a9a2cfdc-6614-434f-bd13-6aaa11062116', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:39:42', '2023-01-25 13:39:42'),
('aa19e88f-3c0c-4273-a4e9-1465f6fe78e2', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:40:31', '2023-01-25 11:40:31'),
('aa31ba02-5531-4055-9af1-15754f2a2dd1', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 14:08:44', '2023-01-25 14:08:44'),
('aa4c8395-b1d9-4d8b-a54e-5f060d90bda4', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:53:51', '2023-01-25 13:53:51'),
('ab9337e6-bcc6-4eaa-bc25-b0f1d8c9f93a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:44:07', '2023-01-25 11:44:07'),
('abcbd072-1add-44a3-80e4-83be3584775f', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 09:09:31', '2023-01-26 09:09:31'),
('ac7545dc-4f28-4a49-9b65-a31ae5d7eb84', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 09:50:09', '2023-01-26 09:50:09'),
('ac7cc5f2-bab6-47d2-9b0d-d196468edbab', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 16:41:27', '2023-01-25 16:41:27'),
('ac83c8f3-dff7-4386-8160-bdca9b381269', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-26 10:09:30', '2023-01-26 10:09:30'),
('adfcfab0-2e40-4502-9816-b012419a153b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 10:44:50', '2023-01-25 10:44:50'),
('ae927cd5-7910-459a-9a2b-b2582c6072c6', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 10:41:37', '2023-01-25 10:41:37'),
('b0a6cd00-8e7f-42fb-90bc-6da20f6df09c', '', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang  sedang dikerjakan', '2023-01-27 09:02:31', '2023-01-27 09:02:31'),
('b0aea616-3753-4ef1-af44-e488713df44c', '', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang  telah diterima dan akan segera diproses', '2023-01-27 08:56:26', '2023-01-27 08:56:26'),
('b1de9d31-d028-4b22-b51e-c7299f04bf01', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 15:37:52', '2023-01-12 15:37:52'),
('b2e4f162-2968-40c8-aead-a1fce52fa859', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 16:06:24', '2023-01-26 16:06:24'),
('b36baee6-2b86-4f2e-b883-5129a67ac7b7', '', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang  sedang dikerjakan', '2023-01-27 09:03:15', '2023-01-27 09:03:15'),
('b4bd1ba3-39cf-4674-af63-c4f76172997d', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:01:55', '2023-01-25 11:01:55'),
('b5324803-280a-4b4b-a1c5-5af1e81e90d2', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 14:22:17', '2023-01-25 14:22:17'),
('b5c15afe-1cba-4af4-be17-3b0140e44e09', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-27 09:12:51', '2023-01-27 09:12:51'),
('b83fc572-f41c-44b4-ac01-afc62784d5fc', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-27 11:01:36', '2023-01-27 11:01:36'),
('b928102f-0517-4d13-9d87-7113fc30b3fe', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:01:15', '2023-01-25 11:01:15');
INSERT INTO `tb_notification` (`id_notification`, `id_user`, `id_appropriate`, `type`, `title`, `content`, `create_at`, `update_at`) VALUES
('bd34073e-3f6c-4f3f-ba8c-3975f3b2891e', '', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang  telah diterima dan akan segera diproses', '2023-01-27 08:58:47', '2023-01-27 08:58:47'),
('be68272c-5d94-4d8a-baee-20d3e91bf7b4', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:15:36', '2023-01-25 13:15:36'),
('bf10afa4-afae-47af-a889-bdc3a8d9f24e', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 10:29:22', '2023-01-26 10:29:22'),
('c409a656-3c86-444d-9fe3-4e48df1ebf22', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 10:35:51', '2023-01-26 10:35:51'),
('c49c8749-cc76-4d63-8f2b-b4552a27229e', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 11:38:55', '2023-01-25 11:38:55'),
('c4d7544c-0453-42aa-b4ec-e3b38ea814c4', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 13:38:23', '2023-01-25 13:38:23'),
('c5ecabb4-8cc0-42a7-809d-fbaf0d85416b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:27:46', '2023-01-25 11:27:46'),
('c8470d32-7286-4a07-9e1a-b6767e6c0c1c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:23:43', '2023-01-25 11:23:43'),
('cbb6cd65-b5e7-4fba-ac30-d4bbd25dcb9f', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 13:03:02', '2023-01-25 13:03:02'),
('cbfad6be-b44a-4c53-b153-bc3c0afb3e41', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 16:01:15', '2023-01-25 16:01:15'),
('ccee5574-937c-4cbe-a721-402653d5ac22', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:18:47', '2023-01-12 16:18:47'),
('cd482612-fdf9-41f5-9bc5-7277f02eaf66', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 10:44:50', '2023-01-25 10:44:50'),
('ceb739dd-0ef8-4582-9aac-e88f98ff71ad', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 11:11:06', '2023-01-25 11:11:06'),
('cfd50ea7-7cc4-41f5-87e6-b632c4e4b754', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-27 11:02:39', '2023-01-27 11:02:39'),
('d06add3a-3805-4ddd-b87f-87a7cd3b2f90', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 09:09:45', '2023-01-26 09:09:45'),
('d19ad62b-76a8-4d51-827f-7fca78fabb9e', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 10:27:35', '2023-01-26 10:27:35'),
('d1c261fb-115a-4958-ad2f-025bd895356f', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:21:48', '2023-01-25 13:21:48'),
('d1c99483-6d38-4214-9b35-e6a886a87c97', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:33:30', '2023-01-25 11:33:30'),
('d2539033-9c4c-405e-aba4-ca171e52e030', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:17:33', '2023-01-12 16:17:33'),
('d2a75e40-3bb9-4e83-9457-88cace24d889', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 11:19:42', '2023-01-25 11:19:42'),
('d3d71071-a06e-45d5-b714-934f1742752c', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 09:24:22', '2023-01-26 09:24:22'),
('d42c8aa9-a19d-47fb-b2f6-9e47f3455c97', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:01:55', '2023-01-25 11:01:55'),
('d69705e4-2c3e-4d76-bb9d-9da4a427519e', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu 202301/00001telah selesai dikerjakan', '2023-01-27 09:15:16', '2023-01-27 09:15:16'),
('d6bd98c1-e171-4816-bf81-66a81b1a960d', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:12:05', '2023-01-25 13:12:05'),
('d7809b70-ab76-4ede-8af1-55bafe88da66', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 11:31:37', '2023-01-25 11:31:37'),
('d83a60d1-d2b6-40d1-a89b-95f0926862f1', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 11:07:56', '2023-01-25 11:07:56'),
('d8c78cbe-61af-4e32-b2e7-f44c561e9404', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:20:37', '2023-01-12 16:20:37'),
('d9a17169-b507-4147-8102-60b7bcda0461', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu 202301/00001telah selesai dikerjakan', '2023-01-27 09:15:05', '2023-01-27 09:15:05'),
('d9ed999c-b3c8-4d11-a98d-bd45c1e6ce3e', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 14:23:18', '2023-01-25 14:23:18'),
('dab0a9ec-e0bc-414f-ae75-a72551407441', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 10:58:59', '2023-01-25 10:58:59'),
('db496e3d-8c4a-450a-b4c1-7736d9e061dc', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:35:46', '2023-01-25 13:35:46'),
('dc1381b6-116a-4f9f-8f00-a46dc98a329e', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 13:11:59', '2023-01-25 13:11:59'),
('dceab4f9-f2ea-4034-86af-0cd4c688dbf2', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:20:31', '2023-01-12 16:20:31'),
('df10ecbc-0a7c-4c86-9cbd-9f11ac0ca020', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 13:38:08', '2023-01-25 13:38:08'),
('e13cc776-c024-4410-bf6d-86ade0ebf7d3', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:21:20', '2023-01-25 13:21:20'),
('e2b29a00-ae7f-45f7-b903-a2bca9a99f2b', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-25 13:41:36', '2023-01-25 13:41:36'),
('e2cf3b8f-8c8b-49c6-8e8c-37aafbad7057', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'LIKE STATUS', 'AKUN TEST DEVELOPER Menyukai Postinganmu', 'AKUN TEST DEVELOPER Menyukai Postinganmu', '2023-01-12 16:10:17', '2023-01-12 16:10:17'),
('e4802079-4fc0-4c68-af03-89f601fcffbc', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:35:27', '2023-01-25 11:35:27'),
('e4b0ef97-c2d7-4622-8759-62e283acd0a2', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 10:30:29', '2023-01-26 10:30:29'),
('e6dc2395-6688-4d55-929d-17995af8f82e', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 13:35:01', '2023-01-25 13:35:01'),
('ea6c83b2-7178-479f-b2ed-bf46843c51b9', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 13:39:08', '2023-01-25 13:39:08'),
('eaad43c0-c1f0-4ede-b349-df6c592a4f6a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:09:45', '2023-01-25 11:09:45'),
('eb584bf9-1656-470f-8e51-cdf522424c53', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 13:38:16', '2023-01-25 13:38:16'),
('ecd3d252-1d15-49cd-b94b-bdf01b1b10cb', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu 202301/00001telah selesai dikerjakan', '2023-01-26 09:37:48', '2023-01-26 09:37:48'),
('edf63583-2cc5-4507-accd-156f66d08862', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-26 10:27:35', '2023-01-26 10:27:35'),
('f45139ff-8651-4a67-8628-37bfca0a77a9', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-26 09:29:24', '2023-01-26 09:29:24'),
('f5c98583-6061-43f5-9867-ee7d6014bcb8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-27 08:57:05', '2023-01-27 08:57:05'),
('f68ef6df-5668-420f-a536-a97fd241e3e1', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-27 11:02:25', '2023-01-27 11:02:25'),
('f8a7a730-b9f8-40e2-831b-f265d2440864', '', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang  telah diterima dan akan segera diproses', '2023-01-27 08:57:47', '2023-01-27 08:57:47'),
('f960a7cd-0361-4c88-85d7-f25ce50de9ac', '', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang  telah diterima dan akan segera diproses', '2023-01-27 08:57:21', '2023-01-27 08:57:21'),
('f990ba52-a685-4cc6-b05a-93f348913ee4', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-27 09:13:11', '2023-01-27 09:13:11'),
('fa6b74e1-845d-4294-8dd9-b973bb50caa0', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT COMPLETE', 'Cordinator menanggapi laporan', 'Laporanmu tentang Perawatan tamantelah selesai dikerjakan', '2023-01-25 13:41:49', '2023-01-25 13:41:49'),
('fa6c5bf0-78a6-4bed-acde-38a055efa4fa', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'REPORT ACCEPT', 'Cordinator menanggapi laporanmu', 'Laporan mu tentang Perawatan taman telah diterima dan akan segera diproses', '2023-01-27 08:52:22', '2023-01-27 08:52:22'),
('fe5731f1-bce0-44cf-8122-95881fcba07e', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 10:58:49', '2023-01-25 10:58:49'),
('ff0d0ede-ba52-4ba0-90ef-9406238c9bba', '26db0db8-af5e-44ea-8481-c8547f18e7b8', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'REPORT PROCESS', 'Cordinator menanggapi laporanmu', 'Laporanmu tentang Perawatan taman sedang dikerjakan', '2023-01-25 11:20:35', '2023-01-25 11:20:35');

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
  `id_worker` varchar(255) NOT NULL,
  `status_process` varchar(150) NOT NULL,
  `current_time_process` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_process_work`
--

CREATE TABLE `tb_process_work` (
  `id_process_work` int(11) NOT NULL,
  `id_report` int(11) NOT NULL,
  `id_worker` varchar(255) NOT NULL,
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
(39, '26db0db8-af5e-44ea-8481-c8547f18e7b8', '202301/00001', '', '', '2023-01-26', '06:10:00', 'Perawatan taman', 1, 'imagereport/2e8f220087482797042e3e539e49f9d7811cce6f.jpg', 'Menunggu', 0, '', '0000-00-00 00:00:00', 1, '-6.1877329', '106.6935154', 'gondrong griya utama 1rt 002 rw002, Gondrong, Kec. Cipondoh, Kota Tangerang, Banten 15146, Indonesia', 'Anonim', '2023-01-26 06:00:00');

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
('26db0db8-af5e-44ea-8481-c8547f18e7b8', 'ff5d78eb-dced-46b9-8230-0df6de9a9a73', 'BGM/RW/TEST', 'feriwnarta26@gmail.com', '085714342528', 'AKUN TEST DEVELOPER', '4e30c951ea7c956c126389d6d911f3f8', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('a1e5a7d6-5c63-4bd4-a36f-d9c79e74f907', '5e13d8e1-9ee5-4b3b-81cd-9f0fc065a1b1', 'iskandar', 'iskandar@gmail.com', '088888888888', 'iskandar', '680d805d01aa9cb3c5490ef176d4934a', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('a7e58e83-57ac-471d-a169-2999c8af2153', 'ac309780-cd2b-4b15-9478-ec8ae48ce593', 'jokojoko', 'joko@gmail.com', '088888888888', 'joko', '680d805d01aa9cb3c5490ef176d4934a', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('c0de3420-be0d-4ae8-94e1-b2e3cbeace55', 'd79915ac-449f-4013-9dc5-251aef168da4', 'ptham', 'ptham@gmail.com', '08888888888', 'ptham', '680d805d01aa9cb3c5490ef176d4934a', 'imageuser/default_profile/blank_profile_picture.jpg', 0),
('f71d8564-7899-445d-b317-0353bb35f39e', '2fea85f4-aa31-4727-8cf1-ad1245505f7a', 'danumaraden', 'danumaraden@gmail.com', '08888888888888888', 'Danu Maraden', 'bc3817aa8704cb51d4aeccdc38ab152b', 'imageuser/default_profile/blank_profile_picture.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_fcm_token`
--

CREATE TABLE `tb_user_fcm_token` (
  `id_fcm` varchar(255) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `update_at` datetime NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_fcm_token`
--

INSERT INTO `tb_user_fcm_token` (`id_fcm`, `id_user`, `token`, `update_at`, `create_at`) VALUES
('03c6a593-40fb-42d7-bf06-5b85bf53dbcf', 'a7e58e83-57ac-471d-a169-2999c8af2153', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-27 13:33:10', '2023-01-27 13:32:37'),
('321b10d5-a1eb-4563-8fe8-676e07f2aa0a', '26db0db8-af5e-44ea-8481-c8547f18e7b8', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-27 13:41:27', '2023-01-25 16:40:27'),
('537e97a3-4c1e-4e7b-ad52-077f4cf5e613', 'bb396d30-4f7c-4b56-9f9f-9459c8811023', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '0000-00-00 00:00:00', '2023-01-27 11:35:32'),
('5e185f2a-f1d2-47fc-8595-eacb292c387c', 'a3f9be31-8c16-4a7e-8854-4dc2ed91a261', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '0000-00-00 00:00:00', '2023-01-27 11:20:19'),
('5fb0c321-b6bb-46be-81ed-270b257a6300', 'f71d8564-7899-445d-b317-0353bb35f39e', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '0000-00-00 00:00:00', '2023-01-27 13:34:12'),
('7bb59509-18a0-4013-a60b-6d3c678f5f7a', '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-27 11:24:15', '2023-01-26 16:38:48'),
('7d950f46-d782-425d-bd10-e9737f629b57', 'c6b5673e-f727-4940-864a-d64b0ea364a5', 'asdasd2sadw123', '2023-01-25 16:59:06', '2023-01-25 16:58:07'),
('a55d1909-1e6e-484d-bc71-3bfa835625a0', '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-27 11:22:58', '2023-01-26 13:09:23'),
('b46e02ea-1bb6-487d-85a8-af339e9ccc0e', '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '2023-01-27 11:41:16', '2023-01-25 16:25:48'),
('d62e9284-90c7-4d36-ab3f-4f064949639e', 'c0de3420-be0d-4ae8-94e1-b2e3cbeace55', 'cjggnFaCTXCTOhBCmMUStA:APA91bF-cjQaoA7-UH-xZBELz20ZkDlwcGwy-EHTsHt_SHQV0KqyQAPkCA_1XkxAfTnNN-vDz72dA6yQtIx7R31X_UaNmJyZCmIV2LhJvXJg30pavvEcIQ8JjtXmcoF_kcAR_Mmoy5r9', '2023-01-27 14:07:25', '2023-01-27 13:31:48'),
('e77413a8-1936-4f35-8f84-2366a8a6c99d', 'e4bc16bf-f796-4782-99e5-fe327f6b913f', 'eLHu1JZsTf2fi4yTpWgFJs:APA91bGgaYIZRRG55wreb7UDv_diLIl7X_HjT6CcPfG6bQj8Acjf4o2-D17ifgzb485N9bjjb55XL6IpcsKyiP8NMOJKZUGzDi8vKPBAl8R489YuUj5-oJlLYpVxnstYEOIXYKa5Tris', '0000-00-00 00:00:00', '2023-01-25 16:55:13');

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
(4, '21827ecc-16a5-4790-a7c4-ec80386fd02b', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-20 16:15:28'),
(5, '32175642-7cf2-41ac-b2be-1bb056bfa1bb', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-25 16:11:08'),
(6, 'e4bc16bf-f796-4782-99e5-fe327f6b913f', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-25 16:55:13'),
(7, 'c6b5673e-f727-4940-864a-d64b0ea364a5', '123123', '123asdasd', '2023-01-25 16:58:07'),
(8, '1787ed51-f0c0-4b27-911c-1afef56f9cbf', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-26 13:09:23'),
(9, '271b37a3-2bcb-4f84-ba99-bb084ee635a5', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-26 16:38:48'),
(10, 'c0de3420-be0d-4ae8-94e1-b2e3cbeace55', 'MIX', 'MXB48T', '2023-01-27 13:31:48'),
(11, 'a7e58e83-57ac-471d-a169-2999c8af2153', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-27 13:32:37'),
(12, 'f71d8564-7899-445d-b317-0353bb35f39e', 'sdk_gphone64_arm64', 'SE1A.220203.002.A1', '2023-01-27 13:34:12');

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
-- Indexes for table `tb_manager_contractor`
--
ALTER TABLE `tb_manager_contractor`
  ADD PRIMARY KEY (`id_manager_contractor`);

--
-- Indexes for table `tb_manager_contractor_job`
--
ALTER TABLE `tb_manager_contractor_job`
  ADD PRIMARY KEY (`id_manager_contractor_job`);

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
-- Indexes for table `tb_process_work`
--
ALTER TABLE `tb_process_work`
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
-- AUTO_INCREMENT for table `tb_process_work`
--
ALTER TABLE `tb_process_work`
  MODIFY `id_process_work` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_report`
--
ALTER TABLE `tb_report`
  MODIFY `id_report` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
-- AUTO_INCREMENT for table `tb_user_login_auth`
--
ALTER TABLE `tb_user_login_auth`
  MODIFY `id_login_auth` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
