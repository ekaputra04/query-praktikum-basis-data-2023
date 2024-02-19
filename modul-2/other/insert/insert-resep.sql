-- Rumus angka random dari a sampai b
-- FLOOR(RAND() * (b - a + 1) + a);
INSERT INTO
  resep (id_user, foto)
VALUES
  (
    FLOOR(RAND() * (39 - 12 + 1) + 12),
    CONCAT(
      LOWER(
        SUBSTRING(
          MD5(RAND())
          FROM
            1 FOR 8
        )
      ),
      '.png'
    )
  )