DELIMITER / / CREATE TRIGGER insert_resep_transaksi
AFTER
INSERT
  ON detail_transaksi FOR EACH ROW BEGIN DECLARE var_id_user int;

SELECT
  users.id INTO var_id_user
FROM
  users
  JOIN resep ON resep.id_user = users.id
  JOIN resep_transaksi ON resep_transaksi.id_resep = resep.id
  JOIN detail_transaksi ON detail_transaksi.id = resep_transaksi.id_transaksi
WHERE
  detail_transaksi.id = NEW.id;

UPDATE
  transaksi
SET
  id_user = id_user
WHERE
  id = NEW.id_transaksi;

END;

/ / DELIMITER;