import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/app/core/utils/extensions.dart';
import 'package:getx/app/core/values/colors.dart';
import 'package:getx/widgets/icons.dart';

import '../../../data/models/task.dart';
import '../controller.dart';

class AddCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            title: "Task ",
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            content: Form(
              key: homeCtrl.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                    child: TextFormField(
                      controller: homeCtrl.editingCtlr,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Title",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please Enter your Title";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Wrap(
                    spacing: 3.0.wp,
                    children: icons
                        .map(
                          (e) => Obx(() {
                            final index = icons.indexOf(e);
                            return ChoiceChip(
                              label: e,
                              selected: homeCtrl.chipIndex.value == index,
                              onSelected: (bool selected) {
                                homeCtrl.chipIndex.value = selected ? index : 0;
                              },
                            );
                          }),
                        )
                        .toList(),
                  ),

                  // button for Adding Task
                  ElevatedButton(
                    onPressed: () {
                      if(homeCtrl.formKey.currentState!.validate()){
                        int icon = icons[homeCtrl.chipIndex.value].icon!.codePoint;
                        String color = icons[homeCtrl.chipIndex.value].color!.toHex();
                        var task = Task(
                          title: homeCtrl.editingCtlr.text,
                          icon: icon,
                          color: color
                        );

                        // close dialog
                        Get.back();

                        // sending task
                        homeCtrl.addTask(task) ?
                            EasyLoading.showSuccess("Created Success") :
                            EasyLoading.showError("Duplicate Task");

                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 40),
                      // foregroundColor: blue,
                      foregroundColor: Colors.white,
                      backgroundColor: blue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text("Add To Task"),
                  ),
                ],
              ),
            ),
          );
          homeCtrl.editingCtlr.clear();
          homeCtrl.changeChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey.shade400,
          dashPattern: [8, 4],
          child: Center(
            child: Icon(
              Icons.add,
              size: 10.0.wp,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
