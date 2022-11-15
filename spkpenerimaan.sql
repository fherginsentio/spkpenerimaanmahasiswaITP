-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Bulan Mei 2022 pada 07.44
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spkpenerimaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bobot_kriteria`
--

CREATE TABLE `bobot_kriteria` (
  `id_bobotkriteria` int(3) NOT NULL,
  `id_jenispendaftaran` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `bobot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bobot_kriteria`
--

INSERT INTO `bobot_kriteria` (`id_bobotkriteria`, `id_jenispendaftaran`, `id_kriteria`, `bobot`) VALUES
(13, 5, 7, 0.5),
(14, 5, 8, 1),
(15, 5, 9, 0.5),
(16, 5, 10, 0),
(17, 3, 7, 1),
(18, 3, 8, 0.5),
(19, 3, 9, 1),
(20, 3, 10, 0),
(21, 4, 7, 1),
(22, 4, 8, 0.25),
(23, 4, 9, 0.5),
(24, 4, 10, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` int(3) NOT NULL,
  `id_jenispendaftaran` int(3) NOT NULL,
  `id_mahasiswa` int(3) NOT NULL,
  `hasil` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `id_jenispendaftaran`, `id_mahasiswa`, `hasil`) VALUES
(4, 3, 4, 2.125),
(5, 3, 5, 2),
(6, 3, 6, 2.375),
(7, 5, 1, 1.875),
(8, 5, 2, 1.875),
(9, 5, 3, 1.75),
(10, 4, 7, 1.875),
(11, 4, 8, 1.3955),
(12, 4, 9, 2.6875),
(13, 3, 116, 1.75),
(14, 3, 117, 2.25),
(15, 3, 118, 1.75),
(16, 3, 194, 1.625),
(17, 3, 195, 1.625),
(18, 3, 196, 2.125),
(19, 3, 364, 2.25),
(20, 3, 365, 2),
(21, 3, 480, 2.25),
(22, 3, 481, 1.75),
(23, 3, 484, 2.125),
(24, 3, 370, 1.75),
(25, 3, 371, 1.875),
(26, 3, 372, 2.25),
(27, 4, 373, 1.875),
(28, 4, 374, 1.625),
(29, 4, 375, 1.75),
(30, 4, 197, 1.875),
(31, 4, 198, 1.8125),
(32, 4, 476, 1.8125),
(33, 4, 477, 1.875),
(34, 4, 482, 1.5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_pendaftaran`
--

CREATE TABLE `jenis_pendaftaran` (
  `id_jenispendaftaran` int(3) NOT NULL,
  `namapendaftaran` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_pendaftaran`
--

INSERT INTO `jenis_pendaftaran` (`id_jenispendaftaran`, `namapendaftaran`) VALUES
(3, 'Beasiswa BIDIKMISI'),
(4, 'Beasiswa Yayasan'),
(5, 'Mandiri');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(3) NOT NULL,
  `namaKriteria` varchar(30) NOT NULL,
  `sifat` enum('Benefit','Cost') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `namaKriteria`, `sifat`) VALUES
