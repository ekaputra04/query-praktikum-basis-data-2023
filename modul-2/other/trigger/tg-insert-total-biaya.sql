DELIMITER / / CREATE TRIGGER insert_total_biaya BEFORE
INSERT
  ON detail_transaksi FOR EACH ROW BEGIN DECLARE harga_jual_obat DECIMAL(10, 2);

SELECT
  harga_jual INTO harga_jual_obat
FROM
  obat
WHERE
  id = NEW.id_obat;

-- Hitung total_biaya
SET
  NEW.total_biaya = harga_jual_obat * NEW.jumlah;

END;

/ / DELIMITER;