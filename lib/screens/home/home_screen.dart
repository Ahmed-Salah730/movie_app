import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/screens/home/profile_tab/profile_tab.dart';
import 'package:movies_app/screens/home/search_tab/search_tab.dart';

import '../../cubits/app_cubit.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import 'explore_tab/explore_tab.dart';
import 'home_tab/home_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  late double screenWidth;
  late double screenHeight;
  List<Widget> tabs = [HomeTab(), SearchTab(), ExploreTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width; //  430
    screenHeight = MediaQuery.of(context).size.height; //  932

    return BlocProvider(
        create: (_) => AppCubit(),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final cubit = context.read<AppCubit>();

            return Scaffold(
              body: backgroundStyle(selectedIndex),
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: AppColors.gray,
                  scaffoldBackgroundColor: AppColors.black,
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  iconSize: 22,
                  showSelectedLabels: false,
                  selectedItemColor: AppColors.yellow,
                  unselectedItemColor: AppColors.white,
                  currentIndex: selectedIndex,
                  onTap: (int index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(AppImages.homeIcon)),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(AppImages.searchIcon)),
                      label: "Search",
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(AppImages.exploreIcon)),
                      label: "Explore",
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(AppImages.profileIcon)),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget backgroundStyle(int index) {
    if (index == 0) {
      return tabs[0];
    } else {
      return SafeArea(child: tabs[index]);
    }
  }
}
