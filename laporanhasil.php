<?php
require 'connect.php';
require 'class/saw.php';
?>
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
                             $konek = mysqli_connect("localhost","root","","spkpenerimaan");
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
