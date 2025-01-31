import 'package:com.roy93group.flutter_tutorial/lib/common/const/dimen_constants.dart';
import 'package:com.roy93group.flutter_tutorial/lib/util/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * Created by Loitp on 05,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class AnimatedPositionedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIUtils.getAppBar(
        "AnimatedPositionedScreen",
        () => Get.back(),
        null,
      ),
      body: Container(
        padding: EdgeInsets.all(DimenConstants.marginPaddingMedium),
        child: AnimatedPositionedWidget(),
      ),
    );
  }
}

class AnimatedPositionedWidget extends StatefulWidget {
  @override
  _AnimatedPositionedWidgetState createState() =>
      _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  bool status = true;

  double left = 30;
  double top = 30;
  double right = 30;
  double bottom = 30;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.red,
          height: 300,
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                left: left,
                top: top,
                right: right,
                bottom: bottom,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        UIUtils.getButton("Change position", () {
          setState(() {
            left = status ? 10 : 50;
            top = status ? 20 : 40;
            right = status ? 20 : 40;
            bottom = status ? 20 : 70;
            status = !status;
          });
        }),
      ],
    );
  }
}
