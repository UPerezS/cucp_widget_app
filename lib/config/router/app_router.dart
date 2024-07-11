import 'package:go_router/go_router.dart';
import 'package:cucp_widget_app/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/buttons',
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    path: '/cards',
    builder: (context, state) => const CardsScreen(),
  ),
  GoRoute(
    path: '/progress',
    builder: (context, state) => const ProgressScreen(),
  ),
  GoRoute(
    path: '/snackbar',
    builder: (context, state) => const SnackbarScreen(),
  ),
  GoRoute(
    path: '/animated',
    name: AnimateScreen.name,
    builder: (context, state) => const AnimateScreen(),
  ),
  GoRoute(
    path: '/ui-controls',
    name: UiControlsScreen.name,
    builder: (context, state) => const UiControlsScreen(),
  ),
  GoRoute(
    path: '/tutorial',
    name: AppTutorialScreen.name,
    builder: (context, state) => const AppTutorialScreen(),
  ),
]);
