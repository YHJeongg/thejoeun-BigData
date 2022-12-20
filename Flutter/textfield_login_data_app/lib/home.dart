import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:textfield_login_data_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('LogIn '),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  'images/login.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    labelText: '사용자 ID를 입력하세요.',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: '패스워드를 입력하세요.',
                  ),
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (userIdController.text.trim().isEmpty ||
                      passwordController.text.trim().isEmpty) {
                    errorSnackBar(context);
                  } else {
                    if (userIdController.text.trim() == 'root' &&
                        passwordController.text.trim() == 'qwer1234') {
                      _showDialog(context, userIdController.text,
                          passwordController.text);
                    } else {
                      checkSnackBar(context);
                    }
                  }
                },
                child: const Text('로그인'),
              ),
            ],
          ),
        ),
      ),
    );
  }

// --- Functions ---

  /// Desc : id와 password를 입력 안했을 경우, Date : 2022.12.20
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 ID와 암호를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  /// Desc : 로그인 성공시 SecondPage로 이동, Date : 2022.12.20
  _showDialog(BuildContext context, String userId, String password) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('환영 합니다!'),
          content: const Text('신분이 확인 되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondPage(id: userId, pw: password);
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

  /// Desc : Id와 Password 확인, Date : 2022.12.20
  checkSnackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 ID 또는 암호가 일치하지 않습니다'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
} // End
