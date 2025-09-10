part of 'part_of_import.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.userHomeScreen,

    routes: [
      //Bottom NavBar
      // StatefulShellRoute.indexedStack(
      //   builder: (context, state, navigationShell) =>
      //       BottomBarWidget(navigationShell: navigationShell),
      //   branches: [
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteName.homeScreen,
      //           pageBuilder: (context, state) {
      //             return buildPageWithTransition(
      //               context: context,
      //               state: state,
      //               transitionType: PageTransitionType.slideRightToLeft,
      //               child: HomeScreen(),
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteName.paymentsScreen,
      //           builder: (context, state) => const HomeScreen(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteName.productsScreen,
      //           builder: (context, state) => const HomeScreen(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteName.helpScreen,
      //           builder: (context, state) => const HomeScreen(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteName.moreScreen,
      //           builder: (context, state) => const HomeScreen(),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),

    GoRoute(
      name: RouteName.splashScreen,
      path: RouteName.splashScreen,
      pageBuilder: (context, state) {
        return const MaterialPage(child: SplashScreen());
      },
    ),
      GoRoute(
        name: RouteName.splashScreen2,
        path: RouteName.splashScreen2,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen2());
        },
      ),
 GoRoute(
        name: RouteName.createAccountScreen,
        path: RouteName.createAccountScreen,
        pageBuilder: (context, state) {
          return MaterialPage(child: CreateAccountScreen());
        },
      ),
       GoRoute(
        name: RouteName.verificationScreen,
        path: RouteName.verificationScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: VerificationScreen());
        },
      ),
          GoRoute(
        name: RouteName.successScreen,
        path: RouteName.successScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SuccessScreen());
        },
      ),
      GoRoute(
        name: RouteName.loginScreen,
        path: RouteName.loginScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        },
      ),
       GoRoute(
        name: RouteName.forgotUserScreen,
        path: RouteName.forgotUserScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: ForgotScreen(isUser: true));
        },),
       GoRoute(
        name: RouteName.forgotPassScreen,
        path: RouteName.forgotPassScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: ForgotScreen(isUser: false));
        },
      ),
       GoRoute(
        name: RouteName.newUserScreen,
        path: RouteName.newUserScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: NewScreen(isUser: true));
        },
      ),
       GoRoute(
        name: RouteName.newPasswordScreen,
        path: RouteName.newPasswordScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: NewScreen(isUser: false));
        },
      ),
       GoRoute(
        name: RouteName.restoreUserScreen,
        path: RouteName.restoreUserScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: RestoreScreen(isUser: true));
        },
      ),
      GoRoute(
        name: RouteName.restorePasswordScreen,
        path: RouteName.restorePasswordScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: RestoreScreen(isUser: false));
        },
      ),

      GoRoute(
        name: RouteName.userHomeScreen,
        path: RouteName.userHomeScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: UserHomeScreen());
        },
      ),

      GoRoute(
        name: RouteName.helperHomeScreen,
        path: RouteName.helperHomeScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: HelperHomeScreen());
        },
      ),

      // GoRoute(
      //   name: RouteName.ebookPlay,
      //   path: '${RouteName.ebookPlay}/:ebookId',
      //   pageBuilder: (context, state) {
      //     final ebookId = state.pathParameters['ebookId']!;
      //     return buildPageWithTransition(
      //       context: context,
      //       state: state,
      //       transitionType: PageTransitionType.fade,
      //       child: EbookPlay(ebookId: ebookId),
      //     );
      //   },
      // ),
    ]);

}
