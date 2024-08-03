import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/app/widgets/bottom_navigation_bar.dart';
import 'package:my_app/calendar/view/calendar_page.dart';
import 'package:my_app/camera/view/page/camera_page.dart';
import 'package:my_app/gallery/bloc/gallery_event.dart';
import 'package:my_app/gallery/view/page/gallery_page.dart';
import 'package:my_app/home/view/page/home_page.dart';

import '../gallery/bloc/gallery_bloc.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeTabNavigatorKey = GlobalKey<NavigatorState>();
final _profileTabNavigatorKey = GlobalKey<NavigatorState>();

// home
const homePath = '/home';
const calendarPath = '/calendar';
const galleryPath = '/gallery';
const cameraPath = '/camera';

Page getPage({
  required Widget child,
  required GoRouterState state,
}) {
  return MaterialPage(
    key: state.pageKey,
    child: child,
  );
}

final router = GoRouter(
  initialLocation: '/home',
  // navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      // parentNavigatorKey: _rootNavigatorKey,
      branches: [
        StatefulShellBranch(
          // navigatorKey: _homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: homePath,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const HomePage(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: calendarPath,
              pageBuilder: (context, state) {
                return getPage(
                  child: const CalendarPage(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: galleryPath,
              pageBuilder: (context, state) {
                return getPage(
                   child: GalleryPage()
                  ,
                
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: cameraPath,
              pageBuilder: (context, state) {
                return getPage(
                  child: CameraPage(),
                  state: state,
                );
              },
            ),
          ],
        ),
      ],
      pageBuilder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return getPage(
          child: BottomNavigationPage(
            child: navigationShell,
          ),
          state: state,
        );
      },
    ),
    // GoRoute(
    //   parentNavigatorKey: _rootNavigatorKey,
    //   path: otherpages,
    //   pageBuilder: (context, state) =>
    //       const NoTransitionPage(child: OtherPage()),
    // ),
  ],
);
