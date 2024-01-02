-- Buat trigger untuk memeriksa status lapangan sebelum penyewaan
DELIMITER / / CREATE TRIGGER update_check_lapangan_status BEFORE
UPDATE
  ON detail_penyewaan_lapangan FOR EACH ROW BEGIN DECLARE lapangan_status ENUM('tersedia', 'dipesan');

-- Ambil status lapangan berdasarkan id_lapangan yang akan disewa
SELECT
  status_lapangan INTO lapangan_status
FROM
  lapangan
WHERE
  id = NEW.id_lapangan;

-- Periksa apakah lapangan tidak bisa dipesan
IF lapangan_status = 'dipesan' THEN SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'Lapangan tidak bisa dipesan saat ini';

END IF;

END;

/ / DELIMITER;