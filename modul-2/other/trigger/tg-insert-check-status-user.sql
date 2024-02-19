DELIMITER / / CREATE TRIGGER insert_check_status_user BEFORE
INSERT
  ON transaksi FOR EACH ROW BEGIN IF NEW.id_status = 1
  AND NEW.id_user IS NOT NULL THEN
SET
  NEW.id_user = null;

END IF;

END;

/ / DELIMITER;