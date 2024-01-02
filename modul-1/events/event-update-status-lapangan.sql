-- Aktifkan event scheduler jika belum aktif
SET
  GLOBAL event_scheduler = ON;

-- Buat event untuk memeriksa dan mengubah status_lapangan lapangan
DELIMITER / / CREATE EVENT update_status_lapangan ON SCHEDULE EVERY 1 SECOND -- Ganti dengan interval waktu yang sesuai
DO BEGIN -- Periksa dan ubah status sesuai kondisi
UPDATE
  lapangan
SET
  status_lapangan = CASE
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
  status_lapangan = 'tersedia'
  OR status_lapangan = 'dipesan';

END;

/ / DELIMITER;