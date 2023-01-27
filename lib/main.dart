import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:todoapp_v2/views/todoDetailPage/todo_detail_page.dart';

import './views/TopPage/top_page.dart';
import './views/todoListPage/todo_list_page.dart';
import './views/todoDetailPage/todo_detail_page.dart';
import './models/todo_model.dart';

Future<void> main() async {
  runApp(ProviderScope(child: TodoApp()));
}

class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);
  
  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const TopPage(),
        routes: [
          GoRoute(
            path: "todo_list",
            builder: (BuildContext context, GoRouterState state) => const TodoListPage(),
            routes: [
              GoRoute(
                path: "todo_detail",
                builder: (BuildContext context, GoRouterState state) {
                  TodoModel todo = state.extra as TodoModel;
                  return TodoDetailPage(todo: todo);
                }
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      locale: const Locale('ja', 'JP'),
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}