import 'package:bookly_app/core/widgets/custom_shimmer.dart';
import 'package:bookly_app/core/widgets/shimmer_card.dart';
import 'package:flutter/material.dart';

class ShimmerBookListViewItem extends StatelessWidget {
  const ShimmerBookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding:  EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              ShimmerCard(),
              SizedBox(width: 20,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomShimmer(height: 15,),
                  SizedBox(height: 15,),
                  CustomShimmer(width: 100,height: 15,),
                  SizedBox(height: 15,),
                  Row(children: [CustomShimmer(width: 50,height: 15,),Spacer(),CustomShimmer(width: 70,height: 15,),],),
                  
                ],
              ))
            ],
          ),
        ),
      ) ;
  }
}