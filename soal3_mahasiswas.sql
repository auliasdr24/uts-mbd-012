SELECT version();

create schema "SALAM";

create table "SALAM".mahasiswas (
    nim        VARCHAR(15)  primary key,
    nama       VARCHAR(100) not null,
    email      VARCHAR(100) unique,
    fakultas   VARCHAR(75)  not null default 'Sains dan Teknologi',
    jurusan    VARCHAR(50)  not null default 'Teknik Informatika',
    angkatan   SMALLINT     check (angkatan between 2020 and 2030),
    semester   SMALLINT     check (semester between 1 and 14),
    umur       SMALLINT     check (umur >= 17),
    ipk        NUMERIC(3,2) check (ipk between 0.00 and 4.00),
    status     VARCHAR(20)  not null default 'Aktif' check (status in ('Aktif','Cuti','Lulus')),
    no_hp      VARCHAR(20),
    created_at TIMESTAMP    default CURRENT_TIMESTAMP
);

insert into "SALAM".mahasiswas (nim, nama, email, fakultas, jurusan, angkatan, semester, umur, ipk, status, no_hp)
values ('1247050012', 'Eom SeongHyeon', 'SeanEom@gmail.com', 'Sains dan Teknologi', 'Teknik Informatika', 2024, 5, 21, 3.90, 'Aktif', 089675988766),
		('1247050013', 'Anh KeonHo', 'KeanAnh@gmail.com', 'Sains dan Teknologi', 'Teknik Informatika', 2024, 5, 21, 3.85, 'Aktif', 089856332674),
		('1237050010', 'James', 'James@gmail.com', 'Sains dan Teknologi', 'Teknik Elektro', 2023, 7, 23, 3.60, 'Aktif', 089374628374),
		('1237050029', 'Kim JuHoon', 'JuhoonKim@gmail.com', 'Sains dan Teknologi', 'Fisika', 2023, 7, 22, 3.50, 'Aktif', 089263748950),
		('1237050011', 'Martin', 'Martin@gmail.com', 'Sains dan Teknologi', 'Teknik Informatika', 2023, 7, 22, 3.85, 'Aktif', 089273844577);

select * from "SALAM".mahasiswas;

INSERT INTO "SALAM".mahasiswas (nim, nama, email, angkatan, semester, umur, ipk)
VALUES ('1247050012', 'SeongHyeon Kembar', 'kembar1@gmail.com', 2024, 5, 21, 3.00);

INSERT INTO "SALAM".mahasiswas (nim, nama, email, angkatan, semester, umur, ipk)
VALUES ('1247050099', 'Email Kembar', 'SeanEom@gmail.com', 2024, 5, 21, 3.00);

INSERT INTO "SALAM".mahasiswas (nim, nama, email, angkatan, semester, umur, ipk)
VALUES ('1247050088', 'Super Senior', 'senior@gmail.com', 2020, 15, 24, 3.00);

SELECT version(), current_database();