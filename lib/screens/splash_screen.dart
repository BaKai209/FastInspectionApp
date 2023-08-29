import 'package:fast_inspection/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/constant_values.dart';
import '../constants/tab_options.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  _move() {
    if (getStringAsync(k3TypeInspectionChoose, defaultValue: '1') == '2') {
      setValue(k3TypeInspectionChoose, '2');
      ref.read(tabProvider.notifier).state = [
        const TabOptions(id: 0, title: 'Page 1'),
        const TabOptions(id: 1, title: 'Page 2'),
        const TabOptions(id: 2, title: 'Page 3'),
        const TabOptions(id: 3, title: 'Page 4'),
        const TabOptions(id: 4, title: 'Page 5'),
        const TabOptions(id: 5, title: 'Page 6'),
        const TabOptions(id: 6, title: 'Page 7'),
        const TabOptions(id: 7, title: 'Page 8'),
        const TabOptions(id: 8, title: 'Page 9'),
        const TabOptions(id: 9, title: 'Page 10'),
        const TabOptions(id: 10, title: 'Page 11'),
        const TabOptions(id: 12, title: 'Page 13'),
      ];
    } else if (getStringAsync(k3TypeInspectionChoose, defaultValue: '1') ==
        '3') {
      setValue(k3TypeInspectionChoose, '3');
      ref.read(tabProvider.notifier).state = [
        const TabOptions(id: 0, title: 'Page 1'),
        const TabOptions(id: 1, title: 'Page 2'),
        const TabOptions(id: 2, title: 'Page 3'),
        const TabOptions(id: 3, title: 'Page 4'),
        const TabOptions(id: 4, title: 'Page 5'),
        const TabOptions(id: 5, title: 'Page 6'),
        const TabOptions(id: 6, title: 'Page 7'),
        const TabOptions(id: 7, title: 'Page 8'),
        const TabOptions(id: 8, title: 'Page 9'),
        //const TabOptions(id: 9, title: 'Page 10'),
        const TabOptions(id: 10, title: 'Page 11'),
        const TabOptions(id: 11, title: 'Page 12'),
        const TabOptions(id: 12, title: 'Page 13'),
      ];
    } else {
      setValue(k3TypeInspectionChoose, '1');

      ref.read(tabProvider.notifier).state = [
        const TabOptions(id: 0, title: 'Page 1'),
        const TabOptions(id: 1, title: 'Page 2'),
        const TabOptions(id: 2, title: 'Page 3'),
        const TabOptions(id: 3, title: 'Page 4'),
        const TabOptions(id: 4, title: 'Page 5'),
        const TabOptions(id: 5, title: 'Page 6'),
        const TabOptions(id: 6, title: 'Page 7'),
        const TabOptions(id: 7, title: 'Page 8'),
        const TabOptions(id: 8, title: 'Page 9'),
        //const TabOptions(id: 9, title: 'Page 10'),
        const TabOptions(id: 10, title: 'Page 11'),
        // const TabOptions(id: 11, title: 'Page 12'),
        const TabOptions(id: 12, title: 'Page 13'),
      ];
    }
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SignInScreen()),
        (route) => false);
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), _move);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.fill)),
      ),
    );
  }
}
