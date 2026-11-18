# Toko Kita - Aplikasi Mobile Flutter (CRUD dengan API CodeIgniter 4)

## Identitas Mahasiswa
*   **Nama:** Nafisah Sekar Ayu
*   **NIM:** H1D024087
*   **Shift Awal:** H
*   **Shift Akhir:** D

---

## 📝 Deskripsi Proyek
Proyek ini mengimplementasikan aplikasi mobile **Toko Kita** menggunakan Flutter yang terhubung dengan RESTful API berbasis **CodeIgniter 4** dan database MySQL (XAMPP).

Sistem ini mencakup dua bagian utama:
1. **Backend REST API (CodeIgniter 4)**: Dijalankan di web server XAMPP (`http://localhost/toko-api/public/`) dengan database `toko_api`.
2. **Frontend Mobile (Flutter)**: Proyek Flutter `tokokita` yang mencakup form registrasi, login, form produk (tambah & ubah), detail produk, dan list produk dengan drawer navigasi.

---

## 🗄️ Database (`toko_api`)
Database MySQL `toko_api` terdiri dari 3 tabel:
1. **`member`**: Menyimpan data akun pengguna (`id`, `nama`, `email`, `password` dienkripsi dengan bcrypt).
2. **`member_token`**: Menyimpan token autentikasi sesi login (`id`, `member_id`, `auth_key`).
3. **`produk`**: Menyimpan data produk toko (`id`, `kode_produk`, `nama_produk`, `harga`).

---

## 🌐 Backend RESTful API (CodeIgniter 4)
Repositori backend API terpisah dapat diakses pada tautan berikut:
🔗 **[Repository Toko API (Backend CodeIgniter 4)](https://github.com/Nafisah528/H1D024087-NafisahSekarAyu-FlutterBagian1-API)**

Base URL: `http://localhost/toko-api/public`

| No | Modul | Endpoint | Method | Keterangan |
|---|---|---|---|---|
| 1 | Registrasi | `/registrasi` | POST | Mendaftarkan akun member baru |
| 2 | Login | `/login` | POST | Autentikasi member dan membuat token |
| 3 | Produk | `/produk` | POST | Menambahkan produk baru |
| 4 | Produk | `/produk` | GET | Menampilkan daftar seluruh produk |
| 5 | Produk | `/produk/{id}` | GET | Menampilkan detail produk berdasarkan ID |
| 6 | Produk | `/produk/{id}` | PUT | Memperbarui data produk berdasarkan ID |
| 7 | Produk | `/produk/{id}` | DELETE | Menghapus produk berdasarkan ID |

---

## 📱 Arsitektur & Struktur File Flutter (`tokokita`)
```
tokokita/
├── lib/
│   ├── model/
│   │   ├── login.dart         # Model deserialisasi response login
│   │   ├── registrasi.dart    # Model deserialisasi response registrasi
│   │   └── produk.dart        # Model deserialisasi objek produk
│   ├── ui/
│   │   ├── registrasi_page.dart # Form registrasi dengan validasi Nama, Email (Regex), Password & Konfirmasi
│   │   ├── login_page.dart      # Form login dengan link ke halaman Registrasi
│   │   ├── produk_page.dart     # Halaman list produk, Drawer navigasi, dan tombol tambah produk (+)
│   │   ├── produk_form.dart     # Form dinamis untuk Tambah Produk dan Ubah Produk
│   │   └── produk_detail.dart   # Halaman detail produk lengkap tombol EDIT dan DELETE (konfirmasi dialog)
│   └── main.dart                # Entry point aplikasi yang memanggil ProdukPage()
└── test/
    └── widget_test.dart         # Smoke test widget Toko Kita
```

---

## 🚀 Cara Menjalankan
1. **Pastikan Apache dan MySQL di XAMPP telah berjalan (Status: Running)**.
2. **Uji API melalui Postman**: Import file `toko_api_postman_collection.json` untuk menguji registrasi, login, dan CRUD produk.
3. **Jalankan Aplikasi Flutter**:
   ```bash
   cd c:\Kuliah\Belajar\tokokita
   flutter run
   ```
