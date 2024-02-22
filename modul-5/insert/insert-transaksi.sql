INSERT INTO
  transaksi(
    id_pemesanan,
    tanggal_bayar,
    status
  )
SELECT
  FLOOR(RAND() *(82 -1 + 1)) + 1 AS id_pemesanan,
  FROM_UNIXTIME(
    ROUND(
      UNIX_TIMESTAMP('2024-01-01 00:00:00') + RAND() * (
        UNIX_TIMESTAMP('2025-01-01 00:00:00') - UNIX_TIMESTAMP('2024-01-01 00:00:00')
      )
    )
  ) AS tanggal_bayar,
  'sukses' AS status -- 'gagal' AS status
FROM
  INFORMATION_SCHEMA.TABLES
LIMIT
  1;