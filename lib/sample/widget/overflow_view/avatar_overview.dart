import 'package:flutter/material.dart';
import 'package:com.roy93group.flutter_tutorial/sample/widget/overflow_view/avatar_widget.dart';

import 'avatar.dart';

/**
 * Created by Loitp on 08,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class AvatarOverview extends StatelessWidget {
  AvatarOverview({
    Key? key,
    required int remaining,
    required int position,
    required int counter,
  })  : index = counter - remaining + position,
        alignment = _getAlignment(position),
        super(key: key);

  final int index;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final Avatar avatar = avatars[index];
    return FractionallySizedBox(
      key: ValueKey(index),
      alignment: alignment,
      widthFactor: 0.5,
      heightFactor: 0.5,
      child: FittedBox(
        child: AvatarWidget(
          text: avatar.initials,
          color: avatar.color,
        ),
      ),
    );
  }

  static Alignment _getAlignment(int position) {
    switch (position) {
      case 0:
        return Alignment.topLeft;
      case 1:
        return Alignment.topRight;
      case 2:
        return Alignment.bottomLeft;
      default:
        return Alignment.bottomRight;
    }
  }
}
