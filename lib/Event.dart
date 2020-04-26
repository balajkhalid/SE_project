// import 'dart:html';

import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Event{ 
//   final String EventId; //unique identifier
  
//   Event({this.EventId});
// }

class Event{
  final String coverimage;
  final String eventID;
  // final LatLng location;
  final DateTime enddate;
  final String logo;
  final String invitecode;
  final LatLng location1;
  final String name;
  final DateTime startdate;
  final String uid;


  Event({this.uid, this.eventID, this.invitecode, this.location1, this.startdate, this.enddate, this.name,this.logo,this.coverimage});

  // EventData.fromData(Map<String, dynamic> data)
  //   : uid = data['uid'],
  //     EventId = data['EventId'],
  //     InviteCode = data['InviteCode'],
  //     Location = data['Location'],
  //     StartDate = data['StartDate'],
  //     EndDate = data['EndDate'],
  //     Name = data['Name'];

  // Map<String, dynamic> toJSON(){
  //   return{
  //     'uid' : uid, 
  //     'EventId' : EventId,
  //     'InviteCode' : InviteCode,
  //     'Location' : Location,
  //     'StartDate' : StartDate,
  //     'EndDate' : EndDate,
  //     'Name' : Name,
  //   };
  // }
}