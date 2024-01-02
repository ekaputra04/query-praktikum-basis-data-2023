DELIMITER / / CREATE TRIGGER insert_waktu_pesan_raket BEFORE
INSERT
  ON detail_penyewaan_raket FOR EACH ROW BEGIN DECLARE rentang_waktu DECIMAL(10, 2);

-- Ambil nilai rentang_waktu dari detail_penyewaan_raket
SET
  rentang_waktu = NEW.rentang_waktu;

-- Update waktu_pesan pada raket dengan nilai rentang_waktu
UPDATE
  raket
SET
  waktu_pesan_awal = now(),
  waktu_pesan_akhir = date_add(waktu_pesan_awal, interval rentang_waktu hour)
WHERE
  id = NEW.id_raket;

END;

/ / DELIMITER;