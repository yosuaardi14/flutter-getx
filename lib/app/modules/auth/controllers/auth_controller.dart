import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  int currentStep = 0;
  bool complete = false;

  List<Step> mySteps() => [
        Step(
            isActive: currentStep == 0,
            title: const Text("Step 1"),
            subtitle: const Text("Deskripsi"),
            content: const Text("Beli Teh dan gula di warung")),
        Step(
            isActive: currentStep == 1,
            title: const Text("Step 2"),
            content: const Text("Siapkan gelas dan air panas")),
        Step(
            isActive: currentStep == 2,
            title: const Text("Step 3"),
            content: const Text(
                "Masukan teh kedalam gelas dan berikan gula secukupnya")),
        Step(
            isActive: currentStep == 3,
            title: const Text("Step 4"),
            content: const Text("Tuangkan air panas")),
        Step(
            isActive: currentStep == 4,
            title: const Text("Step 5"),
            content: const Text("Tunggu hingga warna air menjadi gelap")),
        Step(
            isActive: currentStep == 5,
            title: const Text("Step 6"),
            content: const Text("Teh siap diminum")),
      ];

  void next() {
    currentStep + 1 != mySteps().length
        ? goTo(currentStep + 1)
        : complete = true;
    if (complete) {
      Get.dialog(
          AlertDialog(
            content: const Text("Berhasil"),
            actions: [
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ),
          barrierDismissible: false);
    }
    update();
  }

  void cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
      update();
    }
  }

  void goTo(int step) {
    currentStep = step;
    update();
  }
}
