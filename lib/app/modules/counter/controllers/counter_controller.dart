import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 1.obs;

  void increment() { 
    
    if (count >= 50) {
      Get.snackbar(
      "Ngges atuh di tambahan wae",
      "hayoh weee ",
      colorText: Colors.white,
      backgroundColor: Colors.lightBlue,
      icon: const Icon(Icons.add_alert),
      );
    } else {
      count.value++;
    }
  }

   void decrement() { 
    
    if (count <= 50) {
      Get.snackbar(
      "Atos atuh di kurangan wae",
      "ie geus leutik ai kamu",
      colorText: Colors.white,
      backgroundColor: Colors.red,
      icon: const Icon(Icons.add_alert),
      );
    } else {
      count.value--;
    }
  } 
 }
