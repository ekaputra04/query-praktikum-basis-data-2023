DELIMITER / / CREATE TRIGGER tg_update_transaksi_buku_total_biaya BEFORE
UPDATE
  ON detail_transaksi_buku FOR EACH ROW BEGIN DECLARE var_total_biaya decimal(10, 2);

SELECT
  total_biaya INTO var_total_biaya
FROM
  transaksi_buku
WHERE
  id = NEW.id_tr_buku;

SET
  var_total_biaya = var_total_biaya + NEW.sub_total_biaya;

UPDATE
  transaksi_buku
SET
  total_biaya = var_total_biaya
WHERE
  id = NEW.id_tr_buku;

END;

/ / DELIMITER;