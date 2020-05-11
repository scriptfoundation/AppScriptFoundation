import 'dart:math';

import 'package:ScriptFoundation/universal/tools.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Events',
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.black,
              size: 20.0,
            ),
            onPressed: () {
              Share.share(
                  'Download Script Foundation App Now. https://github.com/ShivamGoyal1899/AppScriptFoundation',
                  subject: 'Script Foundation App');
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('events')
            .orderBy("id", descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return ListView(
                children:
                snapshot.data.documents.map((DocumentSnapshot document) {
                  return Card(
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ConstrainedBox(
                                constraints: BoxConstraints.expand(
                                  height:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.15,
                                  width:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.3,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: document['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.4,
                                          child: Text(
                                            document['title'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.2,
                                          height: 5,
                                          color: Tools
                                              .multiColors[Random().nextInt(4)],
                                        ),
                                        SizedBox(height: 10),
                                        SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.4,
                                          child: Text(
                                            document['desc'],
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.signInAlt,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        launch(document['url']);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.45,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.date_range,
                                      size: 15.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.4,
                                      child: Text(
                                        document['date'],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.45,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      Icons.access_time,
                                      size: 15.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.4,
                                      child: Text(
                                        document['time'],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.45,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.record_voice_over,
                                      size: 15.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.4,
                                      child: Text(
                                        document['speaker'],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.45,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.settings,
                                      size: 15.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.4,
                                      child: Text(
                                        document['organizer'],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.45,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.timelapse,
                                      size: 15.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.4,
                                      child: Text(
                                        document['duration'],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.45,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      size: 15.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.4,
                                      child: Text(
                                        document['location'],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
