DELIMITER / / CREATE TRIGGER insert_waktu_pesan_lapangan BEFORE
INSERT
  ON detail_penyewaan_lapangan FOR EACH ROW BEGIN DECLARE rentang_waktu DECIMAL(10, 2);

-- Ambil nilai rentang_waktu dari detail_penyewaan_lapangan
SET
  rentang_waktu = NEW.rentang_waktu;

-- Update waktu_pesan pada lapangan dengan nilai rentang_waktu
UPDATE
  lapangan
SET
  waktu_pesan_awal = now(),
  waktu_pesan_akhir = date_add(waktu_pesan_awal, interval rentang_waktu hour)
WHERE
  id = NEW.id_lapangan;

END;

/ / DELIMITER;