DELIMITER / / CREATE TRIGGER tg_update_detail_pemesanan_sub_total_harga BEFORE
UPDATE
  ON detail_pemesanan FOR EACH ROW BEGIN DECLARE harga INT;

DECLARE jumlah INT;

-- Ambil nilai harga dari produk atau dari wishlist
IF NEW.id_produk IS NOT NULL
AND NEW.id_wishlist IS NULL THEN
SELECT
  harga_produk INTO harga
FROM
  produk
WHERE
  id = NEW.id_produk;

SET
  NEW.sub_total_harga = harga * NEW.total_produk;

ELSEIF NEW.id_produk IS NULL
AND NEW.id_wishlist IS NOT NULL THEN
SELECT
  jumlah_produk INTO jumlah
FROM
  wishlist
WHERE
  id = NEW.id_wishlist;

SET
  NEW.total_produk = jumlah;

SELECT
  total_harga INTO harga
FROM
  wishlist
WHERE
  id = NEW.id_wishlist;

SET
  NEW.sub_total_harga = harga;

END IF;

END;

/ / DELIMITER;