<?php
require '../connect.php';
require '../class/crud.php';
$crud = new crud($konek);

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $id = @$_GET['id'];
    $op = @$_GET['op'];
} else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = @$_POST['id'];
    $op = @$_POST['op'];
}
$pendaftaran = @$_POST['pendaftaran'];
$mahasiswa = @$_POST['mahasiswa'];
$jurusan = @$_POST['jurusan'];
$tpt_lahir = @$_POST['tpt_lahir'];
$tgl_lahir = @$_POST['tgl_lahir'];
$jk = @$_POST['jk'];
$hp = @$_POST['hp'];
$kriteria = @$_POST['kriteria'];
$sifat = @$_POST['sifat'];
$nilai = @$_POST['nilai'];
$keterangan = @$_POST['keterangan'];
$bobot = @$_POST['bobot'];
switch ($op) {
    case 'pendaftaran': //tambah data pendaftaran
        $query = "INSERT INTO jenis_pendaftaran (namapendaftaran) VALUES ('$pendaftaran')";
        $crud->addData($query, $konek);
        break;
    case 'mahasiswa': //tambah data mahasiswa
        $cek = "SELECT namamahasiswa FROM mahasiswa WHERE namamahasiswa='$mahasiswa', jurusan='$jurusan', tpt_lahir='$tpt_lahir',tgl_lahir='$tgl_lahir',jk='$jk',hp='$hp'";
        $query = "INSERT INTO mahasiswa (namamahasiswa,jurusan,tpt_lahir,tgl_lahir,jk,hp) VALUES ('$mahasiswa','$jurusan','$tpt_lahir','$tgl_lahir','$jk','$hp');";
        $crud->multiAddData($cek, $query, $konek);
        break;
    case 'kriteria': //tambah data kriteria
        $cek = "SELECT namaKriteria FROM kriteria WHERE namaKriteria='$kriteria'";
        $query = null;
        $query = "INSERT INTO kriteria (namaKriteria,sifat) VALUES ('$kriteria','$sifat')";
        $crud->multiAddData($cek, $query, $konek);
        break;
    case 'subkriteria': //tambah data sub kriteria
        $cek = "SELECT id_nilaikriteria FROM nilai_kriteria WHERE (id_kriteria='$kriteria' AND nilai ='$nilai') OR (id_kriteria='$kriteria' AND keterangan = '$keterangan')";
        $query = null;
        $query .= "INSERT INTO nilai_kriteria (id_kriteria,nilai,keterangan) VALUES ('$kriteria','$nilai','$keterangan');";
        $crud->multiAddData($cek, $query, $konek);
        break;
    case 'bobot': //tambah data bobot
        $cek = "SELECT id_bobotkriteria FROM bobot_kriteria WHERE id_jenispendaftaran='$pendaftaran'";
        $query = null;
        for ($i = 0; $i < count($kriteria); $i++) {
            $query .= "INSERT INTO bobot_kriteria (id_jenispendaftaran,id_kriteria,bobot) VALUES ('$pendaftaran','$kriteria[$i]','$bobot[$i]');";
        }
        $crud->multiAddData($cek, $query, $konek);
        break;
    case 'nilai': //tambah data nilai
        $cek = "SELECT id_mahasiswa FROM nilai_mahasiswa WHERE id_mahasiswa='$mahasiswa'";
        $query = null;
        for ($i = 0; $i < count($nilai); $i++) {
            $query .= "INSERT INTO nilai_mahasiswa (id_mahasiswa,id_jenispendaftaran,id_kriteria,id_nilaikriteria) VALUES ('$mahasiswa','$pendaftaran','$kriteria[$i]','$nilai[$i]');";
        }
        $crud->multiAddData($cek, $query, $konek);
        break;
}
