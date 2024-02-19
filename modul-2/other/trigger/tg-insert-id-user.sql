DELIMITER / / CREATE TRIGGER insert_id_user
AFTER
INSERT
  ON resep_transaksi FOR EACH ROW BEGIN DECLARE id_user_resep int;

SELECT
  resep.id_user INTO id_user_resep
FROM
  resep
  JOIN resep_transaksi ON resep_transaksi.id_resep = resep.id
WHERE
  resep_transaksi.id = NEW.id;

UPDATE
  transaksi
SET
  id_user = id_user_resep
WHERE
  id = NEW.id_transaksi;

END;

/ / DELIMITER;