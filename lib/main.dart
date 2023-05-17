import 'package:ai_ecommerce/core/bloc/auth_bloc.dart';
import 'package:ai_ecommerce/core/repository/auth_repository.dart';
import 'package:ai_ecommerce/view/cart/cart_screen.dart';
import 'package:ai_ecommerce/view/categories/categories_screen.dart';
import 'package:ai_ecommerce/view/home/home_screen.dart';
import 'package:ai_ecommerce/view/profile/profile_screen.dart';
import 'package:ai_ecommerce/view/register/register_screen.dart';
import 'package:ai_ecommerce/view/search/search_screen.dart';
import 'package:ai_ecommerce/core/utils/my_colors.dart';
import 'package:ai_ecommerce/core/widgets/my_home_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ai_ecommerce/view/login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Raleway",
            cardColor: MyColors.whiteBlue,
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/myHomeApp': (context) => const MyHomeApp(),
            '/home': (context) => const HomeScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/search': (context) => const SearchScreen(),
            '/cart': (context) => const CartScreen(),
            '/categories': (context) => const CategoriesScreen(),
          },
        ),
      ),
    );
  }
}
