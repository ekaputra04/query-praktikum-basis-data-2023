-- Rumus angka random dari a sampai b
-- FLOOR(RAND() * (b - a + 1) + a);
INSERT INTO
  detail_penyewaan_raket (id_penyewaan, id_raket, rentang_waktu)
VALUES
  (
    FLOOR(RAND() * (51 - 1 + 1) + 1),
    FLOOR(RAND() * (26 - 1 + 1) + 1),
    FLOOR(RAND() * (3 - 1 + 1) + 1)
  );