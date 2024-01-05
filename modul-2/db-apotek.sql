create database db_apotek;

use db_apotek;

create table users(
  id int primary key auto_increment,
  nama varchar(64),
  email varchar(64),
  password varchar(64),
  role enum('users', 'admin', 'produsen') default 'users',
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp
);

create table kategori_obat(
  id int primary key auto_increment,
  nama_kategori varchar(64),
  is_produce tinyint(1),
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp
);

create table obat(
  id int primary key auto_increment,
  id_kategori int,
  nama_obat varchar(64),
  harga_beli decimal(10, 2),
  harga_jual decimal(10, 2),
  stok int,
  expired_date datetime,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key (id_kategori) references kategori_obat(id)
);

create table resep(
  id int primary key auto_increment,
  id_user int,
  total_harga decimal(10, 2),
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key (id_user) references users(id)
);

create table detail_resep(
  id int primary key auto_increment,
  id_resep int,
  id_obat int,
  jumlah int,
  total_biaya decimal(10, 2),
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key (id_resep) references resep(id),
  foreign key (id_user) references users(id)
);

create table transaksi(
  id int primary key auto_increment,
  id_user int,
  id_admin int,
  total_transaksi decimal(10, 2),
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key (id_user) references users(id),
  foreign key (id_admin) references users(id)
);

create table detail_transaksi(
  id int primary key auto_increment,
  id_transaksi int,
  id_obat int,
  jumlah decimal(10, 2),
  total_biaya decimal(10, 2) default 0,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key(id_transaksi) references transaksi(id),
  foreign key(id_obat) references obat(id)
);

create table supply(
  id int primary key auto_increment,
  id_produsen int,
  id_admin int,
  total_transaksi decimal(10, 2),
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key (id_produsen) references users(id),
  foreign key (id_admin) references users(id)
);

create table detail_supply(
  id int primary key auto_increment,
  id_supply int,
  id_obat int,
  jumlah decimal(10, 2),
  total_biaya decimal(10, 2) default 0,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key(id_supply) references supply(id),
  foreign key(id_obat) references obat(id)
);