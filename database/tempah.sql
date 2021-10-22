CREATE DATABASE tempah;

USE tempah;

CREATE TABLE konsumen(
	id_konsumen int(11) PRIMARY KEY AUTO_INCREMENT,
    nama varchar(100),
    username varchar(50),
    password varchar(20),
    no_hp varchar(12),
    email varchar(50),
    poin int,
    saldo float -- Membayar Pengangkut
);

CREATE TABLE pengangkut(
	id_pengangkut int(11) PRIMARY KEY AUTO_INCREMENT,
    nama varchar(100),
    username varchar(50),
    password varchar(20),
    no_hp varchar(12),
    koin float -- Berdasarkan jumlah berat daur ulang
);

CREATE TABLE pelestari(
	id_pelestari int(11) PRIMARY KEY AUTO_INCREMENT,
    nama varchar(100),
    username varchar(50),
    password varchar(20),
    no_hp varchar(12),
    saldo float
);

CREATE TABLE pengangkutan(
	id_pengangkutan int(11) PRIMARY KEY AUTO_INCREMENT,
    id_pengangkut int(11), FOREIGN KEY(id_pengangkut) REFERENCES pengangkut(id_pengangkut),
    id_konsumen int(11), FOREIGN KEY(id_konsumen) REFERENCES konsumen(id_konsumen),
    id_bank_sampah int(11), FOREIGN KEY(id_bank_sampah) REFERENCES bank_sampah(id_bank_sampah),
    tgl_ambil date,
    berat_organik float DEFAULT 0.0,
    berat_anorganik float DEFAULT 0.0,
	berat_daurulang float DEFAULT 0.0,
    kesesuaian boolean,
    status_angkut boolean
);

CREATE TABLE rekap_bank_sampah(
	id_bank_sampah int(11), FOREIGN KEY(id_bank_sampah) REFERENCES bank_sampah(id_bank_sampah),
	berat_daurulang float DEFAULT 0.0,
    saldo_konsumen float,
    saldo_transaksi float,
    saldo_total float
);

CREATE TABLE bank_sampah(
	id_bank_sampah int(11) PRIMARY KEY AUTO_INCREMENT,
    username varchar(20),
    password varchar(11),
    wilayah varchar(25),
    no_hp varchar(12)
);

CREATE TABLE transaksi(
	id_transaksi int(11) PRIMARY KEY AUTO_INCREMENT,
    id_bank_sampah int(11), FOREIGN KEY(id_bank_sampah) REFERENCES bank_sampah(id_bank_sampah),
    tgl_transaksi date,
    berat_total float DEFAULT 0.0,
    nominal_transaksi float
);

