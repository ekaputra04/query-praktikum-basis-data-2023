create database db_bulutangkis;

use db_bulutangkis;

create table users(
  id int primary key auto_increment,
  nama varchar(64),
  email varchar(64),
  password varchar(64),
  is_admin tinyint(1) default 0,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp
);

create table lapangan(
  id int primary key auto_increment,
  nama varchar(64),
  harga_per_jam decimal(10, 2),
  kelas enum('gold', 'silver', 'bronze'),
  status_lapangan enum('tersedia', 'dipesan') not null default 'tersedia',
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  waktu_pesan_awal datetime,
  waktu_pesan_akhir datetime
);

create table raket(
  id int primary key auto_increment,
  nama varchar(64),
  harga_per_jam decimal(10, 2),
  status_raket enum('tersedia', 'dipesan') not null default 'tersedia',
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  waktu_pesan_awal datetime,
  waktu_pesan_akhir datetime
);

create table kok(
  id int primary key auto_increment,
  status_kok enum('tersedia', 'terjual') not null default 'tersedia',
  harga decimal(10, 2),
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  ordered_at datetime
);

create table penyewaan_lapangan(
  id int primary key auto_increment,
  id_user int,
  id_admin int,
  total_penyewaan decimal(10, 2) default 0,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key(id_user) references users(id),
  foreign key(id_admin) references users(id)
);

create table detail_penyewaan_lapangan(
  id int primary key auto_increment,
  id_penyewaan int,
  id_lapangan int,
  rentang_waktu decimal(10, 2),
  total_biaya decimal(10, 2) default 0,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key(id_penyewaan) references penyewaan_lapangan(id),
  foreign key(id_lapangan) references lapangan(id)
);

create table penyewaan_raket(
  id int primary key auto_increment,
  id_user int,
  id_admin int,
  total_penyewaan decimal(10, 2) default 0,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key(id_user) references users(id),
  foreign key(id_admin) references users(id)
);

create table detail_penyewaan_raket(
  id int primary key auto_increment,
  id_penyewaan int,
  id_raket int,
  rentang_waktu decimal(10, 2),
  total_biaya decimal(10, 2) default 0,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key(id_penyewaan) references penyewaan_raket(id),
  foreign key(id_raket) references raket(id)
);

create table pembelian_kok (
  id int primary key auto_increment,
  id_user int,
  id_admin int,
  total_pembelian decimal(10, 2) default 0,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key(id_user) references users(id),
  foreign key(id_admin) references users(id)
);

create table detail_pembelian_kok(
  id int primary key auto_increment,
  id_pembelian int,
  id_kok int,
  jumlah decimal(10, 2),
  total_biaya decimal(10, 2) default 0,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key(id_pembelian) references pembelian_kok(id),
  foreign key(id_kok) references kok(id)
);

create table review_lapangan(
  id int primary key auto_increment,
  id_pesanan_lapangan int,
  pesan text,
  rating int,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key(id_pesanan_lapangan) references detail_penyewaan_lapangan(id)
);

create table review_raket(
  id int primary key auto_increment,
  id_pesanan_raket int,
  pesan text,
  rating int,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  foreign key(id_pesanan_raket) references detail_penyewaan_raket(id)
);