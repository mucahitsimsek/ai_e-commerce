import 'package:ai_ecommerce/core/widgets/navigation/bloc/navigation_bloc.dart';
import 'package:ai_ecommerce/core/widgets/navigation/tab_item.dart';
import 'package:ai_ecommerce/core/widgets/navigation/tab_navigator.dart';
import 'package:ai_ecommerce/view/cart/cart_screen.dart';
import 'package:ai_ecommerce/view/categories/categories_screen.dart';
import 'package:ai_ecommerce/view/home/home_screen.dart';
import 'package:ai_ecommerce/view/profile/profile_screen.dart';
import 'package:ai_ecommerce/view/search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

class MyHomeApp extends StatelessWidget {
  MyHomeApp({super.key});

  final _items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home,
        ),
        label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.folder,
        ),
        label: "Categories"),
    const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.search,
        ),
        label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.cart,
        ),
        label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.profile_circled,
        ),
        label: "Home"),
  ];

  final _screens = <TabItem>[
    TabItem(
      GlobalKey<NavigatorState>(),
      const HomeScreen(),
    ),
    TabItem(
      GlobalKey<NavigatorState>(),
      const CategoriesScreen(),
    ),
    TabItem(
      GlobalKey<NavigatorState>(),
      const SearchScreen(),
    ),
    TabItem(
      GlobalKey<NavigatorState>(),
      const CartScreen(),
    ),
    TabItem(
      GlobalKey<NavigatorState>(),
      const ProfileScreen(),
    ),
  ];

  final _tabNavigator = GlobalKey<TabNavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, int>(
      builder: (context, state) {
        final navBloc = BlocProvider.of<NavigationBloc>(context);

        buildNavBar() {
          return Padding(
            padding: EdgeInsets.all(5.w(context)),
            child: BottomNavigationBar(
              onTap: (value) => navBloc.add(OnTapNav(value)),
              currentIndex: state,
              items: _items,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,
            ),
          );
        }

        return WillPopScope(
          onWillPop: () async => !await _tabNavigator.currentState!.maybePop(),
          child: Scaffold(
            extendBody: true,
            bottomNavigationBar: buildNavBar(),
            body: TabNavigator(
              key: _tabNavigator,
              tabs: _screens,
              selectedIndex: state,
            ),
          ),
        );
      },
    );
  }
}
