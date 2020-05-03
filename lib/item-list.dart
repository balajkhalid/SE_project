import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item.dart';
import 'hostit.dart';
import 'userRedirection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rating_bar/rating_bar.dart' ;

class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {

    final items = Provider.of<List<Item>>(context);
    if (items == null){
      return LoadingScreen();
    }else{
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index){
          return Row(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20,right: 0.0, left: 20.0),
                        child: CircleAvatar(
                          radius: 60, 
                          backgroundImage: NetworkImage('${items[index].logo}'), 
                          backgroundColor: Colors.transparent, 
                        )
                        
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10,right: 0.0, left: 20.0),
                          child: Text('${items[index].name}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)))
                      
                    ],
                  ),
                ),

                 Container(
                  child: Column(
                    children: <Widget>[
                       Container(
                    child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(right: 0.0, left: 50.0),
                    child: Column(
                      children: <Widget>[
                        RatingBar.readOnly(
                          initialRating: double.parse('${items[index].aggregateRating}'),
                          isHalfAllowed: true,
                          halfFilledIcon: Icons.star_half,
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          filledColor: Colors.amber,
                          emptyColor: Colors.amber,
                          halfFilledColor: Colors.amber,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                )),

                 

                Padding(
                          padding: EdgeInsets.only(top: 10,right: 0.0, left: 40.0),
                          child: Text('${items[index].aggregateRating}/5.0',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)))
                      
                    ],
                  ),
                ),
               
              ],
            );
      });
    }
  }
}


class ListItemHostIt extends StatefulWidget {
  @override
  _ListItemStateHostIt createState() => _ListItemStateHostIt();
}

class _ListItemStateHostIt extends State<ListItemHostIt> {
  
  @override
  Widget build(BuildContext context) {

    final items = Provider.of<List<Item>>(context);
    if (items == null){
      return LoadingScreen();
    }
    else{
      return Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index){
            return Card(
              child:ListTile(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> EditItem(itemData: items[index],)),);
                },
                onLongPress: () async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Confirm"),

                        content: Text("Are you sure you want to delete this vendor?"),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () async {
                              await Firestore.instance.collection('item').document(items[index].itemId).delete();
                              Navigator.of(context).pop(false);
                            },
                            child: Text("Delete"),
                          ),
                          FlatButton(
                            onPressed: ()=>Navigator.of(context).pop(false),
                            child: Text("Cancel"),
                          )
                        ],
                      ); 
                    },
                  ); 
                },
                title: Text(items[index].name.trim()),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('${items[index].logo}'),
                ),
              )
            );
          }
        ),
      );
    }
  }
}