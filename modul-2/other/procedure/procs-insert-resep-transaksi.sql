-- procedure untuk melakukan insert data secara otomatis pada tabel resep_transaksi
DELIMITER / / CREATE PROCEDURE InsertResepTransaksi() BEGIN DECLARE counter INT DEFAULT 1;

WHILE counter <= 50 DO
INSERT INTO
  resep_transaksi (id_transaksi, id_resep)
VALUES
  (counter, counter);

SET
  counter = counter + 1;

END WHILE;

END;

/ / DELIMITER;