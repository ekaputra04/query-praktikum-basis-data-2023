create database db_manajemen_stasiun;

use db_manajemen_stasiun;

create table user (
  id int(11) auto_increment primary key not null,
  nama_user varchar(255) not null,
  status_user enum('User', 'Admin') default 'User',
  email_user varchar(255) not null,
  sandi varchar(20) not null,
  no_telepon varchar(15) not null,
  alamat_user varchar(255) not null
);

create table masinis (
  id int(11) auto_increment primary key not null,
  nama_masinis varchar(50) not null,
  alamat_masinis varchar(50) not null,
  no_telp_masinis varchar(15) not null
);

create table fasilitas (
  id int(11) auto_increment primary key not null,
  jenis_fasilitas varchar(50) not null,
  harga_fasilitas int(100) not null
);

create table kereta (
  id int(11) auto_increment primary key not null,
  id_masinis int(11) not null,
  nama_kereta varchar(50) not null,
  nomor_kereta varchar(10) not null,
  ketersediaan_kursi int not null,
  foreign key(id_masinis) references masinis(id)
);

create table kota (
  id int(11) auto_increment primary key not null,
  nama_kota varchar(50) not null
);

create table jadwal_keberangkatan (
  id int(11) auto_increment primary key not null,
  id_kereta int not null,
  id_kota_awal int not null,
  id_kota_tujuan int not null,
  tanggal_keberangkatan datetime not null,
  tanggal_kedatangan datetime not null,
  harga int(1) not null,
  foreign key(id_kereta) references kereta(id),
  foreign key(id_kota_awal) references kota(id),
  foreign key(id_kota_tujuan) references kota(id)
);

create table metode_pembayaran (
  id int(11) auto_increment primary key not null,
  jenis_pembayaran varchar(50) not null
);

create table pemesanan (
  id int(11) auto_increment primary key not null,
  id_user int(11) not null,
  id_jadwal_keberangkatan int(11) not null,
  id_fasilitas int(11) DEFAULT NULL,
  id_metode_pembayaran int(11) not null,
  banyak_penumpang int(11) not null,
  tanggal_pemesanan datetime not null DEFAULT current_timestamp,
  metode_pemesanan enum('transfer', 'kredit') not null,
  status_pemesanan enum('valid', 'unvalid') not null,
  foreign key(id_user) references user(id),
  foreign key(id_jadwal_keberangkatan) references jadwal_keberangkatan(id),
  foreign key(id_fasilitas) references fasilitas(id),
  foreign key(id_metode_pembayaran) references metode_pembayaran(id)
);

create table transaksi (
  id int(11) auto_increment primary key not null,
  id_pemesanan int(11) not null,
  tanggal_bayar datetime not null DEFAULT current_timestamp,
  total_harga int not null,
  status enum('sukses', 'gagal') not null,
  foreign key(id_pemesanan) references pemesanan(id)
);

-- tabel tambahan (opsional)
create table roomchat (
  id int(11) auto_increment primary key not null,
  id_user int(11) not null,
  id_admin int(11) not null,
  foreign key(id_user) references user(id),
  foreign key(id_admin) references user(id)
);

create table chatlog (
  id int(11) auto_increment primary key not null,
  id_roomchat int(11) not null,
  is_sender enum('Yes', 'No') default 'Yes',
  content varchar(255) not null,
  waktu_terkirim datetime default current_timestamp,
  foreign key(id_roomchat) references roomchat(id)
);