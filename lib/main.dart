import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pantheon/core/router.dart';
import 'package:pantheon/core/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: PantheonApp(),
    ),
  );
}

class PantheonApp extends StatelessWidget {
  const PantheonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PANTHEON',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
