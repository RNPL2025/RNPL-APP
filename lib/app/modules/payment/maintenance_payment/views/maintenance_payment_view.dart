import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/maintenance_payment_controller.dart';

class MaintenancePaymentView extends GetView<MaintenancePaymentController> {
  const MaintenancePaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaintenancePaymentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MaintenancePaymentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
