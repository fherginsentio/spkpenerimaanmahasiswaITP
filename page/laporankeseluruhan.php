<!-- judul -->
<div class="panel">
    <div class="panel-middle" id="judul">
        <img src="asset/image/rank.svg">
        <div id="judul-text">
            <h2 class="text-green">LAPORAN</h2>
            Halamanan Utama Laporan
        </div>
    </div>
</div>

<!-- judul -->
<div class="row">

    <div class="col-12">

        <div class="panel">
        <div style="float: right;" class="input-dropdown">
            <a class="btn btn-green" id="btn-dropdown" target="_blank" href="./cetak.php"><i class="fa fa-print"></i> Cetak Hasil</a>
            <!--ul class="dropdown" id="panel-dropdown">
               <li><a href="./cetakexcel.php"><i class="fa fa-file-excel"></i> Cetak Excel</a></li>
                <li><a class="btn btn-green" id="btn-dropdown" target="_blank" href="./cetak.php"><i class="fa fa-print"></i> Cetak laporan keseluruhan</a></li>
            </ul-->
            </div>
            <div class="panel-top">
                <b class="text-green">LAPORAN NILAI AKHIR MAHASISWA</b>
                
        </div>
            <div class="panel-middle">
                <div class="table-responsive">
                    <table>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama</th>
                                <th>Jurusan</th>
                                <th>Jalur Pendaftaran</th>
                                <th>Nilai Hasil</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $query = "SELECT hasil.id_hasil, hasil.id_mahasiswa, mahasiswa.namamahasiswa, mahasiswa.jurusan, hasil.id_jenispendaftaran, jenis_pendaftaran.namapendaftaran, hasil.hasil FROM hasil INNER JOIN mahasiswa on hasil.id_mahasiswa = mahasiswa.id_mahasiswa INNER JOIN jenis_pendaftaran on hasil.id_jenispendaftaran = jenis_pendaftaran.id_jenispendaftaran";
                            $execute = $konek->query($query);
                            if ($execute->num_rows > 0) {
                                $no = 1;
                                while ($data = $execute->fetch_array(MYSQLI_ASSOC)) {
                                    echo "
                                <tr id='data'>
                                    <td>$no</td>
                                    <td>$data[namamahasiswa]</td>
                                    <td>$data[jurusan]</td>
                                    <td>$data[namapendaftaran]</td>
                                    <td>$data[hasil]</td>
                                </tr>";
                                    $no++;
                                }
                            } else {
                                echo "<tr><td  class='text-center text-green' colspan='3'>Kosong</td></tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>