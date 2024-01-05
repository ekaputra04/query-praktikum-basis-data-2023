DELIMITER / / CREATE TRIGGER insert_total_biaya_kok BEFORE
INSERT
  ON detail_pembelian_kok FOR EACH ROW BEGIN DECLARE harga_kok DECIMAL(10, 2);

-- Ambil nilai harga dari kok
SELECT
  harga INTO harga_kok
FROM
  kok
WHERE
  id = NEW.id_kok;

-- Hitung total_biaya
SET
  NEW.total_biaya = harga_kok * NEW.jumlah;

END;

/ / DELIMITER;