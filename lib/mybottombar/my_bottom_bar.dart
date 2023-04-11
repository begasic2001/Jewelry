import 'package:app_trang_suc/Screens/homepage/homepage.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:flutter/cupertino.dart';
//import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/material.dart';
// import 'package:custom_navigator/custom_navigator.dart';

/// This is the stateful widget that the main application instantiates.
class MyBottomBar extends StatefulWidget {
  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

/// This is the private State class that goes with MyBottomBar.
class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    // CategoryScreen(),
    // YourBagScreen(),
    // WishListScreen(),
    // ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        activeColor: AppColors.baseDarkPinkColor,
        inactiveColor: AppColors.baseGrey40Color,
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomePage(),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomePage(),
              );
            });
        }
      },
    );
  }
}

//  return Scaffold(
      //children: _widgetOptions,
      //onItemTap: _onItemTapped,

    //   body: Center(
    //     child: _widgetOptions.elementAt(_selectedIndex),
    //   ),
    //   bottomNavigationBar: BottomNavigationBar(
    //     showSelectedLabels: false,
    //     showUnselectedLabels: false,
    //     type: BottomNavigationBarType.fixed,
    //     unselectedItemColor: AppColors.baseGrey40Color,
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: '',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.grid_view),
    //         label: '',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.shopping_cart_outlined),
    //         label: '',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.favorite_border),
    //         label: '',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.person),
    //         label: '',
    //       ),
    //     ],
    //     currentIndex: _selectedIndex,
    //     selectedIconTheme: IconThemeData(
    //       color: AppColors.baseDarkPinkColor,
    //     ),
    //     //selectedItemColor: AppColors.baseDarkPinkColor,
    //     onTap: _onItemTapped,
    //   ),
    // );
