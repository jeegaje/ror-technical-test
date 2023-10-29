# README

# Deskripsi Proyek

## Nama Proyek: Sistem Manajemen Perpustakaan

### Deskripsi Singkat:
Sistem Manajemen Data Buku proyek Ruby on Rails yang bertujuan untuk memudahkan manajemen dan pencatatan buku. Proyek ini memungkinkan pengguna untuk menambahkan, mengedit, serta melihat daftar buku yang tersedia.

### Fitur Utama:
- Pendaftaran dan otentikasi pengguna.
- Penambahan buku baru ke dalam basis data.
- Penyuntingan informasi buku (judul, penulis, ISBN, dll.).

## Teknologi yang Digunakan:
- Ruby on Rails: Framework web untuk pengembangan aplikasi Ruby.
- SQLite: Basis data ringan yang digunakan untuk menyimpan data buku.
- Redis: Digunakan untuk caching dan manajemen sesi.

## Panduan Instalasi:
Untuk menjalankan proyek ini di lingkungan lokal Anda, ikuti langkah-langkah berikut:

1. Pastikan Ruby dan Ruby on Rails sudah terinstal. Jika belum, ikuti petunjuk instalasi pada [Ruby](https://www.ruby-lang.org/en/documentation/installation/) dan [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html#installing-rails).

2. Clone repositori proyek:

   ```bash
   git clone https://github.com/jeegaje/ror-technical-test.git
   ```

3. Buka file Gemfile dan pastikan gem yang diperlukan telah ditambahkan. Jalankan bundle install untuk menginstal gem yang diperlukan.

4. Instal Redis dan pastikan Redis server berjalan.

5. Migrasikan basis data dengan perintah:
    ```bash
    rails db:migrate
    ```

6. Jalankan server pengembangan dengan:
    ```bash
    rails server

    ```
7. Jalankan Sidekiq untuk mengelola tugas latar belakang dengan perintah:
    ```bash
    bundle exec sidekiq
    ```


8. Buka browser dan akses http://localhost:3000 untuk mengakses aplikasi    

