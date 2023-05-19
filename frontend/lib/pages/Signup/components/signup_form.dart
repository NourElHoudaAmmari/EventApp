import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/constant.dart';

import '../../../components/already_have_an_account_acheck.dart';

import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
    final FirebaseAuth auth = FirebaseAuth.instance;

     @override
  void dispose(){
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> addUserDetails(String name, String email, String phone, String password, String profilePick, String id, bool isBlocked) async {
  final time = DateTime.now().microsecondsSinceEpoch.toString();
  final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: email)
      .limit(1)
      .get();

  if (snapshot.docs.isNotEmpty) {
    Fluttertoast.showToast(
      msg: "un compte existe déjà pour cet e-mail",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
    throw Exception("Cet e-mail est déjà enregistré, veuillez en utiliser un autre.");
  } else {
    // enregistrer les détails de l'utilisateur
   // usersCollectionRef.doc(userUid).set({
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'profilePick': profilePick,
      'id':id,
      'isBlocked': isBlocked,
     
     
    });
  }
}
   String id = "";
    String name = "";
    String email = "";
    String phoneNumber="";
    String password = "";
    String profilePick="";
    bool isBlocked = false;
   
 TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController profilePickController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
   TextEditingController nameController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
   bool _isNotValidate = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [  TextFormField(
                validator: (value) {
                            if(value!.isEmpty){
                              return 'Please enter your Name';
                            }
                            setState(() {
                              name = value;
                            });
                          
                            return null;
                          },
            controller: nameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (name) {},
            
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
          errorText: _isNotValidate ?"Please enter your Name":null,
              hintText: "Name",
              // ignore: prefer_const_constructors
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person_outline,color:Color.fromARGB(255, 189, 188, 188),),
              ),
             
            ),
            
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
               validator: (value) {
                            if(value!.isEmpty){
                              return 'Please enter your email';
                            }
                            setState(() {
                              email = value;
                            });
                          
                            return null;
                          },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            onSaved: (email){},
              cursorColor: kPrimaryColor,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
               errorText: _isNotValidate ?"Please enter your email":null,
                hintText: "email Adress",
                // ignore: prefer_const_constructors
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
             child: Icon(Icons.email_outlined,color:Color.fromARGB(255, 189, 188, 188),),
                ),
              ),
            ),
          ),
               Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
               validator: (value) {
                            if(value!.isEmpty){
                              return 'Please enter your phone Number';
                            }
                              if (value.length > 8) {
      return 'The phone number cannot contain more than 8 digits';
    }
                            setState(() {
                             phoneNumber = value;

                            });
                          
                            return null;
                          },
              controller: phoneController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
           
              cursorColor: kPrimaryColor,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
               errorText: _isNotValidate ?"Please enter your phone Number":null,
                hintText: "phone Number",
                 
                // ignore: prefer_const_constructors
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
             child: Icon(Icons.numbers,color:Color.fromARGB(255, 189, 188, 188),),
                ),
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
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                   errorText: _isNotValidate ?"Please enter a password (at least 6 characters)":null,
                hintText: "Password",
                // ignore: prefer_const_constructors
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                child:const Icon(Icons.lock_outline,color:Color.fromARGB(255, 189, 188, 188),),
          ),
                ),
              ),
            ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text,
                 password: passwordController.text,
                 //name :nameController.text
                 ).then((value) {
                  Fluttertoast.showToast(
  msg: "Account created successfully",
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.TOP_RIGHT,
  backgroundColor: Colors.green,
  textColor: Colors.white,
);
                  print("Compte créer avec succes");
Navigator.push(context,
MaterialPageRoute(builder: (context)=>LoginScreen()));
                 }).onError((error, stackTrace) {
                Fluttertoast.showToast(
  msg: "invalid credentials",
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.TOP_RIGHT,
  backgroundColor: Colors.red,
  textColor: Colors.white,
);
                  print("Error ${error.toString()}");
                 });
                 addUserDetails(
                nameController.text.trim(),
                 emailController.text.trim(),
                phoneController.text.trim(),
                 passwordController.text.trim(),
                 profilePickController.text.trim(),
                 idController.text.trim(),
                 isBlocked,
                
                    );
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}