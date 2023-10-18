import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/pages/choose_language_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LanguagePage();
              },
            ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xff12D6CA),
                Color(0xff49EEAC),
              ],
            ),
          ),
          child: Center(
            child: Text(
              "as-salom",
              style: Styles.tooBoldtext60,
            ),
          ),
        ),
      ),
    );
  }
}
