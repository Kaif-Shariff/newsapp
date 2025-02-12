import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/apptheme/app_theme.dart';
import 'package:newsapp/core/network/api_service.dart';
import 'package:newsapp/presentation/screens/home_screen.dart';
import 'package:newsapp/repository/news_repository.dart';
import 'package:newsapp/state/article_bloc.dart';

void main() {
  final Dio dio = Dio();
  final ApiService apiService = ApiService(dio);
  final NewsRepository repository = NewsRepository(apiService);
  runApp(MainApp(repository: repository));
}

class MainApp extends StatelessWidget {
  final NewsRepository repository;

  const MainApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticleBloc>(
          create: (context) => ArticleBloc(repository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // themeMode: state.themeMode,
        home: HomeScreen(),
      ),
    );
  }
}
