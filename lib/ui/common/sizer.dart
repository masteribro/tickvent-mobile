import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class H extends StatelessWidget {
  final double height;
  const H(
    this.height, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class W extends StatelessWidget {
  final double width;
  const W(
    this.width, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width,
    );
  }
}

extension Heightextention on num {
  Widget get height {
    return SizedBox(
      height: this.h,
    );
  }

  Widget get width {
    return SizedBox(
      width: this.w,
    );
  }
}