(7, 'Nilai UN', 'Benefit'),
(8, 'Nilai Tes', 'Benefit'),
(9, 'Nilai Rapor', 'Benefit'),
(10, 'Penghasilan Orangtua', 'Cost');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(10) NOT NULL,
  `namamahasiswa` varchar(100) NOT NULL,
  `jurusan` enum('Teknik Listrik D3','Teknik Mesin D3','Teknik Sipil D3','Teknik Sipil S1','Teknik Mesin S1','Teknik Elektro S1','Teknik Informatika S1','Teknik Geodesi S1','Teknik Lingkungan S1') NOT NULL,
  `tpt_lahir` varchar(30) NOT NULL,
  `tgl_lahir` varchar(20) NOT NULL,
  `jk` enum('Laki-laki','Perempuan') NOT NULL,
  `hp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `namamahasiswa`, `jurusan`, `tpt_lahir`, `tgl_lahir`, `jk`, `hp`) VALUES
(1, 'YUSRI FAHMI ALWI', 'Teknik Listrik D3', 'Pekonina', '12/10/2002', 'Laki-laki', '85274426833'),
(2, 'DZIKRA ASHARI WARDANA', 'Teknik Listrik D3', 'Padang', '24/08/2003', 'Laki-laki', '8,95342E+11'),
(3, 'ALGHI FAHRI', 'Teknik Listrik D3', 'Padang', '03/08/2001', 'Laki-laki', '83826075765'),
(4, 'ANGGA MARDIASYAH', 'Teknik Listrik D3', 'Jakarta', '04/03/2003', 'Laki-laki', '85213984484'),
(5, 'RADI SYAPUTRA', 'Teknik Listrik D3', 'Balik Gunung', '11/09/2002', 'Laki-laki', '81268010317'),
(6, 'RIDHO ANDIKA ILLAHI', 'Teknik Listrik D3', 'GALORO', '17/10/2000', 'Laki-laki', '81319493678'),
(7, 'MUHAMMAD IRFAN', 'Teknik Listrik D3', 'Jakarta', '26/02/2001', 'Laki-laki', '82286832328'),
(8, 'MISANTO SIRIBERE', 'Teknik Listrik D3', 'SIRILOGUI', '10/05/2002', 'Laki-laki', '82284571750'),
(9, 'FEBRI USMANTO', 'Teknik Listrik D3', 'PILUBANG', '25/02/2002', 'Laki-laki', '82287359951'),
(10, 'MUHAMMAD YUSUF', 'Teknik Listrik D3', 'Kubang', '10/09/2002', 'Laki-laki', '83180408674'),
(11, 'ROBBY ALPAJRI', 'Teknik Listrik D3', 'Tanah Periuk', '20/03/2003', 'Laki-laki', '83121481048'),
(12, 'WAHYU EKA PUTRA', 'Teknik Listrik D3', 'Solok', '07/04/2003', 'Laki-laki', '85263165290'),
(13, 'KARTIKA', 'Teknik Listrik D3', 'Padang', '03/04/2003', 'Perempuan', '83182067491'),
(14, 'ILHAMDA', 'Teknik Listrik D3', 'Sungai Aur', '16/12/2002', 'Laki-laki', '82384796965'),
(15, 'RIDO RAHMAN AFRIKO', 'Teknik Listrik D3', 'Padang', '28/04/2003', 'Laki-laki', '85265322434'),
(16, 'MUHAMMAD FARIZ HIDAYATULLAH', 'Teknik Listrik D3', 'Jakarta', '14/09/2002', 'Laki-laki', '81315244309'),
(17, 'GENTA TRI KURNIAWAN', 'Teknik Listrik D3', 'Padang', '30/03/2003', 'Laki-laki', '87891989696'),
(18, 'M HABIB RAMADHAN', 'Teknik Mesin D3', 'supayang', '02/12/2001', 'Laki-laki', '82283304214'),
(19, 'MUHAMMAD DZAKI', 'Teknik Mesin D3', 'Padang', '29/11/2002', 'Laki-laki', '82390845829'),
(20, 'RAHMAD HIDAYAT', 'Teknik Mesin D3', 'PS. Ganting', '19/07/2000', 'Laki-laki', '85263289895'),
(21, 'RANU QIVLAN BAIGA', 'Teknik Mesin D3', 'Padang', '14/12/2000', 'Laki-laki', '83801656380'),
(22, 'VADRI PERNANDES PRATAMA', 'Teknik Mesin D3', 'PADANG', '15/04/2002', 'Laki-laki', '89653090075'),
(23, 'ATTALARIQ', 'Teknik Mesin D3', 'Padang', '10/12/2002', 'Laki-laki', '83190258265'),
(24, 'ANGGI HALOMOAN', 'Teknik Mesin D3', 'BARILAS', '18/11/2000', 'Laki-laki', '82283286538'),
(25, 'RIZKI ALHAMDU', 'Teknik Mesin D3', 'Kampung Melayu', '17/09/2001', 'Laki-laki', '85216364092'),
(26, 'REVA YITNO SAPUTRA', 'Teknik Mesin D3', 'SUNGAI PADI', '08/07/2000', 'Laki-laki', '82268811830'),
(27, 'YANDI', 'Teknik Mesin D3', 'Padang', '05/10/2002', 'Laki-laki', '83164632194'),
(28, 'HARRIS PUTRA', 'Teknik Mesin D3', 'Sungai Penuh', '01/04/2003', 'Laki-laki', '81266576608'),
(29, 'JAKA HARIADI', 'Teknik Mesin D3', 'Air Haji', '04/06/2001', 'Laki-laki', '82391361570'),
(30, 'M FARHAN', 'Teknik Mesin D3', 'Balai Selasa', '08/05/2003', 'Laki-laki', '81275108848'),
(31, 'FEBRINALDI', 'Teknik Mesin D3', 'Pariaman', '18/01/2002', 'Laki-laki', '82285049795'),
(32, 'RAFFI NAZRI YOSE', 'Teknik Mesin D3', 'Jakarta', '07/05/2003', 'Laki-laki', '85349406431'),
(33, 'ARASYD HATTA AL-FALAH', 'Teknik Mesin D3', 'Buluh Kasok', '26/02/2003', 'Laki-laki', '82387711295'),
(34, 'BAYU ISRA NUGRAHA', 'Teknik Mesin D3', 'Padang', '25/10/2000', 'Laki-laki', '81275121155'),
(35, 'ANVIEL DWIRAJLI PUTRA FAUZI', 'Teknik Mesin D3', 'Bt. Arah', '07/10/2001', 'Laki-laki', '82284956728'),
(36, 'FARHAN SEPTIAWAN DEZA', 'Teknik Mesin D3', 'Padang', '10/09/2002', 'Laki-laki', '82171956289'),
(37, 'HENDI PRAWIRO', 'Teknik Mesin D3', 'Lubuk Basung', '25/05/2001', 'Laki-laki', '8,95341E+11'),
(38, 'ORIANTA SUHANDRA', 'Teknik Mesin D3', 'SawahLunto', '09/03/2003', 'Laki-laki', '85156322318'),
(39, 'JEFRI SYAPUTRA', 'Teknik Mesin D3', 'Singkarak', '23/04/2000', 'Laki-laki', '87860328585'),
(40, 'RINTO', 'Teknik Mesin D3', 'Sari Mulya', '05/09/2000', 'Laki-laki', '82299102689'),
(41, 'DANNY WIDAYAT', 'Teknik Mesin D3', 'Bukit Sari', '12/12/2002', 'Laki-laki', '81365552723'),
(42, 'RANKEY SABILLY', 'Teknik Mesin D3', 'Sungai Rumbai', '18/10/1998', 'Laki-laki', '81371665409'),
(43, 'RAHMAT SYUKRI', 'Teknik Mesin D3', 'Badinah', '09/01/2003', 'Laki-laki', '85271374790'),
(44, 'MUHAMMAD SAIBI', 'Teknik Mesin D3', 'Tanjung Tanah', '03/09/2003', 'Laki-laki', '82278132946'),
(45, 'DENO FEBRIAN', 'Teknik Mesin D3', 'Padang', '26/02/2003', 'Laki-laki', '89618746679'),
(46, 'FAKHRUR ROZI', 'Teknik Mesin D3', 'Padang', '20/04/1995', 'Laki-laki', '81276038866'),
(47, 'ANDIKA PIRANDI', 'Teknik Sipil D3', 'Talu', '10/12/2001', 'Laki-laki', '83190279209'),
(48, 'AYDIL SAFITRI', 'Teknik Sipil D3', 'BATUSANGKAR', '27/12/2000', 'Perempuan', '89514392418'),
(49, 'MUHAMMAD DERISMAN', 'Teknik Sipil D3', 'Bukittinggi', '12/04/2001', 'Laki-laki', '88279349118'),
(50, 'FADLI KHULKI', 'Teknik Sipil D3', 'Padang', '11/02/2001', 'Laki-laki', '85676186336'),
(51, 'NABILLA ARNIA', 'Teknik Sipil D3', 'PARIAMAN', '03/10/2002', 'Perempuan', '82269351786'),
(52, 'TAUFIK FEBRIANDI SAPUTRA', 'Teknik Sipil D3', 'Padang', '10/02/2001', 'Laki-laki', '89530037639'),
(53, 'MUHAMMAD ZIQRU IZZATY ROBBY LU', 'Teknik Sipil D3', 'Medan', '13/05/2002', 'Laki-laki', '83189068330'),
(54, 'FAUZI FIRDAUS', 'Teknik Sipil D3', 'LANSANO', '02/07/2002', 'Laki-laki', '82219768072'),
(55, 'HUSNATUL HAYATI', 'Teknik Sipil D3', 'SOLOK', '29/10/2002', 'Perempuan', '83181558037'),
(56, 'HAMID ALFARISI', 'Teknik Sipil D3', 'Nanggalo', '18/06/2002', 'Laki-laki', '83818923115'),
(57, 'ANDRE DWI PERMANA', 'Teknik Sipil D3', 'Air Haji', '11/03/2001', 'Laki-laki', '81378335862'),
(58, 'SUDRALIO RESTUGIRI', 'Teknik Sipil D3', 'Solok', '12/03/2001', 'Laki-laki', '82268968401'),
(59, 'ALDY WAHYUANDA', 'Teknik Sipil D3', 'Simpang Empat', '17/06/2002', 'Laki-laki', '85271138528'),
(60, 'RAHMAD DHANI', 'Teknik Sipil D3', 'Pariaman', '10/06/2002', 'Laki-laki', '81314674034'),
(61, 'M. DERRI PAJRI', 'Teknik Sipil D3', 'Kapar Utara', '19/06/2002', 'Laki-laki', '82288652844'),
(62, 'MAHFUDZ RIDHO', 'Teknik Sipil D3', 'Kajai', '31/01/2001', 'Laki-laki', '81372770889'),
(63, 'RAVIE MAHENDRA BIMA', 'Teknik Sipil D3', 'Jakarta', '15/10/2002', 'Laki-laki', '82211965690'),
(64, 'MOHAMMAD DAIVA HARIANTO', 'Teknik Sipil D3', 'Solok', '11/10/2002', 'Laki-laki', '82268330278'),
(65, 'TAUFIK RINALDI', 'Teknik Sipil D3', 'Pekanbaru', '25/12/2002', 'Laki-laki', '81973431680'),
(66, 'AGUNG NUGRAHA', 'Teknik Sipil D3', 'Padang', '25/06/2002', 'Laki-laki', '82388163012'),
(67, 'ALFITO DINOVA', 'Teknik Elektro S1', 'Padang', '03/07/2002', 'Laki-laki', '85924636392'),
(68, 'Annisa Alviyenti', 'Teknik Elektro S1', 'Padang', '16/04/2003', 'Perempuan', '83161892433'),
(69, 'FERDY RAHMAT HIDAYAT', 'Teknik Elektro S1', 'Malang', '07/04/2003', 'Laki-laki', '85363340392'),
(70, 'FERGI ROBERT MAHENDRA', 'Teknik Elektro S1', 'Padang', '07/09/1999', 'Laki-laki', '85364963374'),
(71, 'M. INDRA', 'Teknik Elektro S1', 'Bonjol', '04/10/2002', 'Laki-laki', '82286381406'),
(72, 'MARTINI', 'Teknik Elektro S1', 'Inderapuraa', '13/06/2002', 'Perempuan', '82392039243'),
(73, 'MUTIARA SALSA BILLA', 'Teknik Elektro S1', 'Bukittinggi', '27/08/2002', 'Perempuan', '83182806241'),
(74, 'RAHUL MARYULIS PUTRA', 'Teknik Elektro S1', 'Padang', '20/05/2003', 'Laki-laki', '83183394283'),
(75, 'SUPRIADI', 'Teknik Elektro S1', 'Sungai Sarik', '29/06/2002', 'Laki-laki', '82286299358'),
(76, 'TIUR LESTARI WIBOWO', 'Teknik Elektro S1', 'Sungai Talang', '30/08/2001', 'Perempuan', '82283141215'),
(77, 'APRI ALDI', 'Teknik Elektro S1', 'Batang Limpaung', '07/04/2001', 'Laki-laki', '85364607937'),
(78, 'ARIF HANDIKA', 'Teknik Elektro S1', 'SIMP EMPAT', '22/04/2003', 'Laki-laki', '82246355362'),
(79, 'RAUSLIM', 'Teknik Elektro S1', 'Kampung Dalam', '24/07/2002', 'Laki-laki', '81261616538'),
(80, 'IRA MAY ZAHARA', 'Teknik Elektro S1', 'Painan', '07/05/2001', 'Perempuan', '81277401921'),
(81, 'NURWISUDA PUTRI', 'Teknik Elektro S1', 'Ambacang', '26/10/2002', 'Perempuan', '82114494223'),
(82, 'REZKI VINANDO PUTRA', 'Teknik Elektro S1', 'PUCUNG ANAM', '17/09/2002', 'Laki-laki', '85363856134'),
(83, 'DAYUNA IBRAHIM', 'Teknik Elektro S1', 'Bonjol', '29/05/2001', 'Laki-laki', '81270441257'),
(84, 'FADILA RAHMA YANTI', 'Teknik Elektro S1', 'Sulit Air', '11/01/2003', 'Perempuan', '8566311232'),
(85, 'IRVAN KURNIA', 'Teknik Elektro S1', 'Pekanbaru', '05/11/2001', 'Laki-laki', '83182064548'),
(86, 'ELFIRANISA PUTRI', 'Teknik Elektro S1', 'Kampung Pondok', '24/01/2002', 'Perempuan', '85273542777'),
(87, 'SAMUEL PARTOGI SIMANJUNTAK', 'Teknik Elektro S1', 'Pematangsiantar', '06/08/2003', 'Laki-laki', '85261001722'),
(88, 'ALFRED', 'Teknik Elektro S1', 'Paraman Ampalu', '17/01/2003', 'Laki-laki', '88279549984'),
(89, 'MUHAMMAD FADLI', 'Teknik Elektro S1', 'Koto Tangah Simalanggang', '25/10/2001', 'Laki-laki', '82387712517'),
(90, 'FERNANDA DARUSSALAM', 'Teknik Elektro S1', 'DUMAI', '21/07/2003', 'Laki-laki', '83187973865'),
(91, 'RIVEL NOVENDRA', 'Teknik Elektro S1', 'Taratak', '25/11/2002', 'Laki-laki', '85364249491'),
(92, 'HOLIQ IKBAL', 'Teknik Elektro S1', 'Lempur Danau', '03/03/2003', 'Laki-laki', '82215738278'),
(93, 'M. FARHAN ALFAREDHO', 'Teknik Elektro S1', 'Jambi', '21/02/2003', 'Laki-laki', '82280146556'),
(94, 'PAHMI SAPUTRA', 'Teknik Elektro S1', 'LADANG PANJANG', '20/10/2002', 'Laki-laki', '85280729630'),
(95, 'SULTAN ALAMSYAH', 'Teknik Elektro S1', 'Padang', '01/01/2003', 'Laki-laki', '83153850643'),
(96, 'TEGAR TRY ANDHIKA', 'Teknik Elektro S1', 'Surantih', '05/05/2002', 'Laki-laki', '81251342805'),
(97, 'ALWY MUHARDAL ROSSY', 'Teknik Elektro S1', 'Dumai', '02/03/2003', 'Laki-laki', '8231314895'),
(98, 'IRFAN HAFIZH', 'Teknik Elektro S1', 'solok', '21/05/2003', 'Laki-laki', '81275591859'),
(99, 'LINGGA SIDIK HAREFA', 'Teknik Elektro S1', 'Lubuk SIkaping', '01/05/2002', 'Laki-laki', '82293123635'),
(100, 'ZIKRAN FADIA AL FARUQI', 'Teknik Elektro S1', 'Pariaman', '18/01/2003', 'Laki-laki', '8,95612E+11'),
(101, 'FAJAR PIRMA SATRIA', 'Teknik Elektro S1', 'Lampung', '18/01/2002', 'Laki-laki', '82283387457'),
(102, 'DIO KHARISMA PUTRA', 'Teknik Elektro S1', 'Padang', '25/04/2003', 'Laki-laki', '83160200989'),
(103, 'YUDHA TRI EKA PUTRA', 'Teknik Elektro S1', 'Pekanbaru', '29/08/2002', 'Laki-laki', '89527244496'),
(104, 'JHORDY FADDILA FASILLY', 'Teknik Elektro S1', 'Bukittinggi', '09/09/2001', 'Laki-laki', '82173169392'),
(105, 'ZACKY SUKMA RAJA', 'Teknik Elektro S1', 'pulau punjung', '19/06/2003', 'Laki-laki', '89514829458'),
(106, 'LARAS IRRA MONIKA', 'Teknik Elektro S1', 'Balai Nan Duo', '31/05/2002', 'Perempuan', '83827088889'),
(107, 'SYAHRUL TRI HARDIANTO', 'Teknik Elektro S1', 'Jambak', '14/12/2002', 'Laki-laki', '81278727586'),
(108, 'ROMI MAISA KURNIA', 'Teknik Elektro S1', 'Larik Kemahan', '17/03/2002', 'Laki-laki', '82273250563'),
(109, 'ANUGERAH DINANTA', 'Teknik Elektro S1', 'Padang', '08/01/2002', 'Laki-laki', '81277841975'),
(110, 'ABDUL AJAI', 'Teknik Elektro S1', 'Sekungkung', '06/06/2002', 'Laki-laki', '85832018901'),
(111, 'RANGGA MASNUR PRATAMA', 'Teknik Elektro S1', 'Padang', '27/02/2003', 'Laki-laki', '83190274489'),
(112, 'RIDWAN FAUZI', 'Teknik Elektro S1', 'BATUSANGKAR', '11/08/2001', 'Laki-laki', '82385067938'),
(113, 'ARIWIBOWO', 'Teknik Elektro S1', 'Padang', '06/02/2002', 'Laki-laki', '82292115211'),
(114, 'M. ROFFIE', 'Teknik Elektro S1', 'Batam', '05/10/1996', 'Laki-laki', '81252361505'),
(115, 'ALDIFA AMENDRA MAKRUF', 'Teknik Elektro S1', 'Padang', '02/06/2001', 'Laki-laki', '82381540657'),
(116, 'ANGGA ARMANSYAH', 'Teknik Mesin S1', 'Marunggi', '05/05/2000', 'Laki-laki', '85262999188'),
(117, 'DECKY SEPRIANTO', 'Teknik Mesin S1', 'Pakandangan', '21/09/2002', 'Laki-laki', '88807464430'),
(118, 'FADHAL FATUR ASHARI', 'Teknik Mesin S1', 'Padang', '15/10/2001', 'Laki-laki', '83180205588'),
(119, 'HERU ORLANDO', 'Teknik Mesin S1', 'PADANG', '04/08/2002', 'Laki-laki', '83167235891'),
(120, 'MOVI WAHYU', 'Teknik Mesin S1', 'Belui', '10/01/2001', 'Laki-laki', '82213797034'),
(121, 'ABDUL JALIL', 'Teknik Mesin S1', 'Simpang', '13/10/2003', 'Laki-laki', '82385348722'),
(122, 'FIKI FIRDAUS', 'Teknik Mesin S1', 'Padang', '10/05/2001', 'Laki-laki', '8995706541'),
(123, 'SYAHREZA PUTRA PRATAMA CHANDRA', 'Teknik Mesin S1', 'Painan', '06/05/2002', 'Laki-laki', '85215222166'),
(124, 'ZACKY RUBEN', 'Teknik Mesin S1', 'Padang', '01/10/2002', 'Laki-laki', '81261530812'),
(125, 'ABDUL MUNAP', 'Teknik Mesin S1', 'Sungai Asam', '04/02/2002', 'Laki-laki', '82284987252'),
(126, 'GIO EFRIYAN', 'Teknik Mesin S1', 'PD. Leban', '22/10/2002', 'Laki-laki', '82288322755'),
(127, 'MUHAMMAD AFDHAL', 'Teknik Mesin S1', 'Padang', '19/04/2004', 'Laki-laki', ''),
(128, 'AHMAD HAMDA', 'Teknik Mesin S1', 'Simpang Tonang', '25/03/2003', 'Laki-laki', '83815513070'),
(129, 'FAJAR EFENDI', 'Teknik Mesin S1', 'Koto Kaciak', '14/12/2001', 'Laki-laki', '82390789978'),
(130, 'FAJAR NURJAMAN', 'Teknik Mesin S1', 'Sawahlunto Sijunjung', '09/02/2002', 'Laki-laki', '85271359280'),
(131, 'TAUFIQ HIDAYAT', 'Teknik Mesin S1', 'Pariaman', '17/04/2001', 'Laki-laki', '82275176885'),
(132, 'ALYATUL FATHILA', 'Teknik Mesin S1', 'Padang', '30/01/2003', 'Perempuan', '89630762296'),
(133, 'DANU NAUFAL KHAIRA', 'Teknik Mesin S1', 'MANINJAU', '07/11/2002', 'Laki-laki', '81267838373'),
(134, 'CANDRA', 'Teknik Mesin S1', 'Padang', '11/01/2002', 'Laki-laki', '83170346158'),
(135, 'HAZNUL FITRA', 'Teknik Mesin S1', 'Bonjol', '27/12/2002', 'Laki-laki', '82228429135'),
(136, 'MUHAMMAD NASRI', 'Teknik Mesin S1', 'Sawah Bukit', '25/04/2003', 'Laki-laki', '82360507018'),
(137, 'HALOMOAN OKTORA', 'Teknik Mesin S1', 'Padang Panjang', '29/10/2001', 'Laki-laki', '85280463970'),
(138, 'ADE IRWANSYAH', 'Teknik Mesin S1', 'Pekanbaru', '11/03/2002', 'Laki-laki', '81310395161'),
(139, 'REZKI ANAN JANUARI', 'Teknik Mesin S1', 'Padang', '16/01/2003', 'Laki-laki', '83178797593'),
(140, 'ARYA ARDIANSYAH', 'Teknik Mesin S1', 'Gunung Labu', '13/05/2003', 'Laki-laki', '82278144315'),
(141, 'AZIZUL HAQIM', 'Teknik Mesin S1', 'AIR HAJI', '08/02/2003', 'Laki-laki', '81267646848'),
(142, 'KHUSNUL KHIRAM', 'Teknik Mesin S1', 'Teluk Rendah Hulu', '01/06/2003', 'Laki-laki', '82278036189'),
(143, 'M. ZAQI ALHAKIM', 'Teknik Mesin S1', 'Bukittinggi', '10/11/2000', 'Laki-laki', '82385912529'),
(144, 'RAHMADANO', 'Teknik Mesin S1', 'Pulau Lebar', '15/11/2003', 'Laki-laki', '82280457970'),
(145, 'REZKY ALTRI DENI', 'Teknik Mesin S1', 'Sawahlunto Sijunjung', '26/06/2003', 'Perempuan', '82284037788'),
(146, 'RIDHO SYAPUTRA', 'Teknik Mesin S1', 'Padang', '18/01/2002', 'Laki-laki', '6,28536E+12'),
(147, 'JERRY APRIAN', 'Teknik Mesin S1', 'Inuman', '29/04/2001', 'Laki-laki', '82268131166'),
(148, 'WAHYU TRI FIRDAUS', 'Teknik Mesin S1', 'Koto Anau', '02/02/2002', 'Laki-laki', '82288948715'),
(149, 'RIVA CHILDI HIDAYATULLAH', 'Teknik Mesin S1', 'Peranap', '28/06/2003', 'Laki-laki', '82268693916'),
(150, 'ZANDRA AKSA PUTRA', 'Teknik Mesin S1', 'Lolo', '29/09/2001', 'Laki-laki', '85363550243'),
(151, 'RONAL', 'Teknik Mesin S1', 'Cubadak', '02/08/2001', 'Laki-laki', '82287284502'),
(152, 'HAFIDL HAMDI', 'Teknik Mesin S1', 'Pekanbaru', '19/05/2002', 'Laki-laki', '88271306554'),
(153, 'ABIL HUSNI', 'Teknik Mesin S1', 'Pamenang', '09/05/2003', 'Laki-laki', '82227376303'),
(154, 'ROMIDI', 'Teknik Mesin S1', 'Tanjung Alai', '30/01/2003', 'Laki-laki', '82268359621'),
(155, 'RAHMAD PRASETYO', 'Teknik Mesin S1', 'bukit gading', '09/07/2003', 'Laki-laki', '82288772048'),
(156, 'NIKO ARIFALDI', 'Teknik Mesin S1', 'Kinali', '30/12/2003', 'Laki-laki', '82171267893'),
(157, 'ZAKI WAHID DATULLAH', 'Teknik Mesin S1', 'Tebing Tinggi', '20/12/2000', 'Laki-laki', '82287965847'),
(158, 'M.HABIB AL HADI', 'Teknik Mesin S1', 'Kapar', '19/01/2002', 'Laki-laki', '82351267380'),
(159, 'MUHAMMAD BINTANG', 'Teknik Mesin S1', 'Padang', '05/09/2002', 'Laki-laki', '81276094429'),
(160, 'FAJAR MAHYU AKBAR', 'Teknik Mesin S1', 'Koto Jayo', '28/10/2003', 'Laki-laki', '83802806468'),
(161, 'ARI ROMADON', 'Teknik Mesin S1', 'Suka Maju', '17/01/2001', 'Laki-laki', '83180443516'),
(162, 'LUTHFI KUSUMA ARDHANA', 'Teknik Mesin S1', 'Padang', '25/04/2003', 'Laki-laki', '81366680750'),
(163, 'FIRMANSYAH PRATAMA', 'Teknik Mesin S1', 'Aek Torop', '18/08/2003', 'Laki-laki', '82181561066'),
(164, 'ADIT AFLIAN', 'Teknik Mesin S1', 'painan', '11/09/2003', 'Laki-laki', '85269901436'),
(165, 'MUHAMMAD RAFLI', 'Teknik Mesin S1', 'Pincuran Tujuh', '21/01/2000', 'Laki-laki', '82287605330'),
(166, 'ABEL DACHOSTA', 'Teknik Mesin S1', 'Padang', '03/06/2002', 'Laki-laki', '82268413912'),
(167, 'MUHAMMAD SOBRI SIREGAR', 'Teknik Mesin S1', 'sukaramai', '25/01/2003', 'Laki-laki', '82273491407'),
(168, 'MUHAMMAD LUTHFY', 'Teknik Mesin S1', 'batam', '24/11/2002', 'Laki-laki', '82285491327'),
(169, 'AL FIKRI IBNU SALAM', 'Teknik Mesin S1', 'Padang', '20/11/1999', 'Laki-laki', '81363835549'),
(170, 'RAGIL', 'Teknik Mesin S1', 'Kamang', '20/07/2002', 'Laki-laki', '82285517032'),
(171, 'KEKEN MINOKTRI PRAYUDHA', 'Teknik Mesin S1', 'Pondok Baru', '02/10/2003', 'Laki-laki', '85267921706'),
(172, 'MUHAMMAD ARIF', 'Teknik Mesin S1', 'Padang', '01/04/2002', 'Laki-laki', '8,95604E+11'),
(173, 'FARHAN EMELSON', 'Teknik Mesin S1', 'Bukittinggi', '24/06/2003', 'Laki-laki', '85156768914'),
(174, 'M.GHANI AHMADIANSYAH', 'Teknik Mesin S1', 'Pautan Kabau', '19/10/2003', 'Laki-laki', '83867233404'),
(175, 'FERLIAN DESKA EMELDI', 'Teknik Mesin S1', 'TAPAN', '17/12/2001', 'Laki-laki', '82284436613'),
(176, 'FADHIL ABIYYU DZAKY', 'Teknik Mesin S1', 'Perawang', '09/11/2002', 'Laki-laki', '82286379186'),
(177, 'EGI PUTRA', 'Teknik Mesin S1', 'Perawang', '07/05/2003', 'Laki-laki', '85618159523'),
(178, 'MANGILI SARORO', 'Teknik Mesin S1', 'SALIGUMA', '09/05/1999', 'Laki-laki', '82173241798'),
(179, 'AFRIANSYAH', 'Teknik Mesin S1', 'Tano Bato', '15/04/2003', 'Laki-laki', '83166500589'),
(180, 'RAMZY FAJDLUR MUMTAZ', 'Teknik Mesin S1', 'Parit Malintang', '04/05/2003', 'Laki-laki', '81365579123'),
(181, 'ERLANGGA EFENDI', 'Teknik Mesin S1', 'Payakumbuh', '23/01/2001', 'Laki-laki', '83841986883'),
(182, 'TENGKU AFFANDI MARTALATA', 'Teknik Mesin S1', 'Padang', '24/03/2003', 'Laki-laki', '82121649249'),
(183, 'ABID RAHMAN', 'Teknik Mesin S1', 'Batusangkar', '10/10/2001', 'Laki-laki', '81266383352'),
(184, 'FARHAN NAUFAL', 'Teknik Mesin S1', 'Padang', '30/06/2003', 'Laki-laki', '83186677550'),
(185, 'ERPINUS SARIRIKKA', 'Teknik Mesin S1', 'Sirisurak', '26/05/2001', 'Laki-laki', '82368437347'),
(186, 'DENA YUNI AFDAL', 'Teknik Mesin S1', 'Balai Selasa', '29/06/2002', 'Laki-laki', '82284972061'),
(187, 'MUHAMMAD BADRI', 'Teknik Mesin S1', 'Padang', '24/08/2002', 'Laki-laki', '83803915159'),
(188, 'JEFRIMAN SAPUTRA', 'Teknik Mesin S1', 'paguh duku', '28/04/2001', 'Laki-laki', '83841883808'),
(189, 'MARTINUS ZALUKHU', 'Teknik Mesin S1', 'Padang Palak', '26/05/2002', 'Laki-laki', '81261778344'),
(190, 'BINTANG FAJAR JEKRIYA', 'Teknik Mesin S1', 'Padang', '14/04/2003', 'Laki-laki', '85274233868'),
(191, 'RIDO NOVRIAN RAHMAD', 'Teknik Mesin S1', 'Sibaruas', '25/11/2002', 'Laki-laki', '82239703718'),
(192, 'FIRGIAN CRYSTANTO', 'Teknik Mesin S1', 'Padang', '11/08/2002', 'Laki-laki', '89671145692'),
(193, 'IRFANDHI SYAFRIADI', 'Teknik Mesin S1', 'Mukouko', '09/04/2001', 'Laki-laki', '82281552972'),
(194, 'ARIEF MAULANA IBRAHIM', 'Teknik Sipil S1', 'Padang', '05/06/2002', 'Laki-laki', '85212950871'),
(195, 'DAZAQKI PRAWIRA', 'Teknik Sipil S1', 'Padang', '07/04/2003', 'Laki-laki', '82386678323'),
(196, 'SINDI OKTAVIANI', 'Teknik Sipil S1', 'Bonjol', '18/10/2002', 'Perempuan', '82283019029'),
(197, 'VERDIAN', 'Teknik Sipil S1', 'Kota Pekanbaru', '08/09/2003', 'Laki-laki', '83186567218'),
(198, 'ANNA PEBRIAN AGUSTIN', 'Teknik Sipil S1', 'Selat Panjang', '26/08/2001', 'Perempuan', '81267338457'),
(199, 'MHD RAHIM', 'Teknik Sipil S1', 'Padang', '01/11/2002', 'Laki-laki', '81364076984'),
(200, 'MUHAMMAD FAHRUR ROZI PULUNGAN', 'Teknik Sipil S1', 'Bekasi', '04/03/2001', 'Laki-laki', '85261604255'),
(201, 'ILHAM WAHYU OKMI', 'Teknik Sipil S1', 'Lansano', '10/10/2002', 'Laki-laki', '82258486411'),
(202, 'JUAN VITO GRACIA', 'Teknik Sipil S1', 'Padang', '04/08/2003', 'Laki-laki', '82123701326'),
(203, 'M.HAMDAN', 'Teknik Sipil S1', 'Nipah Panjang', '16/11/2002', 'Laki-laki', '85295263273'),
(204, 'MILYA FITRIA', 'Teknik Sipil S1', 'Air Bangis', '16/10/2002', 'Perempuan', '81365157954'),
(205, 'MUHAMMAD HIDAYAT', 'Teknik Sipil S1', 'Koto Tuo', '20/07/2002', 'Laki-laki', '85890343720'),
(206, 'RAHMAD IZZUDDIN', 'Teknik Sipil S1', 'Padang', '15/05/2003', 'Laki-laki', '89617049306'),
(207, 'RANDI SAPUTRA', 'Teknik Sipil S1', 'Jambi', '18/03/2002', 'Laki-laki', '81374624952'),
(208, 'ROZA MAILINA PUTRI', 'Teknik Sipil S1', 'Padang', '12/06/2001', 'Perempuan', '89617685456'),
(209, 'JOHAN ABDULLAH', 'Teknik Sipil S1', 'Pekan Sabtu', '20/06/2003', 'Laki-laki', '81374121558'),
(210, 'CHANTIKA RAHMA DIVA', 'Teknik Sipil S1', 'Padang', '10/04/2003', 'Perempuan', '83807557533'),
(211, 'MUHAMMAD ARIF', 'Teknik Sipil S1', 'Payakumbuh', '06/06/2003', 'Laki-laki', '8,95618E+11'),
(212, 'MUHAMMAD ARIF SYAWILCHAN', 'Teknik Sipil S1', 'Padang', '13/11/2000', 'Laki-laki', '8,95357E+11'),
(213, 'RIJAL FADLI', 'Teknik Sipil S1', 'Padang', '29/09/2000', 'Laki-laki', '85763541432'),
(214, 'RISKI HIDAYAT', 'Teknik Sipil S1', 'Air Bangis', '01/10/2001', 'Laki-laki', '82287255690'),
(215, 'RISNA MAYDI PUTRI', 'Teknik Sipil S1', 'KOTO TARATAK', '07/06/2003', 'Perempuan', '82384549973'),
(216, 'IRMAN INSANI', 'Teknik Sipil S1', 'Sungai Padi', '08/01/2003', 'Laki-laki', '82386460641'),
(217, 'AYU LESTARI', 'Teknik Sipil S1', 'Simpang Tiga Rawang', '22/01/2003', 'Perempuan', '81377632556'),
(218, 'BINTANG REZKI ANDESYA PUTRA', 'Teknik Sipil S1', 'Talu', '07/04/2002', 'Laki-laki', '85171040704'),
(219, 'FARA OKTA VIOLA', 'Teknik Sipil S1', 'LOLO', '22/10/2002', 'Perempuan', '82173179106'),
(220, 'FEBRI WULANDARI', 'Teknik Sipil S1', 'Tanjung Nan IV', '26/02/2003', 'Perempuan', '81261019065'),
(221, 'PUTRI RAHMADANI', 'Teknik Sipil S1', 'Panampung', '22/11/2002', 'Perempuan', '85263185480'),
(222, 'RANDI ELDI PRAMANA', 'Teknik Sipil S1', 'Lubuk Sikaping', '09/04/2001', 'Laki-laki', '81280703377'),
(223, 'REDHO MUHAMMAD SANI', 'Teknik Sipil S1', 'Tanjung Durian', '10/08/2001', 'Laki-laki', '82388271005'),
(224, 'SAFINA LAELY', 'Teknik Sipil S1', 'Padang', '23/12/2001', 'Perempuan', '83157485280'),
(225, 'YUSUF ARRASYD', 'Teknik Sipil S1', 'Panyalaian', '12/10/2002', 'Laki-laki', '8,95619E+11'),
(226, 'BILWANDI', 'Teknik Sipil S1', 'Tanjung Saba', '19/11/2003', 'Laki-laki', '81365986705'),
(227, 'DICKY WAHYUDI', 'Teknik Sipil S1', 'Pasar kuok', '04/03/2003', 'Laki-laki', '81371285271'),
(228, 'DINI CAHYANI', 'Teknik Sipil S1', 'Padang', '31/10/2001', 'Perempuan', '83841919335'),
(229, 'DINI ISLAMI RAHMAWATI', 'Teknik Sipil S1', 'Padang', '26/04/2003', 'Perempuan', '85271244319'),
(230, 'DYANDRA AMANDA PUTRA', 'Teknik Sipil S1', 'AIR BANGIS', '18/10/2002', 'Laki-laki', '81371119638'),
(231, 'FERDI YUSANDRI', 'Teknik Sipil S1', 'Bukit Tinggi', '13/11/2002', 'Laki-laki', ''),
(232, 'MUHAMMAD ASYRAF AZZUHRA', 'Teknik Sipil S1', 'SOLOK', '24/07/2003', 'Laki-laki', '89502419933'),
(233, 'RIVALDI', 'Teknik Sipil S1', 'Padang', '24/02/2002', 'Laki-laki', '85271376575'),
(234, 'ANGGI GUSPITA', 'Teknik Sipil S1', 'Padang', '30/08/2002', 'Perempuan', '89514640935'),
(235, 'GILANG RAMADHAN', 'Teknik Sipil S1', 'Solok', '28/11/2001', 'Laki-laki', '81277519280'),
(236, 'GUSTI PRAYOGA', 'Teknik Sipil S1', 'Bukit Sileh', '14/08/2001', 'Laki-laki', '8,95602E+11'),
(237, 'NURAINI RAMADANI', 'Teknik Sipil S1', 'LUBUK SIANOK', '04/12/2003', 'Perempuan', '83169063104'),
(238, 'TASYA RIMANDA PUTRI', 'Teknik Sipil S1', 'Gurun Panjang', '15/07/2003', 'Perempuan', '81268318933'),
(239, 'TAUFIK TRIANTO', 'Teknik Sipil S1', 'Padang', '03/02/2003', 'Laki-laki', '85263055390'),
(240, 'WICCO HARNEVA PILKA', 'Teknik Sipil S1', 'Pasar Baru Lakitan', '04/01/2004', 'Laki-laki', '82286336236'),
(241, 'SUGETRI HASIBUAN', 'Teknik Sipil S1', 'MUARA TANJUNG BETUNG', '23/12/2000', 'Laki-laki', '85374176117'),
(242, 'AMALINA SITI LUTFI', 'Teknik Sipil S1', 'Pandam', '10/08/2002', 'Perempuan', '82310797034'),
(243, 'DAHLER HASIBUAN', 'Teknik Sipil S1', 'MUARA TANJUNG BETUNG', '09/11/2003', 'Laki-laki', '82286694640'),
(244, 'HAMES RICHARDO', 'Teknik Sipil S1', 'PADANG', '06/10/2002', 'Laki-laki', '89623083706'),
(245, 'DELIA OKTAMA PUTRI', 'Teknik Sipil S1', 'Padang', '24/10/2000', 'Perempuan', '82384418809'),
(246, 'ALDI', 'Teknik Sipil S1', 'Koto Tinggi', '18/04/2002', 'Laki-laki', '81371769110'),
(247, 'MALVIN A RACHMAN', 'Teknik Sipil S1', 'SEMERAP', '05/09/2003', 'Laki-laki', '82184293067'),
(248, 'RAYHAN DEVITRA', 'Teknik Sipil S1', 'Pandeglang', '03/05/2004', 'Laki-laki', '83124026667'),
(249, 'MUHAMMAD RIZKI AFRIANTO', 'Teknik Sipil S1', 'Padang', '16/01/2000', 'Laki-laki', '82384987556'),
(250, 'AKMAZAKI', 'Teknik Sipil S1', 'Solok', '07/09/2002', 'Laki-laki', '82346736158'),
(251, 'RIVAL FERDIKA WAHYU', 'Teknik Sipil S1', 'Dilam', '21/03/2003', 'Laki-laki', '82288670299'),
(252, 'GRESCHEA JHESKHILKA ANANDA SAF', 'Teknik Sipil S1', 'Bangkinang', '16/01/2004', 'Perempuan', '85363313163'),
(253, 'FITO PUJIANTO', 'Teknik Sipil S1', 'Kp Baru', '29/01/2003', 'Laki-laki', '85264324254'),
(254, 'AKBAR KURNIAWAN', 'Teknik Sipil S1', 'Padang', '05/07/2003', 'Laki-laki', '82283735256'),
(255, 'YUDA MUBAROK', 'Teknik Sipil S1', 'Padang', '29/05/2004', 'Laki-laki', '89504600101'),
(256, 'DIAN WAHYU PERMADI', 'Teknik Sipil S1', 'Sute Ule', '30/06/2002', 'Laki-laki', '85263513297'),
(257, 'M. ROOFI AFIQO', 'Teknik Sipil S1', 'Yogyakarta', '19/07/2003', 'Laki-laki', '89613002849'),
(258, 'NAUFAL HAZIM ADRI YUDA', 'Teknik Sipil S1', 'muara labuh', '13/06/2002', 'Laki-laki', '85158330613'),
(259, 'YOSA REYHAN', 'Teknik Sipil S1', 'Dolok Sanggul', '06/07/2003', 'Perempuan', '85369865135'),
(260, 'ZIKRA VANIA FEBIOLA', 'Teknik Sipil S1', 'Solok', '10/02/2002', 'Perempuan', '6,28789E+12'),
(261, 'KURNIA RIZKY PRIBADI', 'Teknik Sipil S1', 'Bukittinggi', '03/03/2002', 'Laki-laki', '82139833895'),
(262, 'ARRIQFE LUTHFI', 'Teknik Sipil S1', 'Lubuk Sikaping', '29/10/2002', 'Laki-laki', '82287759664'),
(263, 'AURA NADIVA SALSABILLA', 'Teknik Sipil S1', 'PADANG', '28/11/2003', 'Perempuan', '89504455878'),
(264, 'LUCKY JOANS VALENTINO', 'Teknik Sipil S1', 'Sungai Penuh', '21/04/2003', 'Laki-laki', '82184942164'),
(265, 'DINUL ISLAM', 'Teknik Sipil S1', 'Sapan Sari', '04/08/2002', 'Laki-laki', '82284570951'),
(266, 'SAEPUL MUIZ', 'Teknik Sipil S1', 'LEBAK', '04/10/1996', 'Laki-laki', '89644402390'),
(267, 'MUHAMMAD AL-HAZEN', 'Teknik Sipil S1', 'Api-Api', '07/05/2002', 'Laki-laki', '82288629646'),
(268, 'AZIZAH FADHILAH', 'Teknik Sipil S1', 'Padang Aro', '14/04/2002', 'Perempuan', '82228074592'),
(269, 'PENDI YULIYANDRA', 'Teknik Sipil S1', 'Inderapura', '22/07/2002', 'Laki-laki', '82285418691'),
(270, 'PEDRYAN PRATAMA', 'Teknik Sipil S1', 'MANNA', '21/12/2002', 'Laki-laki', '82180368438'),
(271, 'ROVAL PUTRA', 'Teknik Sipil S1', 'Lolo Hilir', '03/03/2003', 'Laki-laki', '82260698112'),
(272, 'REZKY PUJA ANGGRAYNI', 'Teknik Sipil S1', 'PADANG', '21/02/2003', 'Perempuan', '8,95337E+11'),
(273, 'YOHANDRA', 'Teknik Sipil S1', 'PANYALAIAN', '29/05/2003', 'Laki-laki', '8983723166'),
(274, 'ALVIN DIVA', 'Teknik Sipil S1', 'Sungai Pegeh', '03/01/2003', 'Laki-laki', '85369699650'),
(275, 'M. JUBRON RUSADI', 'Teknik Sipil S1', 'Semerap', '25/06/2002', 'Laki-laki', '82295537330'),
(276, 'MUHAMMAD HABIL', 'Teknik Sipil S1', 'Sungai Padi', '19/06/2003', 'Laki-laki', '82288985336'),
(277, 'LAURA WENZARY', 'Teknik Sipil S1', 'Kayu Aro', '08/05/2003', 'Perempuan', '83170152915'),
(278, 'UTARI RAHMI', 'Teknik Sipil S1', 'Padang Alai', '07/05/2003', 'Perempuan', '81275562736'),
(279, 'TRI DENDI DARMAWAN', 'Teknik Sipil S1', 'JAKARTA', '06/06/1997', 'Laki-laki', '82387359625'),
(280, 'FIKRI RAHMANDA', 'Teknik Sipil S1', 'Alahan Panjang', '01/10/2001', 'Laki-laki', '81371844810'),
(281, 'MIKEL MARVIL MASMARITA', 'Teknik Sipil S1', 'Tanjung Nan Iv', '08/03/2001', 'Laki-laki', '81270521460'),
(282, 'FERRY JULIAN UTBA', 'Teknik Sipil S1', 'Koto Baru Semerap', '03/06/2003', 'Laki-laki', '82296306694'),
(283, 'YUSRIL SEFRIALDI', 'Teknik Sipil S1', 'Koto Baru Semerap', '16/09/2001', 'Laki-laki', '82373684099'),
(284, 'HARVIZAQ ARSYAD', 'Teknik Sipil S1', 'padang lawas', '17/02/2002', 'Laki-laki', '82288715544'),
(285, 'FEBRIKA RINDU ANGGRILA', 'Teknik Sipil S1', 'Muara Labuh', '08/09/2003', 'Perempuan', '82169449261'),
(286, 'FARAH DANOVAND', 'Teknik Sipil S1', 'Pariaman', '02/04/2003', 'Perempuan', '85254650162'),
(287, 'INDAH PERMATA SARI', 'Teknik Sipil S1', 'Pasar Surantih', '17/06/2002', 'Perempuan', '82287680092'),
(288, 'GIBRAN ALTHOF', 'Teknik Sipil S1', 'Padang', '08/11/2003', 'Laki-laki', '82284402496'),
(289, 'YUSRIL RAHMAD', 'Teknik Sipil S1', 'CURUP', '26/11/2004', 'Laki-laki', '82249426182'),
(290, 'REZI MUSTAQIM', 'Teknik Sipil S1', 'Padang Cupak', '24/09/2002', 'Laki-laki', '85264750474'),
(291, 'WALFIQ KURNIA MAUNARDI', 'Teknik Sipil S1', 'Sulit Air', '09/10/2001', 'Laki-laki', '81268627493'),
(292, 'MUHAMMAD TEGUH', 'Teknik Sipil S1', 'Padang', '26/08/2001', 'Laki-laki', '8,95604E+11'),
(293, 'QARINA UTAMI FRINARDI', 'Teknik Sipil S1', 'Padang', '25/09/2003', 'Perempuan', '8,954E+11'),
(294, 'IKHSAN NAJIB', 'Teknik Sipil S1', 'Tanjung Bonai Aur', '30/07/2001', 'Laki-laki', '82294329927'),
(295, 'ARIF RIZQAN AL ROFI', 'Teknik Sipil S1', 'Padang', '17/04/2002', 'Laki-laki', '82124965174'),
(296, 'FITO FIRMANSYAH', 'Teknik Sipil S1', 'Kerinci', '10/07/2002', 'Laki-laki', '82283611278'),
(297, 'AULIYAH', 'Teknik Sipil S1', 'Bandar Hapinis', '22/07/2003', 'Perempuan', '82268194805'),
(298, 'AHMAD ALLIDO SYOFYAN', 'Teknik Sipil S1', 'Padang', '08/09/2002', 'Laki-laki', '82287041731'),
(299, 'MUHAMMAD RAHMATA SYAFPUTRA', 'Teknik Sipil S1', 'Padang', '28/01/2003', 'Laki-laki', '83180102364'),
(300, 'FERDO ADIKA PUTRA', 'Teknik Sipil S1', 'Rawang', '30/04/2002', 'Laki-laki', '82283678372'),
(301, 'FADLI HABIB', 'Teknik Sipil S1', 'Bukittinggi', '20/02/2003', 'Laki-laki', '82210283425'),
(302, 'AZIZI', 'Teknik Sipil S1', 'Koto Bangun', '25/02/2003', 'Laki-laki', '85320376246'),
(303, 'MUHAMMAD FARHAN MAARUF', 'Teknik Sipil S1', 'Solok', '07/06/2002', 'Laki-laki', '85894512619'),
(304, 'SAIDINA HAKIM', 'Teknik Sipil S1', 'Solok', '31/08/2002', 'Laki-laki', '89602872929'),
(305, 'DAFIT GUNAWAN', 'Teknik Sipil S1', 'Lolo', '01/05/2002', 'Laki-laki', '81267631891'),
(306, 'MELANI AGUSTIN', 'Teknik Sipil S1', 'Muaro Sijunjung', '08/08/2003', 'Perempuan', '82268535372'),
(307, 'MAOSO PUTRA HALAWA', 'Teknik Sipil S1', 'Padang', '23/12/2001', 'Laki-laki', '8,95342E+11'),
(308, 'MUHAMMAD BINTANG ODYTAMA', 'Teknik Sipil S1', 'Batam', '05/04/2003', 'Laki-laki', '85254713885'),
(309, 'ALESSANDRO', 'Teknik Sipil S1', 'Lubuk Alung', '09/10/2001', 'Laki-laki', '85236060548'),
(310, 'RAFI HAIDAR FADHILAH', 'Teknik Sipil S1', 'Solok', '27/06/2003', 'Laki-laki', '85363367578'),
(311, 'ZAKI FIRJA TULLAH', 'Teknik Sipil S1', 'Padang', '15/06/2003', 'Laki-laki', '89512490621'),
(312, 'SAIDIL SYUJA', 'Teknik Sipil S1', 'Padang Air Dingin', '06/06/2003', 'Laki-laki', '82262123761'),
(313, 'FAJAR RAMADHAN', 'Teknik Sipil S1', 'Jakarta', '08/11/2002', 'Laki-laki', 'Hp 083186133715/Wa 0'),
(314, 'TEGAR JULIANDRO', 'Teknik Sipil S1', 'Sampu', '22/07/2003', 'Laki-laki', '82284159573'),
(315, 'IKSAN SISWANDI', 'Teknik Sipil S1', 'BATU HAMPAR', '07/11/2002', 'Laki-laki', '82283666982'),
(316, 'RIVALDI', 'Teknik Sipil S1', 'Koto Urek', '02/02/2002', 'Laki-laki', '85271376575'),
(317, 'NURUL ARRASYID', 'Teknik Sipil S1', 'Padang Panjang', '23/10/2002', 'Laki-laki', '8,95618E+11'),
(318, 'GEBRIAN DJORGIE', 'Teknik Sipil S1', 'PADANG', '25/05/2001', 'Laki-laki', ''),
(319, 'RINO AGUNG SETIAWAN', 'Teknik Sipil S1', 'Padang', '30/08/2002', 'Laki-laki', '82171009365'),
(320, 'MUHAMMAD HARDIANSYAH', 'Teknik Sipil S1', 'BUKITTINGGI', '19/10/2002', 'Laki-laki', '085159670088 / 08961'),
(321, 'RIFALDO ZIKRI', 'Teknik Sipil S1', 'Beringin Sakti', '06/10/2002', 'Laki-laki', '81365151495'),
(322, 'OKTADIVA MUZAKHI', 'Teknik Sipil S1', 'Bekasi', '16/10/2002', 'Laki-laki', '85213036230'),
(323, 'ARYA FAJRIL', 'Teknik Sipil S1', 'Batam', '30/06/2001', 'Laki-laki', '83175285417'),
(324, 'YOGI APRILIO', 'Teknik Sipil S1', 'PADANG', '10/04/2001', 'Laki-laki', '82163380738'),
(325, 'RATNA FIRA', 'Teknik Sipil S1', 'KAMPUNG BARU', '10/10/2002', 'Perempuan', '82171048605'),
(326, 'RIKKY CHANDRA', 'Teknik Sipil S1', 'Pasie Laweh', '23/06/2003', 'Laki-laki', '81261033288'),
(327, 'DEFI RAHMAT USNI', 'Teknik Sipil S1', 'Lubuk Alung', '09/12/2002', 'Laki-laki', '83861651393'),
(328, 'MUHAMMAD AZZIL ERIZAL', 'Teknik Sipil S1', 'Duku', '04/02/2004', 'Laki-laki', '82268151264'),
(329, 'M. FAIZ WAFDULLAH', 'Teknik Sipil S1', 'Painan', '22/04/2003', 'Laki-laki', '82284322254'),
(330, 'LAYYA ANNISYA', 'Teknik Sipil S1', 'Pasaman', '29/06/2002', 'Perempuan', '83124517414'),
(331, 'YOGA MAULANA ZULFARID', 'Teknik Sipil S1', 'Padang', '02/01/2000', 'Laki-laki', '85778703310'),
(332, 'TEDDY RAHMAN JOVI', 'Teknik Sipil S1', 'Bukittinggi', '12/04/2002', 'Laki-laki', '82172919303'),
(333, 'AIDINUL ZAIPUL', 'Teknik Sipil S1', 'Padang', '21/11/2001', 'Laki-laki', '8995707114'),
(334, 'JUMYHI HIRAVAT', 'Teknik Sipil S1', 'DUKU', '12/03/2003', 'Laki-laki', '83169192958'),
(335, 'DEA AMELIA', 'Teknik Sipil S1', 'Padang', '14/06/2003', 'Perempuan', '82383640447'),
(336, 'IRFAN SAPUTRA', 'Teknik Sipil S1', 'Padang', '04/03/2003', 'Laki-laki', '82385798584'),
(337, 'MUHAMMAD ADLAR REYHAN', 'Teknik Sipil S1', 'Jambak', '06/09/2002', 'Laki-laki', '81356789186'),
(338, 'SAID AGUNG RANJAMI', 'Teknik Sipil S1', 'Padang', '19/11/2002', 'Laki-laki', '89674470408'),
(339, 'MAYFAD RIYAN', 'Teknik Sipil S1', 'Padang', '04/05/1999', 'Laki-laki', '85363996441'),
(340, 'ATHARIQ ALKUDRI', 'Teknik Sipil S1', 'Padang', '05/09/2003', 'Laki-laki', '89623035565'),
(341, 'HABIB AL FAYED', 'Teknik Sipil S1', 'Tanjung Pinang', '13/10/2002', 'Laki-laki', '81276718493'),
(342, 'MUHAMMAD FAUZAN', 'Teknik Sipil S1', 'Padang', '15/08/2002', 'Laki-laki', '83180058831'),
(343, 'FIRZA LUTHFI ANENDI', 'Teknik Sipil S1', 'Batu Sangkar', '28/12/2001', 'Laki-laki', '082283627700 / 08228'),
(344, 'HAFIZH FITRA RULIAN', 'Teknik Sipil S1', 'Solok', '17/12/2001', 'Laki-laki', '85765745752'),
(345, 'YOGA PRADANA', 'Teknik Sipil S1', 'SawahLunto', '31/08/2001', 'Laki-laki', '82286129450'),
(346, 'INSANUL FIKRI', 'Teknik Sipil S1', 'Padang', '24/07/2003', 'Laki-laki', '89670095591'),
(347, 'ELVI RAHMI', 'Teknik Sipil S1', 'Padang', '13/01/2003', 'Perempuan', '81268871662'),
(348, 'GILANG GIOVANI', 'Teknik Sipil S1', 'Padang', '06/11/2003', 'Laki-laki', '89513644915'),
(349, 'ZAKIATUL IFZI', 'Teknik Sipil S1', 'Padang', '13/12/2002', 'Laki-laki', '89518983700'),
(350, 'RAUDATUL HUSNAH', 'Teknik Sipil S1', 'Pariaman', '04/04/2000', 'Perempuan', '85263679123'),
(351, 'RANGGA SEPTRIADI', 'Teknik Sipil S1', 'Lereng Bukit', '15/09/2002', 'Laki-laki', '82386562523'),
(352, 'MUHAMMAD AZHURI', 'Teknik Sipil S1', 'Kampung Rao-Rao', '08/12/2001', 'Laki-laki', '82244924938'),
(353, 'ALIFA FAUZIA', 'Teknik Sipil S1', 'Limau Sundai', '23/08/1998', 'Perempuan', '81371857810'),
(354, 'ZHAQIA FASYIRA', 'Teknik Sipil S1', 'Padang', '22/06/2003', 'Perempuan', '81365121349'),
(355, 'MUHAMMAD SHIDQI HAFIZ', 'Teknik Sipil S1', 'SUNGAI PENUH', '01/01/1930', 'Laki-laki', '81272164383'),
(356, 'YULMANSYAH BOY', 'Teknik Sipil S1', 'Padang', '09/06/1975', 'Laki-laki', '81363745174'),
(357, 'IKBAL MIKHDAD', 'Teknik Sipil S1', 'PANIGGAHAN', '07/07/1999', 'Laki-laki', '88296721089'),
(358, 'ABRIAL', 'Teknik Sipil S1', 'Langung', '19/08/2001', 'Laki-laki', '82286704764'),
(359, 'DWI SATRIA', 'Teknik Sipil S1', 'BANGKO', '16/10/2001', 'Laki-laki', '85263668852'),
(360, 'AGRIAWAN PRATAMA SYAHPUTRA', 'Teknik Sipil S1', 'Padang', '29/08/1995', 'Laki-laki', '82284043205'),
(361, 'FAUZIAH KUMALA SARI', 'Teknik Sipil S1', 'Sago', '20/08/1999', 'Perempuan', '82283067582'),
(362, 'MUHAMAD FADHIL', 'Teknik Sipil S1', 'Padang', '29/11/2001', 'Laki-laki', '83183074799'),
(363, 'CHANTIKA ADINDA PUTRI MENTARI ', 'Teknik Sipil S1', 'Pariaman', '01/07/1999', 'Perempuan', ''),
(364, 'MUHAMMAD ARHABSYAH ATH-THARIQ', 'Teknik Lingkungan S1', 'Lubuk Sikaping', '07/06/2003', 'Laki-laki', '81378075851'),
(365, 'RIZKY HIDAYAT', 'Teknik Lingkungan S1', 'Duri', '08/12/2000', 'Laki-laki', '85264383802'),
(366, 'FIVI SANRYANI', 'Teknik Lingkungan S1', 'Sumpadang Rao Pasaman', '10/09/2001', 'Perempuan', '85355820327'),
(367, 'RAHMAT TULLAH', 'Teknik Lingkungan S1', 'Muara Labuh', '30/03/2003', 'Laki-laki', '8127098378'),
(368, 'ALVITO HAMZAH', 'Teknik Lingkungan S1', 'Pekanbaru', '30/09/2002', 'Laki-laki', '85265367565'),
(369, 'IFAN PRAYUDHA', 'Teknik Lingkungan S1', 'Rantau Prapat', '06/05/2002', 'Laki-laki', '82297429403'),
(370, 'LANGGITA MAHARANI', 'Teknik Geodesi S1', 'PADANG PANJANG', '12/12/2001', 'Perempuan', '8,95352E+11'),
(371, 'YUDHA CHAIRUL ANAMI', 'Teknik Geodesi S1', 'Padang', '06/09/2001', 'Laki-laki', '82171295788'),
(372, 'NANIK FITRI HANDAYANI', 'Teknik Geodesi S1', 'Kerinci', '18/03/2003', 'Perempuan', '8,95342E+11'),
(373, 'PUJA KHARISMA', 'Teknik Geodesi S1', 'BUKITTINGGI', '04/06/2003', 'Perempuan', '89503685404'),
(374, 'BERRI SUWANDI', 'Teknik Geodesi S1', 'Simpang Tonang', '14/10/2001', 'Laki-laki', '83814735207'),
(375, 'ZENI ERISA PUSPA', 'Teknik Geodesi S1', 'Air Batumbuk', '25/03/2003', 'Perempuan', '82186579351'),
(376, 'VIXRI NUR SIDIQ', 'Teknik Geodesi S1', 'SOLOK', '24/05/2002', 'Laki-laki', '8,9534E+11'),
(377, 'IRFAN AL FATIH', 'Teknik Geodesi S1', 'Bukittinggi', '01/02/2002', 'Laki-laki', '82169047478'),
(378, 'ULFAH UMNIYYAH', 'Teknik Geodesi S1', 'PADANG', '09/10/2003', 'Perempuan', '85332624369'),
(379, 'ANDILA RAHMA PUTRI', 'Teknik Geodesi S1', 'PEKANBARU', '30/07/2001', 'Perempuan', '82152968868'),
(380, 'VIYONA GANESSA PUTRI', 'Teknik Geodesi S1', 'Bukittinggi', '21/12/2002', 'Perempuan', '85375524640'),
(381, 'OVI WAHANA SANDOVA', 'Teknik Geodesi S1', 'Sitapung', '26/01/2002', 'Laki-laki', '82388522825'),
(382, 'MUAMMAR KHADAFHI AL MUSYARAF', 'Teknik Geodesi S1', 'Bontang', '13/09/2001', 'Laki-laki', '82158446329'),
(383, 'REGITA LIA SUKMA', 'Teknik Geodesi S1', 'Koto Baru', '25/06/2003', 'Perempuan', '81211047659'),
(384, 'MUHAMADI VIKI', 'Teknik Geodesi S1', 'Padang', '12/03/2002', 'Laki-laki', '81374185903'),
(385, 'AYU FATIMATUZ ZAHRA', 'Teknik Geodesi S1', 'Pekanbaru', '15/05/2003', 'Perempuan', '81275619548'),
(386, 'AHMAD NAUFAL', 'Teknik Geodesi S1', 'Pasaman', '02/09/2002', 'Laki-laki', '82385996013'),
(387, 'ALHADI IHSAN', 'Teknik Geodesi S1', 'Tanah Datar', '06/03/2002', 'Laki-laki', '85831405540'),
(388, 'ARTHA KENCANA', 'Teknik Geodesi S1', 'Napal Putih', '10/11/2004', 'Laki-laki', '82234495575'),
(389, 'BARUKH TRIYESIMAEL', 'Teknik Geodesi S1', 'Sagitsi', '08/08/2003', 'Laki-laki', '8238737707'),
(390, 'NURUL FAUZIAH', 'Teknik Geodesi S1', 'Panyakalan', '09/12/2002', 'Perempuan', '89505909756'),
(391, 'ALDI SAPUTRA', 'Teknik Geodesi S1', 'Pekanbaru', '03/03/2003', 'Laki-laki', '82287695953'),
(392, 'ADITYA NICHO SAPUTRA', 'Teknik Geodesi S1', 'JAMBAK', '27/07/2002', 'Laki-laki', '83801961755'),
(393, 'ALHUDRI ARROFI', 'Teknik Geodesi S1', 'Sungai Nanam', '21/04/2002', 'Laki-laki', '81277703774'),
(394, 'FAZIR AKBAR NUGRAHA', 'Teknik Geodesi S1', 'Padang', '12/09/2002', 'Laki-laki', '85263568796'),
(395, 'TEGAR PERDINANZA', 'Teknik Geodesi S1', 'Pekanbaru', '11/09/2002', 'Laki-laki', '81263012722'),
(396, 'RIYAN FRASETYO', 'Teknik Geodesi S1', 'Pariaman', '09/02/2000', 'Laki-laki', '81261986049'),
(397, 'IRFAN LATIF', 'Teknik Geodesi S1', 'Pekanbaru', '25/12/2001', 'Laki-laki', '82286690729'),
(398, 'MUHAMMAD AZMI FIRDAUS', 'Teknik Geodesi S1', 'Bangansiapiapi', '13/06/2003', 'Laki-laki', '89606944535'),
(399, 'WAHYU NAUVAL HAFIZH', 'Teknik Geodesi S1', 'Solok', '07/08/2003', 'Laki-laki', '82386622069'),
(400, 'SELLY SELVINA', 'Teknik Geodesi S1', 'Selayo Tanang', '26/04/2003', 'Perempuan', '82171739287'),
(401, 'MUHAMMAD HIDAYAT', 'Teknik Geodesi S1', 'Padang Panjang', '24/06/2001', 'Laki-laki', '81371588075'),
(402, 'ANDIKA SAPURDA', 'Teknik Geodesi S1', 'Sungai Baung', '28/04/2003', 'Laki-laki', '82275620221'),
(403, 'AHMAT ISKANDAR', 'Teknik Geodesi S1', 'Belawan', '27/05/2003', 'Laki-laki', '81374247725'),
(404, 'FADJRI HIDAYAT ELMAN', 'Teknik Geodesi S1', 'Labuhan', '30/06/1999', 'Laki-laki', '83181183399'),
(405, 'SUCI RAMAYANA', 'Teknik Geodesi S1', 'Bukit Bio-bio', '03/09/2003', 'Perempuan', '82268137027'),
(406, 'AYUNI NAYLA PRATIWI', 'Teknik Informatika S1', 'Padang', '13/06/2001', 'Perempuan', '89617018675'),
(407, 'SASRA ADILLA', 'Teknik Informatika S1', 'Sungai Penuh', '24/04/2002', 'Perempuan', '82375706690'),
(408, 'SHELLA MONICA', 'Teknik Informatika S1', 'BATU LANGKAH BESAR', '17/12/2002', 'Perempuan', '85384627289'),
(409, 'AZ ZAHRA', 'Teknik Informatika S1', 'Prabumulih', '27/12/2001', 'Perempuan', '82262122450'),
(410, 'RINALDI RIAN', 'Teknik Informatika S1', 'Koto Bangko', '23/03/2003', 'Laki-laki', '82283703602'),
(411, 'AIDIA ISFA', 'Teknik Informatika S1', 'Air Bangis', '13/10/2002', 'Perempuan', '82287939685'),
(412, 'ALVINO ANDIKA', 'Teknik Informatika S1', 'Simpang', '07/09/2003', 'Laki-laki', '82171093641'),
(413, 'ANDRE HIDAYAT', 'Teknik Informatika S1', 'Muaro Bungo', '16/06/2002', 'Laki-laki', '82278300220'),
(414, 'DWI VINDI PUTRI MAULANA', 'Teknik Informatika S1', 'TALANG', '03/11/2001', 'Perempuan', '82318065486'),
(415, 'IRMA OKTAVIA', 'Teknik Informatika S1', 'Sukarami', '30/10/2002', 'Perempuan', '82285922892'),
(416, 'MAYA SANIA ALFIAH', 'Teknik Informatika S1', 'Kurnia Maju', '22/08/2003', 'Perempuan', '85363553483'),
(417, 'AHMAD ERLAN SAPUTRA', 'Teknik Informatika S1', 'Padang', '08/10/2002', 'Laki-laki', '83173630203'),
(418, 'ANIKA HARTANTI', 'Teknik Informatika S1', 'Air Bangis', '17/09/2001', 'Perempuan', '85763860827'),
(419, 'AZZYLA MAHREDHA', 'Teknik Informatika S1', 'Talang', '18/03/2003', 'Perempuan', '85263212320'),
(420, 'DELLA PATRICIA', 'Teknik Informatika S1', 'Padang', '15/04/2003', 'Perempuan', '83181994476'),
(421, 'FIRMAN ILAHI', 'Teknik Informatika S1', 'Padang', '30/05/2001', 'Laki-laki', '89617950824'),
(422, 'RURY SHAZKYYA ASTRADA', 'Teknik Informatika S1', 'Duri', '06/08/2002', 'Perempuan', '88708227847'),
(423, 'ALFARISI', 'Teknik Informatika S1', 'Bonjol', '22/07/2003', 'Laki-laki', '82384174731'),
(424, 'ANTONIUS HENDRO SABABAK', 'Teknik Informatika S1', 'Taileleu', '29/08/2001', 'Laki-laki', '82171395082'),
(425, 'ARIF RAHMAD', 'Teknik Informatika S1', 'Muara Labuh', '02/04/2001', 'Laki-laki', '82348668868'),
(426, 'ASYIFA MAHARANI GUSTINA', 'Teknik Informatika S1', 'Siguntur Muda', '12/08/2002', 'Perempuan', '82288637571'),
(427, 'PUJA APRILIA', 'Teknik Informatika S1', 'TANJUNG PINANG', '17/04/2003', 'Perempuan', '83161269340'),
(428, 'RAYHAN ADYTIA OEMARIN', 'Teknik Informatika S1', 'Bandung', '11/09/2003', 'Laki-laki', '89518099801'),
(429, 'REKA SEPTI', 'Teknik Informatika S1', 'Alahan Mati', '19/09/2002', 'Perempuan', '82385340032'),
(430, 'FEBRO YORALDI', 'Teknik Informatika S1', 'Parambahan', '31/01/2001', 'Laki-laki', '85210207375'),
(431, 'MUHAMMAD RAMVI SAPUTRA', 'Teknik Informatika S1', 'Padang', '05/01/2001', 'Laki-laki', '8,95616E+11'),
(432, 'NAJIB ALFARIZI', 'Teknik Informatika S1', 'Bukittinggi', '16/10/2002', 'Laki-laki', '82172634578'),
(433, 'RIPAL PUTRA MANDAI', 'Teknik Informatika S1', 'Koto Bangko', '20/04/2002', 'Laki-laki', '82268857067'),
(434, 'YUNDA SRIDEWI', 'Teknik Informatika S1', 'concong luar', '26/06/2002', 'Perempuan', '83196427875'),
(435, 'RAFLI ARDIAN', 'Teknik Informatika S1', 'Medan', '13/06/2003', 'Laki-laki', '83182443999'),
(436, 'RIDHA FAUZIAH', 'Teknik Informatika S1', 'Lubuk sikaping', '30/05/2001', 'Perempuan', '83182733338'),
(437, 'ROZI CANDRA', 'Teknik Informatika S1', 'Kampung Lambah', '27/07/2002', 'Laki-laki', '81365796520'),
(438, 'ULUL AZMI', 'Teknik Informatika S1', 'Padang', '14/02/2003', 'Laki-laki', '89503985874'),
(439, 'MUHAMAD IHSAN CT', 'Teknik Informatika S1', 'Bonjol', '25/04/2003', 'Laki-laki', '83849835351'),
(440, 'RYAN IKHSAN', 'Teknik Informatika S1', 'Pekanbaru', '30/03/2003', 'Laki-laki', '82387870924'),
(441, 'HERU SOPHIAN', 'Teknik Informatika S1', 'Kumpulan', '26/03/2003', 'Laki-laki', '82213447193'),
(442, 'JEAN THORIQ', 'Teknik Informatika S1', 'Padang', '14/10/2002', 'Laki-laki', '81363767294'),
(443, 'AZWAR YUSUF', 'Teknik Informatika S1', 'Sei Undan', '23/06/2002', 'Laki-laki', '82280374557'),
(444, 'MUSA AL KAZHIM', 'Teknik Informatika S1', 'Bengkulu', '22/01/2002', 'Laki-laki', '82373235102'),
(445, 'KHIRATUL RAHIM', 'Teknik Informatika S1', 'Padang', '15/05/1996', 'Laki-laki', '81211220643'),
(446, 'RAJA MUSTOPA SIREGAR', 'Teknik Informatika S1', 'Sipange Godang', '22/12/2002', 'Laki-laki', '81262492560'),
(447, 'PAISAL FAHRU LUBIS', 'Teknik Informatika S1', 'Saba Dolok', '16/05/2003', 'Laki-laki', '81269533252'),
(448, 'KHAIRUL AGUNG BASTIAR', 'Teknik Informatika S1', 'Padang Sidimpuan', '21/07/2003', 'Laki-laki', '82211729849'),
(449, 'ABDI SUGANDA', 'Teknik Informatika S1', 'Kapuh', '09/09/1999', 'Laki-laki', '82288557855'),
(450, 'MUHAMMAD YUSUF AL QARDHAWI', 'Teknik Informatika S1', 'Padang', '25/08/2001', 'Laki-laki', ''),
(451, 'VERO AGRISANDA', 'Teknik Informatika S1', 'Lubuk Sanai', '29/08/2001', 'Laki-laki', '82269314996'),
(452, 'CLINTON SAN WISMAR PANJAITAN', 'Teknik Informatika S1', 'Padang', '01/04/1999', 'Laki-laki', '81226288432'),
(453, 'SRI ERMA NOVIRA', 'Teknik Informatika S1', 'Pematang Panjang', '28/11/2002', 'Perempuan', '85376757201'),
(454, 'MUHAMMAD HAFIZH JUSRA', 'Teknik Informatika S1', 'K.Simpang', '24/10/2003', 'Laki-laki', '85363553539'),
(455, 'IKHFAL MAYENDRA', 'Teknik Informatika S1', 'Payakumbuh', '25/05/2001', 'Laki-laki', '82391981941'),
(456, 'AZHANI PUTRI KIRANTI', 'Teknik Informatika S1', 'SOLOK', '15/07/2003', 'Perempuan', '85217735549'),
(457, 'ALWIRA', 'Teknik Informatika S1', 'Pematang', '24/08/2003', 'Laki-laki', '81268450421'),
(458, 'ISRA ANGGINA PUTRI NASUTION', 'Teknik Informatika S1', 'Psar Kotanopan', '05/10/2003', 'Perempuan', '81990723914'),
(459, 'RIZQY YOANDA', 'Teknik Informatika S1', 'Padang', '15/04/2003', 'Laki-laki', '8116690403'),
(460, 'PANGKU ADIANSYAH SIREGAR', 'Teknik Informatika S1', 'Siboris Lombang', '10/09/1998', 'Laki-laki', '82382807653'),
(461, 'ALFONSUS PUTERA WARUWU', 'Teknik Informatika S1', 'Padang', '26/10/1997', 'Laki-laki', '82176067612'),
(462, 'SASKIA RAMADANTI', 'Teknik Informatika S1', 'Mungo', '07/11/2002', 'Perempuan', '82171095341'),
(463, 'MUHAMAD MAULANA BAYU', 'Teknik Informatika S1', 'Serasah', '06/07/2003', 'Laki-laki', '85273257491'),
(464, 'PUTERI AMELIA AZLI', 'Teknik Informatika S1', 'Pekanbaru', '18/02/2002', 'Perempuan', '85382691780'),
(465, 'FAJAR AIDIL PUTRA', 'Teknik Informatika S1', 'Kampung Tangah', '27/01/2003', 'Laki-laki', '85265319892'),
(466, 'HOIRUL', 'Teknik Informatika S1', 'Rantau Kasai', '08/05/2003', 'Laki-laki', '82283910169'),
(467, 'SABRINA AZHARI', 'Teknik Informatika S1', 'Padang Panjang', '01/02/2002', 'Perempuan', '83180317624'),
(468, 'GILANG RAHMAT GUSTIANTO', 'Teknik Informatika S1', 'Padang', '16/08/2003', 'Laki-laki', '89617938874'),
(469, 'SURYA RIDHONI SAPUTRA', 'Teknik Informatika S1', 'Padang', '01/07/2003', 'Laki-laki', '89621771716'),
(470, 'RANDI ALTRIONANDA', 'Teknik Informatika S1', 'Perawang', '10/05/2002', 'Laki-laki', '82391815421'),
(471, 'PUTRA ANUGRAH', 'Teknik Informatika S1', 'Batusangkar', '02/09/2002', 'Laki-laki', '85363277750'),
(472, 'AHMAD RESKI', 'Teknik Informatika S1', 'Cubadak', '17/07/2001', 'Laki-laki', '82288046386'),
(473, 'RAYHAN RANGGA PUTRA', 'Teknik Informatika S1', 'Jakarta', '10/05/2002', 'Laki-laki', '82169910463'),
(474, 'ADITYA ZULFAJRI', 'Teknik Informatika S1', 'Padang', '19/04/2001', 'Laki-laki', '85878168697'),
(475, 'RAHMAT HASAYANGAN SIMANJUNTAK', 'Teknik Informatika S1', 'Medan', '02/12/2002', 'Laki-laki', '82368453269'),
(476, 'DINA FADIAH HERIKA', 'Teknik Informatika S1', 'PADANG', '30/11/2002', 'Perempuan', '82284333411'),
(477, 'MUBAROK ADABI', 'Teknik Informatika S1', 'sialang atas', '26/12/2001', 'Laki-laki', '85163704893'),
(478, 'ROZA WULANDA', 'Teknik Informatika S1', 'Simpang Tiga', '24/01/2003', 'Perempuan', '82384362498'),
(479, 'ADITYA WARSITO KURNIAWAN', 'Teknik Informatika S1', 'PURBALINGGA', '20/07/1996', 'Laki-laki', '81252536789'),
(480, 'RIZKY USRIANSYAH', 'Teknik Informatika S1', 'Padang', '20/07/1994', 'Laki-laki', ''),
(481, 'RIZKI RAHMANDA', 'Teknik Informatika S1', 'Pariaman', '09/05/2002', 'Laki-laki', '82312248237'),
(482, 'JOHANTINUS.S', 'Teknik Informatika S1', 'Madobag', '29/02/2000', 'Laki-laki', '82384109792'),
(483, 'MUHAMMAD ADITYA', 'Teknik Informatika S1', 'Padang', '14/05/2003', 'Laki-laki', '89531612139'),
(484, 'BINTANG LANANG FAHLEVIE', 'Teknik Informatika S1', 'Pariaman', '30/08/2002', 'Laki-laki', '82288626448');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_kriteria`
--

