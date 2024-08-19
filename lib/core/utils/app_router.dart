// ignore_for_file: constant_identifier_names

import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/mange/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/data/repository/search_repo_iplementation.dart';
import 'package:bookly_app/features/search/presentaion/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentaion/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const KHomeView = '/HomeView';
  static const KBookDetailsView = '/BookDetailsView';
  static const String searchViewPath = "/SearchView";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: KHomeView,
        builder: (context, state) => const HOmeView(),
      ),
      GoRoute(
        path: KBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>()
          ),

          child: BookDetailsView(bookModel: state.extra as BookModel,),
        ),
      ),

      GoRoute(
          path: searchViewPath,
          builder: (context, state) => BlocProvider(
                create: (context) =>
                    SearchCubitCubit(SearchRepoIplementation()),
                child: SearchView(books: state.extra as List<BookModel>),
              ))

      
    ],
  );
}
