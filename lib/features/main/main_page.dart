import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/config/constants/assets.dart';
import 'package:manage_finance/core/db/db_helper.dart';
import 'package:manage_finance/features/add_pupil/pages/add_pupil_page.dart';
import 'package:manage_finance/features/home/presentation/pages/home_page.dart';
import 'package:manage_finance/features/settings/bloc/bloc/settings_bloc.dart';
import 'package:manage_finance/features/settings/pages/settings_page.dart';
import 'package:manage_finance/features/teachers/precentation/pages/teachers_page.dart';
import 'package:manage_finance/features/teachers/precentation/widgets/add_teacher_bottom_sheet.dart';
import 'package:manage_finance/injection_container.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin {
  late final PageController pageController;
  int activeIndex = 0;
  @override
  void initState() {
    super.initState();
    sl<DBHelper>().init().then((value) {
      context.read<SettingsBloc>().add(GetAllDateEvent());
    });
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        activeIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is SettingsLoadedState) {
              return PageView(
                controller: pageController,
                children: [
                  const HomePage(),
                  AddPupilPage(),
                  const TeachersPage(),
                  const SettingsPage(),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: activeIndex == 0 || activeIndex == 2
            ? FloatingActionButton(
                onPressed: () {
                  if (activeIndex == 0) {
                    pageController.jumpToPage(1);
                  } else {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return const AddTeacherBottomSheet();
                      },
                    );
                  }
                },
                backgroundColor: AppColors.black,
                shape: const CircleBorder(),
                child: SvgPicture.asset(Assets.icons.add),
              )
            : null,
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
  
  @override
  bool get wantKeepAlive => false;
}
