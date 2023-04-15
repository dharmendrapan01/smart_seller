import 'package:get/get.dart';
import 'package:smart_seller/controllers/home_controller.dart';
import 'package:smart_seller/views/home_screen/home_screen.dart';
import 'package:smart_seller/views/orders_screen/orders_screen.dart';
import 'package:smart_seller/views/product_screen/product_screen.dart';
import 'package:smart_seller/views/profile_screen/profile_screen.dart';

import '../../const/const.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navScreens = [
      const HomeScreen(), const ProductScreen(), const OrdersScreen(), const ProfileScreen()
    ];

    var bottomNavBar = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: dashboard),
      BottomNavigationBarItem(icon: Image.asset(icProducts, color: darkGrey, width: 24), label: products),
      BottomNavigationBarItem(icon: Image.asset(icOrders, color: darkGrey, width: 24), label: orders),
      BottomNavigationBarItem(icon: Image.asset(icGeneralSettings, color: darkGrey, width: 24), label: settings),
    ];


    return Scaffold(
      bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.navIndex.value,
          onTap: (index) {
            controller.navIndex.value = index;
          },
          type: BottomNavigationBarType.fixed,
          items: bottomNavBar,
          selectedItemColor: purpleColor,
          unselectedItemColor: darkGrey,
        ),
      ),
      body: Column(
        children: [
          Obx(() => Expanded(child: navScreens.elementAt(controller.navIndex.value))),
        ],
      ),
    );
  }
}
