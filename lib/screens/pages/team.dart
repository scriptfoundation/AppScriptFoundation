import 'dart:math';

import 'package:ScriptFoundation/universal/tools.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Team',
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
            .collection('team')
            .orderBy("id", descending: false)
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints.expand(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.2,
                              width: MediaQuery
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          0.4,
                                      child: Text(
                                        document['name'],
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
                                        maxLines: 2,
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
                                    FontAwesomeIcons.linkedinIn,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    launch(document['linkedinUrl']);
                                  },
                                ),
                              ],
                            ),
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
