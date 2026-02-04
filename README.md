# 📝 Tudulis - Simple & Reactive To-Do App

**Tudulis** adalah aplikasi manajemen tugas sederhana yang dibangun menggunakan **Flutter**. Proyek ini dibuat untuk mendemonstrasikan penerapan **State Management (GetX)** dan **Local Storage** yang efisien.

Aplikasi ini memungkinkan pengguna untuk membuat, memantau, dan menghapus tugas harian mereka tanpa takut data hilang saat aplikasi ditutup.

---

## 📸 Screenshots

| Halaman Utama | Tambah Tugas | Tugas Selesai |
|:---:|:---:|:---:|
| <img src="URL_GAMBAR_1_DISINI" width="200" /> | <img src="URL_GAMBAR_2_DISINI" width="200" /> | <img src="URL_GAMBAR_3_DISINI" width="200" /> |

*(Note: Ganti `URL_GAMBAR` dengan link screenshot aplikasi kamu)*

---

## ✨ Fitur Utama

* **Create Task:** Menambahkan tugas baru dengan ID unik berbasis waktu.
* **Read Task:** Menampilkan daftar tugas secara *real-time* (Reactive).
* **Update Status:** Menandai tugas selesai/belum selesai dengan sekali tap (Toggle).
* **Delete Task:** Menghapus tugas yang tidak diinginkan.
* **Data Persistence:** Data tersimpan otomatis di memori HP menggunakan **GetStorage** (Data tidak hilang walau aplikasi di-restart).
* **Empty State Handling:** Tampilan ramah saat daftar tugas kosong (menggunakan teknik *Early Return*).

---

## 🛠️ Teknologi yang Digunakan

* **Language:** [Dart](https://dart.dev/)
* **Framework:** [Flutter](https://flutter.dev/)
* **State Management:** [GetX](https://pub.dev/packages/get) (Untuk performa tinggi & reaktif)
* **Local Storage:** [GetStorage](https://pub.dev/packages/get_storage) (Penyimpanan ringan & cepat)

---

## 🚀 Cara Menjalankan (Installation)

1.  **Clone Repository ini**
    ```bash
    git clone [https://github.com/ilahammu/tudulis.git](https://github.com/ilahammu/tudulis.git)
    ```

2.  **Masuk ke Folder Proyek**
    ```bash
    cd tudulis
    ```

3.  **Install Dependencies**
    ```bash
    flutter pub get
    ```

4.  **Jalankan Aplikasi**
    ```bash
    flutter run
    ```

---

## 👤 Author

**Ilham Muhijri**
* GitHub: [@ilahammu](https://github.com/ilahammu)
* LinkedIn: [Ilham Muhijri](https://www.linkedin.com/in/ilham-muhijri-yosefin-02a8a4248/)

---

*Dibuat dengan ❤️ dan Flutter.*