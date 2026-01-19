import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_list/app/Routes/app_pages.dart';

void main() async {
  await GetStorage.init(); // Wajib buat save data
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do List",
      initialRoute: AppPages.INITIAL, // Mulai dari mana? (/home)
      getPages: AppPages.routes, // Daftar peta jalannya
    );
  }
}
