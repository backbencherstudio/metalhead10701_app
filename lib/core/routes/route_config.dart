part of 'part_of_import.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.successScreen,

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
//        GoRoute(
//         name: RouteName.signupIntroScreen,
//         path: RouteName.signupIntroScreen,
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: SignupIntroScreen());
//         },),
//        GoRoute(
//         name: RouteName.successScreen,
//         path: RouteName.successScreen,
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: SuccessScreen());
//         },
//       ),
//        GoRoute(
//         name: RouteName.forgetOtpScreen,
//         path: RouteName.forgetOtpScreen,
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: ForgetOtpScreen());
//         },
//       ),
//        GoRoute(
//         name: RouteName.resetPassScreen,
//         path: RouteName.resetPassScreen,
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: ResetPassScreen());
//         },
//       ),
//        GoRoute(
//         name: RouteName.signupScreen,
//         path: RouteName.signupScreen,
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: SignupScreen());
//         },
//       ),

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
