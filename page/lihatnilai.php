<?php
$a = htmlspecialchars(@$_GET['a']);
$b = htmlspecialchars(@$_GET['b']);
$querylihat = "SELECT id_nilaimahasiswa,kriteria.namaKriteria AS namaKriteria,nilai_kriteria.keterangan AS keterangan FROM nilai_mahasiswa
INNER JOIN kriteria USING (id_kriteria)
INNER JOIN nilai_kriteria USING (id_nilaikriteria)
WHERE nilai_mahasiswa.id_mahasiswa='$a' AND nilai_mahasiswa.id_jenispendaftaran='$b'";
$execute2 = $konek->query($querylihat);
if ($execute2->num_rows == 0) {
    header('location:./?page=penilaian');
}
?>
<!-- judul -->
<div class="panel-top">
    <b class="text-green">Detail data</b>
</div>
<form>
    <div class="panel-middle">
        <div class="group-input">
            <?php
            $query = "SELECT namamahasiswa FROM mahasiswa WHERE id_mahasiswa='$a'";
            $execute = $konek->query($query);
            $data = $execute->fetch_array(MYSQLI_ASSOC);
            ?>
            <div class="group-input">
                <label for="jenispendaftaran">Nama mahasiswa</label>
                <input class="form-custom" value="<?php echo $data['namamahasiswa']; ?>" disabled type="text" autocomplete="off" required name="jenispendaftaran" id="jenispendaftaran">
            </div>
        </div>
        <div class="group-input">
            <?php
            $query = "SELECT namapendaftaran FROM jenis_pendaftaran WHERE id_jenispendaftaran='$b'";
            $execute = $konek->query($query);
            $data = $execute->fetch_array(MYSQLI_ASSOC);
            ?>
            <div class="group-input">
                <label for="jenispendaftaran">Jenis pendaftaran</label>
                <input class="form-custom" value="<?php echo $data['namapendaftaran']; ?>" disabled type="text" autocomplete="off" required name="jenispendaftaran" id="jenispendaftaran" placeholder="jenispendaftaran">
            </div>
        </div>
        <?php
        $execute2 = $konek->query($querylihat);
        while ($data2 = $execute2->fetch_array(MYSQLI_ASSOC)) {
            echo "<div class=\"group-input\">
                        <label for=\"\">$data2[namaKriteria]</label>
                        <input class=\"form-custom\" value=\"$data2[keterangan]\" disabled type=\"text\" autocomplete=\"off\" required name=\"bobot[]\">
                      </div>
                ";
        }
        ?>
    </div>
    <div class="panel-bottom">
        <button type="submit" class="btn btn-green">Simpan</button>
        <button type="reset" class="btn btn-second">Reset</button>
    </div>
</form>