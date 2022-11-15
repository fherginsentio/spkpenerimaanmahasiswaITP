<div class="panel">
    <div class="panel-middle" id="judul">
        <div id="judul-text">
            <h2 class="text-green">Mahasiswa</h2>
            Halamanan Administrator Mahasiswa
        </div>
    </div>
</div>
<!-- judul -->
<div class="row">
    <div class="col-4">
        <div class="panel">
            <?php
            if (@htmlspecialchars($_GET['aksi']) == 'ubah') {
                include 'ubahmahasiswa.php';
            } else {
                include 'tambahmahasiswa.php';
            }
            ?>
        </div>
    </div>
    <div class="col-8">
        <div class="panel">
            <div class="panel-top">
                <b class="text-green">Daftar mahasiswa</b>
            </div>
            <div class="panel-middle">
                <div class="table-responsive">
                    <table>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama</th>
                                <th>Jurusan</th>
                                <th>Tempat Lahir</th>
                                <th>Tanggal lahir</th>
                                <th>Jenis Kelamin</th>
                                <th>No.HP</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $query = "SELECT * FROM mahasiswa";
                            $execute = $konek->query($query);
                            if ($execute->num_rows > 0) {
                                $no = 1;
                                while ($data = $execute->fetch_array(MYSQLI_ASSOC)) {
                                    echo "
                                <tr id='data'>
                                    <td>$no</td>
                                    <td>$data[namamahasiswa]</td>
                                    <td>$data[jurusan]</td>
                                    <td>$data[tpt_lahir]</td>
                                    <td>$data[tgl_lahir]</td>
                                    <td>$data[jk]</td>
                                    <td>$data[hp]</td>
                                    <td>
                                    <div class='norebuttom'>
                                    <a class=\"btn btn-light-green\" href='./?page=mahasiswa&aksi=ubah&id=" . $data['id_mahasiswa'] . "'><i class='fa fa-pencil-alt'></i></a>
                                    <a class=\"btn btn-yellow\" data-a=" . $data['namamahasiswa'] . " id='hapus' href='./proses/proseshapus.php/?op=mahasiswa&id=" . $data['id_mahasiswa'] . "'><i class='fa fa-trash-alt'></i></a>
                                    </div></td>
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
            <div class="panel-bottom"></div>
        </div>
    </div>
</div>