CREATE TABLE `nilai_kriteria` (
  `id_nilaikriteria` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `nilai` float NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai_kriteria`
--

INSERT INTO `nilai_kriteria` (`id_nilaikriteria`, `id_kriteria`, `nilai`, `keterangan`) VALUES
(29, 7, 4, '80 - 100'),
(30, 7, 3, '60 - 79'),
(31, 7, 2, '40 - 59'),
(32, 7, 1, '0 - 39'),
(33, 8, 4, '80 - 100'),
(34, 8, 3, '60 - 79'),
(35, 8, 2, '40 - 59'),
(36, 8, 1, '0 - 39'),
(37, 9, 4, '8 - 10'),
(39, 9, 3, '6 - 7.9'),
(40, 9, 2, '4 - 5.9'),
(41, 9, 1, '0 - 3.9'),
(42, 10, 4, '<= 500000'),
(43, 10, 3, '1.100.000 - 3.000.000'),
(44, 10, 2, '3.100.000 - 5.000.000'),
(45, 10, 1, '5.100.000 =>');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_mahasiswa`
--

CREATE TABLE `nilai_mahasiswa` (
  `id_nilaimahasiswa` int(3) NOT NULL,
  `id_mahasiswa` int(3) NOT NULL,
  `id_jenispendaftaran` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `id_nilaikriteria` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai_mahasiswa`
--

INSERT INTO `nilai_mahasiswa` (`id_nilaimahasiswa`, `id_mahasiswa`, `id_jenispendaftaran`, `id_kriteria`, `id_nilaikriteria`) VALUES
(77, 1, 3, 7, 30),
(78, 1, 3, 8, 34),
(79, 1, 3, 9, 39),
(80, 1, 3, 10, 43),
(81, 2, 3, 7, 31),
(82, 2, 3, 8, 33),
(83, 2, 3, 9, 39),
(84, 2, 3, 10, 43),
(85, 3, 3, 7, 30),
(86, 3, 3, 8, 33),
(87, 3, 3, 9, 39),
(88, 3, 3, 10, 42),
(89, 4, 4, 7, 30),
(90, 4, 4, 8, 33),
(91, 4, 4, 9, 40),
(92, 4, 4, 10, 44),
(93, 5, 4, 7, 29),
(94, 5, 4, 8, 34),
(95, 5, 4, 9, 37),
(96, 5, 4, 10, 45),
(97, 6, 4, 7, 30),
(98, 6, 4, 8, 35),
(99, 6, 4, 9, 40),
(100, 6, 4, 10, 44),
(101, 7, 5, 7, 34),
(102, 7, 5, 8, 39),
(103, 7, 5, 9, 42),
(104, 8, 5, 7, 29),
(105, 8, 5, 8, 34),
(106, 8, 5, 9, 39),
(107, 8, 5, 10, 43),
(108, 9, 5, 7, 31),
(109, 9, 5, 8, 34),
(110, 9, 5, 9, 39),
(111, 9, 5, 10, 43),
(112, 18, 3, 7, 30),
(113, 18, 3, 8, 33),
(114, 18, 3, 9, 37),
(115, 18, 3, 10, 42),
(116, 19, 3, 7, 30),
(117, 19, 3, 8, 34),
(118, 19, 3, 9, 39),
(119, 19, 3, 10, 43),
(120, 20, 3, 7, 30),
(121, 20, 3, 8, 34),
(122, 20, 3, 9, 40),
(123, 20, 3, 10, 43),
(124, 21, 4, 7, 30),
(125, 21, 4, 8, 34),
(126, 21, 4, 9, 40),
(127, 21, 4, 10, 42),
(128, 22, 4, 7, 30),
(129, 22, 4, 8, 33),
(130, 22, 4, 9, 37),
(131, 22, 4, 10, 44),
(132, 23, 4, 7, 29),
(133, 23, 4, 8, 33),
(134, 23, 4, 9, 37),
(135, 23, 4, 10, 44),
(136, 24, 5, 7, 31),
(137, 24, 5, 8, 34),
(138, 24, 5, 9, 39),
(139, 24, 5, 10, 43),
(140, 25, 5, 7, 30),
(141, 25, 5, 8, 33),
(142, 25, 5, 9, 39),
(143, 25, 5, 10, 42),
(144, 26, 5, 7, 30),
(145, 26, 5, 8, 34),
(146, 26, 5, 9, 39),
(147, 26, 5, 10, 42),
(148, 47, 3, 7, 30),
(149, 47, 3, 8, 34),
(150, 47, 3, 9, 37),
(151, 47, 3, 10, 42),
(152, 48, 3, 7, 30),
(153, 48, 3, 8, 34),
(154, 48, 3, 9, 37),
(155, 48, 3, 10, 45),
(156, 49, 3, 7, 31),
(157, 49, 3, 8, 34),
(158, 49, 3, 9, 39),
(159, 49, 3, 10, 42),
(160, 50, 4, 7, 30),
(161, 50, 4, 8, 35),
(162, 50, 4, 9, 39),
(163, 50, 4, 10, 44),
(164, 51, 4, 7, 30),
(165, 51, 4, 8, 33),
(166, 51, 4, 9, 37),
(167, 51, 4, 10, 44),
(168, 52, 4, 7, 30),
(169, 52, 4, 8, 35),
(170, 52, 4, 9, 37),
(171, 52, 4, 10, 45),
(172, 53, 5, 7, 31),
(173, 53, 5, 8, 34),
(174, 53, 5, 9, 37),
(175, 53, 5, 10, 43),
(176, 54, 5, 7, 29),
(177, 54, 5, 8, 35),
(178, 54, 5, 9, 40),
(179, 54, 5, 10, 45),
(180, 55, 5, 7, 31),
(181, 55, 5, 8, 33),
(182, 55, 5, 9, 39),
(183, 55, 5, 10, 43),
(184, 67, 3, 7, 30),
(185, 67, 3, 8, 35),
(186, 67, 3, 9, 39),
(187, 67, 3, 10, 43),
(188, 68, 3, 7, 29),
(189, 68, 3, 8, 33),
(190, 68, 3, 9, 37),
(191, 68, 3, 10, 45),
(192, 69, 3, 7, 31),
(193, 69, 3, 8, 33),
(194, 69, 3, 9, 39),
(195, 69, 3, 10, 44),
(196, 70, 4, 7, 31),
(197, 70, 4, 8, 35),
(198, 70, 4, 9, 40),
(199, 70, 4, 10, 42),
(200, 71, 4, 7, 30),
(201, 71, 4, 8, 34),
(202, 71, 4, 9, 41),
(203, 71, 4, 10, 42),
(204, 72, 4, 7, 30),
(205, 72, 4, 8, 33),
(206, 72, 4, 9, 39),
(207, 72, 4, 10, 43),
(208, 73, 5, 7, 29),
(209, 73, 5, 8, 33),
(210, 73, 5, 9, 39),
(211, 73, 5, 10, 43),
(212, 74, 5, 7, 29),
(213, 74, 5, 8, 34),
(214, 74, 5, 9, 39),
(215, 74, 5, 10, 43),
(216, 75, 5, 7, 31),
(217, 75, 5, 8, 35),
(218, 75, 5, 9, 37),
(219, 75, 5, 10, 43),
(220, 116, 3, 7, 31),
(221, 116, 3, 8, 33),
(222, 116, 3, 9, 39),
(223, 116, 3, 10, 45),
(224, 117, 3, 7, 30),
(225, 117, 3, 8, 33),
(226, 117, 3, 9, 37),
(227, 117, 3, 10, 44),
(228, 118, 3, 7, 31),
(229, 118, 3, 8, 35),
(230, 118, 3, 9, 37),
(231, 118, 3, 10, 42),
(232, 119, 4, 7, 29),
(233, 119, 4, 8, 35),
(234, 119, 4, 9, 39),
(235, 119, 4, 10, 45),
(236, 120, 4, 7, 29),
(237, 120, 4, 8, 33),
(238, 120, 4, 9, 39),
(239, 120, 4, 10, 43),
(240, 121, 4, 7, 30),
(241, 121, 4, 8, 33),
(242, 121, 4, 9, 39),
(243, 121, 4, 10, 43),
(244, 122, 5, 7, 31),
(245, 122, 5, 8, 33),
(246, 122, 5, 9, 39),
(247, 122, 5, 10, 45),
(248, 123, 5, 7, 29),
(249, 123, 5, 8, 33),
(250, 123, 5, 9, 37),
(251, 123, 5, 10, 45),
(252, 124, 4, 7, 30),
(253, 124, 4, 8, 33),
(254, 124, 4, 9, 40),
(255, 124, 4, 10, 44),
(256, 194, 3, 7, 30),
(257, 194, 3, 8, 34),
(258, 194, 3, 9, 40),
(259, 194, 3, 10, 44),
(260, 195, 3, 7, 30),
(261, 195, 3, 8, 34),
(262, 195, 3, 9, 40),
(263, 195, 3, 10, 42),
(264, 196, 3, 7, 29),
(265, 196, 3, 8, 34),
(266, 196, 3, 9, 39),
(267, 196, 3, 10, 44),
(268, 197, 4, 7, 29),
(269, 197, 4, 8, 35),
(270, 197, 4, 9, 37),
(271, 197, 4, 10, 42),
(272, 198, 4, 7, 29),
(273, 198, 4, 8, 34),
(274, 198, 4, 9, 39),
(275, 198, 4, 10, 42),
(280, 199, 5, 7, 30),
(281, 199, 5, 8, 33),
(282, 199, 5, 9, 37),
(283, 199, 5, 10, 43),
(284, 200, 5, 7, 30),
(285, 200, 5, 8, 33),
(286, 200, 5, 9, 39),
(287, 200, 5, 10, 45),
(288, 201, 5, 7, 30),
(289, 201, 5, 8, 33),
(290, 201, 5, 9, 37),
(291, 201, 5, 10, 43),
(292, 364, 3, 7, 29),
(293, 364, 3, 8, 33),
(294, 364, 3, 9, 39),
(295, 364, 3, 10, 43),
(296, 365, 3, 7, 30),
(297, 365, 3, 8, 33),
(298, 365, 3, 9, 39),
(299, 365, 3, 10, 44),
(300, 366, 4, 7, 29),
(301, 366, 4, 8, 34),
(302, 366, 4, 9, 40),
(303, 366, 4, 10, 43),
(304, 367, 4, 7, 29),
(305, 367, 4, 8, 35),
(306, 367, 4, 9, 39),
(307, 367, 4, 10, 42),
(308, 368, 5, 7, 29),
(309, 368, 5, 8, 34),
(310, 368, 5, 9, 39),
(311, 368, 5, 10, 43),
(312, 369, 5, 7, 29),
(313, 369, 5, 8, 33),
(314, 369, 5, 9, 39),
(315, 369, 5, 10, 44),
(316, 370, 3, 7, 31),
(317, 370, 3, 8, 33),
(318, 370, 3, 9, 39),
(319, 370, 3, 10, 43),
(320, 371, 3, 7, 30),
(321, 371, 3, 8, 34),
(322, 371, 3, 9, 39),
(323, 371, 3, 10, 44),
(324, 372, 3, 7, 29),
(325, 372, 3, 8, 33),
(326, 372, 3, 9, 39),
(327, 372, 3, 10, 42),
(328, 373, 4, 7, 29),
(329, 373, 4, 8, 33),
(330, 373, 4, 9, 39),
(331, 373, 4, 10, 42),
(332, 374, 4, 7, 30),
(333, 374, 4, 8, 33),
(334, 374, 4, 9, 39),
(335, 374, 4, 10, 42),
(336, 375, 4, 7, 30),
(337, 375, 4, 8, 33),
(338, 375, 4, 9, 37),
(339, 375, 4, 10, 42),
(340, 376, 5, 7, 30),
(341, 376, 5, 8, 34),
(342, 376, 5, 9, 39),
(343, 376, 5, 10, 45),
(344, 377, 5, 7, 30),
(345, 377, 5, 8, 33),
(346, 377, 5, 9, 40),
(347, 377, 5, 10, 44),
(348, 378, 5, 7, 30),
(349, 378, 5, 8, 33),
(350, 378, 5, 9, 40),
(351, 378, 5, 10, 45),
(352, 481, 3, 7, 30),
(353, 481, 3, 8, 33),
(354, 481, 3, 9, 40),
(355, 481, 3, 10, 43),
(356, 484, 3, 7, 29),
(357, 484, 3, 8, 34),
(358, 484, 3, 9, 39),
(359, 484, 3, 10, 45),
(360, 480, 3, 7, 29),
(361, 480, 3, 8, 33),
(362, 480, 3, 9, 39),
(363, 480, 3, 10, 43),
(364, 482, 4, 7, 30),
(365, 482, 4, 8, 33),
(366, 482, 4, 9, 40),
(367, 482, 4, 10, 42),
(368, 477, 4, 7, 29),
(369, 477, 4, 8, 33),
(370, 477, 4, 9, 39),
(371, 477, 4, 10, 42),
(372, 476, 4, 7, 29),
(373, 476, 4, 8, 34),
(374, 476, 4, 9, 39),
(375, 476, 4, 10, 42),
(376, 473, 5, 7, 29),
(377, 473, 5, 8, 34),
(378, 473, 5, 9, 39),
(379, 473, 5, 10, 42),
(380, 478, 5, 7, 29),
(381, 478, 5, 8, 34),
(382, 478, 5, 9, 39),
(383, 478, 5, 10, 45);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `Id_admin` int(3) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`Id_admin`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$M80eHFnCpX6RzDiN7LfRNeNMmUZM51y4gT9NqnerVnud9onIWBvyq');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD PRIMARY KEY (`id_bobotkriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`),
  ADD KEY `id_jenispendaftaran` (`id_jenispendaftaran`);

--
-- Indeks untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `id_jenispendaftaran` (`id_jenispendaftaran`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`);

--
-- Indeks untuk tabel `jenis_pendaftaran`
--
ALTER TABLE `jenis_pendaftaran`
  ADD PRIMARY KEY (`id_jenispendaftaran`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`);

--
-- Indeks untuk tabel `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  ADD PRIMARY KEY (`id_nilaikriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `nilai_mahasiswa`
--
ALTER TABLE `nilai_mahasiswa`
  ADD PRIMARY KEY (`id_nilaimahasiswa`),
  ADD KEY `id_kriteria` (`id_kriteria`),
  ADD KEY `id_nilaikriteria` (`id_nilaikriteria`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_jenispendaftaran` (`id_jenispendaftaran`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id_admin`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  MODIFY `id_bobotkriteria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `jenis_pendaftaran`
--
ALTER TABLE `jenis_pendaftaran`
  MODIFY `id_jenispendaftaran` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2021710008;

--
-- AUTO_INCREMENT untuk tabel `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  MODIFY `id_nilaikriteria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `nilai_mahasiswa`
--
ALTER TABLE `nilai_mahasiswa`
  MODIFY `id_nilaimahasiswa` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=384;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `Id_admin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD CONSTRAINT `bobot_kriteria_ibfk_1` FOREIGN KEY (`id_jenispendaftaran`) REFERENCES `jenis_pendaftaran` (`id_jenispendaftaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bobot_kriteria_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_jenispendaftaran`) REFERENCES `jenis_pendaftaran` (`id_jenispendaftaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_ibfk_2` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  ADD CONSTRAINT `nilai_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_mahasiswa`
--
ALTER TABLE `nilai_mahasiswa`
  ADD CONSTRAINT `nilai_mahasiswa_ibfk_1` FOREIGN KEY (`id_jenispendaftaran`) REFERENCES `jenis_pendaftaran` (`id_jenispendaftaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_mahasiswa_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_mahasiswa_ibfk_3` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_mahasiswa_ibfk_4` FOREIGN KEY (`id_nilaikriteria`) REFERENCES `nilai_kriteria` (`id_nilaikriteria`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
