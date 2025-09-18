part of 'part_of_import.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    // initialLocation: RouteName.browseJobScreen,
    initialLocation: RouteName.splashScreen,

    routes: [
      //Bottom NavBar USER
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            BottomBarWidget(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteName.userHomeScreen,
                pageBuilder: (context, state) {
                  return buildPageWithTransition(
                    context: context,
                    state: state,
                    transitionType: PageTransitionType.slideRightToLeft,
                    child: UserHomeScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteName.jobScreen1,
                builder: (context, state) => const UserHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteName.msgScreen1,
                builder: (context, state) => const UserHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteName.profileScreen,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      //Bottom NavBar Helper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            BottomBarWidget(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteName.helperHomeScreen,
                pageBuilder: (context, state) {
                  return buildPageWithTransition(
                    context: context,
                    state: state,
                    transitionType: PageTransitionType.slideRightToLeft,
                    child: HelperHomeScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteName.jobScreen2,
                builder: (context, state) => const HelperHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteName.msgScreen2,
                builder: (context, state) => const HelperHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteName.profileScreen2,
                builder: (context, state) => const HelperHomeScreen(),
              ),
            ],
          ),
        ],
      ),

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
        name: RouteName.completeProfileSetupScreen,
        path: RouteName.completeProfileSetupScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: CompleteProfileSetupScreen());
        },
      ),
      GoRoute(
        name: RouteName.jobDetailsScreen,
        path: RouteName.jobDetailsScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: JobDetailsScreen());
        },
      ),
      GoRoute(
        name: RouteName.jobCounterOfferOfferScreen,
        path: RouteName.jobCounterOfferOfferScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: JobCounterOfferOfferScreen());
        },
      ),
      GoRoute(
        name: RouteName.afterAcceptCounterOffer,
        path: RouteName.afterAcceptCounterOffer,
        pageBuilder: (context, state) {
          return const MaterialPage(child: AfterAcceptCounterOffer());
        },
      ),
      GoRoute(
        name: RouteName.afterAcceptJobUserSide,
        path: RouteName.afterAcceptJobUserSide,
        pageBuilder: (context, state) {
          return const MaterialPage(child: AfterAcceptJobUserSide());
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
        },
      ),
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

      GoRoute(
        name: RouteName.jobPostScreen,
        path: RouteName.jobPostScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: JobPostScreen());
        },
      ),

      GoRoute(
        name: RouteName.counterOfferAcceptedScreen,
        path: RouteName.counterOfferAcceptedScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: CounterOfferAcceptedScreen());
        },
      ),

      GoRoute(
        name: RouteName.searchScreen,
        path: RouteName.searchScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SearchScreen());
        },
      ),

      GoRoute(
        name: RouteName.filterScreen,
        path: RouteName.filterScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: FilterScreen());
        },
      ),

      GoRoute(
        name: RouteName.personalInfoEditingScreen,
        path: RouteName.personalInfoEditingScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: PersonalInfoEditingScreen());
        },
      ),

      GoRoute(
        name: RouteName.browseJobScreen,
        path: RouteName.browseJobScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: BrowseJobScreen());
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
    ],
  );
}
