DELIMITER / / CREATE TRIGGER tg_insert_detail_transaksi_buku_sub_total_biaya BEFORE
INSERT
  ON detail_transaksi_buku FOR EACH ROW BEGIN DECLARE var_harga decimal(10, 2);

SELECT
  harga_satuan INTO var_harga
FROM
  buku
WHERE
  id = NEW.id_buku;

SET
  NEW.sub_total_biaya = var_harga * NEW.jml_buku;

END;

/ / DELIMITER;