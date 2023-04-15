import '../../const/const.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(orders),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(20, (index) => ListTile(
              onTap: () {},
              tileColor: textfieldGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: boldText(text: "9642154789654", color: purpleColor),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_month, color: fontGrey,),
                      10.widthBox,
                      boldText(text: intl.DateFormat().add_yMd().format(DateTime.now()), color: fontGrey),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.car_crash, color: fontGrey),
                      10.widthBox,
                      boldText(text: unpaid, color: red),
                    ],
                  ),
                ],
              ),
              trailing: boldText(text: "\$40.0", color: purpleColor, size: 16.0),
            ).box.margin(const EdgeInsets.only(bottom: 4)).make(),
            ),
          ),
        ),
      ),
    );
  }
}
