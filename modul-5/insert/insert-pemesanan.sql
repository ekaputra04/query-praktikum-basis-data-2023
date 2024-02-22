INSERT INTO
  pemesanan(
    id_user,
    id_jadwal_keberangkatan,
    id_fasilitas,
    id_metode_pembayaran,
    tanggal_pemesanan,
    metode_pemesanan,
    status_pemesanan,
    banyak_penumpang
  )
SELECT
  FLOOR(RAND() *(121 -6 + 1)) + 1 AS id_user,
  FLOOR(RAND() *(101 -1 + 1)) + 1 AS id_jadwal_keberangkatan,
  FLOOR(RAND() *(3 -1 + 1)) + 1 AS id_fasilitas,
  FLOOR(RAND() *(50 -1 + 1)) + 1 AS id_metode_pembayaran,
  FROM_UNIXTIME(
    ROUND(
      UNIX_TIMESTAMP('2024-01-01 00:00:00') + RAND() * (
        UNIX_TIMESTAMP('2025-01-01 00:00:00') - UNIX_TIMESTAMP('2024-01-01 00:00:00')
      )
    )
  ) AS tanggal_pemesanan,
  -- 'transfer' AS metode_pemesanan,
  -- 'valid' AS status_pemesanan,
  'kredit' AS metode_pemesanan,
  'unvalid' AS status_pemesanan,
  FLOOR(RAND() *(3 -1 + 1)) + 1 AS banyak_penumpang,
FROM
  INFORMATION_SCHEMA.TABLES
LIMIT
  20;