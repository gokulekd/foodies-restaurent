import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/controller/googlesignin.dart';
import 'package:foodies_restaurent/firebase_options.dart';
import 'package:foodies_restaurent/view/pages/splash_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: GetMaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: kwhite,
          ),
        ),
        builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            breakpoints: const [
              ResponsiveBreakpoint.resize(350, name: MOBILE),
              ResponsiveBreakpoint.autoScale(600, name: TABLET),
              ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ]),
        debugShowCheckedModeBanner: false,
        home: const ScreenSplash(),
        // home: BottomNavigationBarResaurent(),
      ),
    );
  }
}
