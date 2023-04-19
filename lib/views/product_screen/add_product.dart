import 'package:get/get.dart';
import 'package:smart_seller/const/const.dart';
import 'package:smart_seller/controllers/products_controller.dart';
import 'package:smart_seller/views/widgets/loading_indicator.dart';

import '../widgets/custom_textfield.dart';
import '../widgets/text_style.dart';
import 'components/product_dropdown.dart';
import 'components/product_images.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductsController>();

    return Obx(
      () => Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Get.back();
          }, icon: const Icon(Icons.arrow_back)),
          title: boldText(text: "Add Product"),
          actions: [
            controller.isLoading.value ? loadingIndicator(circleColor: white) : TextButton(onPressed: () async {
              controller.isLoading(true);
              await controller.uploadImages();
              await controller.uploadProduct(context);
              Get.back();
            }, child: boldText(text: save)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextField(hint: "eg. BMW", label: "Product Name", controller: controller.pnameController),
                10.heightBox,
                customTextField(hint: "eg. Nice product", label: "Description", isDesc: true, controller: controller.pdescController),
                10.heightBox,
                customTextField(hint: "eg. \$100", label: "Price", controller: controller.ppriceController),
                10.heightBox,
                customTextField(hint: "eg. 20", label: "Quantity", controller: controller.pquantityController),
                10.heightBox,
                productDropdown("Category", controller.categoryList, controller.categoryValue, controller),
                10.heightBox,
                productDropdown("Subcategory", controller.subcategoryList, controller.subcategoryValue, controller),
                10.heightBox,
                const Divider(color: white),
                boldText(text: "Choose product images"),
                10.heightBox,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(3, (index) => controller.pImagesList[index] != null ? Image.file(
                      controller.pImagesList[index],
                      width: 100,
                    ).onTap(() {
                      controller.pickImage(index, context);
                    }) : productImages(label: "${index + 1}").onTap(() {
                      controller.pickImage(index, context);
                    })),
                  ),
                ),
                5.heightBox,
                normalText(text: "First image will be your display image", color: lightGrey),
                const Divider(color: white),
                10.heightBox,
                boldText(text: "Choose product color"),
                10.heightBox,
                Obx(
                  () => Wrap(
                    spacing: 7,
                    runSpacing: 8,
                    children: List.generate(9, (index) => Stack(
                      alignment: Alignment.center,
                      children: [
                        VxBox().color(Vx.randomPrimaryColor).roundedFull.size(60, 60).make().onTap(() {
                          controller.selectedColorIndex.value = index;
                        }),
                        controller.selectedColorIndex.value == index ?
                        const Icon(Icons.done, color: white) : const SizedBox(),
                      ],
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
