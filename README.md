# MoodBite 🍪

MoodBite adalah aplikasi pemantau suasana hati (*mood tracker*) berbasis perangkat bergerak (*mobile*) yang dibangun menggunakan Flutter SDK. Aplikasi ini dirancang secara khusus untuk membantu pengguna menyelaraskan kondisi emosional dengan manajemen asupan nutrisi harian yang tepat.

Dokumen ini disusun sebagai wujud pemenuhan komponen penilaian **Ujian Tengah Semester (UTS) pada mata kuliah Mobile Computing**.

---

## 🎨 Tautan Desain (Figma)

Seluruh implementasi antarmuka komponen visual (UI), pengalaman pengguna (UX), serta alur navigasi dari aplikasi ini mengacu sepenuhnya pada rancangan desain digital yang dapat diakses melalui tautan berikut:
👉 [**Desain Prototipe MoodBite di Figma**](https://www.figma.com/design/4MTzeDKDDGYWbzJFlnBQzS/MoodBite?node-id=0-1&t=pDwhFWggBABLLXOE-1)

---

## ✨ Fitur Utama (Konsep Komponen Utama)

* **Nourish Path:** Modul interaktif personal yang ditempatkan pada halaman beranda sebagai fungsionalitas inti dari aplikasi MoodBite. Fitur ini memandu pengguna untuk memulai perjalanan (*"Mulai Perjalanan"*) dalam mentransformasikan atau mengelola suasana hati (*mood*) mereka saat itu menjadi tindakan pemenuhan nutrisi riil, dengan fokus pada stabilisasi pikiran serta pemeliharaan kesehatan tubuh.

---

## 📐 Cakupan Widget & Dokumentasi Arsitektur Kode

Berikut adalah daftar komponen widget beserta dokumentasi teknis implementasinya di dalam repositori proyek ini:

* **Scaffold** : Bertindak sebagai fondasi utama halaman, menyediakan struktur dasar tata letak layar, serta mengatur warna latar belakang aplikasi (`#F9FAFC`) agar selaras dengan skema warna sistem pada Figma.
* **Column** : Berfungsi untuk menyusun susunan komponen visual (seperti aset logo, komponen teks judul, kolom input formulir, dan tombol aksi) secara vertikal dari atas ke bawah.
* **Row** : Digunakan untuk mengorganisasikan elemen visual secara horizontal (sejajar ke samping) pada area *footer*, seperti pada teks penunjuk akun dan tautan tombol *"Daftar"*.
* **Padding & SizedBox** : Berfungsi sebagai pengatur dimensi jarak tepi dalam (*margin/padding*) layar serta menyediakan ruang kosong (*spacing*) vertikal/horizontal antar-widget untuk mencapai presisi tata letak (*layout*) yang sesuai dengan desain asli.
* **Center** : Berfungsi untuk memosisikan blok kontainer utama formulir autentikasi agar berada tepat di titik tengah geometris layar perangkat pengguna.
* **SingleChildScrollView** : Menyediakan fungsionalitas gulir (*scroll*) adaptif pada layar saat papan ketik virtual (*keyboard*) aktif, guna mencegah terjadinya galat kebocoran piksel (*pixel overflow error*).
* **StatefulWidget vs StatelessWidget** : 
  * `LoginPage` diimplementasikan sebagai *StatefulWidget* untuk mengelola perubahan status (*state*) UI secara dinamis, seperti validasi data masukan formulir dan visibilitas teks kata sandi.
  * `HomePagePlaceholder` diimplementasikan sebagai *StatelessWidget* karena hanya bertugas merender elemen statis (logo dan pesan selamat datang) tanpa adanya perubahan data internal pada layar tersebut.
* **Form & GlobalKey\<FormState\>** : Berfungsi sebagai kontainer pengontrol terpusat yang melacak, mengidentifikasi, dan memvalidasi keabsahan status seluruh kolom input formulir secara simultan.
* **TextFormField & Validator** : Komponen kolom input teks interaktif yang dilengkapi dengan logika pengecekan otomatis untuk mendeteksi string kosong, validasi struktur surat elektronik menggunakan ekspresi reguler (*Regular Expression / RegEx*), serta pembatasan panjang kata sandi minimal 8 karakter.
* **setState()** : Fungsi mutasi *state* bawaan Flutter yang memicu perenderaan ulang (*rebuild*) komponen UI secara *real-time* saat terjadi perubahan status data (seperti mengubah ikon mata sandi dan mengaktifkan status memuat).
* **CircularProgressIndicator** : Menampilkan animasi indikator pemrosesan berbentuk lingkaran sebagai umpan balik visual (*visual feedback*) bahwa sistem sedang mengeksekusi verifikasi kredensial login.
* **Navigator.pushReplacement()** : Mengontrol alur navigasi perpindahan halaman dari `LoginPage` menuju `HomePagePlaceholder` dengan cara menggantikan (*replace*) riwayat halaman lama dalam tumpukan memori (*stack*), sehingga mencegah pengguna kembali ke halaman autentikasi saat menekan tombol kembali fisik perangkat.
* **TextEditingController.clear()** : Metode yang digunakan untuk menghapus dan membersihkan sisa teks residu di dalam kolom input sesaat sebelum sistem dialihkan menuju halaman utama.

---

## 🚀 Panduan Menjalankan Proyek (Deployment)

1. Pastikan perangkat Anda telah terkonfigurasi dengan **Flutter SDK** versi stabil.
2. Lakukan klon (*clone*) repositori ini ke dalam direktori lokal komputer Anda.
3. Buka terminal pada direktori proyek tersebut, lalu jalankan perintah berikut untuk mengunduh seluruh dependensi (*packages*) yang tertera pada `pubspec.yaml`:
   ```bash
   flutter pub get