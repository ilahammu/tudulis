import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/Widgets/Custom_Button.dart';
import 'package:to_do_list/app/Widgets/Custom_Card.dart';
import '../controllers/Home_controller.dart';

class HomeView extends GetView<TaskController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My To-Do List"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // Hias dikit
        foregroundColor: Colors.white,
      ),

      // 1. OBX: INI KUNCINYA!
      // Kita bungkus body dengan Obx agar setiap 'listTask' berubah,
      // tampilan otomatis digambar ulang.
      body: Obx(() {
        // Cek kalau list kosong, tampilkan gambar/teks kosong
        if (controller.listTask.isEmpty) {
          return const Center(child: Text("Belum ada tugas, yuk tambah!"));
        }

        // Kalau ada isi, tampilkan ListView
        return ListView.builder(
          itemCount: controller.listTask.length,
          itemBuilder: (context, index) {
            // Ambil data task satu per satu
            var task = controller.listTask[index];

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                // JUDUL TUGAS
                title: Text(
                  task.judul,
                  style: TextStyle(
                    // Kalau selesai, teks dicoret (lineThrough)
                    decoration: task.isSelesai
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: task.isSelesai ? Colors.grey : Colors.black,
                  ),
                ),

                subtitle: Text("Dibuat pada: ${task.id.split(' ')[0]}"),

                // CHECKBOX DI KIRI (Buat tandai selesai)
                leading: Checkbox(
                  value: task.isSelesai,
                  onChanged: (value) {
                    controller.gantiStatus(task.id);
                  },
                ),

                // TOMBOL SAMPAH DI KANAN (Buat hapus)
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    controller.hapusTugas(task.id);
                  },
                ),

                onLongPress: () {
                  // Saat ditekan lama, panggil fungsi dialog edit
                  _tampilDialogEdit(context, task.id, task.judul);
                },
              ),
            );
          },
        );
      }),

      // TOMBOL TAMBAH (FAB)
      floatingActionButton: CustomButton(
        label: "+ Tambah",
        onPressed: () {
          // Siapkan controller sementara
          final inputC = TextEditingController();

          // TAMPILKAN CARD DARI BAWAH (Pakai Get.bottomSheet)
          Get.bottomSheet(
            InputCard(
              controllerInput: inputC,
              onSimpan: () {
                if (inputC.text.isNotEmpty) {
                  controller.tambahTugas(inputC.text);
                  Get.back(); // Tutup sheet
                }
              },
            ),
          );
        },
      ),
    );
  }

  // FUNGSI POPUP INPUT
  // Kita bikin fungsi kecil di sini biar kodingan build gak penuh
  void _tampilDialogInput(BuildContext context) {
    final textEdit = TextEditingController(); // Penampung teks inputan

    Get.defaultDialog(
      title: "Tambah Tugas",
      content: TextField(
        controller: textEdit,
        decoration: const InputDecoration(hintText: "Mau ngapain hari ini?"),
      ),
      textConfirm: "Simpan",
      textCancel: "Batal",
      confirmTextColor: Colors.white,
      onConfirm: () {
        if (textEdit.text.isNotEmpty) {
          controller.tambahTugas(textEdit.text); // Panggil Controller
          Get.back(); // Tutup dialog
        }
      },
    );
  }

  // FUNGSI DIALOG EDIT
  void _tampilDialogEdit(BuildContext context, String id, String judulLama) {
    final controllerEdit = TextEditingController();

    // ISI TEXT FIELD DENGAN JUDUL LAMA
    controllerEdit.text = judulLama;

    Get.defaultDialog(
      title: "Edit Tugas",
      content: TextField(
        controller: controllerEdit,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: "Mau ganti jadi apa?",
          border: OutlineInputBorder(),
        ),
      ),
      textConfirm: "Simpan Perubahan",
      textCancel: "Batal",
      confirmTextColor: Colors.white,
      onConfirm: () {
        if (controllerEdit.text.isNotEmpty) {
          // Panggil fungsi edit di controller
          controller.editTugas(id, controllerEdit.text);
          Get.back(); // Tutup dialog
        }
      },
    );
  }
}
