<style type="text/css">
  {
            padding: 0;
            margin: 0;
        }

        #header {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            text-align: center;
            border-collapse: collapse;        
        }

        .text-underline {
            text-decoration: underline;
        }

        .text-center {
            text-align: center;
        }

        #judul {
            margin: 10px 0px 10px 0px;
        }

        table {
            text-align: center;
            border-collapse: collapse;
            margin: 7px 0px 15px 0px;
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: solid 2px black;
        }

        table tr {
            border: solid 2px black;
        }

        table th {
            padding: 5px 8px;
            border: solid 2px black;
            border-bottom: solid 2px black;
            font-weight: bold;
        }

        table td {
            border: solid 2px black;
            padding: 5px;
        }

        table tr#data:nth-child(odd) {
            background-color: #f2f2f2;
            border: solid 2px black;
        }
 </style>
     <div id="header" class="text-center">
        <h4>Sistem Pendukung Keputusan Penerimaan Mahasiswa</h4>
        <h2>Institut Teknologi Padang</h2>
    </div>
    <div id="judul" class="text-center">
        <p class="text-underline">Laporan Hasil Perhitungan</p>
   
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
                    </div>
    <script>
 window.print();
 </script>