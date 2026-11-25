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
│   ├── bloc/
│   │   ├── login_bloc.dart          # Controller BLoC untuk autentikasi login
│   │   ├── logout_bloc.dart         # Controller BLoC untuk proses logout (clear token)
│   │   ├── produk_bloc.dart         # Controller BLoC CRUD produk (get, add, update, delete)
│   │   └── registrasi_bloc.dart     # Controller BLoC untuk pendaftaran member baru
│   ├── helpers/
│   │   ├── api.dart                 # Wrapper HTTP Request (POST, GET, DELETE dengan Bearer Token)
│   │   ├── api_url.dart             # Konfigurasi endpoint URL REST API
│   │   ├── app_exception.dart       # Penanganan error jaringan (Exception handling)
│   │   └── user_info.dart           # Local storage SharedPreferences (Token & UserID)
│   ├── model/
│   │   ├── login.dart               # Model deserialisasi response login
│   │   ├── produk.dart              # Model deserialisasi objek produk
│   │   └── registrasi.dart          # Model deserialisasi response registrasi
│   ├── ui/
│   │   ├── login_page.dart          # Form login terintegrasi LoginBloc & UserInfo
│   │   ├── produk_detail.dart       # Detail produk terintegrasi ProdukBloc.deleteProduk
│   │   ├── produk_form.dart         # Form Tambah & Ubah terintegrasi ProdukBloc
│   │   ├── produk_page.dart         # List produk dinamis via FutureBuilder & ProdukBloc
│   │   └── registrasi_page.dart     # Form registrasi terintegrasi RegistrasiBloc
│   ├── widget/
│   │   ├── success_dialog.dart      # Dialog notifikasi sukses
│   │   └── warning_dialog.dart      # Dialog notifikasi peringatan/gagal
│   └── main.dart                    # Entry point aplikasi dengan pengecekan token sesi login
└── test/
    └── widget_test.dart             # Smoke test widget Toko Kita
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
## Screenshot Tampilan
<img width="500" height="826" alt="image" src="https://github.com/user-attachments/assets/576e2c09-69b2-4a0a-8cef-1fe4b80158ae" />
<img width="497" height="798" alt="image" src="https://github.com/user-attachments/assets/ce7ac632-3a33-474d-9f23-af1906a229ab" />
<img width="497" height="810" alt="image" src="https://github.com/user-attachments/assets/4cf4e866-f125-48ef-8294-450953c1376b" />
<img width="495" height="787" alt="image" src="https://github.com/user-attachments/assets/2b88488a-ded4-4fff-a8b1-5ae2c522ed47" />
<img width="498" height="801" alt="image" src="https://github.com/user-attachments/assets/73cfc689-4217-4a3a-8ad4-4780fcb10a2a" />
<img width="497" height="798" alt="image" src="https://github.com/user-attachments/assets/473f676b-cbbc-4e25-8d2c-fe4f46d43669" />
<img width="492" height="807" alt="image" src="https://github.com/user-attachments/assets/ba81ec2b-67c3-4b6a-b1cd-498f619cde69" />
<img width="507" height="801" alt="image" src="https://github.com/user-attachments/assets/d8cf3e97-9006-41d5-b03e-4a2d6c95cfe4" />






