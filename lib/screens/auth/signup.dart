import 'package:flutter/material.dart';
import 'package:groceries/components/password_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              'Hello Again!',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Welcome Back You've Been Missed",
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),

            _buildTextField(label: "Email address", hintText: "Enter text"),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            ),

            PasswordField(),

            const SizedBox(height: 25),

            // Sign In Button
            _buildButton("Sign In", backgroundColor: Color(0xFF2FAA7A),
                textColor: Colors.white),

            const SizedBox(height: 15),

            Text(
              'Recovery Password',
              style: TextStyle(color: Color(0xFF2FAA7A), fontSize: 15),
            ),

            const SizedBox(height: 30),

            _buildSocialButton("Sign in With Apple", Icons.apple),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE7F6EF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      height: 24,  // Adjust as necessary
                      width: 24,   // Adjust as necessary
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Sign in With Google',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,  // Center the text inside the Text widget
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),


            const Spacer(),

            Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(fontSize: 14, color: Colors.black),
                children: [
                  TextSpan(
                    text: "Sign up for free",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

// Helper Widgets

    Widget _buildTextField({required String label, String? hintText, bool isPassword = false}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 7),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.green, width: 2),
              ),
              suffixIcon: isPassword ? Icon(Icons.visibility_off) : null,
            ),
          ),
        ],
      );
    }

    Widget _buildButton(String text, {required Color backgroundColor, required Color textColor}) {
      return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 16),
          ),
        ),
      );
    }

    Widget _buildSocialButton(String text, IconData icon) {
      return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFE7F6EF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.black),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }
}
