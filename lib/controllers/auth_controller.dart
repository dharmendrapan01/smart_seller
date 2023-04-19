import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_seller/views/home_screen/home.dart';
import '../const/const.dart';
import '../const/firebase_consts.dart';

class AuthController extends GetxController{
  var isLoading = false.obs;

  // login text controller
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // login method
  void loginMethod({context}) {
    isLoading(true);
    auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
      isLoading(false);
      Get.to(() => const Home());
      VxToast.show(context, msg: "Logged in successfully");
    }).onError((error, stackTrace) {
      isLoading(false);
      VxToast.show(context, msg: error.toString());
    });
  }
  // Future<UserCredential?> loginMethod({context}) async {
  //   UserCredential? userCredential;
  //   try{
  //     await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
  //   } on FirebaseAuthException catch(e){
  //     VxToast.show(context, msg: e.toString());
  //   }
  //   log('message: $userCredential');
  //   return userCredential;
  // }

  // signout method
  signoutMethod(context) async {
    try{
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }
}