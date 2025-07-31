import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx/app/core/utils/keys.dart';
import 'package:getx/app/data/models/task.dart';
import 'package:getx/app/data/services/storage/services.dart';

class TaskProvider{
  final _storage = Get.find<StorageServices>();

//   {
//     'task':[
//   {
//     'title':'work',
//     'color':'ff123456',
//     'icon':'0xe123',
//   }
//     ]
// }

  List<Task> readTask(){
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e)=>tasks.add(Task.fromJson(e)));
    return tasks;
  }
  void writeTasks(List<Task> tasks){
    _storage.write(taskKey, jsonEncode(tasks));
  }
}