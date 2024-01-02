DELIMITER / / CREATE TRIGGER update_total_biaya_raket BEFORE
UPDATE
  ON detail_penyewaan_raket FOR EACH ROW BEGIN DECLARE harga DECIMAL(10, 2);

-- Ambil nilai harga_per_jam dari raket
SELECT
  harga_per_jam INTO harga
FROM
  raket
WHERE
  id = NEW.id_raket;

-- Jika terjadi UPDATE pada rentang_waktu atau id_raket
SET
  NEW.total_biaya = harga * NEW.rentang_waktu;

END;

/ / DELIMITER;