<?php

/**
 * Created by PhpStorm.
 * User: dimas
 * Date: 23/06/2018
 * Time: 10:50
 */
class saw
{

    private $konek;
    private $idCookie;
    private $idJurusan;
    public $simpanNormalisasi = array();
    public function setconfig($konek, $idCookie, $idJurusan)
    {
        $this->konek = $konek;
        $this->idCookie = $idCookie;
        $this->idJurusan = $idJurusan;


        $filterjurusan = "";

        if (!empty($this->idJurusan)) {

            $this->FilterJurusan = "and mahasiswa.jurusan ='$this->idJurusan' ";
        }
    }
    public function getConnect()
    {
        return $this->konek;
    }
    //mendapatkan kriteria
    public function getKriteria()
    {
        $data = array();
        $querykriteria = "SELECT namaKriteria FROM kriteria"; //query tabel kriteria
        $execute = $this->getConnect()->query($querykriteria);
        while ($row = $execute->fetch_array(MYSQLI_ASSOC)) {
            array_push($data, $row['namaKriteria']);
        }
        return $data;
    }
    //mendapatkan alternative
    public function getAlternative()
    {
        $data = array();




        $queryAlternative = "SELECT mahasiswa.namamahasiswa AS namamahasiswa,id_mahasiswa FROM nilai_mahasiswa INNER JOIN mahasiswa USING(id_mahasiswa) WHERE id_jenispendaftaran='$this->idCookie'  $this->FilterJurusan  GROUP BY id_mahasiswa ";
        $execute = $this->getConnect()->query($queryAlternative);
        while ($row = $execute->fetch_array(MYSQLI_ASSOC)) {
            array_push($data, array("namamahasiswa" => $row['namamahasiswa'], "id_mahasiswa" => $row['id_mahasiswa']));
        }
        return $data;
    }
    public function getNilaiMatriks($id_mahasiswa)
    {
        $data = array();
        $queryGetNilai = "SELECT nilai_kriteria.nilai AS nilai,kriteria.sifat AS sifat,nilai_mahasiswa.id_kriteria AS id_kriteria FROM nilai_mahasiswa JOIN kriteria ON kriteria.id_kriteria=nilai_mahasiswa.id_kriteria JOIN nilai_kriteria ON nilai_kriteria.id_nilaikriteria=nilai_mahasiswa.id_nilaikriteria WHERE (id_jenispendaftaran='$this->idCookie' AND id_mahasiswa='$id_mahasiswa')";
        $execute = $this->getConnect()->query($queryGetNilai);
        while ($row = $execute->fetch_array(MYSQLI_ASSOC)) {
            array_push($data, array(
                "nilai" => $row['nilai'],
                "sifat" => $row['sifat'],
                "id_kriteria" => $row['id_kriteria']
            ));
        }
        return $data;
    }
    public function getArrayNilai($id_kriteria)
    {
        $data = array();
        $queryGetArrayNilai = "SELECT nilai_kriteria.nilai AS nilai FROM nilai_mahasiswa INNER JOIN nilai_kriteria ON nilai_mahasiswa.id_nilaikriteria=nilai_kriteria.id_nilaikriteria WHERE nilai_mahasiswa.id_kriteria='$id_kriteria' AND nilai_mahasiswa.id_jenispendaftaran='$this->idCookie'";
        $execute = $this->getConnect()->query($queryGetArrayNilai);
        while ($row = $execute->fetch_array(MYSQLI_ASSOC)) {
            array_push($data, $row['nilai']);
        }
        return $data;
    }
    //rumus normalisasai
    public function normalisasi($array, $sifat, $nilai)
    {
        if ($sifat == 'Benefit') {
            $result = $nilai / max($array);
        } elseif ($sifat == 'Cost') {
            $result = min($array) / $nilai;
        }
        return round($result, 3);
    }
    //mendapatkan bobot kriteria
    public function getBobot($id_kriteria)
    {
        $queryBobot = "SELECT bobot FROM bobot_kriteria WHERE id_jenispendaftaran='$this->idCookie' AND id_kriteria='$id_kriteria' ";
        $row = $this->getConnect()->query($queryBobot)->fetch_array(MYSQLI_ASSOC);
        return $row['bobot'];
    }
    //meyimpan hasil perhitungan
    public function simpanHasil($id_mahasiswa, $hasil)
    {
        $queryCek = "SELECT hasil FROM hasil WHERE id_mahasiswa='$id_mahasiswa' AND id_jenispendaftaran='$this->idCookie'";
        $execute = $this->getConnect()->query($queryCek);
        if ($execute->num_rows > 0) {
            $querySimpan = "UPDATE hasil SET hasil='$hasil' WHERE id_mahasiswa='$id_mahasiswa' AND id_jenispendaftaran='$this->idCookie'";
        } else {
            $querySimpan = "INSERT INTO hasil(hasil,id_mahasiswa,id_jenispendaftaran) VALUES ('$hasil','$id_mahasiswa','$this->idCookie')";
        }
        $execute = $this->getConnect()->query($querySimpan);
    }
    //Kmencari kesimpulan
    public function getHasil($limit = "")
    {
        /*echo $queryHasil     =   "SELECT hasil.hasil AS hasil,jenis_pendaftaran.namapendaftaran,mahasiswa.namamahasiswa AS namamahasiswa FROM hasil JOIN jenis_pendaftaran ON jenis_pendaftaran.id_jenispendaftaran=hasil.id_jenispendaftaran JOIN mahasiswa ON mahasiswa.id_mahasiswa=hasil.id_mahasiswa WHERE hasil.hasil=(SELECT MAX(hasil) FROM hasil as hs join mahasiswa as mh on hs.id_mahasiswa = mh.id_mahasiswa WHERE hs.id_jenispendaftaran='$this->idCookie' and mh.jurusan ='$this->idJurusan'  )  "; */

        $FilterLimit = "";

        if (!empty($limit)) {

            $FilterLimit = "LIMIT " . $limit;
        }

        $queryHasil     = "SELECT mh.id_mahasiswa, hasil, pf.namapendaftaran as namapendaftaran , mh.namamahasiswa FROM hasil as hs join mahasiswa as mh on hs.id_mahasiswa = mh.id_mahasiswa join jenis_pendaftaran as pf on hs.id_jenispendaftaran = pf.id_jenispendaftaran WHERE hs.id_jenispendaftaran='$this->idCookie' and mh.jurusan ='$this->idJurusan' order by hs.hasil DESC $FilterLimit ";

        if (!empty($limit)) {

            $execute        =   $this->getConnect()->query($queryHasil)->fetch_array(MYSQLI_ASSOC);
            echo "<p>Jadi calon mahasiswa terbaik <i>$execute[namapendaftaran]</i> jatuh pada <i>$execute[namamahasiswa]</i> dengan Nilai <b>" . round($execute['hasil'], 3) . "</b></p>";
        } else {
            return $execute = $this->getConnect()->query($queryHasil);
        }
    }
}
