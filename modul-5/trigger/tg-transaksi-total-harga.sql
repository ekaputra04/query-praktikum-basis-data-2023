DELIMITER / / CREATE TRIGGER tg_transaksi_total_harga BEFORE
INSERT
  ON transaksi FOR EACH ROW BEGIN DECLARE var_harga_kereta INT;

DECLARE var_harga_fasilitas INT;

SELECT
  jk.harga INTO var_harga_kereta
FROM
  pemesanan AS p
  JOIN jadwal_keberangkatan AS jk ON jk.id = p.id_jadwal_keberangkatan
WHERE
  p.id = NEW.id_pemesanan;

SELECT
  f.harga_fasilitas INTO var_harga_fasilitas
FROM
  pemesanan AS p
  JOIN fasilitas AS f ON f.id = p.id_fasilitas
WHERE
  p.id = NEW.id_pemesanan;

SET
  NEW.total_harga = var_harga_kereta + var_harga_fasilitas;

END;

/ / DELIMITER;