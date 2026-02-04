import 'package:flutter/material.dart';
import 'package:to_do_list/app/Widgets/Custom_Button.dart';

class InputCard extends StatelessWidget {
  final TextEditingController controllerInput;
  final VoidCallback onSimpan;

  const InputCard({
    super.key,
    required this.controllerInput,
    required this.onSimpan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ukuran ngikutin isi
        children: [
          const Text(
            "Tambah Aktivitas",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: controllerInput,
            decoration: InputDecoration(
              hintText: "Mau ngapain?",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // PANGGIL TOMBOL CUSTOM KITA DISINI 👇
          SizedBox(
            width: double.infinity, // Lebar full
            child: CustomButton(label: "Simpan Sekarang", onPressed: onSimpan),
          ),
        ],
      ),
    );
  }
}
