DELIMITER / / CREATE TRIGGER update_total_pembelian_kok
AFTER
UPDATE
  ON detail_pembelian_kok FOR EACH ROW BEGIN
UPDATE
  pembelian_kok pl
SET
  pl.total_pembelian = (
    SELECT
      SUM(dp.total_biaya)
    FROM
      detail_pembelian_kok dp
    WHERE
      dp.id_pembelian = NEW.id_pembelian
  )
WHERE
  pl.id = NEW.id_pembelian;

END;

/ / DELIMITER;