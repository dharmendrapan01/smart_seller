import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_seller/const/const.dart';
import 'package:smart_seller/const/firebase_consts.dart';
import 'package:smart_seller/controllers/auth_controller.dart';
import 'package:smart_seller/views/home_screen/home.dart';
import 'package:smart_seller/views/widgets/text_style.dart';

import '../widgets/loading_indicator.dart';
import '../widgets/our_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.heightBox,
            normalText(text: welcome, size: 18.0),
            20.heightBox,
            Row(
              children: [
                Image.asset(icLogo, width: 70, height: 70,).box.border(color: white).rounded.padding(const EdgeInsets.all(8)).make(),
                10.widthBox,
                boldText(text: appname, size: 18.0),
              ],
            ),
            60.heightBox,
            normalText(text: loginTo, size: 18.0, color: lightGrey),
            10.heightBox,
            Obx(
                () => Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: textfieldGrey,
                      hintText: emailHint,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email, color: purpleColor)
                    ),
                  ),
                  10.heightBox,
                  TextFormField(
                    obscureText: true,
                    controller: controller.passwordController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: textfieldGrey,
                        hintText: emailHint,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, color: purpleColor)
                    ),
                  ),
                  20.heightBox,
                  controller.isLoading.value ? loadingIndicator() : ourButton(title: login, onPress: () {
                    controller.loginMethod(context: context);
                  }).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){}, child: normalText(text: forgotPassword, color: purpleColor))),
                ],
              ).box.rounded.white.outerShadowMd.padding(const EdgeInsets.all(8)).make(),
            ),
            10.heightBox,
            Center(child: normalText(text: anyProblem, color: lightGrey)),
            const Spacer(),
            Center(child: boldText(text: credit, size: 14.0)),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
