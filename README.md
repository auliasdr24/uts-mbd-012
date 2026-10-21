# UTS Manajemen Basis Data
## PostgreSQL 15 + pgAdmin 4 dengan Docker Compose

Proyek ini merupakan tugas Ujian Tengah Semester (UTS) mata kuliah **Manajemen Basis Data**. Proyek menggunakan PostgreSQL 15 dan pgAdmin 4 yang dijalankan dalam container Docker, dilengkapi dengan skema `SALAM`, tabel `mahasiswas` beserta constraint, serta pengelolaan user dan hak akses database.

## Identitas

| Keterangan | Detail |
|---|---|
| Nama | Aulia Safarina Dwi Rahayu |
| NIM | 1247050012 |
| Program Studi | Teknik Informatika |
| Universitas | UIN Sunan Gunung Djati Bandung |
| Mata Kuliah | Manajemen Basis Data |

## Fitur Utama

- **Konfigurasi kredensial:** Menggunakan file `.env` untuk menyimpan konfigurasi database agar tidak ditulis langsung di `docker-compose.yml`.
- **Healthcheck PostgreSQL:** Menggunakan `pg_isready` dan `depends_on` dengan kondisi `service_healthy` agar pgAdmin dijalankan setelah PostgreSQL siap.
- **Penamaan resource unik:** Menggunakan database `mbd_uts_012`, volume `pgdata_012`, dan jaringan `jaringan_uts_012`.
- **Manajemen hak akses:** Mengelola tiga user database, yaitu `backend_dev`, `bi_dev`, dan `data_engineer`, menggunakan `GRANT` dan `ALTER DEFAULT PRIVILEGES`.

## Struktur Repository

```text
.
├── docker-compose.yml
├── .env.example
├── soal3_mahasiswas.sql
├── soal4_user_role.sql
└── README.md
```

| File | Keterangan |
|---|---|
| `docker-compose.yml` | Konfigurasi service PostgreSQL dan pgAdmin 4 menggunakan Docker Compose. |
| `.env.example` | Contoh konfigurasi environment yang perlu disalin menjadi `.env`. |
| `soal3_mahasiswas.sql` | Pembuatan skema `SALAM`, tabel `mahasiswas`, data, dan pengujian constraint. |
| `soal4_user_role.sql` | Pembuatan user database dan pengaturan hak akses menggunakan `GRANT`. |
| `README.md` | Dokumentasi proyek dan panduan menjalankan aplikasi. |

## Persyaratan

Pastikan perangkat sudah memiliki:

- Docker Desktop
- Docker Compose
- Git (opsional, untuk mengelola repository)

## Cara Menjalankan

### 1. Clone Repository

```bash
git clone <URL_REPOSITORY>
cd <NAMA_FOLDER_REPOSITORY>
```

Jika proyek sudah tersedia di komputer, langsung buka folder proyek tersebut melalui terminal.

### 2. Konfigurasi Environment

Salin file `.env.example` menjadi `.env`.

**Windows PowerShell:**

```powershell
Copy-Item .env.example .env
```

**Linux/macOS:**

```bash
cp .env.example .env
```

Buka file `.env`, kemudian isi nilai konfigurasi dan password sesuai kebutuhan. Jangan mengunggah file `.env` yang berisi kredensial asli ke repository publik.

### 3. Jalankan Container

Pastikan Docker Desktop sudah berjalan, lalu jalankan:

```bash
docker compose up -d
```

Perintah tersebut akan menjalankan service PostgreSQL dan pgAdmin 4 di background.

### 4. Periksa Status Container

```bash
docker compose ps
```

Untuk melihat log container:

```bash
docker compose logs -f
```

### 5. Akses Layanan

| Service | Alamat | Keterangan |
|---|---|---|
| PostgreSQL 15 | `localhost:22012` | Koneksi database dari aplikasi atau client PostgreSQL. |
| pgAdmin 4 | [http://localhost:44012](http://localhost:44012) | Antarmuka web untuk mengelola database. |

Gunakan kredensial yang telah dikonfigurasi di file `.env` untuk login ke pgAdmin. Untuk mendaftarkan server PostgreSQL di pgAdmin, gunakan hostname service Docker sebagai host jika pgAdmin berjalan dalam jaringan Compose yang sama. Gunakan port internal PostgreSQL sesuai konfigurasi container.

## Konfigurasi Port

Nomor port mengikuti ketentuan tugas berdasarkan tiga digit terakhir NIM, yaitu `012`.

| Service | Port | Ketentuan |
|---|---:|---|
| PostgreSQL | `22012` | `22XXX` |
| pgAdmin 4 | `44012` | `44XXX` |

## Database dan Hak Akses

Proyek ini mencakup:

1. Pembuatan skema `SALAM` dan tabel `mahasiswas`.
2. Penerapan constraint pada tabel.
3. Pengisian data dan pengujian constraint.
4. Pembuatan user `backend_dev`, `bi_dev`, dan `data_engineer`.
5. Pembagian hak akses database menggunakan `GRANT`.
6. Pengaturan hak akses default untuk objek database baru menggunakan `ALTER DEFAULT PRIVILEGES`.

Implementasi lengkap tersedia pada file SQL yang disertakan dalam repository.

## Menghentikan Container

Untuk menghentikan service:

```bash
docker compose down
```

Untuk menghentikan service sekaligus menghapus volume database:

```bash
docker compose down -v
```

**Perhatian:** Perintah kedua menghapus volume yang digunakan untuk menyimpan data PostgreSQL. Gunakan hanya jika data memang ingin dihapus.

---

**Dibuat oleh:** Aulia Safarina Dwi Rahayu  
**Mata Kuliah:** Manajemen Basis Data  
**Program Studi:** Teknik Informatika — UIN Sunan Gunung Djati Bandung
