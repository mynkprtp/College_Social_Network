import '../../utils/theme.dart';
import '../../view_models/auth_view_model.dart';
import '../../view_models/message_view_model.dart';
import '../../views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AuthViewModel()),
        ChangeNotifierProvider(create: (ctx) => MessageViewModel()),
      ],
      child: Consumer<AuthViewModel>(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: value.isDarkMode ? darkTheme : lightTheme,
            debugShowCheckedModeBanner: false,
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
