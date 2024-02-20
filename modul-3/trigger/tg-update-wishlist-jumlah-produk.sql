DELIMITER / / CREATE TRIGGER tg_update_wishlist_jumlah_produk BEFORE
UPDATE
  ON wishlist FOR EACH ROW BEGIN DECLARE harga INT;

-- Ambil nilai harga dari produk
SELECT
  harga_produk INTO harga
FROM
  produk
WHERE
  id = NEW.id_produk;

-- Update total_harga
SET
  NEW.total_harga = harga * NEW.jumlah_produk;

END;

/ / DELIMITER;