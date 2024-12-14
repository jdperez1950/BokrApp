import 'package:brokr/models/user_model.dart';
import 'package:get/get.dart';

class TestController {
  String session = 'Guest';

  changeToBrokr() {
    session = 'Broker';
  }

  changeToGuest() {
    session = 'Guest';
  }

  changeToHost() {
    session = 'Host';
  }
}
