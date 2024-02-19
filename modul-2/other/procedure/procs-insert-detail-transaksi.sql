-- procedure untuk melakukan insert data secara otomatis pada tabel detail_transaksi
DELIMITER / / CREATE PROCEDURE InsertDetailTransaksi(INT param_id_transaksi IN) BEGIN DECLARE counter INT DEFAULT 1,
var_id_obat int;

-- SELECT
--   COUNT(detail_resep.id_obat) INTO banyak_obat
-- FROM
--   detail_resep
--   JOIN resep_transaksi ON resep_transaksi.id_resep = detail_resep.id_resep
-- WHERE
--   resep_transaksi.id_transaksi = param_id_transaksi;
-- WHILE counter <= banyak_obat DO
-- INSERT INTO
--   detail_transaksi (id_transaksi, id_obat, jumlah)
-- VALUES
--   (counter, counter);
-- SET
--   counter = counter + 1;
-- END WHILE;
SELECT
  detail_resep.id_obat INTO var_id_obat;

INSERT INTO
  detail_transaksi (id_transaksi, id_obat, jumlah)
SELECT
  param_id_transaksi,
  id_obat,
  jumlah
FROM
  detail_resep
  JOIN resep_transaksi ON resep_transaksi.id_resep = detail_resep.id_resep
  JOIN detail_transaksi ON detail_transaksi.id_transaksi = resep_transaksi.id_transaksi
WHERE
  detail_transaksi.id_transaksi = param_id_transaksi;

END;

/ / DELIMITER;