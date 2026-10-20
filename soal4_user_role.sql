-- ====== SOAL 4: USER & ROLE ======

-- (a) backend_dev : CRUD semua tabel
CREATE USER backend_dev WITH PASSWORD 'BackendAulia012';
GRANT USAGE ON SCHEMA "SALAM" TO backend_dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA "SALAM" TO backend_dev;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA "SALAM" TO backend_dev;

-- (b) bi_dev : hanya SELECT (read-only)
CREATE USER bi_dev WITH PASSWORD 'BiDevAulia012';
GRANT USAGE ON SCHEMA "SALAM" TO bi_dev;
GRANT SELECT ON ALL TABLES IN SCHEMA "SALAM" TO bi_dev;

-- (c) data_engineer : CREATE, MODIFY, DROP semua object + CRUD
CREATE USER data_engineer WITH PASSWORD 'EngineerAulia012';
GRANT USAGE, CREATE ON SCHEMA "SALAM" TO data_engineer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA "SALAM" TO data_engineer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA "SALAM" TO data_engineer;

-- bonus pembeda: hak otomatis untuk tabel yang DIBUAT DI MASA DEPAN
ALTER DEFAULT PRIVILEGES IN SCHEMA "SALAM" GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO backend_dev;
ALTER DEFAULT PRIVILEGES IN SCHEMA "SALAM" GRANT SELECT ON TABLES TO bi_dev;
ALTER DEFAULT PRIVILEGES IN SCHEMA "SALAM" GRANT ALL ON TABLES TO data_engineer;

SET ROLE backend_dev;

SELECT nim, nama FROM "SALAM".mahasiswas;

INSERT INTO "SALAM".mahasiswas (nim, nama, email, angkatan, semester, umur, ipk)
VALUES ('1247050021', 'Sumbangan Backend', 'backend@dev.com', 2024, 5, 21, 3.20);

UPDATE "SALAM".mahasiswas SET ipk = 3.30 WHERE nim = '1247050021';

DELETE FROM "SALAM".mahasiswas WHERE nim = '1247050021';

CREATE TABLE "SALAM".coba_backend (id INT);

RESET ROLE;

SET ROLE bi_dev;

SELECT current_user;

SELECT count(*) FROM "SALAM".mahasiswas;

INSERT INTO "SALAM".mahasiswas (nim, nama, email, angkatan, semester, umur, ipk)
VALUES ('1247050031', 'Tukang Nyelundup', 'sneak@bi.com', 2024, 5, 21, 3.00);

RESET ROLE;

SET ROLE data_engineer;

CREATE TABLE "SALAM".meja_uji (id INT PRIMARY KEY, ket VARCHAR(50));

INSERT INTO "SALAM".meja_uji VALUES (1, 'kerjanya data_engineer');

ALTER TABLE "SALAM".meja_uji ADD COLUMN catatan VARCHAR(30);

DROP TABLE "SALAM".meja_uji;

SELECT count(*) FROM "SALAM".mahasiswas;

RESET ROLE;
