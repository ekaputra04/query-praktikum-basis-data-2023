DELIMITER / / CREATE TRIGGER tg_insert_transaksi_bahan_baku_total_biaya BEFORE
INSERT
  ON detail_transaksi_bahan_baku FOR EACH ROW BEGIN DECLARE var_total_biaya decimal(10, 2);

SELECT
  total_biaya INTO var_total_biaya
FROM
  transaksi_bahan_baku
WHERE
  id = NEW.id_tr_bahan_baku;

SET
  var_total_biaya = var_total_biaya + NEW.sub_total_biaya;

UPDATE
  transaksi_bahan_baku
SET
  total_biaya = var_total_biaya
WHERE
  id = NEW.id_tr_bahan_baku;

END;

/ / DELIMITER;