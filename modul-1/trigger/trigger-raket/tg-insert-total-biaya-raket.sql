DELIMITER / / CREATE TRIGGER insert_total_biaya_raket BEFORE
INSERT
  ON detail_penyewaan_raket FOR EACH ROW BEGIN DECLARE harga DECIMAL(10, 2);

-- Ambil nilai harga_per_jam dari raket
SELECT
  harga_per_jam INTO harga
FROM
  raket
WHERE
  id = NEW.id_raket;

-- Hitung total_biaya
SET
  NEW.total_biaya = harga * NEW.rentang_waktu;

END;

/ / DELIMITER;