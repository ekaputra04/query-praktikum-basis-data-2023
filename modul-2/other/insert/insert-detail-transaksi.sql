-- Rumus angka random dari a sampai b
-- FLOOR(RAND() * (b - a + 1) + a);
INSERT INTO
  detail_transaksi (id_transaksi, id_resep, id_obat, jumlah)
VALUES
  (
    FLOOR(RAND() * (102 - 1 + 1) + 1),
    FLOOR(RAND() * (42 - 1 + 1) + 1),
    FLOOR(RAND() * (5 - 1 + 1) + 1)
  );