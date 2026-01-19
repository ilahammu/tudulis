import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Pastikan path import ini sesuai dengan folder kamu ya
import '../controllers/task_controller.dart';

class HomeView extends GetView<TaskController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. PENTING: Panggil Controller biar dia 'Hidup' di memori
    // Kalau baris ini gak ada, nanti error "TaskController not found"

    return Scaffold(
      appBar: AppBar(title: const Text("My To-Do List"), centerTitle: true),
      body: const Center(
        child: Text(
          "Logika sudah siap!\nUI List akan kita bangun di Day 7.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
      // Tombol tes doang biar keliatan ada interaksi
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tes fungsi tambah tugas (Cek di Debug Console nanti)
          controller.tambahTugas("Tes Tugas Baru");
          print("Tugas berhasil ditambah ke Controller!");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
