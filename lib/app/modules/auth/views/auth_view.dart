import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthView'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: const Text("Hello Friend"),
              automaticallyImplyLeading: false,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.shop),
              title: const Text("Shop"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text("Orders"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(
        children: [
          const Text(
            'AuthView is working',
            style: TextStyle(fontSize: 20),
          ),
          GetBuilder(
            init: AuthController(),
            builder: (AuthController val) => Stepper(
              steps: val.mySteps(),
              currentStep: val.currentStep,
              onStepContinue: val.next,
              onStepTapped: (step) => val.goTo(step),
              onStepCancel: val.cancel,
            ),
          ),
        ],
      )),
    );
  }
}
