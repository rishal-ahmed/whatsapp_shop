import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenSize {
  ScreenSize(this.context);
  final BuildContext context;

  Size get getSize {
    return MediaQuery.of(context).size;
  }
}

//========== Constant White Spaces ==========
const SizedBox kNone = SizedBox();

const SizedBox kWidth1 = SizedBox(width: 1);
const SizedBox kWidth2 = SizedBox(width: 2);
const SizedBox kWidth5 = SizedBox(width: 5);
const SizedBox kWidth10 = SizedBox(width: 10);
const SizedBox kWidth15 = SizedBox(width: 15);
const SizedBox kWidth20 = SizedBox(width: 20);

const SizedBox kHeight1 = SizedBox(height: 1);
const SizedBox kHeight2 = SizedBox(height: 2);
const SizedBox kHeight3 = SizedBox(height: 3);
const SizedBox kHeight4 = SizedBox(height: 4);
const SizedBox kHeight5 = SizedBox(height: 5);
const SizedBox kHeight10 = SizedBox(height: 10);
const SizedBox kHeight15 = SizedBox(height: 15);
const SizedBox kHeight20 = SizedBox(height: 20);
const SizedBox kHeight25 = SizedBox(height: 25);
const SizedBox kHeight30 = SizedBox(height: 30);
const SizedBox kHeight40 = SizedBox(height: 40);

//========== Constant White Spaces ==========
final SizedBox dWidth1 = SizedBox(width: 1.w);
final SizedBox dWidth2 = SizedBox(width: 2.w);
final SizedBox dWidth3 = SizedBox(width: 3.w);
final SizedBox dWidth4 = SizedBox(width: 4.w);
final SizedBox dWidth5 = SizedBox(width: 5.w);
final SizedBox dWidth10 = SizedBox(width: 10.w);
final SizedBox dWidth15 = SizedBox(width: 15.w);
final SizedBox dWidth20 = SizedBox(width: 20.w);

final SizedBox dHeight05 = SizedBox(height: 0.5.h);
final SizedBox dHeight1 = SizedBox(height: 1.h);
final SizedBox dHeight1n5 = SizedBox(height: 1.5.h);
final SizedBox dHeight2 = SizedBox(height: 2.h);
final SizedBox dHeight3 = SizedBox(height: 3.h);
final SizedBox dHeight4 = SizedBox(height: 4.h);
final SizedBox dHeight5 = SizedBox(height: 5.h);
final SizedBox dHeight6 = SizedBox(height: 6.h);
final SizedBox dHeight7 = SizedBox(height: 7.h);
final SizedBox dHeight8 = SizedBox(height: 8.h);
final SizedBox dHeight10 = SizedBox(height: 10.h);
final SizedBox dHeight15 = SizedBox(height: 15.h);
final SizedBox dHeight20 = SizedBox(height: 20.h);
final SizedBox dHeight40 = SizedBox(height: 40.h);
