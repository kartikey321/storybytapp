import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:storybytapp/helpers/dataHelpers/user_data.dart';
import 'package:storybytapp/mixins/screen_mixin.dart';
import 'package:storybytapp/models/user.dart';
import 'package:storybytapp/screens/home_screen.dart';
import 'package:storybytapp/utils/debouncer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

enum LoginState { google, email, phone, none }

class _LoginScreenState extends State<LoginScreen> with ScreenMixin {
  late LoginState loginState;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser;
  final Debouncer _debouncer = Debouncer(milliseconds: 300);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginState = LoginState.none;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png'),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    'storybyt',
                    style: TextStyle(
                        fontFamily: 'NordiquePro-Semibold',
                        fontSize: 18.3,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 42,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Thousands of audio ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 23,
                          color: Colors.white),
                      children: [
                    TextSpan(
                        text: 'stories.\nlots to hear.',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 23,
                            color: Color(0xFF3AB2AD)))
                  ])),
              if (loginState == LoginState.none) ...[
                SizedBox(
                  height: 42,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 7.5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 21, vertical: 11),
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            FontAwesome.mobile_phone,
                            size: 25,
                            color: Colors.black,
                          ),
                          Text(
                            'Continue with Phone Number',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black),
                          ),
                          SizedBox.shrink()
                        ],
                      )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 7.5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 21, vertical: 11),
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                width: 0.5, color: Color(0xFF464646))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              AssetImage('assets/mail.png'),
                              size: 25,
                              color: Colors.white,
                            ),
                            Text(
                              'Continue with Email',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                            SizedBox.shrink()
                          ],
                        )),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    loginState = LoginState.google;
                    try {
                      googleUser = await _googleSignIn.signIn();
                      if (googleUser != null) {
                        if (googleUser!.displayName != null) {
                          await UserData.addData(UserModel(
                              id: googleUser!.id,
                              name: googleUser!.displayName!,
                              stories: [],
                              favourites: [],
                              createdDate: DateTime.now(),
                              dp: googleUser!.photoUrl,
                              email: googleUser!.email));
                        }
                        setState(() {});
                      }
                    } catch (error) {
                      loginState = LoginState.none;
                      setState(() {});
                      print(error);
                    }
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 7.5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 21, vertical: 11),
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(width: 0.5, color: Color(0xFF464646))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/google.png',
                            height: 25,
                            width: 25,
                          ),
                          Text(
                            'Continue with Google',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.white),
                          ),
                          SizedBox.shrink()
                        ],
                      )),
                ),
              ],
              if (loginState == LoginState.google &&
                  googleUser?.displayName != null) ...[
                TextField(
                  controller: nameController,
                  onChanged: (val) {
                    _debouncer.run(() {
                      setState(() {});
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                        color: Color(0xFF959595),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                    suffix: nameController.text.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () =>
                                setState(() => nameController.text = ''),
                            icon: Icon(
                              Icons.close,
                              color: Color(0xFF959595),
                              size: 10,
                            )),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Color(0xFF464646)),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Color(0xFF464646)),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Color(0xFF464646)),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ContinueButton(
                    enabled: nameController.text.trim().length > 4,
                    text: 'Continue',
                    onTap: () {
                      UserData.addData(UserModel(id: googleUser.id  , name: name, stories: stories, favourites: favourites, createdDate: createdDate))
                    })
              ],
              if (loginState == LoginState.phone) ...[
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                        color: Color(0xFF959595),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                    suffix: nameController.text.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () =>
                                setState(() => nameController.text = ''),
                            icon: Icon(
                              Icons.close,
                              color: Color(0xFF959595),
                              size: 10,
                            )),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Color(0xFF464646)),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Color(0xFF464646)),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Color(0xFF464646)),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  final bool enabled;
  final String text;
  final VoidCallback onTap;
  const ContinueButton(
      {super.key,
      this.enabled = true,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!enabled) return;
        onTap.call();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: enabled ? Colors.white : Color(0xFF151515)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: enabled ? Colors.black : Color(0xFF545454)),
          ),
        ),
      ),
    );
  }
}
