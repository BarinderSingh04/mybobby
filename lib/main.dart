import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybobby/Services/local_storage_service.dart';
import 'package:mybobby/screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  runApp(
      ProviderScope(
          overrides: [
            sharedPrefsProvider.overrideWithValue(sharedPreferences)
          ],
          child: const MyApp()),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        supportedLocales: const [
          Locale('en'),
          Locale('el'),
          Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
          Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
        ],
          localizationsDelegates: const [
            CountryLocalizations.delegate,

          ],
          debugShowCheckedModeBanner: false,
          home:const SplashScreen(),
          theme: ThemeData(
            // ignore: prefer_const_constructors
              scaffoldBackgroundColor: Colors.white,
              textTheme: GoogleFonts.interTextTheme (
                  Theme.of(context).textTheme

              )
          ),
        );



    }
}
