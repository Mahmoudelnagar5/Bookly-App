import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> imageOpacityAnimation;
  late Animation<Offset> imageSlideAnimation;

  @override
  void initState() {
    super.initState();
    initAnimations();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlideTransition(
          position: imageSlideAnimation,
          child: FadeTransition(
            opacity: imageOpacityAnimation,
            child: Image.asset(AssetsData.logo),
          ),
        ),
        const SizedBox(height: 20),
        SlidingText(
          slidingAnimation: slidingAnimation,
          animationController: animationController,
        ),
      ],
    );
  }

  void initAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    imageOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    imageSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        GoRouter.of(context).push(AppRouter.homeView);
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

// import 'package:bookly_app/core/utils/app_router.dart';
// import 'package:bookly_app/core/utils/assets.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import 'sliding_text.dart';

// class SplashViewBody extends StatefulWidget {
//   const SplashViewBody({super.key});

//   @override
//   State<SplashViewBody> createState() => _SplashViewBodyState();
// }

// class _SplashViewBodyState extends State<SplashViewBody>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<Offset> slidingAnimation;

//   @override
//   void initState() {
//     super.initState();
//     initSlidingAnimation();
//     navigateToHome();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Image.asset(AssetsData.logo),
//         const SizedBox(height: 20),
//         SlidingText(
//           slidingAnimation: slidingAnimation,
//           animationController: animationController,
//         ),
//       ],
//     );
//   }

//   void initSlidingAnimation() {
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );

//     slidingAnimation = Tween<Offset>(
//       begin: const Offset(0, 3),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Curves.fastEaseInToSlowEaseOut,
//       ),
//     );
//     animationController.forward();
//   }

//   void navigateToHome() {
//     Future.delayed(
//       const Duration(seconds: 3),
//       () {
//         GoRouter.of(context).push(AppRouter.homeView);
//       },
//     );
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }
// }