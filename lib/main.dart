import 'package:flutter/material.dart';
import 'package:untitled1/screens/onboarding_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const Splash(),
    );
  }
}


class Splash extends StatefulWidget{
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash>{

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const App()));
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfff7a710),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logos.jpg' , height: 130,)
          ],
        ),
      ),
    );
  }
}




class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OnboardingScreen(),

    );
  }
}






