import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_app_clone/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app_clone/application/home/home_bloc.dart';
import 'package:netflix_app_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app_clone/application/search/search_bloc.dart';
import 'package:netflix_app_clone/core/colors.dart';
import 'package:netflix_app_clone/domain/core/dependency_injection/injectable.dart';
import 'package:netflix_app_clone/presentation/main_page/screen_main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
        BlocProvider(create: (ctx) => getIt<FastLaughBloc>()),
        BlocProvider(create: (ctx) => getIt<HotAndNewBloc>()),
        BlocProvider(create: (ctx) => getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: kBlackColor,
          ),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          scaffoldBackgroundColor: backgroundColor,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
          ),
          primarySwatch: Colors.blue,
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
