import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/Components/Splash_content.dart';
import 'package:tic_tac_toe/Ui/Player_creating_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150.h,
                        ),
                        Container(
                          width: 200.w,
                          height: 200.h,
                          child: Center(
                            child: Image.asset(
                              contents[i].image,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80.h,
                        ),
                        SizedBox(
                          width: 342.w,
                          child: Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.20.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        SizedBox(
                          width: 342.w,
                          child: Text(
                            contents[i].discription,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.65.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(40.w),
                width: 342.w,
                height: 58.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFF0A84FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xFF0A84FF))),
                  child: Text(
                    currentIndex == contents.length - 1 ? "CONTINUE" : "NEXT",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    if (currentIndex == contents.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PlayerCreatingScreen(),
                        ),
                      );
                    }
                    _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.h,
      width: currentIndex == index ? 25.w : 10.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Color(0xFF0A84FF),
      ),
    );
  }
}
