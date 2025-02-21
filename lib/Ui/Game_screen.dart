import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  final String player1;
  final String player2;

  const GameScreen({super.key, required this.player1, required this.player2});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> board = List.generate(9, (index) => ""); // Game board
  bool isXTurn = true; // Track turn
  String winner = "";

  void _handleTap(int index) {
    if (board[index] != "" || winner.isNotEmpty) return; // Prevent overriding moves

    setState(() {
      board[index] = isXTurn ? "X" : "O";
      winner = _checkWinner();
      isXTurn = !isXTurn; // Switch turn only after checking winner
    });
     if (winner.isNotEmpty) {
      _showWinnerDialog();
    }
  }

  String _checkWinner() {
    // Winning combinations
    List<List<int>> winningPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6] // Diagonals
    ];

    for (var pattern in winningPatterns) {
      if (board[pattern[0]] != "" &&
          board[pattern[0]] == board[pattern[1]] &&
          board[pattern[0]] == board[pattern[2]]) {
        return board[pattern[0]]; // Return "X" or "O"
      }
    }

    if (!board.contains("")) return "Draw"; // Check for draw
  
    
    return ""; // No winner yet
    
  }

  void _resetGame() {
    setState(() {
      board = List.generate(9, (index) => "");
      isXTurn = true;
      winner = "";
    });

    
  }
   void _showWinnerDialog() {
    AwesomeDialog(
      context: context,
      dialogType: winner == "Draw" ? DialogType.info : DialogType.success,
      animType: AnimType.rightSlide,
      title: winner == "Draw"
          ? "It's a Draw!"
          : "${winner == "X" ? widget.player1 : widget.player2} Wins!",
          titleTextStyle: GoogleFonts.poppins(fontSize: 30.sp, fontWeight: FontWeight.w600, color: Colors.black),
      btnOkText: 'Play Again',
      btnOkOnPress: _resetGame,
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323D5B),
      
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (winner.isEmpty)
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Turn : ",
                    style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text( 
                   
                    "${isXTurn ? widget.player1 : widget.player2} (${isXTurn ? "X" : "O"})",
                    style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold, color:  Colors.white),
                  ),
                ],
              ),
           
            SizedBox(height: 20.h),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _handleTap(index),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF0E1E3A),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: 
                      GlowText( 
                        glowColor: board[index] == "X" ? Colors.cyanAccent:Colors.white,
                        board[index],
                        style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.bold, color:  board[index] == "X" ? Colors.cyanAccent : Colors.white,),)
                      
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 50.h),
            GestureDetector(
              onTap: () => _resetGame(),
              child: Container(
                      height: 60.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Color(0xFF0A84FF)),
                      child: Center(
                        child: Text(
                          'Reset Game',
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
    );
  }
}
