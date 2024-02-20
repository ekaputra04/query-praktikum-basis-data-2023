DELIMITER / / CREATE TRIGGER tg_insert_wishlist_jumlah_produk BEFORE
INSERT
  ON wishlist FOR EACH ROW BEGIN DECLARE harga int(11);

-- Ambil nilai harga dari produk
SELECT
  harga_produk INTO harga
FROM
  produk
WHERE
  id = NEW.id_produk;

-- Hitung total_harga
SET
  NEW.total_harga = harga * NEW.jumlah_produk;

END;

/ / DELIMITER;