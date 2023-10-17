//import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/resources/firestore_methods.dart';

class JitsiMeetMethod {
  
  final AuthMethods _authMethods = AuthMethods();
  final FireStoreMethods _fireStoreMethods=FireStoreMethods();
   createMeeting(
      {required String roomName,
      required isAudioMuted,
      required bool isVideoMuted,
      String userName=''
      }) async {
        try{
     
  String name;
  if(userName.isEmpty)
  {
  name= _authMethods.user.displayName!;
  }
  else
  name=userName;
    var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,
        userDisplayName: name,
        userEmail: _authMethods.user.email,
        userAvatarUrl: _authMethods.user.photoURL,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
       
         
        );
    _fireStoreMethods.addToMeetingHistory(roomName); 
    
    await JitsiMeetWrapper.joinMeeting(
  options: options,
  listener: JitsiMeetingListener(
    onConferenceWillJoin: (url) => print("onConferenceWillJoin: url: $url"),
    onConferenceJoined: (url) => print("onConferenceJoined: url: $url"),
    onConferenceTerminated: (url, error) => print("onConferenceTerminated: url: $url, error: $error"),
  ),
);
        }catch(e){
          print(e);
        }
  }
}
