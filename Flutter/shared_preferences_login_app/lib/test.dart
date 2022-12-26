import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_app/login.dart';

import 'second_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  late TextEditingController userIdController;
  late TextEditingController passwordController;
  late AppLifecycleState _lastLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    userIdController = TextEditingController();
    passwordController = TextEditingController();
    _initSharedPreferences(); // SharedPreferences 초기화
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        print('detached');
        break;
      case AppLifecycleState.resumed:
        print('resumed');
        break;
      case AppLifecycleState.inactive:
        _disposeSharedPreferences();
        print('inactive');
        break;
      case AppLifecycleState.paused:
        print('paused');
        break;
    }
    _lastLifecycleState = state;
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      logo: const AssetImage('images/login.png'),
      title: 'LogIn',
      savedEmail: userIdController.text,
      savedPassword: passwordController.text,
      onLogin: (_) => Future(() => null),
      onSignup: (_) => Future(() => null),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            print(userIdController.text);
            print(passwordController.text);
            return const SecondPage();
          },
        ));
      },
      onRecoverPassword: (_) => Future(() => null),
      messages: LoginMessages(userHint: 'ID'),
    );
  }

  // ---Functions ---
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userIdController.text = (prefs.getString('p_userId') ?? "");
      passwordController.text = (prefs.getString('p_password') ?? "");
    });

    print(userIdController.text);
    print(passwordController.text);
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('환영 합니다.'),
          content: const Text('신분이 확인 되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _saveSharedPreferences();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SecondPage();
                    },
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  _saveSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('p_userId', userIdController.text);
    pref.setString('p_password', passwordController.text);
  }

  _disposeSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('p_userId');
    pref.remove('p_password');
  }
}
