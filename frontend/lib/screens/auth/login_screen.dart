import 'package:flutter/material.dart';
import 'package:storybytapp/mixins/screen_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ScreenMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: getSize().height * 0.63,
                child: Image.asset(
                  'assets/login.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        const Color(0xFF13161B).withOpacity(0.0),
                        Colors.black
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.63])),
            )),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Column(children: [
                Text('Mobile No.',textAlign: TextAlign.start,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
                TextField(
                  
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}
