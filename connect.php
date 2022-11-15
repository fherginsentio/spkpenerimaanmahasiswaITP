<?php
$konek = new mysqli('localhost', 'root', '', 'spkpenerimaan');
if ($konek->connect_errno) {
    "Database Error" . $konek->connect_error;
}
