import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/managerListEntity.dart';

class ManagerListPageController extends GetxController {
  late ManagerListEntity manager;

  final list = <ManagerListEntity>[
    const ManagerListEntity(
        id: 001,
        name: "Ray",
        description: "Admin/Captain",
        image:
            "https://images.unsplash.com/flagged/photo-1566127992631-137a642a90f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60")
  ].obs;

  addManager(int id, String name, String desc, String image) {
    manager =
        ManagerListEntity(id: id, name: name, description: desc, image: image);
    list.add(manager);
  }

  removeManager(int id) {
    for (ManagerListEntity i in list) {
      if (i.id == id) {
        list.remove(i);
      }
    }
  }
}
