DELIMITER / / CREATE TRIGGER update_total_biaya_lapangan
AFTER
UPDATE
  ON detail_penyewaan_lapangan FOR EACH ROW BEGIN DECLARE harga DECIMAL(10, 2);

-- Ambil nilai harga_per_jam dari lapangan
SELECT
  harga_per_jam INTO harga
FROM
  lapangan
WHERE
  id = NEW.id_lapangan;

-- Jika terjadi UPDATE pada rentang_waktu atau id_lapangan
SET
  NEW.total_biaya = harga * NEW.rentang_waktu;

END;

/ / DELIMITER;