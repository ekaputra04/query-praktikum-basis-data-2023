create database db_marketplace;

use db_marketplace;

create table user (
  id int(11) auto_increment primary key not null,
  nama_user varchar(255) not null,
  status_user enum('Seller', 'Buyer') default 'Buyer',
  email_user varchar(255) not null,
  sandi varchar(20) not null,
  no_telepon varchar(15) not null,
  alamat_user varchar(255) not null,
  jumlah_saldo int(11) default 0
);

create table toko (
  id int(11) auto_increment primary key not null,
  id_user int(11) not null,
  foreign key(id_user) references user(id)
);

create table kategori (
  id int(11) auto_increment primary key not null,
  jenis_kategori varchar(50) not null
);

create table produk (
  id int(11) auto_increment primary key not null,
  id_toko int(11) not null,
  id_kategori int(11) not null,
  nama_produk varchar(255) not null,
  harga_produk int(11) not null,
  stok_produk int(11) default 0,
  jumlah_terjual_produk int(11) default 0,
  deskripsi_produk varchar(255) default null,
  foreign key(id_toko) references toko(id),
  foreign key(id_kategori) references kategori(id)
);

create table wishlist (
  id int(11) auto_increment primary key not null,
  id_user int(11) not null,
  id_produk int(11) not null,
  jumlah_produk int(11) default 0,
  total_harga int(11) default 0,
  status_wishlist enum('Terbeli', 'Belum') default 'Belum',
  foreign key(id_user) references user(id),
  foreign key(id_produk) references produk(id)
);

create table review (
  id int(11) auto_increment primary key not null,
  id_user int(11) not null,
  review varchar(255) not null,
  rating int(11) not null,
  jawaban_seller varchar(255) default null,
  foreign key(id_user) references user(id)
);

create table metode_pembayaran (
  id int(11) auto_increment primary key not null,
  jenis_pembayaran varchar(50) not null
);

create table pengiriman (
  id int(11) auto_increment primary key not null,
  tanggal_pengiriman date not null default current_date,
  alamat_pengiriman varchar(255) default null,
  status_pengiriman enum('Terkirim', 'Belum Terkirim') default 'Belum Terkirim'
);

create table pemesanan (
  id int(11) auto_increment primary key not null,
  id_user int(11) not null,
  id_toko int(11) not null,
  id_metode_bayar int(11) not null,
  id_pengiriman int(11) not null,
  tanggal_pemesanan date not null default current_date,
  status_pembayaran enum('Lunas', 'Belum Lunas') default 'Belum Lunas',
  total_harga int(11) DEFAULT 0,
  foreign key(id_user) references user(id),
  foreign key(id_toko) references toko(id),
  foreign key(id_metode_bayar) references metode_pembayaran(id),
  foreign key(id_pengiriman) references pengiriman(id)
);

create table detail_pemesanan (
  id int(11) auto_increment primary key not null,
  id_pemesanan int(11) not null,
  id_produk int(11) default null,
  id_wishlist int(11) default null,
  id_review int(11) default null,
  total_produk int(11) not null,
  sub_total_harga int(11) default 0,
  ongkos_kirim int(11) default 0,
  foreign key(id_pemesanan) references pemesanan(id),
  foreign key(id_produk) references produk(id),
  foreign key(id_wishlist) references wishlist(id),
  foreign key(id_review) references review(id)
);

create table roomchat (
  id int(11) auto_increment primary key not null,
  id_user int(11) not null,
  foreign key(id_user) references user(id)
);

create table chatlog (
  id int(11) auto_increment primary key not null,
  id_roomchat int(11) not null,
  is_sender enum('Yes', 'No') default 'Yes',
  content varchar(255) not null,
  waktu_terkirim datetime default current_timestamp,
  foreign key(id_roomchat) references roomchat(id)
);