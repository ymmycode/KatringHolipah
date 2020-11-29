-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2020 at 04:50 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `katringholipah`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(5) NOT NULL,
  `user` varchar(30) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idAdmin`, `user`, `pass`) VALUES
(2, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `bayarcatering`
--

CREATE TABLE `bayarcatering` (
  `id` int(5) NOT NULL,
  `idPesan` int(5) NOT NULL,
  `harga` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bayarcatering`
--

INSERT INTO `bayarcatering` (`id`, `idPesan`, `harga`) VALUES
(1, 2, '1800000'),
(2, 3, '1800000'),
(4, 5, '1800000'),
(5, 6, '1800000');

-- --------------------------------------------------------

--
-- Table structure for table `bayarpaket`
--

CREATE TABLE `bayarpaket` (
  `id` int(5) NOT NULL,
  `idPesan` int(5) NOT NULL,
  `harga` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bayarpaket`
--

INSERT INTO `bayarpaket` (`id`, `idPesan`, `harga`) VALUES
(3, 4, '20000'),
(4, 5, '30000'),
(5, 6, '36000');

-- --------------------------------------------------------

--
-- Table structure for table `catering`
--

CREATE TABLE `catering` (
  `idPesan` int(5) NOT NULL,
  `tanggal` varchar(20) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `telp` varchar(30) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catering`
--

INSERT INTO `catering` (`idPesan`, `tanggal`, `nama`, `telp`, `alamat`, `detail`, `status`) VALUES
(2, '29 Agustus 2020', 'fauzi', '088873495', 'Kompleks Keuangan', 'Hidangan Menu Utama', 'full'),
(3, '29 Agustus 2020', 'Septian', '087342342234', 'Sawo 3', 'Hidangan Menu Utama', 'full'),
(5, '29 Agustus 2020', 'Aditya', '03485349', 'gg bb', 'Hidangan Menu Utama', 'Full'),
(6, '29 Agustus 2020', 'Daylami', '0743984343', 'gg bb', 'Hidangan Menu Utama', 'Full');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `idPesan` int(5) NOT NULL,
  `tanggal` varchar(20) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `telp` varchar(30) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`idPesan`, `tanggal`, `nama`, `telp`, `alamat`, `detail`, `status`) VALUES
(4, '29 Agustus 2020', 'Septian', '09886267', 'Sawo 3', 'Paket 1', 'full'),
(5, '29 Agustus 2020', 'wawan', '0898375885', 'citayam', 'Paket 3', 'full'),
(6, '30 Agustus 2020', 'Andi', '08774349981', 'Jakarta, gg bb, tegal parang', 'Paket 2', 'dp');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(5) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `telp` varchar(30) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `telp`, `alamat`) VALUES
(1, 'Akbar', '0812345688', 'Jakarta, gg bb'),
(2, 'Kurniawan', '0812738593485', 'Jakarta tegal parang'),
(4, 'Andi', '08774349981', 'Jakarta, gg bb, tegal parang');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` int(5) NOT NULL,
  `tanggal` varchar(150) DEFAULT NULL,
  `ket` varchar(150) DEFAULT NULL,
  `jumlah` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id`, `tanggal`, `ket`, `jumlah`) VALUES
(1, '30 Agustus 2020', 'Beli Telur 10KG', '50000'),
(2, '30 Agustus 2020', 'Beli sayuran', '180000'),
(3, '30 Agustus 2020', 'Beli Daging Sapi', '300000'),
(4, '30 Agustus 2020', 'Beli Sayur', '200000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `bayarcatering`
--
ALTER TABLE `bayarcatering`
  ADD PRIMARY KEY (`id`,`idPesan`) USING BTREE;

--
-- Indexes for table `bayarpaket`
--
ALTER TABLE `bayarpaket`
  ADD PRIMARY KEY (`id`,`idPesan`) USING BTREE;

--
-- Indexes for table `catering`
--
ALTER TABLE `catering`
  ADD PRIMARY KEY (`idPesan`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`idPesan`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bayarcatering`
--
ALTER TABLE `bayarcatering`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bayarpaket`
--
ALTER TABLE `bayarpaket`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `catering`
--
ALTER TABLE `catering`
  MODIFY `idPesan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `idPesan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
