import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:grocessary/feature/groceries/domain/entity/groceryItem_entity.dart';
import 'package:grocessary/feature/groceries/presentation/bloc/grocery_bloc.dart';
import 'package:grocessary/feature/groceries/presentation/pages/grocery_cart_page.dart';
import 'package:grocessary/feature/groceries/presentation/pages/home_page.dart';
import 'package:grocessary/feature/groceries/presentation/pages/grocery_detail_page.dart';
import 'injection_container.dart' as lc;
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await lc.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => lc.sl<GroceryBloc>(), // Register GroceryBloc
        ),
      ],
      child: MaterialApp(
        initialRoute: '/splash_screen',
        onGenerateRoute: (settings) {
          if (settings.name == '/splash_screen') {
            return MaterialPageRoute(builder: (_) => const SplashScreen());
          } else if (settings.name == '/home_page') {
            return MaterialPageRoute(builder: (_) => HomePage());
          } else if (settings.name == '/grocery_cart_page') {
            return MaterialPageRoute(builder: (_) => const GroceryCartPage());
          } else if (settings.name == '/grocery_detail_page') {
            final GroceryItemEntity selectedGrocery = settings.arguments as GroceryItemEntity;
            return MaterialPageRoute(
              builder: (_) => GroceryDetailPage(selectedGrocery: selectedGrocery),
            );
          }
          return null;
        },
        title: 'Flutter App',
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
