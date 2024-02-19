create database db_apotek;

use db_apotek;

create table user (
  id int primary key auto_increment,
  nama varchar(255),
  role enum('customer', 'admin'),
  gender enum('pria', 'wanita')
);

create table produsen(
  id int primary key auto_increment,
  nama varchar(255),
  kontak varchar(13)
);

create table pengajuan_resep (
  id int primary key auto_increment,
  isi varchar(255),
  status enum('terkonfirmasi', 'menunggu', 'ditolak'),
  tgl_pengajuan datetime default null,
  id_user int default null,
  foreign key(id_user) references user(id)
);

create table resep(
  id int primary key auto_increment,
  deskripsi varchar(255)
);

create table bahan_penyusun(
  id int primary key auto_increment,
  bahan_penyusun varchar(255),
  id_resep int,
  foreign key(id_resep) references resep(id)
);

create table obat(
  id int primary key auto_increment,
  nama varchar(255),
  kategori enum(
    'obat bebas',
    'obat bebas terbatas',
    'obat keras',
    'obat golongan narkotika',
    'obat fitofarmaka',
    'obat herbal terstandar',
    'obat herbal'
  ),
  stok int,
  harga_beli int,
  harga_jual int,
  id_resep int,
  id_produsen int,
  foreign key(id_resep) references resep(id),
  foreign key(id_produsen) references produsen(id)
);

create table wishlist(
  id int primary key auto_increment,
  id_obat int,
  id_user int,
  status enum('terkonfirmasi', 'menunggu', 'ditolak'),
  total_harga int,
  total_obat int,
  foreign key(id_obat) references obat(id),
  foreign key(id_user) references user(id)
);

create table transaksi_obat(
  id int primary key auto_increment,
  tgl_transaksi datetime,
  total_harga int,
  id_pengajuan_resep int,
  id_wishlist int,
  foreign key(id_pengajuan_resep) references pengajuan_resep(id),
  foreign key(id_wishlist) references wishlist(id)
);

create table transaksi_produsen(
  id int primary key auto_increment,
  tgl_pembelian datetime,
  status enum('berhasil', 'gagal'),
  id_produsen int,
  id_user int,
  foreign key(id_produsen) references produsen(id),
  foreign key(id_user) references user(id)
);

CREATE TABLE detail_transaksi_produsen (
  id int NOT NULL,
  jumlah int default null,
  total_harga int default null,
  id_transaksi_produsen int default null,
  id_obat int default null,
  foreign key(id_obat) references obat(id)
);