import 'package:bs_23/core/widgets/global_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final String? imageBoxFit;
  final String? placeHolder;
  const ImageWidget({super.key,this.imageUrl,this.height,this.width,this.imageBoxFit,this.placeHolder});


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      height: height??size.height*0.15,
      width: width??size.width*0.25,
      fit: GlobalWidgets.commonUi.getBoxFit(imageBoxFit??'cover'),
      placeholder: (context, url) =>  Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image(
          image:  AssetImage(placeHolder??'assets/images/logo.png'),
          fit: GlobalWidgets.commonUi.getBoxFit(imageBoxFit!),
        ),
      ),
      errorWidget: (context, url, error) =>  Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image(
          image:  AssetImage(placeHolder??
            'assets/images/logo.png',
          ),
          fit: GlobalWidgets.commonUi.getBoxFit(imageBoxFit!),
        ),
      ),
    );
  }
}
