import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:getx/app/data/providers/task/provider.dart';
import 'package:getx/app/modules/home/controller.dart';

import '../../data/services/storage/repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
      Get.lazyPut(
        () => HomeController(
          taskRepository: TaskRepository(
            taskProvider: TaskProvider(),
          ),
        ),
      );
    }
  }

