import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/config/go_router.dart';
import 'package:soccer_app/l10n/app_localizations_setup.dart';
import 'package:soccer_app/presentation/providers/fixture/fixture_provider.dart';
import 'package:soccer_app/presentation/providers/ligues/ligues_provider.dart';
import 'package:soccer_app/presentation/providers/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LiguesProvider(),
        ),
        ChangeNotifierProvider(
          create:(_) => FixtureProvider(), 
        ),
        ChangeNotifierProvider(
          create:(_) => LocaleProvider(), 
        ),
      ],
      
      child: const MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    return MaterialApp.router(
      supportedLocales: const [
        Locale('en'),
        Locale('es')
      ],
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      locale: localeProvider.locale,
      title: 'Material App',
      routerConfig: AppRouter.appRouter,
      theme: ThemeData(
        // tabBarTheme: TabBarTheme(
        //   indicatorColor: Colors.red
        // )
      ),
    );
  }
}
