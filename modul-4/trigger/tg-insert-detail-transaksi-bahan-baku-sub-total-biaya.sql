DELIMITER / / CREATE TRIGGER tg_insert_detail_transaksi_bahan_baku_sub_total_biaya BEFORE
INSERT
  ON detail_transaksi_bahan_baku FOR EACH ROW BEGIN DECLARE var_harga decimal(10, 2);

SELECT
  harga_satuan INTO var_harga
FROM
  bahan_baku
WHERE
  id = NEW.id_bahan_baku;

SET
  NEW.sub_total_biaya = var_harga * NEW.jml_bahan_baku;

END;

/ / DELIMITER;