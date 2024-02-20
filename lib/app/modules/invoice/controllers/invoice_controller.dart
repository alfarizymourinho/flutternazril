import 'package:belajar_getx/app/modules/invoice/views/ouput.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvoiceController extends GetxController {
  var fullname = ''.obs;
  var placeofbirth = ''.obs;
  var dateofbirth = ''.obs;
  var gender = 'Laki-Laki'.obs;
  var email = ''.obs;
  var nationality = ''.obs;
  var harga = ''.obs;
  var benefits = ''.obs;
  var cardnumber = ''.obs;
  var exprireddate = ''.obs;
  var payment = ''.obs;
  var membership = ''.obs;
  

  var isFormSubmitted = false.obs;
  // var selectedDate = ''.obs;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      dateofbirth.value = formattedDate;
    }
   }
   
   Future<void> selectExpiredDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final experieddate = picked.add(Duration(days: 7));
      final formattedDate = DateFormat('yyyy-MM-dd').format(experieddate);
      exprireddate.value = formattedDate;
    }
   }

    RxString calculateAge() {
    if (dateofbirth.value.isNotEmpty) {
      DateTime dob = DateFormat('yyyy-MM-dd').parse(dateofbirth.value);
      DateTime now = DateTime.now();
      int age = now.year - dob.year;
      int monthNow = now.month;
      int monthDob = dob.month;
      if (monthNow < monthDob || (monthNow == monthDob && now.day < dob.day)) {
        age--;
      } 
      return age.toString().obs;
    }
    return ''.obs;
  }

  void toggleMembership(String membershipValue) {
   membership.value = membershipValue;
   if (membership == "Reguler") {
     harga.value = "50000";
     benefits.value = "Anggota 1 Bulan";
   } else if (membership == "Gold") {
    harga.value = "150000";
    benefits.value = "Anggota 1 Bulan + cemilan gratis";
   } else if (membership == "Platinum") {
    harga.value = "250000";
    benefits.value = "Anggota 2 Bulan + Free Wifi";
   } else if (membership == "Vip") {
    harga.value = "500000" ;
    benefits.value = "Anggota 3 Bulan + Free Wifi + Tiket Konser";
   }
  }

  void submitForm() {
    print(
        'Data formulir: $fullname, $placeofbirth, $dateofbirth, $gender, $email, $nationality, $exprireddate, ${membership.value}, ${harga.value}, ${benefits.value}');
    isFormSubmitted.value = true;
    
  }
}
