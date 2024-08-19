import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/asset.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{
  //createAnimation
  //Step 1:Convert from stl to stf & SingleTickerProviderStateMixin
  //Step 2:Create  two object from(AnimationController&Animation<Offset>)
  late AnimationController animatedContainer;
  late Animation<Offset> sildingAnimation;

  //Step 3:initState
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    Future.delayed(
      const Duration(seconds: 3,),(){
        GoRouter.of(context).push(AppRouter.KHomeView);
        // Get.to(()=>const HOmeView(),transition: Transition.fade,duration: KTransitionDuration);
      }
    );
  }

  //Step 4:dispose
  @override
  void dispose() {
    super.dispose();
    animatedContainer.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetData.logo,
          width: 180,
          height: 180,
          alignment: Alignment.center,
        ),
        SlidingText(sildingAnimation: sildingAnimation),
        
      ],
    );
  }

  void initSlidingAnimation() {

    //Step 3/1:AnimationController in initState
    animatedContainer=AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    //Step 3/2:Tween<Offset> in initState
    sildingAnimation=Tween<Offset>(begin: const Offset(2, 0),end: Offset.zero).animate(animatedContainer );

    //Step 3/3:animatedContainer.forward() in initState
    animatedContainer.forward();
  }
}
