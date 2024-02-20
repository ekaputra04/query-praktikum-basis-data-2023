DELIMITER / / CREATE TRIGGER tg_insert_pemesanan_total_harga
AFTER
INSERT
  ON detail_pemesanan FOR EACH ROW BEGIN DECLARE var_total_harga int(11);

SELECT
  total_harga INTO var_total_harga
FROM
  pemesanan
WHERE
  id = NEW.id_pemesanan;

-- Ubah total_harga
SET
  var_total_harga = var_total_harga + NEW.sub_total_harga + NEW.ongkos_kirim;

UPDATE
  pemesanan
SET
  total_harga = var_total_harga
WHERE
  id = NEW.id_pemesanan;

END;

/ / DELIMITER;