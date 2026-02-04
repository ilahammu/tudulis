import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_list/app/data/models/task_models.dart';

class TaskController extends GetxController {
  // 1. Siapkan List Tugas yang Reaktif (.obs)
  var listTask = <TaskModel>[].obs;

  // 2. Panggil Tukang Gudang
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // PAS APLIKASI DIBUKA: Cek apakah ada data lama?
    if (box.hasData('data_tugas')) {
      // Ambil datanya (masih bentuk JSON acak-acakan)
      List dataMentah = box.read('data_tugas');

      // Rapikan data mentah jadi TaskModel, lalu masukkan ke listTask
      listTask.value = dataMentah.map((e) => TaskModel.fromJson(e)).toList();
    }
  }

  // FUNGSI 1: Tambah Tugas Baru
  void tambahTugas(String judulBaru) {
    // Bikin ID unik pakai waktu sekarang (detik pasti beda)
    String idUnik = DateTime.now().toString();

    // Bikin objek tugas baru
    var tugasBaru = TaskModel(id: idUnik, judul: judulBaru);

    // Masukkan ke List (Otomatis tampil di layar karena .obs)
    listTask.add(tugasBaru);

    // Simpan ke Gudang
    simpanKeStorage();
  }

  // FUNGSI 2: Hapus Tugas (Berdasarkan ID)
  void hapusTugas(String idTarget) {
    listTask.removeWhere((item) => item.id == idTarget);
    simpanKeStorage();
  }

  // FUNGSI 3: Coret/Batal Coret Tugas
  void gantiStatus(String idTarget) {
    // Cari tugas yang mau diubah
    var target = listTask.firstWhere((item) => item.id == idTarget);

    // Ubah statusnya (True jadi False, False jadi True)
    target.isSelesai = !target.isSelesai;

    // Kabari si List kalau ada item yang berubah (biar UI update)
    listTask.refresh();

    simpanKeStorage();
  }

  // FUNGSI RAHASIA: Simpan Data Permanen
  void simpanKeStorage() {
    // Ubah semua TaskModel jadi JSON dulu
    var dataMentah = listTask.map((e) => e.toJson()).toList();

    // Tulis ke gudang
    box.write('data_tugas', dataMentah);
  }

  void editTugas(String idTarget, String judulBaru) {
    var task = listTask.firstWhere((item) => item.id == idTarget);

    task.judul = judulBaru;

    listTask.refresh();

    simpanKeStorage();
  }
}
