import 'package:belajar_getx/app/modules/invoice/controllers/invoice_controller.dart';
import 'package:belajar_getx/app/modules/invoice/views/ouput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/invoice_controller.dart';

class InvoiceView extends StatelessWidget {
  InvoiceView({Key? key}) : super(key: key);

  final InvoiceController invoiceController = Get.put(InvoiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('invoiceView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Full Name'),
                    onChanged: (value) =>
                        invoiceController.fullname.value = value,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Place Of Birth'),
              onChanged: (value) =>
                  invoiceController.placeofbirth.value = value,
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () => invoiceController.selectDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  hintText: 'Pilih Tanggal',
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date Of Birth:'),
                    Obx(() => Text(invoiceController.dateofbirth.value)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text("Gender"),
            Row(
              children: [
                Obx(() => Radio(
                      value: 'Laki-laki',
                      groupValue: invoiceController.gender.value,
                      onChanged: (value) =>
                          invoiceController.gender.value = value!,
                    )),
                Text('Laki-laki'),
                Obx(() => Radio(
                      value: 'Perempuan',
                      groupValue: invoiceController.gender.value,
                      onChanged: (value) =>
                          invoiceController.gender.value = value!,
                    )),
                Text('Perempuan'),
              ],
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => invoiceController.email.value = value,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nationality'),
              onChanged: (value) => invoiceController.nationality.value = value,
            ),
            SizedBox(height: 16.0),
            Text("Membership"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Obx(() => Radio(
                          value: 'Reguler',
                          groupValue: invoiceController.membership.value,
                          onChanged: (value) =>
                              invoiceController.toggleMembership(value!),
                        )),
                    Text("Reguler"),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'Gold',
                              groupValue: invoiceController.membership.value,
                              onChanged: (value) =>
                                  invoiceController.toggleMembership(value!),
                            )),
                        Text("Gold"),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'Platinum',
                              groupValue: invoiceController.membership.value,
                              onChanged: (value) =>
                                  invoiceController.toggleMembership(value!),
                            )),
                        Text("Platinum"),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'Vip',
                              groupValue: invoiceController.membership.value,
                              onChanged: (value) =>
                                  invoiceController.toggleMembership(value!),
                            )),
                        Text("VIP"),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Card Number'),
              onChanged: (value) => invoiceController.cardnumber.value = value,
            ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () => invoiceController.selectExpiredDate(),
                child: InputDecorator(
                  decoration: InputDecoration(
                    hintText: 'Pilih Tanggal',
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Expired Date: '),
                      Obx(() => Text(invoiceController.expireddate.value)),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 16.0),
            Obx(() => Text("Harga Member : ${invoiceController.harga}")),

            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => Get.to(OutPut()),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red, onPrimary: Colors.white),
              child: Text(
                'SUBMIT',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Obx(() {
              if (invoiceController.isFormSubmitted.value) {
                return Text(
                  'Output: ${invoiceController.fullname}, ${invoiceController.placeofbirth}, ${invoiceController.calculateAge()}, ${invoiceController.gender}, ${invoiceController.email}, ${invoiceController.nationality}, ${invoiceController.membership}',
                  style: TextStyle(fontSize: 16.0),
                );
              } else {
                return SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}
