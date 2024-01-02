INSERT INTO
  detail_penyewaan_lapangan (id_penyewaan, id_lapangan, rentang_waktu)
VALUES
  (FLOOR(RAND() * (51 - 1 + 1) + 1)),
  FLOOR(RAND() * (b - a + 1) + a);