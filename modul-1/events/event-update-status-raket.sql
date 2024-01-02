-- Aktifkan event scheduler jika belum aktif
SET
  GLOBAL event_scheduler = ON;

-- Buat event untuk memeriksa dan mengubah status_raket 
DELIMITER / / CREATE EVENT update_status_raket ON SCHEDULE EVERY 1 SECOND -- Ganti dengan interval waktu yang sesuai
DO BEGIN -- Periksa dan ubah status sesuai kondisi
UPDATE
  raket
SET
  status_raket = CASE
    WHEN waktu_pesan_akhir IS NOT NULL
    AND NOW() > waktu_pesan_akhir THEN 'tersedia'
    WHEN waktu_pesan_akhir IS NULL THEN 'tersedia'
    ELSE 'dipesan'
  END,
  waktu_pesan_awal = CASE
    WHEN waktu_pesan_akhir IS NOT NULL
    AND NOW() > waktu_pesan_akhir THEN NULL
    ELSE waktu_pesan_awal
  END,
  waktu_pesan_akhir = CASE
    WHEN waktu_pesan_akhir IS NOT NULL
    AND NOW() > waktu_pesan_akhir THEN NULL
    ELSE waktu_pesan_akhir
  END
WHERE
  status_raket = 'tersedia'
  OR status_raket = 'dipesan';

END;

/ / DELIMITER;