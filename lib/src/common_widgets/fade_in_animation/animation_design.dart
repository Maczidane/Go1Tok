import 'package:Go1Tok/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:Go1Tok/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TFadedAnimation extends StatelessWidget {
   TFadedAnimation({
    super.key,
    required this.durationInMs,
     required this.child,
     this.animatedPosition,
  });

  final controller = Get.put(FadeInAnimationController());

  final int durationInMs;


  final TAnimatedPosition ? animatedPosition;
   final Widget child;



   @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(() => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: controller.animate.value ? animatedPosition!.topAfter : animatedPosition!.topBefore,
        left: controller.animate.value ? animatedPosition!.leftAfter : animatedPosition!.leftBefore,
        bottom: controller.animate.value ? animatedPosition!.bottomAfter : animatedPosition!.bottomBefore,
        right: controller.animate.value ? animatedPosition!.rightAfter : animatedPosition!.rightBefore,


        child: AnimatedOpacity(
          opacity: controller.animate.value ? 1 : 0,
          duration:  Duration(milliseconds: durationInMs),

          child: child /*Image(
            image: const AssetImage(tSplashImage),
            height: size.height / 3.0,
            width: size.width / 2.0,
          )*/,
        )),
    );
  }
}

