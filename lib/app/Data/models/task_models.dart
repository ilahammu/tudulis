class TaskModel {
  String id; // ID unik biar gak ketukar saat dihapus
  String judul; // Nama tugasnya
  bool isSelesai; // Status dicoret atau belum

  TaskModel({
    required this.id,
    required this.judul,
    this.isSelesai = false, // Default-nya pasti belum selesai (false)
  });

  // --- BAGIAN PENTING UNTUK GET STORAGE (Serialization) ---

  // 1. Dari Data Asli -> Jadi JSON (Biar bisa disimpan di Gudang/Storage)
  Map<String, dynamic> toJson() {
    return {'id': id, 'judul': judul, 'isSelesai': isSelesai};
  }

  // 2. Dari JSON -> Jadi Data Asli (Pas diambil dari Gudang/Storage)
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      judul: json['judul'],
      isSelesai: json['isSelesai'],
    );
  }
}
