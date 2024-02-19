DELIMITER / / CREATE TRIGGER detail_transaksi_insert_check_status_obat BEFORE
INSERT
  ON detail_transaksi FOR EACH ROW BEGIN DECLARE id_status_transaksi INT,
  id_obat_pada_resep int,
  banyak_obat int;

SELECT
  id_status INTO id_status_transaksi
FROM
  transaksi
WHERE
  transaksi.id = NEW.id_transaksi;

IF id_status_transaksi = 1 THEN
SET
  NEW.id_obat = NULL;

END IF;

END;

/ / DELIMITER;