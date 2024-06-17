import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'view_models/auth_view_model.dart';
import 'view_models/home_view_model.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'utils/custom_colors.dart';
import 'services/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: CustomColors.accentPurple,
          scaffoldBackgroundColor: CustomColors.darkBackground,
          appBarTheme: AppBarTheme(
            color: CustomColors.darkBackground,
            textTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColors.textWhite,
              ),
            ),
          ),
        ),
        home: Consumer<AuthViewModel>(
          builder: (context, auth, child) {
            if (auth.isAuthenticated) {
              return HomeView();
            } else {
              return LoginView();
            }
          },
        ),
      ),
    );
  }
}
