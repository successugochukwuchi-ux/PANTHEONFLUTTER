import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pantheon/features/auth/presentation/login_screen.dart';
import 'package:pantheon/features/auth/presentation/register_screen.dart';
import 'package:pantheon/features/home/presentation/dashboard_screen.dart';
import 'package:pantheon/features/home/presentation/main_screen.dart';
import 'package:pantheon/features/home/presentation/news_board_screen.dart';
import 'package:pantheon/features/notes/presentation/lecture_notes_screen.dart';
import 'package:pantheon/features/notes/presentation/punch_notes_screen.dart';
import 'package:pantheon/features/settings/presentation/settings_screen.dart';
import 'package:pantheon/features/social/presentation/chats_screen.dart';
import 'package:pantheon/features/social/presentation/friends_screen.dart';
import 'package:pantheon/features/study/presentation/cbt_practice_screen.dart';
import 'package:pantheon/features/study/presentation/past_questions_screen.dart';
import 'package:pantheon/features/study/presentation/video_library_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/login',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MainScreen(child: child),
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/video-library',
          builder: (context, state) => const VideoLibraryScreen(),
        ),
        GoRoute(
          path: '/cbt-practice',
          builder: (context, state) => const CBTPracticeScreen(),
        ),
        GoRoute(
          path: '/past-questions',
          builder: (context, state) => const PastQuestionsScreen(),
        ),
        GoRoute(
          path: '/lecture-notes',
          builder: (context, state) => const LectureNotesScreen(),
        ),
        GoRoute(
          path: '/chats',
          builder: (context, state) => const ChatsScreen(),
        ),
        GoRoute(
          path: '/punch-notes',
          builder: (context, state) => const PunchNotesScreen(),
        ),
        GoRoute(
          path: '/news-board',
          builder: (context, state) => const NewsBoardScreen(),
        ),
        GoRoute(
          path: '/friends',
          builder: (context, state) => const FriendsScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
