DELIMITER / / CREATE TRIGGER update_ordered_at_kok
AFTER
UPDATE
  ON detail_pembelian_kok FOR EACH ROW BEGIN DECLARE jumlah DECIMAL(10, 2);

-- Ambil nilai jumlah dari detail_pembelian_kok
SET
  jumlah = NEW.jumlah;

-- Update waktu_pesan pada kok dengan nilai jumlah
UPDATE
  kok
SET
  ordered_at = now()
WHERE
  id = NEW.id_kok;

END;

/ / DELIMITER;