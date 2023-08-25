import 'package:get/get.dart';
import 'package:new_fit/app/bindings/local_source_binding.dart';

//앱 시작시 필요한 의존성
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    LocalSourceBindings().dependencies();
  }
}
