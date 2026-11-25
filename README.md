# Toko Kita - Aplikasi Mobile Flutter (CRUD dengan API CodeIgniter 4)

## Identitas Mahasiswa
*   **Nama:** Nafisah Sekar Ayu
*   **NIM:** H1D024087
*   **Shift Awal:** H
*   **Shift Akhir:** D

---

# 📦 MODUL BAGIAN 1: Desain UI, Form, Model & Validasi

## 📝 Deskripsi Modul Bagian 1
Pada modul Bagian 1, fokus pembelajaran adalah merancang antarmuka pengguna (UI/UX) aplikasi mobile **Toko Kita**, pembuatan data model, pembuatan form dengan validasi lokal, serta perancangan database MySQL dan REST API di CodeIgniter 4 yang diuji melalui Postman.

### Fitur & Komponen Modul Bagian 1:
1. **Model Data (`lib/model/`)**:
   - `login.dart`: Model objek login untuk membaca respon sesi.
   - `registrasi.dart`: Model objek registrasi untuk data akun baru.
   - `produk.dart`: Model objek produk toko (`id`, `kode_produk`, `nama_produk`, `harga`).
2. **Antarmuka Tampilan Pengguna (`lib/ui/`)**:
   - `registrasi_page.dart`: Halaman registrasi dengan validasi input Nama (min 3 karakter), Email (format Regex), Password (min 6 karakter), dan Konfirmasi Password.
   - `login_page.dart`: Halaman login dengan form validasi dan link navigasi menuju Registrasi.
   - `produk_page.dart`: Halaman menampilkan daftar produk (data statis/dummy), drawer menu dengan tombol Logout, dan tombol tambah produk (+).
   - `produk_form.dart`: Form dinamis yang dapat digunakan untuk **Tambah Produk** maupun **Ubah Produk**.
   - `produk_detail.dart`: Halaman detail produk lengkap dengan tombol **EDIT** dan tombol **DELETE** beserta dialog konfirmasi hapus.
