import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var name = TextEditingController().obs;
  var bio = TextEditingController().obs;

  @override
  void dispose() {
    name.value.dispose();
    bio.value.dispose();
    super.dispose();
  }

}
