import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/core/utils/extensions.dart';
import 'package:getx/app/data/models/task.dart';
import 'package:getx/app/modules/home/controller.dart';
import 'package:getx/app/modules/home/widgets/add_card.dart';
import 'package:getx/app/modules/home/widgets/task_card.dart';

class SecondPage extends GetView<HomeController> {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Todo"),
      //   leading: IconButton(
      //     onPressed: () {
      //       // Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.menu),
      //   ),
      // ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Todo App",
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Obx(
              ()=> GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  ...controller.tasks
                      .map((element) => TaskCard(task: element))
                      .toList(),
                  AddCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
