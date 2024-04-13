import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:poll_creation_app/const/app_colors.dart';
import 'package:poll_creation_app/core/router/router.gr.dart';

@RoutePage(
  deferredLoading: true,
)
class NavBarPage extends StatelessWidget {
  const NavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        AllPollsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          elevation: 0.0,
          height: 50,
          backgroundColor: AppColors.kSecondaryColor,
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          indicatorShape: const Border(
            bottom: BorderSide(
              color: Colors.white,
              width: 2.5,
            ),
          ),
          indicatorColor: Colors.white.withOpacity(0.2),
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: AppColors.kTertiaryColor,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.people,
                color: AppColors.kTertiaryColor,
              ),
              label: "Communtiy",
            ),
          ],
        );
      },
    );
  }
}
