-- Rumus angka random dari a sampai b
-- FLOOR(RAND() * (b - a + 1) + a);
INSERT INTO
  detail_pembelian_kok (id_pembelian, id_kok, jumlah)
VALUES
  (
    FLOOR(RAND() * (51 - 1 + 1) + 1),
    FLOOR(RAND() * (140 - 1 + 1) + 1),
    FLOOR(RAND() * (5 - 1 + 1) + 1)
  );