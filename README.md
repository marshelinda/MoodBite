# MoodBite 🍪

MoodBite adalah aplikasi pemantau suasana hati (*mood tracker*) berbasis Flutter yang dirancang untuk membantu pengguna menyelaraskan kondisi emosional dengan asupan nutrisi harian mereka. 

Dokumen ini disusun sebagai pemenuhan **Ujian Tengah Semester (UTS) Mata Kuliah Mobile Computing**.

---

## 🎨 Tautan Desain Figma
Seluruh implementasi komponen antarmuka (UI/UX) dan alur aplikasi ini mengacu pada tautan yang dapat diakses secara publik yaitu :
👉 [**https://www.figma.com/design/4MTzeDKDDGYWbzJFlnBQzS/MoodBite?node-id=0-1&t=pDwhFWggBABLLXOE-1**]

---

## ✨ Fitur Utama
* **Nourish Path:** Sebuah modul interaktif dan personal di halaman beranda yang menjadi inti dari aplikasi MoodBite. Fitur ini mengajak pengguna memulai perjalanan (*"Mulai Perjalanan"*) untuk mengubah atau menyelaraskan suasana hati (*mood*) mereka saat itu menjadi aksi nutrisi nyata yang berfokus pada menenangkan pikiran serta menjaga kesehatan tubuh.

---

## 📐 Cakupan Implementasi Widget & Penjelasannya

* **Scaffold** : Berfungsi sebagai fondasi utama halaman, struktur dasar layar, dan pengatur warna latar belakang aplikasi (`#F9FAFC`) agar sinkron dengan panduan warna di Figma.
* **Column** : Berfungsi untuk menyusun barisan komponen visual (seperti logo, judul teks, kotak input, dan tombol) secara vertikal dari atas ke bawah.
* **Row** : Berfungsi untuk menyusun elemen visual (seperti teks pemancing dan tautan navigasi tombol *"Daftar"*) secara horizontal agar sejajar ke samping pada area *footer*.
* **Padding & SizedBox** : Berfungsi sebagai pengatur dimensi jarak tepi dalam layar dan pemberi ruang kosong (*spacing*) vertikal/horizontal antar-widget agar presisi dengan ukuran desain asli.
* **Center** : Berfungsi untuk menyelaraskan seluruh blok kontainer formulir login agar posisinya otomatis berada tepat di tengah-tengah layar perangkat.
* **SingleChildScrollView** : Berfungsi menyediakan fitur gulir otomatis pada layar saat papan ketik aktif, mencegah terjadinya eror kebocoran piksel (*pixel overflow*).
* **StatefulWidget** : Berfungsi sebagai basis kelas komponen halaman dinamis yang memungkinkan UI memperbarui tampilannya secara instan saat terjadi interaksi pengguna.
* **Form & GlobalKey\<FormState\>** : Berfungsi sebagai wadah pengontrol terpusat untuk melacak, mengidentifikasi, dan memvalidasi keabsahan status seluruh kolom input secara bersamaan.
* **TextFormField & Validator** : Berfungsi sebagai komponen kolom input teks interaktif yang dibekali logika pengecekan otomatis untuk mendeteksi teks kosong, struktur email tiruan (menggunakan RegEx), dan panjang sandi minimal 8 karakter.
* **setState()** : Berfungsi sebagai fungsi pemicu untuk merender ulang komponen UI secara *real-time* saat status data berubah (seperti mengubah visibilitas kata sandi dan status memuat).
* **CircularProgressIndicator** : Berfungsi menampilkan animasi lingkaran berputar sebagai indikator umpan balik visual bahwa aplikasi sedang memproses verifikasi data.
* **showDialog & AlertDialog** : Berfungsi untuk menampilkan jendela *pop-up overlay* estetik di atas halaman utama untuk memberikan informasi keberhasilan akses autentikasi.
* **Navigator.pop(context)** : Berfungsi sebagai fungsi kendali navigasi dasar untuk menutup kembali jendela dialog secara programatis dari memori tumpukan (*stack*).
* **TextEditingController.clear()** : Berfungsi untuk membersihkan kembali sisa-sisa teks yang tertinggal di dalam kolom input sesaat setelah jendela dialog ditutup pengguna.

---

## 🚀 Cara Menjalankan Aplikasi
1. Pastikan Flutter SDK telah terpasang dengan baik di perangkat Anda.
2. Klona (*clone*) repository ini ke dalam direktori lokal komputer Anda.
3. Jalankan perintah berikut pada terminal proyek untuk mengunduh semua dependensi:
   ```bash
   flutter pub get