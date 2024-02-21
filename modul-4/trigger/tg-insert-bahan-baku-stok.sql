DELIMITER / / CREATE TRIGGER tg_insert_bahan_baku_stok BEFORE
INSERT
  ON detail_transaksi_bahan_baku FOR EACH ROW BEGIN DECLARE var_stok int;

SELECT
  stok INTO var_stok
FROM
  bahan_baku
WHERE
  id = NEW.id_bahan_baku;

UPDATE
  bahan_baku
SET
  stok = var_stok + NEW.jml_bahan_baku
WHERE
  id = NEW.id_bahan_baku;

END;

/ / DELIMITER;