class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Welcome',
      image: 'assets/images/idea.png',
      discription:
          "Most fun game now available on your smartphone device!."),
  UnbordingContent(
      title: 'Compete',
      image: 'assets/images/Spl2.png',
      discription:
          "Play online with your friends and top the leaderboard!."),
  UnbordingContent(
      title: 'Scoreboard',
      image: 'assets/images/Spl3.png',
      discription:
          "Earn points for each game and make your way to top the scoreboard!."),
 
];