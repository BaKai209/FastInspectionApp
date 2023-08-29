import 'package:fast_inspection/constants/fonts.dart';
import 'package:fast_inspection/screens/sign_in.dart';
import 'package:fast_inspection/utils/my_utills.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/colors.dart';

class ForgotPassWordScreen extends HookWidget {
   ForgotPassWordScreen({super.key});
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    final emailController = useTextEditingController();

  

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: AppColors.primaryColor, width: 0.3)),
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo.png'),
                      const Gap(20),
                      const Text(
                        'Welcome',
                        style: TextStyle(
                            fontFamily: AppFonts.nunitoSansRegular,
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const Gap(25),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.name,
                        //controller: _firstName,
                        //textInputAction: TextInputType.emailAddress,
                        cursorWidth: 0.5,
                        cursorColor: AppColors.primaryColor.withOpacity(0.1),
                        validator: (value) =>
                            value != null && !value.contains('@')
                                ? 'Should be a valid email'
                                : null,

                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: AppFonts.nunitoSansRegular,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.primaryColor, width: 0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.primaryColor, width: 0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                          hintStyle: const TextStyle(
                              fontFamily: AppFonts.nunitoSansRegular,
                              fontSize: 14,
                              color: Color(0xff4E4E4E)),
                          hintText: 'Email',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                        ),
                      ),
                      const Gap(20),
                      GestureDetector(
                        onTap: () async {
                          if (isLoading.value) {
                            return;
                          }
                          final isValidForm =
                              loginFormKey.currentState?.validate() ?? false;
                          if (!isValidForm) return;

                          loginFormKey.currentState!.save();
                          isLoading.value = true;

                          try {
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(
                                    email: emailController.text)
                                .then((value) async {
                              showSuccessMessage(context,
                                  message:
                                      'Reset email has been sent to your Email');

                              await Future.delayed(const Duration(seconds: 1));
                              isLoading.value = false;
                              context.pop();
                            });
                          } on FirebaseAuthException catch (e) {
                            isLoading.value = false;
                            showErrorMessage(context, message: e.code);
                            /* if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                              showErrorMessage(context,
                                  message: 'No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                              showErrorMessage(context,
                                  message:
                                      'Wrong password provided for that user.');
                            } */
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.primaryColor),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Center(
                              child: isLoading.value
                                  ? const SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      'SIGN IN',
                                      style: TextStyle(
                                          fontFamily:
                                              AppFonts.nunitoSansRegular,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "have an account? ",
                            style: TextStyle(
                                fontFamily: AppFonts.nunitoSansRegular,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>  SignInScreen()));
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontFamily: AppFonts.nunitoSansRegular,
                                  fontSize: 15,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
