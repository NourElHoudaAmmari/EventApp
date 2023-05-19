import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/constant.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/already_have_an_account_acheck.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
    bool isLoggedIn = false;
TextEditingController emailController = TextEditingController();
 TextEditingController passwordController =TextEditingController();
    bool _isNotValidate = false;
    int loginAttempts =0;
    bool isBlocked = false;
    Timer? timer;
     bool isLoginButtonDisabled = false;

     @override
void init() {
  super.initState;

  // Get the isLoggedIn value from shared preferences
  SharedPreferences.getInstance().then((prefs) {
    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });

    // If the user is already logged in, navigate to the home page
    if (isLoggedIn) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    }
  });
}
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    timer?.cancel();
    super.dispose(); 
  }
  void loginUser() {
    // Check if the user is blocked
    if (isBlocked) {
      Fluttertoast.showToast(
        msg: "You have been blocked. Please try again in 20 seconds.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    // Perform the login action
    setState(() {
      isLoginButtonDisabled = true; // Disable the login button
    });

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((value) async {
      isLoggedIn = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', isLoggedIn);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }).catchError((error) {
      Fluttertoast.showToast(
        msg: "The credentials are invalid.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      print("Error ${error.toString()}");

      // Increment the login attempts
      loginAttempts++;

      // Check if the maximum number of attempts is reached
      if (loginAttempts >= 3) {
        // Block the user for 20 seconds
        blockUser();
      }

      setState(() {
        isLoginButtonDisabled = false; // Enable the login button
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
         TextFormField(
           controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            
            decoration: InputDecoration(
              errorText: _isNotValidate ?"Please enter Email Address":null,
              hintText: "Email Address",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
            child: Icon(Icons.email_outlined,color:Color.fromARGB(255, 189, 188, 188),),
            
                
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
            controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                errorText: _isNotValidate ?"Please enter password":null,
                hintText: "Password",
                    
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
           child: Icon(Icons.lock_outline,color:Color.fromARGB(255, 189, 188, 188),),
                ),
              ),
            ),
          ),
          Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    onTap: (){
        
      },
                    child: const Text("Forget Password?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 77, 132, 243),
                          fontSize: 15,
                        )),
                  ),
                ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton (
              onPressed: isLoginButtonDisabled ? null : loginUser,
              // loginUser,      
              style:ButtonStyle(
backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              ),
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  
  void blockUser() {
     setState(() {
      isBlocked = true;
        isLoginButtonDisabled = true;
    });

    // Show the countdown message
    Fluttertoast.showToast(
      msg: "Too many failed login attempts. Please try again in 20 seconds.",
        toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );

    // Start the timer for unblocking the user after 20 seconds
    timer = Timer(Duration(seconds: 20), () {
      setState(() {
        isBlocked = false;
        loginAttempts = 0;
        isLoginButtonDisabled =false;
        timer = null;
      });
    });
  }
}
