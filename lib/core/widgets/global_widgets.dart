import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalWidgets {
  static GlobalWidgets? _commonUi;

  GlobalWidgets._();

  static GlobalWidgets get commonUi => _commonUi ??= GlobalWidgets._();



   BoxDecoration getBoxDecoration({
    Color? color,
    Color? shadowColor,
    double? radius,
    Border? border,
    Gradient? gradient,
  }) {
    return BoxDecoration(
      color: color ?? Get.theme.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      border: border ?? Border.all(color: Get.theme.dividerColor),
      gradient: gradient,
    );
  }


   BoxFit getBoxFit(String boxFit) {
    switch (boxFit) {
      case 'cover':
        return BoxFit.cover;
      case 'fill':
        return BoxFit.fill;
      case 'contain':
        return BoxFit.contain;
      case 'fit_height':
        return BoxFit.fitHeight;
      case 'fit_width':
        return BoxFit.fitWidth;
      case 'none':
        return BoxFit.none;
      case 'scale_down':
        return BoxFit.scaleDown;
      default:
        return BoxFit.cover;
    }
  }

   AlignmentDirectional getAlignmentDirectional(String alignmentDirectional) {
    switch (alignmentDirectional) {
      case 'top_start':
        return AlignmentDirectional.topStart;
      case 'top_center':
        return AlignmentDirectional.topCenter;
      case 'top_end':
        return AlignmentDirectional.topEnd;
      case 'center_start':
        return AlignmentDirectional.centerStart;
      case 'center':
        return AlignmentDirectional.topCenter;
      case 'center_end':
        return AlignmentDirectional.centerEnd;
      case 'bottom_start':
        return AlignmentDirectional.bottomStart;
      case 'bottom_center':
        return AlignmentDirectional.bottomCenter;
      case 'bottom_end':
        return AlignmentDirectional.bottomEnd;
      default:
        return AlignmentDirectional.bottomEnd;
    }
  }

   CrossAxisAlignment getCrossAxisAlignment(String textPosition) {
    switch (textPosition) {
      case 'top_start':
        return CrossAxisAlignment.start;
      case 'top_center':
        return CrossAxisAlignment.center;
      case 'top_end':
        return CrossAxisAlignment.end;
      case 'center_start':
        return CrossAxisAlignment.center;
      case 'center':
        return CrossAxisAlignment.center;
      case 'center_end':
        return CrossAxisAlignment.center;
      case 'bottom_start':
        return CrossAxisAlignment.start;
      case 'bottom_center':
        return CrossAxisAlignment.center;
      case 'bottom_end':
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.start;
    }
  }

   Widget customLottieLoader() {
    return const Center(
      child: Image(
        image: AssetImage(
          'assets/loading.gif',
        ),
      ),
    );
  }

  Widget customBackIcon({VoidCallback? onPress, Color? color}) {
    return IconButton(
        onPressed: onPress,
        icon: Icon(
          Icons.arrow_back_ios,
          color: color!,
        ));
  }

  Widget customSmallBox({double? size,double? height, Color? color, Widget? child, double? radius}) {
    return Container(
      width: size,
      height:height?? size,
      decoration: BoxDecoration(color: color!, borderRadius: BorderRadius.circular(radius ?? 30)),
      child: Center(child: child),
    );
  }


   Widget cardWithText({
    double radius = 5,
    required Color color,
    required Color textColor,
    Color borderColor = Colors.white,
    required String title,
    required double hP,
    required double vP,
    required VoidCallback onPress
  }) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: getBoxDecoration(
            color: color,
            border: Border.all(
              color: borderColor,
            ),
            radius: radius),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }


}
