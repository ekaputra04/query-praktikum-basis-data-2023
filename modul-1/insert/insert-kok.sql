-- Rumus angka random dari a sampai b
-- FLOOR(RAND() * (b - a + 1) + a);
INSERT INTO
  kok (harga)
VALUES
  (FLOOR(RAND() * (30000 - 10000) + 10000));