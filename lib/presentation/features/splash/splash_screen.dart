
import 'package:app_sales29112021/common/app_constant.dart';
import 'package:app_sales29112021/data/datasources/local/share_pref.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blueGrey,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset(
                  'assets/animations/cook.json',
                  animate: true,
                  repeat: true,
                  onLoaded: (complete){
                    Future.delayed(Duration(seconds: 2),() async{
                      String token = await SharePre.instance.get(AppConstant.token);
                      if(token.isNotEmpty){
                        Navigator.pushReplacementNamed(context, "/home");
                      }else{
                        Navigator.pushReplacementNamed(context, "/sign-in");
                      }
                    });
                  }
              ),
              Text("Welcome",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white))
            ],
          )),
    );
  }
}
