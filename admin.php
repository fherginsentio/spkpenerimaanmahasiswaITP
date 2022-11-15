<?php
require './connect.php';
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="SPK_SAW">
    <title>Sistem Pendukung keputusan pemilihan Mahasiswa</title>
    <link rel="stylesheet" type="text/css" href="asset/css/style.css">
    <link rel="stylesheet" type="text/css" href="asset/plugin/font-icon/css/fontawesome-all.min.css">
</head>

<body>
    <header>
        <h1>
            <span class="text-green">Sistem Pendukung Keputusan<br> pemilihan calon mahasiswa di Institut Teknologi Padang<br> menggunakan metode Simple Addictive Weighting</span>
        </h1>
    </header>
    <nav>
        <?php include "nav.php"; ?>
    </nav>
    <main>
        <div id="bg-green"></div>
        <div id="main-body">
            <?php include "page.php"; ?>
        </div>
    </main>
    <script src="asset/js/jquery.js" type="text/javascript"></script>
    <script src="asset/js/main.js" type="text/javascript"></script>
</body>

</html>