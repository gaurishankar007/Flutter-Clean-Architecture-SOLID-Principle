import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boilerplate/core/constants/colors.dart';
import 'package:boilerplate/core/extensions/build_context_extension.dart';
import 'package:boilerplate/core/constants/route_path.dart';
import 'package:boilerplate/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:boilerplate/injection/injector.dart';

@RoutePage(name: kDashboardR)
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    snackBar.init(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.sos,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<DashboardCubit>()),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Builder(builder: (context) {
            return AutoRouter(
              navigatorObservers: () => [DashNavObserver(context)],
            );
          }),
          bottomNavigationBar: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.pSW(10)),
                topRight: Radius.circular(size.pSW(10)),
              ),
              boxShadow: [
                BoxShadow(
                  color: kB15,
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            child: BlocBuilder<DashboardCubit, DashboardState?>(
              builder: (context, state) {
                int activeIndex = 0;

                if (state is DashboardState) {
                  activeIndex = state.activeIndex;
                }

                return BottomNavigationBar(
                  currentIndex: activeIndex,
                  onTap: (index) => BlocProvider.of<DashboardCubit>(context).setIndex(index),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedFontSize: 0,
                  unselectedFontSize: 0,
                  iconSize: 25,
                  selectedItemColor: kP,
                  unselectedItemColor: kEBE,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book_outlined),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.inventory_rounded),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.menu),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_2_outlined),
                      label: "",
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DashNavObserver extends AutoRouterObserver {
  final BuildContext context;

  DashNavObserver(this.context);

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (previousRoute != null) {
      String? subNavHref = route.settings.name;
      if (subNavHref != null) {}
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      String? subNavHref = previousRoute.settings.name;
      if (subNavHref != null) {
        BlocProvider.of<DashboardCubit>(context).findIndex(subNavHref);
      }
    }
  }
}
