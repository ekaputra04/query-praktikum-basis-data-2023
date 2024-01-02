DELIMITER / / CREATE TRIGGER insert_total_penyewaan_lapangan
AFTER
INSERT
  ON detail_penyewaan_lapangan FOR EACH ROW BEGIN
UPDATE
  penyewaan_lapangan pl
SET
  pl.total_penyewaan = (
    SELECT
      SUM(dp.total_biaya)
    FROM
      detail_penyewaan_lapangan dp
    WHERE
      dp.id_penyewaan = NEW.id_penyewaan
  )
WHERE
  pl.id = NEW.id_penyewaan;

END;

/ / DELIMITER;