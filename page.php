<?php
$page = htmlspecialchars(@$_GET['page']);
switch ($page) {
    case null:
        include 'page/beranda.php';
        break;
    case 'beranda':
        include 'page/beranda.php';
        break;
    case 'pendaftaran':
        include 'page/pendaftaran.php';
        break;
    case 'mahasiswa':
        include 'page/mahasiswa.php';
        break;
    case 'kriteria':
        include 'page/kriteria.php';
        break;
    case 'subkriteria':
        include 'page/subkriteria.php';
        break;
    case 'bobot':
        include 'page/bobot.php';
        break;
    case 'penilaian':
        include 'page/nilai.php';
        break;
    case 'hasil':
        include 'page/hasil.php';
        break;
    case 'laporankeseluruhan':
        include 'page/laporankeseluruhan.php';
        break;
    case 'tambahbobot':
        include 'page/tambahbobot.php';
        break;
    default:
        include 'page/404.php';
}
