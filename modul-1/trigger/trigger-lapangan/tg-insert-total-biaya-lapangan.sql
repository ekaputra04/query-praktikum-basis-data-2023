DELIMITER / / CREATE TRIGGER insert_total_biaya_lapangan BEFORE
INSERT
  ON detail_penyewaan_lapangan FOR EACH ROW BEGIN DECLARE harga DECIMAL(10, 2);

-- Ambil nilai harga_per_jam dari lapangan
SELECT
  harga_per_jam INTO harga
FROM
  lapangan
WHERE
  id = NEW.id_lapangan;

-- Hitung total_biaya
SET
  NEW.total_biaya = harga * NEW.rentang_waktu;

END;

/ / DELIMITER;