<!-- judul -->
<div class="panel">
    <div class="panel-middle" id="judul">
        <img src="asset/image/rank.svg">
        <div id="judul-text">
            <h2 class="text-green">LAPORAN</h2>
            Halamanan Utama Laporan Penilaian
        </div>
    </div>
</div>
<!-- judul -->
<div class="panel-body">
    <form class="form-inline" action="<?= $_SERVER["REQUEST_URI"] ?>" method="post">
        <label for="jurusan">Jurusan :</label>
        <select class="form-control" name="jurusan">
            <option>---</option>
            <option value="Teknik Sipil S1">Teknik Sipil S1</option>
            <option value="Teknik Mesin S1">Teknik Mesin S1</option>
            <option value="Teknik Informatika S1">Teknik Informatika S1</option>
            <option value="Teknik Geodesi S1">Teknik Geodesi S1</option>
            <option value="Teknik Lingkungan S1">Teknik Lingkungan S1</option>
            <option value="Teknik Sipil D3">Teknik Sipil D3</option>
            <option value="Teknik Mesin D3">Teknik Mesin D3</option>
            <option value="Teknik Informatika D3">Teknik Informatika D3</option>
        </select>
        <button type="submit" class="btn btn-primary">Tampilkan</button>
    </form>
    <?php if ($_SERVER["REQUEST_METHOD"] == "POST") : ?>
        <?php
        $q = $konek->query("SELECT b.kd_pendaftaran, b.nama, h.nilai, m.nama AS mahasiswa, m.nim, (SELECT MAX(nilai) FROM hasil WHERE nim=h.nim) AS nilai_max FROM mahasiswa m JOIN hasil h ON m.nim=h.nim JOIN pendaftaran b ON b.kd_pendaftaran=h.kd_pendaftaran WHERE m.jrusan='$_POST[jurusan]'");
        $pendaftaran = [];
        $data = [];
        $d = [];
        while ($r = $q->fetch_assoc()) {
            $pendaftaran[$r["kd_pendaftaran"]] = $r["nama"];
            $s = $konek->query("SELECT b.nama, a.nilai FROM hasil a JOIN pendaftaran b USING(kd_pendaftaran) WHERE a.nim=$r[nim] AND a.jurusan=$_POST[jurusan]");
            while ($rr = $s->fetch_assoc()) {
                $d[$rr['nama']] = $rr['nilai'];
            }
            $m = max($d);
            $k = array_search($m, $d);
            $data[$r["nim"] . "-" . $r["mahasiswa"] . "-" . $r["nilai_max"] . "-" . $k][$r["kd_pendaftaran"]] = $r["nilai"];
        }
        ?>
        <hr>
        <table class="table table-condensed">
            <thead>
                <tr>
                    <th>NIM</th>
                    <th>Nama</th>
                    <?php foreach ($pendaftaran as $val) : ?>
                        <th><?= $val ?></th>
                    <?php endforeach; ?>
                    <th>Nilai Maksimal</th>
                    <th>Rekomendasi</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($data as $key => $val) : ?>
                    <tr>
                        <?php $x = explode("-", $key); ?>
                        <td><?= $x[0] ?></td>
                        <td><?= $x[1] ?></td>
                        <?php foreach ($val as $v) : ?>
                            <td><?= number_format($v, 8) ?></td>
                        <?php endforeach; ?>
                        <td><?= number_format($x[2], 8) ?></td>
                        <td><?= $x[3] ?></td>
                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
    <?php endif; ?>
</div>