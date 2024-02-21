create database db_percetakan_buku;

use db_percetakan_buku;

CREATE TABLE bahan_baku (
  id int(11) auto_increment primary key not null,
  nama_bahan varchar(32) not null,
  stok int not null,
  harga_satuan decimal(12, 2) not null
);

CREATE TABLE kategori_buku (
  id int(11) auto_increment primary key not null,
  kategori_buku varchar(32) not null
);

CREATE TABLE distributor_bahan_baku (
  id int(11) auto_increment primary key not null,
  nama_distributor varchar(32) not null,
  alamat varchar(80) not null,
  telepon char(14) not null
);

CREATE TABLE buku (
  id int(11) auto_increment primary key not null,
  id_kategori int not null,
  judul_buku varchar(64) not null,
  penulis varchar(64) not null,
  jml_halaman int not null,
  stok int default null,
  harga_satuan decimal(12, 2) default null,
  foreign key(id_kategori) references kategori_buku(id)
);

CREATE TABLE pegawai (
  id int(11) auto_increment primary key not null,
  nama_pegawai varchar(64) not null,
  alamat varchar(80) not null,
  telepon char(14) not null
);

CREATE TABLE kelompok_kerja (
  id int(11) auto_increment primary key not null,
  kelompok char(2) not null
);

CREATE TABLE toko_buku (
  id int(11) auto_increment primary key not null,
  nama_toko_buku varchar(32) not null,
  alamat varchar(80) not null,
  telepon char(14) not null
);

CREATE TABLE mesin (
  id int(11) auto_increment primary key not null,
  nomor_rangka char(17) not null,
  merek_mesin varchar(32) not null
);

CREATE TABLE kerja_pegawai (
  id int(11) auto_increment primary key not null,
  id_pegawai int not null,
  id_kelompok_kerja int not null,
  shift_siang bit(1) not null,
  foreign key(id_pegawai) references pegawai(id),
  foreign key(id_kelompok_kerja) references kelompok_kerja(id)
);

CREATE TABLE komposisi (
  id int(11) auto_increment primary key not null,
  id_buku int not null,
  id_bahan_baku int not null,
  jml_bahan_terpakai decimal(6, 2) not null,
  harga_satuan decimal(12, 2) default null,
  foreign key(id_buku) references buku(id),
  foreign key(id_bahan_baku) references bahan_baku(id)
);

CREATE TABLE transaksi_bahan_baku (
  id int(11) auto_increment primary key not null,
  id_distributor int not null,
  id_pegawai int not null,
  waktu_transaksi timestamp default current_timestamp,
  total_biaya decimal(12, 2) default 0,
  foreign key(id_distributor) references distributor_bahan_baku(id),
  foreign key(id_pegawai) references pegawai(id)
);

CREATE TABLE detail_transaksi_bahan_baku (
  id int(11) auto_increment primary key not null,
  id_tr_bahan_baku int not null,
  id_bahan_baku int not null,
  jml_bahan_baku int not null,
  sub_total_biaya decimal(12, 2) default 0,
  foreign key(id_tr_bahan_baku) references transaksi_bahan_baku(id),
  foreign key(id_bahan_baku) references bahan_baku(id)
);

CREATE TABLE transaksi_buku (
  id int(11) auto_increment primary key not null,
  id_toko int not null,
  id_pegawai int not null,
  waktu_transaksi timestamp default current_timestamp,
  total_biaya decimal(12, 2) default 0,
  foreign key(id_toko) references toko_buku(id),
  foreign key(id_pegawai) references pegawai(id)
);

CREATE TABLE detail_transaksi_buku (
  id int(11) auto_increment primary key not null,
  id_tr_buku int not null,
  id_buku int not null,
  jml_buku int not null,
  sub_total_biaya decimal(12, 2) default 0,
  foreign key(id_tr_buku) references transaksi_buku(id),
  foreign key(id_buku) references buku(id)
);

CREATE TABLE kerja_mesin (
  id int(11) auto_increment primary key not null,
  id_mesin int not null,
  id_buku int not null,
  id_kelompok_kerja int not null,
  jml_buku_diproduksi int not null,
  tanggal_kerja date not null default current_date,
  foreign key(id_mesin) references mesin(id),
  foreign key(id_buku) references buku(id),
  foreign key(id_kelompok_kerja) references kelompok_kerja(id)
);