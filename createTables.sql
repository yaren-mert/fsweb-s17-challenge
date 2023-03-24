-- Tasarımını yaptığınız tabloları oluşturan sql ifadeleri buraya yazınız.
-- veri tiplerine, nullable olma durumuna, default değerine ve tablolar arası foreign key kullanımına dikkat.
CREATE TABLE `user(kullanici)`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` TEXT NOT NULL,
    `surname` TEXT NOT NULL,
    `membership_date(uyeliktarihi)` DATETIME NOT NULL,
    `last_post_date(sonpaylastarih)` DATETIME NOT NULL,
     PRIMARY KEY (`id`) 
);
create table `categories(kategoriler)` (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    kategori_name Text
);

CREATE TABLE `basket(sepet)`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `product(ürün)` TEXT NOT NULL,
    `price(fiyat)` INT NOT NULL,
    `advert_id(ilanid)` INT NOT NULL,
     PRIMARY KEY (`id`) 
);

CREATE TABLE `ads_in_cart(sepettekiilanlar)`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `advert_id(ilanid)` INT NOT NULL,
    `basket_id(sepetid)` BIGINT NOT NULL,
    CONSTRAINT ilan_idFK FOREIGN KEY (advert_id) REFERENCES `advert(ilanlar)`(id),
    CONSTRAINT sepet_idFK FOREIGN KEY (basket_id) REFERENCES `basket(sepet)`(id),
     PRIMARY KEY (`id`) 
);

CREATE TABLE `advert(ilanlar)`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `picture(resim)` TEXT NOT NULL,
    `title(baslik)` TEXT NOT NULL,
    `explanation(aciklama)` TEXT NOT NULL,
    `labels(etiketler)` TEXT NOT NULL,
    `user_id` INT NOT NULL,
    CONSTRAINT kullaniciIdFK FOREIGN KEY (user_id) REFERENCES users(id),
    user_id INT,
    CONSTRAINT kategoriIdFK FOREIGN KEY (category_id) REFERENCES categories(id),
     PRIMARY KEY (`id`) 
);

CREATE TABLE `sub_categories(altkategoriler)`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `category_id` INT NOT NULL,
    `name` TEXT NOT NULL,
    CONSTRAINT altkategoriIdFK FOREIGN KEY (alt_kategori_id) REFERENCES kategoriler(id),
     PRIMARY KEY (`id`) 
);
ALTER TABLE
    sepet
ADD
    COLUMN kullanici_id INT NOT NULL;

ALTER TABLE
    sepet
ADD
    CONSTRAINT sepet_kullanici_id FOREIGN KEY (kullanici_id) REFERENCES kullanici(id);