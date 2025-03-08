import 'package:flutter/material.dart';
import 'package:app/features/auth/presentation/pages/register_page.dart';
import 'package:app/features/user/presentation/pages/user_dashboard.dart';
import 'package:app/core/widgets/custom_text_field.dart';
import 'package:app/core/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      // TODO: Implement login logic
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UserDashboard()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'NoteBack',
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  CustomTextField(
                    controller: _emailController,
                    label: 'ایمیل',
                    hint: 'ایمیل خود را وارد کنید',
                    keyboardType: TextInputType.emailAddress,
                    // prefixIcon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا ایمیل خود را وارد کنید';
                      }
                      if (!value.contains('@')) {
                        return 'لطفا یک ایمیل معتبر وارد کنید';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _passwordController,
                    label: 'رمز عبور',
                    hint: 'رمز عبور خود را وارد کنید',
                    obscureText: true,
                    // prefixIcon: Icons.lock,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا رمز عبور خود را وارد کنید';
                      }
                      if (value.length < 6) {
                        return 'رمز عبور باید حداقل 6 کاراکتر باشد';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    onPressed: _handleLogin,
                    isLoading: _isLoading,
                    text: 'ورود',
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text('حساب کاربری ندارید؟ ثبت نام کنید'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
