import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/auth_view_model.dart';
import '../utils/custom_styles.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: CustomStyles.appBarTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await auth.signInWithGoogle();
              },
              child: Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
