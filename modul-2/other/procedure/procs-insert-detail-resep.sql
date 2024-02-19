-- procedure untuk melakukan insert data secara otomatis pada tabel detail_resep
DELIMITER / / CREATE PROCEDURE InsertDetailResep() BEGIN DECLARE counter INT DEFAULT 1;

WHILE counter <= 102 DO
INSERT INTO
  detail_resep (id_resep, id_obat, jumlah)
VALUES
  (
    counter,
    FLOOR(RAND() * (42 - 1 + 1) + 1),
    FLOOR(RAND() * (5 - 1 + 1) + 1)
  ),
  (
    counter,
    FLOOR(RAND() * (42 - 1 + 1) + 1),
    FLOOR(RAND() * (5 - 1 + 1) + 1)
  );

SET
  counter = counter + 1;

END WHILE;

END;

/ / DELIMITER;