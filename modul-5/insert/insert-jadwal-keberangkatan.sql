-- Isi tabel jadwal_keberangkatan
INSERT INTO
  jadwal_keberangkatan (
    id_kereta,
    id_kota_awal,
    id_kota_tujuan,
    tanggal_keberangkatan,
    harga
  )
SELECT
  FLOOR(RAND() *(29 -1 + 1)) + 1 AS id_kereta,
  FLOOR(RAND() *(20 -1 + 1)) + 1 AS id_kota_awal,
  FLOOR(RAND() *(20 -1 + 1)) + 1 AS id_kota_tujuan,
  FROM_UNIXTIME(
    ROUND(
      UNIX_TIMESTAMP('2024-01-01 00:00:00') + RAND() * (
        UNIX_TIMESTAMP('2025-01-01 00:00:00') - UNIX_TIMESTAMP('2024-01-01 00:00:00')
      )
    )
  ) AS tanggal_keberangkatan,
  FLOOR(RAND() *(500000 -100000 + 1)) + 100000 AS harga
FROM
  INFORMATION_SCHEMA.TABLES
LIMIT
  100;