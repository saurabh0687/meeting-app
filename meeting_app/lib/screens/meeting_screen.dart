import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom/resources/jitsi_meet_methods.dart';
import 'package:zoom/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});
  final JitsiMeetMethod _jitsiMeetMethod=JitsiMeetMethod();
   createNewMeeting() async{
     var random=Random();
     String name=(random.nextInt(10000000)+10000000).toString();
    _jitsiMeetMethod.createMeeting(roomName: name, isAudioMuted: true, isVideoMuted: true);
   }

   joinMeeting(BuildContext context){
    Navigator.pushNamed(context, '/video-call');
   }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
                onPressed: createNewMeeting,
                icon: Icons.video_call,
                text: "New Meeting"),
            HomeMeetingButton(
                onPressed:() => joinMeeting(context),
                icon: Icons.add_box_rounded,
                text: "Join Meeting"),
            HomeMeetingButton(
                onPressed: () {},
                icon: Icons.calendar_today,
                text: "Schedule"),
            HomeMeetingButton(
                onPressed: () {},
                icon: Icons.arrow_upward_rounded,
                text: "Share Screen"),
          ],
        ),
        const Expanded(child: Center(
          child: Text("Create/Join Meetings with just a click!",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
        ))
      ],
    );;
  }
}