<?php
require 'connect.php';
require 'class/saw.php';
$cookiePilih = @$_COOKIE['pilih'];
$cookieJurusan = @$_COOKIE['Jurusan'];
if (isset($cookiePilih) and !empty($cookiePilih)) {
    $saw = new saw();
    $saw->setconfig($konek, $cookiePilih, $cookieJurusan);
?>
    <div id="Matriks Keputusan">
        <h3>Matriks Keputusan</h3>
        <table>
            <thead>
                <tr>
                    <th rowspan="2">Alternative</th>
                    <th colspan="<?php echo count($saw->getKriteria()) ?>">Kriteria</th>
                </tr>
                <tr>
                    <?php
                    foreach ($saw->getKriteria() as $key) {
                        echo "<th>$key</th>";
                    }
                    ?>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($saw->getAlternative() as $key) {
                    echo "<tr id='data'>";
                    echo "<td>" . $key['namamahasiswa'] . "</td>";
                    $no = 0;
                    foreach ($saw->getNilaiMatriks($key['id_mahasiswa']) as $data) {
                        echo "<td>$data[nilai]</td>";
                    }
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
    <div id="Normalisasi Matriks Keputusan">
        <h3>Normalisasi Matriks Keputusan</h3>
        <table>
            <thead>
                <tr>
                    <th rowspan="2">Alternative</th>
                    <th colspan="<?php echo count($saw->getKriteria()) ?>">Kriteria</th>
                </tr>
                <tr>
                    <?php
                    foreach ($saw->getKriteria() as $key) {
                        echo "<th>$key</th>";
                    }
                    ?>
                </tr>
            </thead>
            <tbody>
                <?php
                //foreach data mahasiswa
                foreach ($saw->getAlternative() as $key) {
                    echo "<tr id='data'>";
                    echo "<td>" . $key['namamahasiswa'] . "</td>";
                    $no = 0;
                    //foreach nilai mahasiswa
                    foreach ($saw->getNilaiMatriks($key['id_mahasiswa']) as $data) {
                        //menghitung normalisasi
                        $hasil = $saw->Normalisasi($saw->getArrayNilai($data['id_kriteria']), $data['sifat'], $data['nilai']);
                        echo "<td>$hasil</td>";
                        $hitungbobot[$key['id_mahasiswa']][$no] = $hasil * $saw->getBobot($data['id_kriteria']);
                        $no++;
                    }
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
    <div id="Perangkingan">
        <h3>Perangkingan</h3>
        <table>
            <thead>
                <tr>
                    <th rowspan="2">Alternative</th>
                    <th colspan="<?php echo count($saw->getKriteria()) ?>">Kriteria</th>
                    <th rowspan="2">Hasil</th>
                </tr>
                <tr>
                    <?php
                    foreach ($saw->getKriteria() as $key) {
                        echo "<th>$key</th>";
                    }
                    ?>
                </tr>
            </thead>
            <tbody>
                <?php
                /* foreach ($saw->getAlternative() as $key) { */
                $execute = $saw->getHasil();
                while ($key = $execute->fetch_array(MYSQLI_ASSOC)) {
                    echo "<tr id='data'>";
                    echo "<td>" . $key['namamahasiswa'] . "</td>";
                    $no = 0;
                    $hasil = 0;
                    foreach ($hitungbobot[$key['id_mahasiswa']] as $data) {
                        echo "<td>$data</td>";
                        //menjumlahkan
                        $hasil += $data;
                    }
                    $saw->simpanHasil($key['id_mahasiswa'], $hasil);
                    echo "<td>" . $hasil . "</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
<?php
    //cetak hasil
    $saw->getHasil(1);
}
