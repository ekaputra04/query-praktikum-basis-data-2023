DELIMITER / / CREATE TRIGGER insert_detail_transaksi_dengan_resep
AFTER
INSERT
  ON detail_resep FOR EACH ROW BEGIN DECLARE var_id_transaksi int;

SELECT
  id_transaksi INTO var_id_transaksi
FROM
  resep_transaksi
  JOIN detail_resep ON detail_resep.id_resep = resep_transaksi.id_resep
WHERE
  detail_resep.id_resep = NEW.id_resep;

INSERT INTO
  detail_transaksi (id_transaksi, id_obat, jumlah)
VALUES
  (var_id_transaksi, NEW.id_obat, NEW.jumlah);

END;

/ / DELIMITER;