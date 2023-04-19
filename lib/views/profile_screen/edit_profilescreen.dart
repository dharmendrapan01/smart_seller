import 'dart:io';

import 'package:get/get.dart';
import 'package:smart_seller/controllers/profile_controller.dart';
import 'package:smart_seller/views/widgets/loading_indicator.dart';
import 'package:smart_seller/views/widgets/text_style.dart';

import '../../const/const.dart';
import '../widgets/custom_textfield.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;
  const EditProfileScreen({Key? key, this.username}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.put(ProfileController());
  @override
  void initState() {
    super.initState();
    controller.nameController.text = widget.username!;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          title: boldText(text: editProfile, size: 16.0),
          actions: [
            controller.isLoading.value ? loadingIndicator(circleColor: white) : TextButton(onPressed: () async {
              controller.isLoading(true);
              // if image is not selected
              if(controller.profileImagePath.value.isNotEmpty){
                await controller.uploadProfileImage();
              }else{
                controller.profileImageLink = controller.snapshotData['imageUrl'];
              }

              // if old password verified from database
              if(controller.snapshotData['password'] == controller.oldpassController.text){
                await controller.changeAuthPassword(email: controller.snapshotData['email'], password: controller.oldpassController.text, newpassword: controller.newpassController.text);
                await controller.updateProfile(
                    name: controller.nameController.text,
                    password: controller.newpassController.text,
                    imgUrl: controller.profileImageLink
                );
                VxToast.show(context, msg: "Updated");
              }else if(controller.oldpassController.text.isEmptyOrNull && controller.newpassController.text.isEmptyOrNull){
                await controller.updateProfile(
                    name: controller.nameController.text,
                    password: controller.snapshotData['password'],
                    imgUrl: controller.profileImageLink
                );
              }else{
                VxToast.show(context, msg: "Some error occured");
                controller.isLoading(false);
              }

            }, child: normalText(text: "Save")),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [

                controller.snapshotData['imageUrl'] == '' && controller.profileImagePath.isEmpty ? Image.asset(
                  imgProduct,
                  width: 130,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make() : controller.snapshotData['imageUrl'] != '' && controller.profileImagePath.isEmpty ? Image.network(controller.snapshotData['imageUrl'],width: 130,
                  fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make() : Image.file(
                  File(controller.profileImagePath.value),
                  width: 130,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),

                // Image.asset(imgProduct, width: 150,).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ElevatedButton(onPressed: () {
                  controller.changeImage(context);
                }, child: normalText(text: changeImage, color: fontGrey)),
                10.heightBox,
                customTextField(label: name, hint: "eg. Dharmendra Devs", controller: controller.nameController),
                10.heightBox,
                const Divider(),
                30.heightBox,
                Align(
                    alignment: Alignment.centerLeft,
                    child: boldText(text: "Change your password")),
                10.heightBox,
                customTextField(label: password, hint: passwordHind, controller: controller.oldpassController),
                10.heightBox,
                customTextField(label: confirmPass, hint: passwordHind, controller: controller.newpassController),
              ],
            ),
        ),
      ),
    );
  }
}
