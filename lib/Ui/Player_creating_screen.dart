import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/Ui/Game_screen.dart';

class PlayerCreatingScreen extends StatefulWidget {
  const PlayerCreatingScreen({super.key});

  @override
  State<PlayerCreatingScreen> createState() => _PlayerCreatingScreenState();
}

class _PlayerCreatingScreenState extends State<PlayerCreatingScreen> {
  final player1 = TextEditingController();
  final player2 = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 250.h,),
                  Text(
                    'Enter Players Name',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w600,
                        height: 0.10.h),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: player1,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF262626),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Color(0xFF262626))),
                         focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF262626)),
                          borderRadius: BorderRadius.circular(8.r)),
                        hintText: 'Player1 Name',
                        hintStyle: GoogleFonts.poppins(
                          color: Color(0xFF7C7C7C),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.10.h,
                        )),
                    validator: (Player1) {
                      if (Player1!.isEmpty) {
                        return 'Player1 Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(textInputAction: TextInputAction.done,
                    controller: player2,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF262626),
                      errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: Color(0xFF262626))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF262626)),
                          borderRadius: BorderRadius.circular(8.r)),
                      hintText: 'Player2 Name',
                      hintStyle: GoogleFonts.poppins(
                        color: Color(0xFF7C7C7C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 0.10.h,
                      ),
                    ),
                    validator: (Player2) {
                      if (Player2!.isEmpty) {
                        return 'Enter a Player2 Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => GameScreen(
                                    player1: player1.text,
                                    player2: player2.text)));
                      }
                    },
                    child: Container(
                      height: 60.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Color(0xFF0A84FF)),
                      child: Center(
                        child: Text(
                          'Start Game',
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              height: 0.10.h),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
