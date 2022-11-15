<div class="panel-top">
    <b class="text-green"><i class="fa fa-plus-circle text-green"></i> Tambah data</b>
</div>
<form id="form" method="POST" action="./proses/prosestambah.php">
    <input type="hidden" name="op" value="mahasiswa">
    <div class="panel-middle">
        <div class="group-input">
            <label for="mahasiswa">Nama Mahasiswa :</label>
            <input type="text" class="form-custom" required autocomplete="off" placeholder="Nama Mahasiswa" id="mahasiswa" name="mahasiswa">
        </div>
        <div class="group-input">
            <label for="jurusan">Jurusan :</label>
            <select class="form-custom" required id="jurusan" name="jurusan">
                <option selected disabled>-- Pilih Jurusan --</option>
                <option value="Teknik Sipil S1">Teknik Sipil S1</option>
                <option value="Teknik Mesin S1">Teknik Mesin S1</option>
                <option value="Teknik Elektro S1">Teknik Elektro S1</option>
                <option value="Teknik Informatika S1">Teknik Informatika S1</option>
                <option value="Teknik Geodesi S1">Teknik Geodesi S1</option>
                <option value="Teknik Lingkungan S1">Teknik Lingkungan S1</option>
                <option value="Teknik Sipil D3">Teknik Sipil D3</option>
                <option value="Teknik Mesin D3">Teknik Mesin D3</option>
                <option value="Teknik Listrik D3">Teknik Listrik D3</option>
            </select>
        </div>
        <div class="group-input">
            <label for="tpt_lahir">Tempat Lahir :</label>
            <input type="text" class="form-custom" required autocomplete="off" placeholder="Tempat lahir" id="tpt_lahir" name="tpt_lahir">
        </div>
        <div class="group-input">
            <label for="tgl_lahir">Tanggal Lahir :</label>
            <input type="text" class="form-custom" required autocomplete="off" placeholder="Tanggal lahir" id="tgl_lahir" name="tgl_lahir">
        </div>
        <div class="group-input">
            <label for="jk">Jenis Kelamin :</label>
            <select class="form-custom" required id="jk" name="jk">
                <option selected disabled>-- Pilih Jenis Kelamin --</option>
                <option value="Laki-Laki">Laki-Laki</option>
                <option value="Perempuan">Perempuan</option>
            </select>
        </div>
        <div class="group-input">
            <label for="hp">No. HP :</label>
            <input type="text" class="form-custom" required autocomplete="off" placeholder="Nomor Handphone" id="hp" name="hp">
        </div>
    </div>
    <div class="panel-bottom">
        <button type="submit" id="buttonsimpan" class="btn btn-green"><i class="fa fa-save"></i> Simpan</button>
		<button type="reset" id="buttonreset" class="btn btn-second">Reset</button>
    </div>
</form>