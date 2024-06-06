import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/storage/getit.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Edit the Directory Programmatically Here
const directory = "Android/media/matrix/.neo";

class SpashView extends StatefulWidget {
  const SpashView({super.key});

  @override
  _SpashViewState createState() => _SpashViewState();
}

class _SpashViewState extends State<SpashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationTopToCenter;
  late Animation<Offset> _animationRightToCenter;
  late Animation<Offset> _animationLefttToCenter;
  late Animation<Offset> _animationBottom;
  late Animation<double> _animationFadeOut;
  late Animation<Offset> _animationFifthImage;
  late Animation<Offset> _animationFifthImageee;
  late Animation<double> _animationScale;
  late Animation<double> _animationScaleBottom;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8), // مدة الحركة الكلية
      vsync: this,
    );

    _animationTopToCenter = Tween<Offset>(
      begin: const Offset(0.0, -5.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(
            0.0, 0.08, // الحركة الأولى تحدث في الربع الأول من المدة
            curve: Curves.easeInOut,
          )),
    );

    _animationRightToCenter = Tween<Offset>(
      begin: const Offset(12.0, 0.0),
      end: const Offset(0.7, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.08, 0.16, // الحركة الثانية تحدث في الربع الثاني من المدة
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationLefttToCenter = Tween<Offset>(
      begin: const Offset(-12.0, 0.0),
      end: const Offset(-0.6, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.16, 0.24, // الحركة الثالثة تحدث في الربع الثالث من المدة
        curve: Curves.easeInOut,
      ),
    ));

    _animationBottom = Tween<Offset>(
      begin: const Offset(0.0, 12.0),
      end: const Offset(0.0, 2.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.24, 0.24, // الحركة الرابعة تحدث في الربع الأخير من المدة
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationScaleBottom = Tween<double>(
      begin: 0.005, // الحجم الأولي للصورة الاخيره (تصغيرها)
      end: 2.0, // الحجم النهائي للصورة (تكبيرها)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.24, 0.34, // تحدد الفترة التي تحدث فيها الحركة
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationFadeOut = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.32, 0.40, // بدء الإخفاء بعد الحركة الرابعة
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationFifthImage = Tween<Offset>(
      begin: const Offset(0.0, -9.0),
      end: const Offset(0.3, -1.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.42, 0.42, // عرض الصورة الخامسة بعد الإخفاء
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationFifthImageee = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 0.5),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.60, 0.60, // عرض الصورة السادسه
          curve: Curves.easeInOut,
        ),
      ),
    );

    _sizeAnimation = Tween<double>(begin: 30.0, end: 90.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.42, 0.54, // تحدد الفترة التي تحدث فيها الحركة
          curve: Curves.easeIn,
        ),
      ),
    );

    _animationScale = Tween<double>(
      begin: 0.005, // الحجم الأولي للصورة الاخيره (تصغيرها)
      end: 2.0, // الحجم النهائي للصورة (تكبيرها)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.60, 0.70, // تحدد الفترة التي تحدث فيها الحركة
          curve: Curves.easeInOut,
        ),
      ),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkAllAnimationsCompleted();
      }
    });
    _animationTopToCenter.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkAllAnimationsCompleted();
      }
    });
    _animationRightToCenter.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkAllAnimationsCompleted();
      }
    });
    _animationLefttToCenter.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkAllAnimationsCompleted();
      }
    });
    _animationBottom.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkAllAnimationsCompleted();
      }
    });
    _animationFadeOut.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkAllAnimationsCompleted();
      }
    });
    _animationFifthImage.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkAllAnimationsCompleted();
      }
    });
    _animationFifthImageee.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkAllAnimationsCompleted();
      }
    });
    _animationScale.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkAllAnimationsCompleted();
      }
    });
    _animationScaleBottom.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkAllAnimationsCompleted();
      }
    });
    _sizeAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkAllAnimationsCompleted();
      }
    });

    _controller.forward();
    Future.delayed(const Duration(seconds: 6), () {
      _controller.forward(); // لبدء الحركة بعد التأخير
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: AnimatedBuilder(
              animation: _sizeAnimation,
              builder: (context, child) {
                return SizedBox(
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  child: child,
                );
              },
              child: SlideTransition(
                  position: _animationTopToCenter,
                  child: SvgPicture.asset('asstes/images/shape1.svg')),
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _animationFadeOut,
              child: SlideTransition(
                position: _animationRightToCenter,
                child: Image.asset('asstes\images\p1.svg'),
              ),
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _animationFadeOut,
              child: SlideTransition(
                position: _animationLefttToCenter,
                child: Image.asset('asstes\images\p2.svg'),
              ),
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _animationScaleBottom,
              child: FadeTransition(
                opacity: _animationFadeOut,
                child: SlideTransition(
                  position: _animationBottom,
                  child: SvgPicture.asset('asstes\images\p3.svg'),
                ),
              ),
            ),
          ),
          Center(
            child: SlideTransition(
              position: _animationFifthImage,
              child: SvgPicture.asset(
                'asstes/images/shape2.svg',
                height: 64,
                width: 64,
              ),
              // SvgPicture.asset(
              //     height: 64, width: 64, 'asstes/image/م shape.svg'),
            ),
          ),
          FadeTransition(
            opacity: _animationScale,
            child: SlideTransition(
              position: _animationFifthImageee,
              child:
                  Image.asset(width: 200, height: 200, 'asstes/images/p3.png'),
            ),
          ),
        ],
      ),
    );
  }

  bool allAnimationsCompleted = false;

  void checkAllAnimationsCompleted() {
    if (_animationTopToCenter.status == AnimationStatus.completed &&
        _animationRightToCenter.status == AnimationStatus.completed &&
        _animationLefttToCenter.status == AnimationStatus.completed &&
        _animationBottom.status == AnimationStatus.completed &&
        _animationFadeOut.status == AnimationStatus.completed &&
        _animationFifthImage.status == AnimationStatus.completed &&
        _animationFifthImageee.status == AnimationStatus.completed &&
        _animationScale.status == AnimationStatus.completed &&
        _animationScaleBottom.status == AnimationStatus.completed &&
        _sizeAnimation.status == AnimationStatus.completed &&
        !allAnimationsCompleted) {
      allAnimationsCompleted = true;
      storage.get<SharedPreferences>().getString('refresh_token') != null ||
              storage.get<SharedPreferences>().getString('refresh_token') == ''
          ? AppRouter.routter.go(AppRouter.kHomeViewStock)
          : AppRouter.routter.go(AppRouter.kLoginView);
    }
  }
}
