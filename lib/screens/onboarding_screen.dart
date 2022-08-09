import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget{
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}



class _OnboardingScreenState extends State<OnboardingScreen>{
 final _controller = PageController();
 int _currentPage = 0;
  List<Map<String, String>> splashData = [

    {
      "title":"Lets Get Started!! \n",
      "subtitle":"Hello ,welcome to Banc ABC mobile,the \ndigital revolution app.",
      "image":"assets/onboarding.png"
    },

    {
      "title":"Online Payments",
      "subtitle":"Make online payments via Zipit\nRTGS and Internal Transfer ",
      "image":"assets/card.png"
    },
    {
      "title":"Mwaya",
      "subtitle":"Send money to any mobile number \n no matter what network or mobile wallet",
      "image":"assets/vula.png"
    },
    {
      "title":"City Hopper",
      "subtitle":"Send foreign currency between cities throughout \n Zimbabwe,instantly and safely",
      "image":"assets/hoper.png"
    }

  ];


  AnimatedContainer _buildDots({int? index}){
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          color: const Color(0xfff111d47),
        ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:Column(
        children: <Widget>[
          Expanded(
        flex: 3,
        child: PageView.builder(
        itemCount: splashData.length,
        itemBuilder:(BuildContext context, int index) {
          return Column(children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset('assets/logs.png' , height: 100),
            ),
            Spacer(flex: 2),
            Padding(padding: const  EdgeInsets.only(bottom: 15.0),
              child: Text(
                splashData[index]['title'].toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xfff111d47),
                ),
              ),
            ),
            Text(
              splashData[index]['subtitle'].toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            Spacer(flex: 2,
            ),
            AspectRatio(aspectRatio: 16 / 9,
              child: Image.asset(
                splashData[index]['image'].toString(),
                fit: BoxFit.contain,),
            ),
            Spacer(),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SizedBox(),
            ),
          ],
          );
        },
          onPageChanged: (value)  => setState(() => _currentPage = value),
      ),
    ),
         Expanded(
             child: Column(
               children: <Widget>[
                 Padding(
                     padding: const EdgeInsets.only(top: 40.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: List.generate(
                     splashData.length,
                         (int index) => _buildDots(index: index),
                 ),
                 ),
                 ),

               ],
             )
         )
    ],
    ),
      ),
    );//Scaffold
  }
}
