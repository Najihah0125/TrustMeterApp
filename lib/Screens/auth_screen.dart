import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trustmeter/Screens/login_screen.dart';
import 'package:trustmeter/Screens/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(
          onClickedRegister: toggle,
        )
      : RegisterScreen(onClickedLogIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
