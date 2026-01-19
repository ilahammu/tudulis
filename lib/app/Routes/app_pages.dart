import 'package:get/get.dart';
import 'package:to_do_list/app/Routes/app_route.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/bindings/home_binding.dart';

class AppPages {
  static const INITIAL = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home, // 1. Kalau dipanggil '/home'
      page: () => const HomeView(), // 2. Tampilkan Halaman ini
      binding: HomeBinding(), // 3. Pasang Logika ini (Otomatis!)
    ),
  ];
}
