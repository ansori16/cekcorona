-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2024 at 05:17 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cekcorona`
--

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `id_gejala` int(11) NOT NULL,
  `gejala` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id_gejala`, `gejala`) VALUES
(1, 'Demam atau Merasa Panas/ Menggigil'),
(2, 'Batuk Berdahak'),
(3, 'Sakit Tenggorokan'),
(4, 'Pilek'),
(5, 'Nyeri Dada, otot atau tubuh'),
(6, 'Sakit Kepala'),
(7, 'Kelelahan'),
(8, 'Batuk Kering'),
(9, 'Kehilangan rasa atau bau (anosmia)'),
(10, 'Hidung Tersumbat'),
(11, 'Sesak Nafas');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id_penyakit` int(11) NOT NULL,
  `penyakit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `penyakit`) VALUES
(1, 'Covid-19'),
(2, 'Covid-19 Varian Alpha'),
(3, 'Covid-19 Varian Beta'),
(4, 'Covid-19 Varian Gamma'),
(5, 'Covid-19 Varian Delta'),
(6, 'Covid-19 Varian Omicron');

-- --------------------------------------------------------

--
-- Table structure for table `relasi`
--

CREATE TABLE `relasi` (
  `id_relasi` int(11) NOT NULL,
  `id_gejala` int(11) DEFAULT NULL,
  `id_penyakit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `relasi`
--

INSERT INTO `relasi` (`id_relasi`, `id_gejala`, `id_penyakit`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 6),
(5, 5, 2),
(6, 6, 1),
(7, 7, 1),
(8, 8, 6),
(9, 9, 2),
(10, 10, 6),
(11, 11, 5),
(12, 12, 2),
(13, 13, 3),
(14, 14, 3),
(15, 15, 3),
(16, 16, 3),
(17, 17, 3),
(18, 18, 4),
(19, 19, 4),
(20, 20, 5),
(21, 21, 5),
(22, 22, 5),
(23, 23, 6),
(24, 24, 6),
(25, 25, 6),
(26, 26, 6),
(27, 27, 6),
(37, 44, 1),
(38, 45, 4);

-- --------------------------------------------------------

--
-- Table structure for table `solusi`
--

CREATE TABLE `solusi` (
  `id_solusi` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `solusi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `solusi`
--

INSERT INTO `solusi` (`id_solusi`, `id_penyakit`, `solusi`) VALUES
(30, 1, 'S1 - Minum obat pereda sakit atau antibiotik, hindari kontak dengan orang yang sakit dan rajin cuci '),
(31, 1, 'S2 - Istirahat yang cukup dan minum obat pereda nyeri / paracetamol, hindari angkat beban yang berat'),
(32, 1, 'S3 - Istirahat yang cukup dan minum obat pereda sakit kepala / paracetamol'),
(33, 1, 'S4 - Istirahat yang cukup, konsumsi vitamin C dan perbanyak makanan Bergizi'),
(34, 1, 'S10 - Istirahat yang cukup, minum air putih yg banyak dan konsumsi obat penurun panas'),
(35, 1, 'S11 - Minum air hangat, konsumsi obat pereda batuk yang mengandung Antihistamin, Diphenhydramine, da'),
(36, 1, 'S12 - Konsultasikan ke Dokter'),
(37, 1, 'S13 - Isolasi mandiri selama 14 hari'),
(38, 2, 'S1 - Minum obat pereda sakit atau antibiotik, hindari kontak dengan orang yang sakit dan rajin cuci '),
(39, 2, 'S2 - Istirahat yang cukup dan minum obat pereda nyeri / paracetamol, hindari angkat beban yang berat'),
(40, 2, 'S11 - Minum air hangat, konsumsi obat pereda batuk yang mengandung Antihistamin, Diphenhydramine, da'),
(41, 2, 'S13 - Isolasi mandiri selama 14 hari'),
(42, 3, 'S1 - Minum obat pereda sakit atau antibiotik, hindari kontak dengan orang yang sakit dan rajin cuci '),
(43, 3, 'S2 - Istirahat yang cukup dan minum obat pereda nyeri / paracetamol, hindari angkat beban yang berat'),
(44, 3, 'S10 - Istirahat yang cukup, minum air putih yg banyak dan konsumsi obat penurun panas'),
(45, 3, 'S11 - Minum air hangat, konsumsi obat pereda batuk yang mengandung Antihistamin, Diphenhydramine, da'),
(46, 3, 'S13 - Isolasi mandiri selama 14 hari'),
(47, 4, 'S1 - Minum obat pereda sakit atau antibiotik, hindari kontak dengan orang yang sakit dan rajin cuci '),
(48, 4, 'S3 - Istirahat yang cukup dan minum obat pereda sakit kepala / paracetamol'),
(49, 4, 'S4 - Istirahat yang cukup, konsumsi vitamin C dan perbanyak makanan Bergizi'),
(50, 4, 'S5 - Istirahat yang cukup, minum air putih yg banyak dan konsumsi obat penurun panas'),
(51, 4, 'S9 - Meningkatkan daya tahan tubuh dengan menerapkan pola hidup bersih dan sehat (PHBS) seperti kons'),
(52, 4, 'S11 - Minum air hangat, konsumsi obat pereda batuk yang mengandung Antihistamin, Diphenhydramine, da'),
(53, 4, 'S12 - Konsultasikan ke Dokter'),
(54, 4, 'S13 - Isolasi mandiri selama 14 hari'),
(55, 5, 'S2 - Istirahat yang cukup dan minum obat pereda nyeri / paracetamol, hindari angkat beban yang berat'),
(56, 5, 'S3 - Istirahat yang cukup dan minum obat pereda sakit kepala / paracetamol'),
(57, 5, 'S4 - Istirahat yang cukup, konsumsi vitamin C dan perbanyak makanan Bergizi'),
(58, 5, 'S6 - Gunakan Masker, Cuci tangan pakai sabun dan air mengalir selama 40-60 detik atau menggunakan ca'),
(59, 5, 'S7 - Menjaga jarak minimal 1 meter dengan orang lain untuk menghindari terkena droplet dari orang ya'),
(60, 5, 'S11 - Minum air hangat, konsumsi obat pereda batuk yang mengandung Antihistamin, Diphenhydramine, da'),
(61, 5, 'S12 - Konsultasikan ke Dokter'),
(62, 5, 'S13 - Isolasi mandiri selama 14 hari'),
(63, 6, 'S3 - Istirahat yang cukup dan minum obat pereda sakit kepala / paracetamol'),
(64, 6, 'S6 - Gunakan Masker, Cuci tangan pakai sabun dan air mengalir selama 40-60 detik atau menggunakan ca'),
(65, 6, 'S8 - Membatasi diri terhadap interaksi / kontak dengan orang lain yang tidak diketahui status keseha'),
(66, 6, 'S9 - Meningkatkan daya tahan tubuh dengan menerapkan pola hidup bersih dan sehat (PHBS) seperti kons'),
(67, 6, 'S10 - Istirahat yang cukup, minum air putih yg banyak dan konsumsi obat penurun panas'),
(68, 6, 'S11 - Minum air hangat, konsumsi obat pereda batuk yang mengandung Antihistamin, Diphenhydramine, da'),
(69, 6, 'S12 - Konsultasikan ke Dokter'),
(70, 6, 'S13 - Isolasi mandiri selama 14 hari');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `role`, `nama`, `email`, `alamat`, `tgl_lahir`, `password`) VALUES
(2, 0, 'admin', 'admin@gmail.com', 'Tabanan', '2020-04-17', '$2y$10$ASS50col3niwOOku4Zkky.HpmF18hiPWL9pi2DnE8CS7jTDSD4ufe'),
(4, 2, 'Dokter Budi', 'budi@gmail.com', 'Badung', '2020-04-09', '$2y$10$n2nS/Rg7Zvjdv.q1mrv7TOJYrzf18LVQQzsWuDWqPf5Ieos/OIWiG'),
(6, 2, 'Dokter Jaya', 'jaya@gmail.com', 'Denpasar', '2020-05-12', '$2y$10$Hb0Q.SpDMZ1m34GlQSnB4.GkKM9wBRwWsrHUIFwn4sV6M7JGNPIV.'),
(7, 2, 'Dokter Sally', 'sally@gmail.com', 'Kuta', '2020-05-28', '$2y$10$xP98m86lQdD8oE/dpTyvh.7.4oAsbcj0.H5Ekw0UhGFCoyaqc49W2'),
(11, 1, 'ansori', 'ansorijrl55@gmail.com', 'Cilegon', '2024-06-29', '$2y$10$7vgpLBbPsCf4T9tttYkrmups9K4LD.LD0x7jOPRI21DzikuafUmHG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id_gejala`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id_penyakit`);

--
-- Indexes for table `relasi`
--
ALTER TABLE `relasi`
  ADD PRIMARY KEY (`id_relasi`),
  ADD KEY `id_gejala` (`id_gejala`),
  ADD KEY `id_penyakit` (`id_penyakit`);

--
-- Indexes for table `solusi`
--
ALTER TABLE `solusi`
  ADD PRIMARY KEY (`id_solusi`),
  ADD KEY `id_penyakit` (`id_penyakit`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id_penyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `relasi`
--
ALTER TABLE `relasi`
  MODIFY `id_relasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `solusi`
--
ALTER TABLE `solusi`
  MODIFY `id_solusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relasi`
--
ALTER TABLE `relasi`
  ADD CONSTRAINT `relasi_ibfk_2` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`);

--
-- Constraints for table `solusi`
--
ALTER TABLE `solusi`
  ADD CONSTRAINT `solusi_ibfk_1` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
