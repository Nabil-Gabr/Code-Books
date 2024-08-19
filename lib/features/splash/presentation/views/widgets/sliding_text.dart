import 'package:bookly_app/features/splash/presentation/views/widgets/textLogo.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.sildingAnimation,
  });

  final Animation<Offset> sildingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: sildingAnimation,
      builder: (context, _) {
        return  SlideTransition(
        position: sildingAnimation,
        child: const Column(
          children: [
            TextLogo(fontSize: 30,),
            Text('Read Free Books')
          ],
        )
      );
        
      },
    );
  }
}
