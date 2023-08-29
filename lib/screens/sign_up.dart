import 'package:fast_inspection/constants/fonts.dart';
import 'package:fast_inspection/utils/my_utills.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/colors.dart';
import 'home_screen.dart';

class SignUpScreen extends HookWidget {
   SignUpScreen({Key? key}) : super(key: key);
 GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final obscure = useState(true);
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phonenumberController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confrimPasswordController = useTextEditingController();
   
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColors.primaryColor, width: 0.3)),
                    child: Form(
                      key: registerFormKey,
                      child: Column(
                        children: [
                          Image.asset('assets/images/logo.png'),
                          const Gap(20),
                          const Text(
                            'Registration',
                            style: TextStyle(
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          25.height,
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: nameController,
                            //controller: _firstName,
                            //textInputAction: TextInputType.emailAddress,
                            cursorWidth: 0.5,
                            cursorColor:
                                AppColors.primaryColor.withOpacity(0.1),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Name field cannot be empty';
                              }
                              return null;
                            },

                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primaryColor, width: 0.5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primaryColor, width: 0.5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              prefixIcon: const Icon(
                                Icons.person_outline_rounded,
                                color: Colors.grey,
                              ),
                              hintStyle: const TextStyle(
                                  fontFamily: AppFonts.nunitoSansRegular,
                                  fontSize: 14,
                                  color: Color(0xff4E4E4E)),
                              hintText: 'Kristin Watson',
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                            ),
                          ),
                          10.height,
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.name,
                            //controller: _firstName,
                            //textInputAction: TextInputType.emailAddress,
                            cursorWidth: 0.5,
                            cursorColor:
                                AppColors.primaryColor.withOpacity(0.1),
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
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1),
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
                          10.height,
                          TextFormField(
                            controller: phonenumberController,
                            keyboardType: TextInputType.name,
                            //controller: _firstName,
                            //textInputAction: TextInputType.emailAddress,
                            cursorWidth: 0.5,
                            cursorColor:
                                AppColors.primaryColor.withOpacity(0.1),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Phone field cannot be empty';
                              }
                              return null;
                            },

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
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              prefixIcon: const Icon(
                                Icons.phone_outlined,
                                color: Colors.grey,
                              ),
                              hintStyle: const TextStyle(
                                  fontFamily: AppFonts.nunitoSansRegular,
                                  fontSize: 14,
                                  color: Color(0xff4E4E4E)),
                              hintText: 'Phone number',
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                            ),
                          ),
                          10.height,
                          TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.name,
                            obscureText: obscure.value,
                            //controller: _firstName,
                            //textInputAction: TextInputType.emailAddress,
                            cursorWidth: 0.5,
                            cursorColor:
                                AppColors.primaryColor.withOpacity(0.1),
                            validator: (value) => value != null &&
                                    value.length < 6
                                ? 'Password must contain atleast 6 characters'
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
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.grey,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  obscure.value = !obscure.value;
                                },
                                child: Icon(
                                  obscure.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                              hintStyle: const TextStyle(
                                  fontFamily: AppFonts.nunitoSansRegular,
                                  fontSize: 14,
                                  color: Color(0xff4E4E4E)),
                              hintText: 'Password',
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                            ),
                          ),
                          10.height,
                          TextFormField(
                            controller: confrimPasswordController,
                            keyboardType: TextInputType.name,
                            obscureText: obscure.value,
                            //controller: _firstName,
                            //textInputAction: TextInputType.emailAddress,
                            cursorWidth: 0.5,
                            cursorColor:
                                AppColors.primaryColor.withOpacity(0.1),
                            validator: (value) => value != null &&
                                    confrimPasswordController.text.trim() !=
                                        passwordController.text.trim()
                                ? confrimPasswordController.text.trim() !=
                                        passwordController.text.trim()
                                    ? 'Confirm password most be equal to password'
                                    : 'Password must contain atleast 6 characters'
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
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.grey,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  obscure.value = !obscure.value;
                                },
                                child: Icon(
                                  obscure.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                              hintStyle: const TextStyle(
                                  fontFamily: AppFonts.nunitoSansRegular,
                                  fontSize: 14,
                                  color: Color(0xff4E4E4E)),
                              hintText: 'Confirm password',
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                            ),
                          ),
                          const Gap(25),
                          GestureDetector(
                            onTap: () async {
                              if (isLoading.value) {
                                return;
                              }
                              final isValidForm =
                                  registerFormKey.currentState?.validate() ??
                                      false;
                              if (!isValidForm) return;

                              registerFormKey.currentState!.save();
                              isLoading.value = true;

                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                                isLoading.value = false;
                                if (credential.user != null) {
                                  showSuccessMessage(context,
                                      message: 'Login successfull');

                                  await Future.delayed(
                                      const Duration(seconds: 1));

                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                      (route) => false);
                                } else {
                                  showErrorMessage(context,
                                      message: "An error occured");
                                }
                              } on FirebaseAuthException catch (e) {
                                isLoading.value = false;
                               /*  if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                  showErrorMessage(context,
                                      message:
                                          "The password provided is too weak.");
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                  showErrorMessage(context,
                                      message:
                                          "The account already exists for that email.");
                                } */
                                showErrorMessage(context, message: e.code);
                              } catch (e) {
                                showErrorMessage(context,
                                    message: e.toString());

                                print(e);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.primaryColor),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
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
                                          'Register',
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
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
