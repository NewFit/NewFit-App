import 'package:get/get.dart';

class TabBarController extends GetxController {
  final _selectedIndexController = 0.obs;

  updateSelectedIndex(int index) => _selectedIndexController(index);

  int get selectedIndex => _selectedIndexController.value;
}
