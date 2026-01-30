# NovaStore E-Ticaret Veri Tabanı Projesi

Bu proje, PostgreSQL kullanılarak geliştirilen bir e-ticaret veri tabanı yönetim sistemidir.  
Amaç; veri tabanı tasarımı, ilişkisel yapı kurma ve SQL sorgulama becerilerinin
gerçek hayat senaryosu üzerinden uygulanmasıdır.

---

##  Proje Amacı
- İlişkisel veri tabanı tasarlamak
- Primary Key ve Foreign Key ilişkilerini kurmak
- JOIN, GROUP BY, SUBQUERY gibi SQL yapılarını kullanmak
- Gerçekçi raporlama sorguları hazırlamak

---

##  Veri Tabanı Yapısı

Veri tabanı aşağıdaki tablolardan oluşmaktadır:

- **Categories** – Ürün kategorileri
- **Products** – Ürün bilgileri
- **Customers** – Müşteri bilgileri
- **Orders** – Sipariş bilgileri
- **OrderDetails** – Sipariş – Ürün ilişkisi (ara tablo)

Tablolar arasında Foreign Key ilişkileri kurulmuştur.

---

##  Kullanılan SQL Yapıları

- CREATE DATABASE / CREATE TABLE
- PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL
- INSERT (Dummy Data)
- SELECT
- INNER JOIN / LEFT JOIN
- GROUP BY, COUNT(), SUM()
- DATEDIFF benzeri tarih hesaplamaları
- VIEW oluşturma

---

##  Örnek Sorgular
- Stok miktarı azalan ürünlerin listelenmesi
- Müşteri – sipariş eşleştirme raporları
- Kategori bazlı ürün sayısı
- Müşteri bazlı toplam ciro analizi
- Siparişlerin üzerinden geçen gün sayısı

---

##  Kullanılan Teknolojiler
- PostgreSQL
- SQL
- Visual Studio Code
- Git & GitHub

---

##  Geliştirici
** Halis Lütfü Bayçöl **  
Staj SQL Projesi
