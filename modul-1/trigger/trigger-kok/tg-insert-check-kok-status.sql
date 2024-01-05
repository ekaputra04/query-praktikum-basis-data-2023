-- Buat trigger untuk memeriksa status kok sebelum pembelian
DELIMITER / / CREATE TRIGGER insert_check_kok_status BEFORE
INSERT
  ON detail_pembelian_kok FOR EACH ROW BEGIN DECLARE kok_status ENUM('tersedia', 'terjual');

-- Ambil status kok berdasarkan id_kok yang akan dijual
SELECT
  status_kok INTO kok_status
FROM
  kok
WHERE
  id = NEW.id_kok;

-- Periksa apakah kok tidak bisa terjual
IF kok_status = 'terjual' THEN SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'Kok sudah terjual';

END IF;

END;

/ / DELIMITER;