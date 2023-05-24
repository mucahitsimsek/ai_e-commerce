import 'package:ai_ecommerce/core/bloc/auth_bloc.dart';
import 'package:ai_ecommerce/core/repository/auth_repository.dart';
import 'package:ai_ecommerce/core/widgets/navigation/un_handled_route.dart';
import 'package:ai_ecommerce/view/authentication/login/login_screen.dart';
import 'package:ai_ecommerce/view/authentication/register/register_screen.dart';
import 'package:ai_ecommerce/view/cart/cart_screen.dart';
import 'package:ai_ecommerce/view/categories/categories_screen.dart';
import 'package:ai_ecommerce/view/home/home_screen.dart';
import 'package:ai_ecommerce/view/profile/profile_screen.dart';
import 'package:ai_ecommerce/view/search/search_screen.dart';
import 'package:ai_ecommerce/core/utils/my_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/widgets/navigation/bottom_navigation_widget.dart';
import 'core/widgets/navigation/bloc/navigation_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          scaffoldMessengerKey: scaffoldMessengerKey,
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Raleway",
            cardColor: MyColors.whiteBlue,
            useMaterial3: true,
          ),
          initialRoute: '/myHomeApp',
          routes: {
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/myHomeApp': (context) => BlocProvider<NavigationBloc>(
                  create: (context) => NavigationBloc(),
                  child: MyHomeApp(),
                ),
            '/home': (context) => const HomeScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/search': (context) => const SearchScreen(),
            '/cart': (context) => const CartScreen(),
            '/categories': (context) => const CategoriesScreen(),
            '/unhandledroute': (context) => const UnHandledRoute(),
          },
        ),
      ),
    );
  }
}
