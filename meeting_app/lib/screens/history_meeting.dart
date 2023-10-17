import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom/resources/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream:FireStoreMethods().meetingHistory, builder:(context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting)
      {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
        itemCount: (snapshot.data! as dynamic).docs.length,
        itemBuilder:(context, index) => ListTile(
        
        title: Text("Room name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}",style: TextStyle(
          fontSize: 20
        ),),
       subtitle: Text(
              'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
            ),
      ),);
    },);
  }
}