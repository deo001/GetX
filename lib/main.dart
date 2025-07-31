import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app/data/services/storage/services.dart';
import 'app/modules/home/binding.dart';
import 'app/modules/home/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ REQUIRED before any async plugin init

  await GetStorage.init(); // ✅ Initializes local storage
  await Get.putAsync(() => StorageServices().init()); // ✅ Inject storage service


  runApp(const MyApp()); // ✅ Run the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SecondPage(), // ✅ Change as needed
      initialBinding: HomeBinding(), // ✅ Sets up your controller/service
      builder: EasyLoading.init(), // ✅ For loading UI
    );
  }
}
