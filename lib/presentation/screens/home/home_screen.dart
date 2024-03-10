import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/screens/home/doctors_info.dart';
import 'package:flutter_application_6/presentation/screens/home/doctors_screen.dart';
import 'package:flutter_application_6/presentation/screens/home/profile_screen.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/resources/resources.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 PersistentTabController  _controller = 
  PersistentTabController(initialIndex: 0);

List <Widget> screens = [
  const DoctorsScreen(),
  const Scaffold(
    body: Center(
      child: Text(
        'Статьи',
      style: AppFonts.w700s34,
      ),
    ),
  ),const Scaffold(
    body: Center(
      child: Text(
        'Вызов',
      style: AppFonts.w700s34,
      ),
    ),
  ),
  const Scaffold(
    body: Center(
      child: Text(
        'Мои доктора',
      style: AppFonts.w700s34,
      ),
    ),
  ),
  const ProfileScreen(),
];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: _controller,
        screens: screens,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style16, // Choose the nav bar style with this property.
    );
  }

    
    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s10,
        icon: const Icon(
          CupertinoIcons.person_crop_circle_fill_badge_plus,
        ),
        title: ("Доктора"),
        activeColorPrimary: AppColors.buttoncolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
            PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s10,
        icon: const Icon(
          CupertinoIcons.square_favorites,
        ),
        title: ("Статьи"),
        activeColorPrimary: AppColors.buttoncolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
            PersistentBottomNavBarItem(
                textStyle: AppFonts.w400s15,
        icon: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset(
            AppPngs.car,
          ),
        ),
        title: (" "),
        activeColorPrimary: AppColors.buttoncolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
            PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s10,
        icon: const Icon(
          CupertinoIcons.flag,
        ),
        title: ("Мои доктора"),
        activeColorPrimary: AppColors.buttoncolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
           PersistentBottomNavBarItem(
        textStyle: AppFonts.w400s10,
        icon: const Icon(CupertinoIcons.profile_circled),
        title: ("Профиль"),
        activeColorPrimary: AppColors.buttoncolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
        ];
    }
}
