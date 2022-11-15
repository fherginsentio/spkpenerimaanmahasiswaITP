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
    case 'pendaftaran':
        $query = "UPDATE jenis_pendaftaran SET namapendaftaran='$pendaftaran' WHERE id_jenispendaftaran='$id'";
        $crud->update($query, $konek, './?page=pendaftaran');
        break;
    case 'mahasiswa':
        $cek = "SELECT namamahasiswa FROM mahasiswa WHERE namamahasiswa='$mahasiswa', jurusan='$jurusan', tpt_lahir='$tpt_lahir', tgl_lahir= '$tgl_lahir', jk='$jk',hp='$hp' ";
        $query = "UPDATE mahasiswa SET namamahasiswa='$mahasiswa',jurusan='$jurusan',tpt_lahir='$tpt_lahir', tgl_lahir='$tgl_lahir', jk='$jk', hp='$hp' WHERE id_mahasiswa='$id'";
        $crud->update($cek, $query, $konek, './?page=mahasiswa');
        break;
    case 'kriteria':
        $cek = "SELECT namaKriteria FROM kriteria WHERE namaKriteria='$kriteria'";
        $query = "UPDATE kriteria SET namaKriteria='$kriteria',sifat='$sifat' WHERE id_kriteria='$id';";
        $crud->multiUpdate($cek, $query, $konek, './?page=kriteria');
        break;
    case 'subkriteria':
        $cek = "SELECT id_nilaikriteria FROM nilai_kriteria WHERE (id_kriteria='$kriteria' AND nilai ='$nilai') OR (id_kriteria='$kriteria' AND keterangan = '$keterangan')";
        $query = "UPDATE nilai_kriteria SET id_kriteria='$kriteria',nilai='$nilai',keterangan='$keterangan' WHERE id_nilaikriteria='$id'";
        $crud->multiUpdate($cek, $query, $konek, './?page=subkriteria');
        break;
    case 'bobot':
        $query = null;
        for ($i = 0; $i < count($id); $i++) {
            $query .= "UPDATE bobot_kriteria SET bobot='$bobot[$i]' WHERE id_bobotkriteria='$id[$i]';";
        }
        $crud->update($query, $konek, './?page=bobot');
        break;
    case 'nilai':
        $query = null;
        for ($i = 0; $i < count($id); $i++) {
            $query .= "UPDATE nilai_mahasiswa SET id_nilaikriteria='$nilai[$i]' WHERE id_nilaimahasiswa='$id[$i]';";
        }
        $crud->update($query, $konek, './?page=penilaian');
        break;
}
