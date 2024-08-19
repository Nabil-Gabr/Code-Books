import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/presentation/mange/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/textLogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: [
          Image.asset('assets/images/book_logo.png',height: 45,),
          const TextLogo(fontSize: 24),
          // const Text('BOOKPULSE',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          const Spacer(),
          IconButton(onPressed: (){
           GoRouter.of(context).push(AppRouter.searchViewPath,extra: BlocProvider.of<FeaturedBooksCubit>(context).searchbooks);
          }, icon: const Icon(FontAwesomeIcons.magnifyingGlass,size: 24,))
        ],
      ),
    );
  }
}