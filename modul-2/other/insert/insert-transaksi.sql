-- Rumus angka random dari a sampai b
-- FLOOR(RAND() * (b - a + 1) + a);
-- insert dengan status 'dengan resep'
INSERT INTO
  transaksi (id_status, id_admin)
VALUES
  (
    1,
    FLOOR(RAND() * (4 - 1 + 1) + 1)
  );

-- insert dengan status 'tanpa resep'
INSERT INTO
  transaksi (id_status, id_user, id_admin)
VALUES
  (
    2,
    FLOOR(RAND() * (39 - 12 + 1) + 12),
    FLOOR(RAND() * (4 - 1 + 1) + 1)
  );