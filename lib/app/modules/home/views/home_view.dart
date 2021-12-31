import 'package:flutter/material.dart';
import 'package:flutter_application_get/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alertDialog = AlertDialog(
      title: const Text("Test"),
      actions: [
        IconButton(
          icon: const Icon(Icons.check),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    final appBar = AppBar(
      title: const Text('HomeView'),
      centerTitle: true,
    );

    final drawer = Drawer(
        child: ListView(
      children: [
        ListTile(
          title: const Text("Test"),
          onTap: () {
            showDialog(
                context: context,
                builder: (ctx) => alertDialog,
                barrierDismissible: false);
          },
        ),
        ListTile(
          title: const Text("Go to Auth page"),
          onTap: () {
            Get.toNamed(Routes.auth);
          },
        ),
      ],
    ));

    final body = Center(
      child: GetX(
        builder: (HomeController val) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              val.title.value,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Click"),
              onPressed: val.click,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Restore"),
              onPressed: val.restore,
            )
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: body,
    );
  }
}
