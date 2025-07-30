import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/controllers/post_controller.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  postController myController = Get.put(postController());
  RxInt count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                radius: 50,
                child: Image.asset("m3.JPG"),
              ),
            ),
            ListTile(
              title: Text("h o m e"),
              leading: Icon(Icons.home),
            ),
          ],
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(myController.post[index]),
            onTap: () {
              myController.post.add('post$index');
            },
          ),
          itemCount: myController.post.length,

          // child: Center(
          //   child: OutlinedButton(
          //     onPressed: () {
          //       name.value = 'Clicked';
          //       count.value++;
          //       // Get.back();
          //     },
          //     child: Obx(
          //       () => Text(name + ' ' + count.value.toString()),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
