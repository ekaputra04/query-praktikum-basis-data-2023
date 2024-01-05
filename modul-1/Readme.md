# Modul 1

## Database Penyewaan Lapangan Bulu Tangkis

## Studi Kasus

Terdapat Sebuah sistem penyewaan lapangan Bulu Tangkis dimana terdapat berbagai fitur didalamnya, yang mempermudah customer dalam melakukan reservasi. Selain fitur penyewaan lapangan, sistem ini juga memiliki fitur penyewaan raket dan pembelian kok. Lapangan dikategorikan menjadi beberapa kelas, seperti Gold, Silver, & Bronze. Untuk penyewaan lapangan dan raket, Customer dapat memilih rentang waktu yang belum disewa oleh customer lainnya. Biaya penyewaan dihitung berdasarkan rentang waktu dalam satuan jam baik dalam penyewaan lapangan ataupun Raket. Costumer dapat melakukan pemesanan secara online dengan cara mendaftar terlebih dahulu dengan menyertakan data diri. Sistem dibekali pula dengan fitur chat guna membantu user dalam mengatasi masalah reservasi bersama admin terkait. Customer juga dapat melakukan review atas pesanan yang dilakukan sebelumnya.

## Report

### Tampilkan kategori kelas lapangan dengan penyewaan tertinggi!

```
SELECT
  l.kelas,
  COUNT(pl.id) AS jumlah_penyewaan
FROM
  lapangan l
JOIN
  detail_penyewaan_lapangan dp ON l.id = dp.id_lapangan
JOIN
  penyewaan_lapangan pl ON dp.id_penyewaan = pl.id
GROUP BY
  l.kelas
ORDER BY
  jumlah_penyewaan DESC;
```

### Tampilkan rata rata penjualan kok 3 bulan terakhir!

```
SELECT
  AVG(dpk.total_biaya) AS rata_rata_penjualan
FROM
  detail_pembelian_kok dpk
JOIN
  pembelian_kok pk ON dpk.id_pembelian = pk.id
JOIN
  kok k ON dpk.id_kok = k.id
WHERE
  pk.created_at >= NOW() - INTERVAL 3 MONTH;
```

### Tampilkan jumlah maksimal pembelian kok yang pernah dilakukan oleh customer yang memesan Lapangan berkategori Gold!

```
SELECT
  pl.id_user,
  u.nama,
  COUNT(dpk.id_kok) AS jumlah_kok_dibeli
FROM
  users u
JOIN
  penyewaan_lapangan pl ON pl.id_user = u.id
JOIN
  detail_penyewaan_lapangan dp ON pl.id = dp.id_penyewaan
JOIN
  lapangan l ON dp.id_lapangan = l.id
JOIN
  pembelian_kok pk ON pl.id_user = pk.id_user
JOIN
  detail_pembelian_kok dpk ON pk.id = dpk.id_pembelian
WHERE
  l.kelas = 'gold'
GROUP BY
  pl.id_user
ORDER BY
  jumlah_kok_dibeli DESC
LIMIT 1;
```
