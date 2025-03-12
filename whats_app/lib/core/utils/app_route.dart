
import 'package:go_router/go_router.dart';
import 'package:whats_app/feature/chat/presentation/views/chat_view.dart';
import 'package:whats_app/feature/home/presentation/views/home_view.dart';
import 'package:whats_app/feature/search/presentation/views/search_view.dart';

abstract class AppRoute {
  static String kChatPath = '/ChatView';
  static String kSearchPath = '/SearchView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kChatPath,
      builder: (context, state) => const ChatView(),
    ),
     GoRoute(
      path: kSearchPath,
      builder: (context, state) => const SearchView(),
    ),
    
    

   
  ]);
}
