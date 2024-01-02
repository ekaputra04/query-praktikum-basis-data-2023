DELIMITER / / CREATE TRIGGER update_total_penyewaan_raket
AFTER
UPDATE
  ON detail_penyewaan_raket FOR EACH ROW BEGIN
UPDATE
  penyewaan_raket pr
SET
  pr.total_penyewaan = (
    SELECT
      SUM(dp.total_biaya)
    FROM
      detail_penyewaan_raket dp
    WHERE
      dp.id_penyewaan = NEW.id_penyewaan
  )
WHERE
  pr.id = NEW.id_penyewaan;

END;

/ / DELIMITER;