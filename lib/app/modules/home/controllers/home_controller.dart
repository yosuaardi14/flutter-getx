import 'package:get/get.dart';

class HomeController extends GetxController {
  final title = "Test Home View".obs;
  void click() => title.value = "Clicked";
  void restore() => title.value = "Test Home View";
}
