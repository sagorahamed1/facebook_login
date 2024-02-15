import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'firebase_options.dart';


///https://facebook-6bd93.firebaseapp.com/__/auth/handler
Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignInScreen()
    );
  }
}


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: TextButton(onPressed: ()async{

            try{
             await signInWithFacebook();
              // final UserCredential userCredential = await LogInWithFacebook();
              // if (context.mounted) {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => HomeScreen(
              //             // displayName: userCredential.user!.displayName!,
              //             // photoURL: userCredential.user!.photoURL ?? "",
              //             // email: userCredential.user!.email!,
              //           )));}
            }catch(e){
              print("----------------------------error$e");
            }

          }, child: Text("Facebook")),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

}

// Future<UserCredential> LogInWithFacebook ()async{
//   final LoginResult loginResult = await FacebookAuth.instance.login();
//   final OAuthCredential facebookAuthCredential =
//   FacebookAuthProvider.credential(loginResult.accessToken!.token);
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
//
// }




///------------------------home page for test somethink----------------->


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is Home Screen"),
      ),
    );
  }
}
