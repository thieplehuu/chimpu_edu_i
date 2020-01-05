import 'package:chimpu_edu_i/core/theme/app_theme.dart';
import 'package:chimpu_edu_i/pages/home/drawer_user_controller.dart';
import 'package:chimpu_edu_i/pages/home/home_drawer.dart';
import 'package:chimpu_edu_i/pages/home/home_gv.dart';
import 'package:chimpu_edu_i/pages/home/home_ph.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const HomeGvPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const HomeGvPage();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = HomePhPage();
        });
      }  else {
        
      }
    }
  }
}

