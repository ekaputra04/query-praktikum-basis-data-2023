-- Aktifkan event scheduler jika belum aktif
SET
  GLOBAL event_scheduler = ON;

-- Buat event untuk memeriksa dan mengubah status_kok 
DELIMITER / / CREATE EVENT update_status_kok ON SCHEDULE EVERY 1 SECOND -- Ganti dengan interval waktu yang sesuai
DO BEGIN -- Periksa dan ubah status sesuai kondisi
UPDATE
  kok
SET
  status_kok = CASE
    WHEN ordered_at IS NOT NULL THEN 'terjual'
    ELSE 'tersedia'
  END
WHERE
  status_kok = 'tersedia'
  OR status_kok = 'terjual';

END;

/ / DELIMITER;