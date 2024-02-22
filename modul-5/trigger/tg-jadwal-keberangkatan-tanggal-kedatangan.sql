DELIMITER / / CREATE TRIGGER tg_jadwal_keberangkatan_tanggal_kedatangan BEFORE
INSERT
  ON jadwal_keberangkatan FOR EACH ROW BEGIN DECLARE var_lama_perjalanan INT;

SET
  var_lama_perjalanan = FLOOR(RAND() *(5 -1 + 1)) + 1;

SET
  NEW.tanggal_kedatangan = DATE_ADD(
    NEW.tanggal_keberangkatan,
    INTERVAL var_lama_perjalanan HOUR
  );

END;

/ / DELIMITER;