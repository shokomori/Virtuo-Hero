import 'package:flutter/material.dart';
import 'package:virtuohero/pages/subpages/coming_soon_page.dart';
import '../../app_styles.dart';
import 'main_page.dart';
import '../widgets/appname.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_emailFocus);
    });
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );

      Future.delayed(const Duration(milliseconds: 500), () {
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png', height: 200),
                    const SizedBox(height: 0),
                    AppName(),
                    const SizedBox(height: 20),
                    Text('LOGIN', style: AppTextStyles.bold),
                    const SizedBox(height: 20),

                    // Form Section
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Email Field
                          SizedBox(
                            width: 292,
                            child: TextFormField(
                              focusNode: _emailFocus,
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: 'Email/Username',
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF00D9E5),
                                    width: 2,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                return value!.isEmpty ? 'Please enter email' : null;
                              },
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Password Field
                          SizedBox(
                            width: 292,
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              style: const TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF00D9E5),
                                    width: 2,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                return value!.isEmpty ? 'Please enter password' : null;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Login Button
                          SizedBox(
                            width: 292,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: _handleLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2B2B2B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          SizedBox(
                            width: 292,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ComingSoonPage()),
                                  );
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: AppTextStyles.fpass,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          SizedBox(
                            width: 292,
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: AppTextStyles.fpass,
                                  children: [
                                    const TextSpan(
                                      text: "Don't have an account? ",
                                      style: TextStyle(color: Color(0xFF414040)),
                                    ),
                                    TextSpan(
                                      text: 'Sign up',
                                      style: const TextStyle(
                                        color: Color(0xFF00B2FF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const ComingSoonPage(), // Replace with SignUpPage if needed
                                            ),
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
