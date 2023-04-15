import '../../const/const.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/text_style.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        child: const Icon(Icons.add),
      ),
      appBar: appbarWidget(products),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(20, (index) => ListTile(
              onTap: () {},
              leading: Image.asset(imgProduct, width: 100, height: 100, fit: BoxFit.cover,),
              title: boldText(text: "Product Title", color: fontGrey),
              subtitle: normalText(text: "\$40.0", color: darkGrey),
              trailing: VxPopupMenu(
                arrowSize: 0.0,
                menuBuilder: () => Column(
                children: List.generate(popupMenuTitles.length, (index) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(popupMenuIcons[index]),
                      10.widthBox,
                      normalText(text: popupMenuTitles[index], color: darkGrey),
                    ],
                  ).onTap(() {
                  }),
                ),
                ),
              ).box.white.rounded.width(200).make(),
                clickType: VxClickType.singleClick,
                child: const Icon(Icons.more_vert_rounded)),
            ),),
          ),
        ),
      ),
    );
  }
}
