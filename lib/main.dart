import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s2/data/api/api_services.dart';
import 'package:s2/provider/detail/resto_detail_provider.dart';
import 'package:s2/provider/home/resto_list_provider.dart' as list_provider;
import 'package:s2/provider/home/resto_search_provider.dart' as search_provider;
import 'package:s2/provider/main/index_nav_provider.dart';
import 'package:s2/screen/detail/detail_screen.dart';
import 'package:s2/screen/main/main_screen.dart';
import 'package:s2/static/navigation_route.dart';
import 'package:s2/style/theme/resto_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IndexNavProvider()),
        Provider(create: (context) => ApiServices()),

        // List provider
        ChangeNotifierProvider(
          create: (context) =>
              list_provider.RestoListProvider(context.read<ApiServices>()),
        ),

        // Detail provider
        ChangeNotifierProvider(
          create: (context) => RestoDetailProvider(context.read<ApiServices>()),
        ),

        // Search provider (constructor 1 argumen saja)
        ChangeNotifierProvider(
          create: (context) =>
              search_provider.RestoSearchProvider(context.read<ApiServices>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: RestoTheme.lightTheme,
      darkTheme: RestoTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const MainScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
          restoId: ModalRoute.of(context)!.settings.arguments as String,
        ),
      },
    );
  }
}
