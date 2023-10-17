import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/screens/home_screen.dart';
import 'package:zoom/screens/login_screen.dart';
import 'package:zoom/screens/video_call_screen.dart';
import 'package:zoom/utils/colors.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
       //JitsiMeetWrapper.init();
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      routes: {
        '/login':(context) => const LoginScreen(),
        '/home':(context) => const HomeScreen(),
        '/video-call':(context) => const VideoCallScreen()
      },
        // home: VideoCallScreen(),
         home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return const Center(
           child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData)
          {
            print(snapshot.data.toString());
            return const HomeScreen();
          }
          return LoginScreen();
        },
     
      )
    );
  }
}




