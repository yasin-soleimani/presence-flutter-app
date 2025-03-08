import 'package:flutter/material.dart';
import 'package:app/core/widgets/custom_text_field.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/user/presentation/pages/user_dashboard.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      // TODO: Implement registration logic
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
      appBar: AppBar(title: const Text('ثبت نام')),
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
                    'ایجاد حساب کاربری',
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  CustomTextField(
                    controller: _fullNameController,
                    label: 'نام و نام خانوادگی',
                    hint: 'نام و نام خانوادگی خود را وارد کنید',
                    // prefixIcon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا نام و نام خانوادگی خود را وارد کنید';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _confirmPasswordController,
                    label: 'تکرار رمز عبور',
                    hint: 'رمز عبور خود را مجددا وارد کنید',
                    obscureText: true,
                    // prefixIcon: Icons.lock_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا تکرار رمز عبور را وارد کنید';
                      }
                      if (value != _passwordController.text) {
                        return 'رمز عبور و تکرار آن یکسان نیستند';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    onPressed: _handleRegister,
                    isLoading: _isLoading,
                    text: 'ثبت نام',
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('قبلا ثبت نام کرده‌اید؟ وارد شوید'),
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
