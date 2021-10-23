import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timers/core/inject/injection_container.dart' as di;
import 'package:timers/application/core/bloc/bloc_observer.dart';
import 'package:timers/presentation/home_page.dart';

import 'core/inject/injection_container.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // BLoC Debug
  Bloc.observer = AppBlocObserver();

  //DI init
  di.configureDependencies();


  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const HomePage(),
    );
  }
  static final theme = ThemeData(
    textTheme: GoogleFonts.openSansTextTheme(),
    primaryColor: Colors.red,
    primarySwatch: Colors.lightBlue,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color:Colors.white, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.white)
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      )
    )
  );
}


