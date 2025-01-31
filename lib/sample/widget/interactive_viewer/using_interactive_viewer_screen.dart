import 'package:com.roy93group.flutter_tutorial/lib/common/const/constants.dart';
import 'package:com.roy93group.flutter_tutorial/lib/util/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * Created by Loitp on 08,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class UsingInteractiveViewerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIUtils.getAppBar(
        "UsingInteractiveViewerScreen",
        () {
          Get.back();
        },
        null,
      ),
      body: InteractiveViewer(
        boundaryMargin: EdgeInsets.all(300.0),
        minScale: 0.1,
        maxScale: 1.6,
        child: Center(
          child: getImageWidget(),
        ),
      ),
    );
  }

  Widget getImageWidget() {
    return Image.network(Constants.dummyImageLink);
  }
}
