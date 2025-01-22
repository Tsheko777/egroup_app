import 'package:egroup_app/pages/dashboard_page.dart';
import 'package:egroup_app/pages/login_page.dart';
import 'package:egroup_app/pages/onboarding.dart';
import 'package:egroup_app/pages/register_page.dart';
import 'package:egroup_app/pages/splash.dart';
import 'package:egroup_app/pages/transfer.dart';
import 'package:egroup_app/service/auth_request.dart';
import 'package:egroup_app/service/guest_request.dart';
import 'package:egroup_app/state/gerneral_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Request objects
  AuthRequest.init();
  GuestRequest.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GerneralState()), //Keep
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: const SplashScreenPage(),
        routes: {
          '/onboarding': (context) => const OnBoardinPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/dashboard': (context) => const DashboardPage(),
          '/transfer': (context) => const TransferPage(),
        });
  }
}
