import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx/app/data/models/task.dart';
import 'package:getx/app/data/services/storage/repository.dart';

class HomeController extends GetxController{
    TaskRepository taskRepository;
    HomeController({required this.taskRepository});
    final formKey  = GlobalKey<FormState>();
    final editingCtlr = TextEditingController();
    final chipIndex =  0.obs;
    final tasks = <Task>[].obs;

    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_)=>taskRepository.writeTasks(tasks));
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void changeChipIndex(int value){
      chipIndex.value = value;
  }

  bool addTask(Task task){
      if(tasks.contains(task)){
        return false;
      }
      tasks.add(task);
      return true;
  }
}