-- Buat trigger untuk memeriksa status raket sebelum penyewaan
DELIMITER / / CREATE TRIGGER insert_check_status_raket BEFORE
INSERT
  ON detail_penyewaan_raket FOR EACH ROW BEGIN DECLARE status_raket ENUM('tersedia', 'dipesan');

-- Ambil status raket berdasarkan id_raket yang akan disewa
SELECT
  status_raket INTO status_raket
FROM
  raket
WHERE
  id = NEW.id_raket;

-- Periksa apakah raket tidak bisa dipesan
IF status_raket = 'dipesan' THEN SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'Raket tidak bisa dipesan saat ini';

END IF;

END;

/ / DELIMITER;