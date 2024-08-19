import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/mange/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/mange/science_books_cubit/science_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>FeaturedBooksCubit(getIt.get<HomeRepoImpl>())..fetchFeaturedBooks(),),
        BlocProvider(create: (context) => ScienceBooksCubit(getIt.get<HomeRepoImpl>())..fatchNewsetBooks(),),
      ], 
      child: MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      
    ),
    );
  }
}