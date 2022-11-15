<!-- judul -->
<div class="panel">
    <div class="panel-middle" id="judul">
        <div id="judul-text">
            <h2 class="text-green">HASIL</h2>
            Halamanan Utama Hasil Penilaian
        </div>
    </div>
</div>
<!-- judul -->
<div class="panel">
    <div class="panel-top">
        <div style="float:left;width: 300px;">
            <select class="form-custom" name="pilih" id="pilihHasil">
                <option disabled selected value="">-- Pilih Jalur Pendaftaran --</option>;
                <?php
                $query = "SELECT*FROM jenis_pendaftaran";
                $execute = $konek->query($query);
                if ($execute->num_rows > 0) {
                    while ($data = $execute->fetch_array(MYSQLI_ASSOC)) {
                        echo "<option value=$data[id_jenispendaftaran]>$data[namapendaftaran]</option>";
                    }
                } else {
                    echo '<option disabled value="">Tidak ada data</option>';
                }
                ?>
            </select>
        </div>

        <div style=" margin-left:20px; float:left;width: 300px;">

            <select class="form-custom" name="jurusan" id="pilihJurusan">
                <option>---</option>
                <option value="Teknik Sipil S1">Teknik Sipil S1</option>
                <option value="Teknik Mesin S1">Teknik Mesin S1</option>
                <option value="Teknik Informatika S1">Teknik Informatika S1</option>
                <option value="Teknik Geodesi S1">Teknik Geodesi S1</option>
                <option value="Teknik Lingkungan S1">Teknik Lingkungan S1</option>
                <option value="Teknik Sipil D3">Teknik Sipil D3</option>
                <option value="Teknik Mesin D3">Teknik Mesin D3</option>
                <option value="Teknik Listrik D3">Teknik Listrik D3</option>
            </select>

        </div>
        <div style="float: right;" class="input-dropdown">
            <a class="btn btn-green" id="btn-dropdown" target="_blank" href="./cetakpdf.php"><i class="fa fa-print"></i> Cetak Hasil Penilaian</a>
            <!--ul class="dropdown" id="panel-dropdown">
               <li><a href="./cetakexcel.php"><i class="fa fa-file-excel"></i> Cetak Excel</a></li>
                <li><a class="btn btn-green" id="btn-dropdown" target="_blank" href="./cetak.php"><i class="fa fa-print"></i> Cetak laporan keseluruhan</a></li>
            </ul-->
        </div>
        <div style="clear: both"></div>
    </div>
    <div class="panel-middle">
        <div id="valueHasil">
            <p class='text-center'><b>Pilih List Pendaftaran dan Jurusan, untuk menampilkan hasil</b></p>
        </div>
    </div>
    <div class="panel-bottom"></div>
</div>