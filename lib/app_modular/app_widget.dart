import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en'), const Locale('pt')],
      debugShowCheckedModeBanner: false,
      title: 'GoPass',
      theme: ThemeData(
          primarySwatch: MaterialColor(0xFF039BE5, {
            50:  Color(0xFF039BE5),
            100: Color(0xFF039BE5),
            200: Color(0xFF039BE5),
            300: Color(0xFF039BE5),
            400: Color(0xFF039BE5),
            500: Color(0xFF039BE5),
            600: Color(0xFF039BE5),
            700: Color(0xFF039BE5),
            800: Color(0xFF039BE5),
            900: Color(0xFF039BE5),
          }),
          primaryColor: const Color.fromRGBO(3, 155, 229, 1)),
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      initialRoute: "/",
    ).modular(); //added by extension
  }
}
