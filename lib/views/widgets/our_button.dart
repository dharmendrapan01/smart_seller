import 'package:smart_seller/views/widgets/text_style.dart';

import '../../const/const.dart';

Widget ourButton({onPress, color = purpleColor, title}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    child: boldText(text: title, size: 16.0),
  );
}