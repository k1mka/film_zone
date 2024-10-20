import 'package:flutter/material.dart';

class Tokens {
  static const xxxS = 2.0;
  static const xxS = 4.0;
  static const xS = 6.0;
  static const S = 8.0;
  static const M = 12.0;
  static const L = 16.0;
  static const xL = 20.0;
  static const xxL = 24.0;
  static const xxxL = 32.0;
  static const xxxxL = 48.0;
  static const xxxxxL = 56.0;
  static const xxxxxxL = 64.0;

  // SPACERS
  static const spacer2 = SizedBox.square(dimension: xxxS);

  static const spacer4 = SizedBox.square(dimension: xxS);

  static const spacer6 = SizedBox.square(dimension: xS);

  static const spacer8 = SizedBox.square(dimension: S);

  static const spacer12 = SizedBox.square(dimension: M);

  static const spacer16 = SizedBox.square(dimension: L);

  static const spacer20 = SizedBox.square(dimension: xL);

  static const spacer24 = SizedBox.square(dimension: xxL);

  static const spacer32 = SizedBox.square(dimension: xxxL);

  static const spacer48 = SizedBox.square(dimension: xxxxL);

  static const spacer56 = SizedBox.square(dimension: xxxxxL);

  static const spacer64 = SizedBox.square(dimension: xxxxxxL);

  // BORDERS
  static const borderRadius8 = BorderRadius.all(Radius.circular(S));

  static const borderRadius12 = BorderRadius.all(Radius.circular(M));

  static const borderRadius16 = BorderRadius.all(Radius.circular(L));

  static const borderRadius24 = BorderRadius.all(Radius.circular(xxL));

  static const borderRadius32 = BorderRadius.all(Radius.circular(xxxL));

  // PADDINGS
  static const padding2 = EdgeInsets.all(xxxS);

  static const padding4 = EdgeInsets.all(xxS);

  static const padding6 = EdgeInsets.all(xS);

  static const padding8 = EdgeInsets.all(S);

  static const padding12 = EdgeInsets.all(M);

  static const padding16 = EdgeInsets.all(L);

  static const padding20 = EdgeInsets.all(xL);

  static const padding24 = EdgeInsets.all(xxL);

  static const padding28 = EdgeInsets.all(xxxL);

  static const padding32 = EdgeInsets.all(xxxL);

  static const paddingH2 = EdgeInsets.symmetric(horizontal: xxxS);

  static const paddingH4 = EdgeInsets.symmetric(horizontal: xxS);

  static const paddingH8 = EdgeInsets.symmetric(horizontal: S);

  static const paddingH12 = EdgeInsets.symmetric(horizontal: M);

  static const paddingH16 = EdgeInsets.symmetric(horizontal: L);

  static const paddingH20 = EdgeInsets.symmetric(horizontal: xL);

  static const paddingH24 = EdgeInsets.symmetric(horizontal: xxL);

  static const paddingH32 = EdgeInsets.symmetric(horizontal: xxxL);

  static const paddingV2 = EdgeInsets.symmetric(vertical: xxxS);

  static const paddingV4 = EdgeInsets.symmetric(vertical: xxS);

  static const paddingV8 = EdgeInsets.symmetric(vertical: S);

  static const paddingV12 = EdgeInsets.symmetric(vertical: M);

  static const paddingV16 = EdgeInsets.symmetric(vertical: L);

  static const paddingV20 = EdgeInsets.symmetric(vertical: xL);

  static const paddingV24 = EdgeInsets.symmetric(vertical: xxL);

  static const paddingV32 = EdgeInsets.symmetric(vertical: xxxL);

  static const paddingV48 = EdgeInsets.symmetric(vertical: xxxxL);
}
