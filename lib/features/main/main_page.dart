import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/config/constants/assets.dart';
import 'package:manage_finance/features/home/pages/home_page.dart';
import 'package:manage_finance/features/main/widgets/custom_textfield.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController pageController;
  int activeIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        activeIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: PageView(
          controller: pageController,
          children: [
            HomePage(),
            HomePage(),
            HomePage(),
            HomePage(),
          ],
        ),
        bottomNavigationBar: BottomBar(
          backgroundColor: AppColors.white,
          height: 90,
          selectedIndex: activeIndex,
          onTap: (value) {
            pageController.jumpToPage(value);
          },
          items: [
            BottomBarItem(
              icon: SvgPicture.asset(Assets.icons.home),
              title: Text(
                'Home',
                style: AppTextStyles.body14w4.copyWith(color: AppColors.white),
              ),
              activeColor: AppColors.primaryColor,
              inactiveIcon: SvgPicture.asset(
                Assets.icons.home,
                color: AppColors.black,
              ),
              backgroundColorOpacity: 1,
            ),
            BottomBarItem(
              icon: SvgPicture.asset(Assets.icons.addStudent),
              title: Text(
                'Pupil',
                style: AppTextStyles.body14w4.copyWith(color: AppColors.white),
              ),
              activeColor: AppColors.primaryColor,
              inactiveIcon: SvgPicture.asset(
                Assets.icons.addStudent,
                color: AppColors.black,
              ),
              backgroundColorOpacity: 1,
            ),
            BottomBarItem(
              icon: SvgPicture.asset(Assets.icons.profile),
              title: Text(
                'Teachers',
                style: AppTextStyles.body14w4.copyWith(color: AppColors.white),
              ),
              activeColor: AppColors.primaryColor,
              inactiveIcon: SvgPicture.asset(
                Assets.icons.profile,
                color: AppColors.black,
              ),
              backgroundColorOpacity: 1,
            ),
            BottomBarItem(
              icon: SvgPicture.asset(Assets.icons.settings),
              title: Text(
                'Settings',
                style: AppTextStyles.body14w4.copyWith(color: AppColors.white),
              ),
              activeColor: AppColors.primaryColor,
              inactiveIcon: SvgPicture.asset(
                Assets.icons.settings,
                color: AppColors.black,
              ),
              backgroundColorOpacity: 1,
            )
          ],
        ),
      ),
    );
  }
}
