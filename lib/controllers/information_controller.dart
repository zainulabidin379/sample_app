import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var name = TextEditingController().obs;
  var bio = TextEditingController().obs;
  var gender = TextEditingController().obs;
  var dob = TextEditingController().obs;
  var lives = TextEditingController().obs;

  @override
  void dispose() {
    name.value.dispose();
    bio.value.dispose();
    gender.value.dispose();
    dob.value.dispose();
    lives.value.dispose();
    super.dispose();
  }

}