3. **Backend REST API CodeIgniter 4 & Database**:
   - Database MySQL: `toko_api` (tabel `member`, `member_token`, `produk`).
   - REST API di XAMPP: `http://localhost/toko-api/public/`
   - Repositori Backend API: 🔗 **[Repository Toko API (Backend CodeIgniter 4)](https://github.com/Nafisah528/H1D024087-NafisahSekarAyu-FlutterBagian1-API)**
   - Pengujian awal endpoint menggunakan Postman (`toko_api_postman_collection.json`).

### Struktur File Modul Bagian 1:
```
tokokita/
├── lib/
│   ├── model/
│   │   ├── login.dart
│   │   ├── produk.dart
│   │   └── registrasi.dart
│   ├── ui/
│   │   ├── login_page.dart
│   │   ├── produk_detail.dart
│   │   ├── produk_form.dart
│   │   ├── produk_page.dart
│   │   └── registrasi_page.dart
│   └── main.dart
```

---

# 🚀 MODUL BAGIAN 2: Integrasi REST API, Helper, BLoC & Local Storage

## 📝 Deskripsi Modul Bagian 2
Pada modul Bagian 2, aplikasi Flutter **Toko Kita** dihubungkan secara nyata (*live integration*) dengan Backend REST API CodeIgniter 4 dan database MySQL di XAMPP. Arsitektur aplikasi ditingkatkan menggunakan pola **BLoC (Business Logic Component)**, modul **Helper HTTP**, penanganan error jaringan, penyimpanan sesi lokal via **SharedPreferences**, serta dialog notifikasi.

### Fitur & Komponen Baru Modul Bagian 2:
1. **Dependencies Tambahan (`pubspec.yaml`)**:
   - `http`: Digunakan untuk mengirim dan menerima request REST API (GET, POST, DELETE).
   - `shared_preferences`: Digunakan untuk menyimpan `token` autentikasi dan `userID` secara lokal di perangkat.
2. **Modul Helper (`lib/helpers/`)**:
   - `api.dart`: Wrapper HTTP request (`post`, `get`, `delete`) yang secara otomatis menyertakan header `Authorization: Bearer $token`.
   - `api_url.dart`: Konfigurasi terpusat untuk alamat endpoint API (otomatis mendeteksi `http://10.0.2.2/toko-api/public` untuk Android Emulator atau `http://localhost/toko-api/public` untuk Chrome/Web).
   - `app_exception.dart`: Penanganan exception jaringan (`FetchDataException`, `BadRequestException`, `UnauthorisedException`, dll).
   - `user_info.dart`: Helper manajemen sesi login (`setToken`, `getToken`, `setUserID`, `getUserID`, dan `logout`).
3. **Modul Controller BLoC (`lib/bloc/`)**:
   - `registrasi_bloc.dart`: Menghubungkan proses pendaftaran akun ke endpoint `POST /registrasi`.
   - `login_bloc.dart`: Menghubungkan proses login ke endpoint `POST /login` dan mengembalikan token autentikasi.
   - `logout_bloc.dart`: Menangani proses keluar akun dan membersihkan data sesi token lokal.
   - `produk_bloc.dart`: Menangani operasi CRUD produk secara dinamis ke server:
     - `getProduks()`: Mengambil list produk dari database (`GET /produk`).
     - `addProduk()`: Menyimpan produk baru ke database (`POST /produk`).
     - `updateProduk()`: Memperbarui data produk (`POST /produk/{id}/update`).
     - `deleteProduk()`: Menghapus produk dari database (`DELETE /produk/{id}`).
4. **Widget Dialog (`lib/widget/`)**:
   - `success_dialog.dart`: Popup modal hijau untuk pesan sukses (registrasi berhasil, dsb).
   - `warning_dialog.dart`: Popup modal merah untuk pesan gagal/peringatan.
5. **Pembaruan Alur UI (`lib/ui/` & `main.dart`)**:
   - `main.dart`: Memeriksa token di `SharedPreferences`. Jika sudah login langsung membuka `ProdukPage`, jika belum membuka `LoginPage`.
   - `produk_page.dart`: Menggunakan `FutureBuilder<List>` untuk menampilkan data produk langsung dari database MySQL secara real-time.
   - `produk_form.dart`: Tombol SIMPAN dan UBAH terhubung ke API `ProdukBloc`.
   - `produk_detail.dart`: Tombol DELETE terhubung ke API `ProdukBloc.deleteProduk`.

### Struktur File Lengkap (Modul Bagian 1 & 2):
```
tokokita/
├── lib/
│   ├── bloc/
│   │   ├── login_bloc.dart          # [Modul 2] BLoC login & token
│   │   ├── logout_bloc.dart         # [Modul 2] BLoC logout
│   │   ├── produk_bloc.dart         # [Modul 2] BLoC CRUD produk
│   │   └── registrasi_bloc.dart     # [Modul 2] BLoC registrasi
│   ├── helpers/
│   │   ├── api.dart                 # [Modul 2] HTTP Request wrapper
│   │   ├── api_url.dart             # [Modul 2] Konfigurasi endpoint URL API
│   │   ├── app_exception.dart       # [Modul 2] Penanganan error jaringan
│   │   └── user_info.dart           # [Modul 2] Local storage SharedPreferences
│   ├── model/
│   │   ├── login.dart               # [Modul 1] Model respon login
│   │   ├── produk.dart              # [Modul 1] Model data produk
│   │   └── registrasi.dart          # [Modul 1] Model respon registrasi
│   ├── ui/
│   │   ├── login_page.dart          # [Modul 1 & 2] UI Login terintegrasi BLoC
│   │   ├── produk_detail.dart       # [Modul 1 & 2] UI Detail produk terintegrasi Hapus
│   │   ├── produk_form.dart         # [Modul 1 & 2] UI Form Tambah/Ubah terintegrasi API
│   │   ├── produk_page.dart         # [Modul 1 & 2] UI List produk via FutureBuilder
│   │   └── registrasi_page.dart     # [Modul 1 & 2] UI Registrasi terintegrasi BLoC
│   ├── widget/
│   │   ├── success_dialog.dart      # [Modul 2] Custom dialog sukses
│   │   └── warning_dialog.dart      # [Modul 2] Custom dialog gagal
│   └── main.dart                    # [Modul 1 & 2] Entry point & auth gate
└── test/
    └── widget_test.dart
```

---

## 🚀 Cara Menjalankan
1. Pastikan **Apache** dan **MySQL** di XAMPP telah berjalan (Status: Running).
2. Database `toko_api` telah diimpor di phpMyAdmin.
3. Jalankan aplikasi Flutter:
   ```bash
   cd c:\Kuliah\Belajar\tokokita
   flutter run -d chrome
   ```

---

## Screenshot Tampilan
<img width="500" height="826" alt="image" src="https://github.com/user-attachments/assets/576e2c09-69b2-4a0a-8cef-1fe4b80158ae" />
<img width="497" height="798" alt="image" src="https://github.com/user-attachments/assets/ce7ac632-3a33-474d-9f23-af1906a229ab" />
<img width="497" height="810" alt="image" src="https://github.com/user-attachments/assets/4cf4e866-f125-48ef-8294-450953c1376b" />
<img width="495" height="787" alt="image" src="https://github.com/user-attachments/assets/2b88488a-ded4-4fff-a8b1-5ae2c522ed47" />
<img width="498" height="801" alt="image" src="https://github.com/user-attachments/assets/73cfc689-4217-4a3a-8ad4-4780fcb10a2a" />
<img width="497" height="798" alt="image" src="https://github.com/user-attachments/assets/473f676b-cbbc-4e25-8d2c-fe4f46d43669" />
<img width="492" height="807" alt="image" src="https://github.com/user-attachments/assets/ba81ec2b-67c3-4b6a-b1cd-498f619cde69" />
<img width="507" height="801" alt="image" src="https://github.com/user-attachments/assets/d8cf3e97-9006-41d5-b03e-4a2d6c95cfe4" />
