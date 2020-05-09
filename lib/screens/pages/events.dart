import 'dart:math';

import 'package:ScriptFoundation/universal/tools.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsData {
  List<Event> events;

  EventsData({this.events});

  EventsData.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = new List<Event>();
      json['events'].forEach((v) {
        events.add(Event.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Event {
  String title;
  String desc;
  String image;
  String url;
  String date;
  String time;
  String duration;
  String speaker;
  String organizer;
  String location;

  Event({
    this.title,
    this.desc,
    this.image,
    this.url,
    this.date,
    this.time,
    this.duration,
    this.speaker,
    this.organizer,
    this.location,
  });

  Event.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    image = json['image'];
    url = json['url'];
    date = json['date'];
    time = json['time'];
    duration = json['duration'];
    speaker = json['speaker'];
    organizer = json['organizer'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['url'] = this.url;
    data['date'] = this.date;
    data['time'] = this.time;
    data['duration'] = this.duration;
    data['speaker'] = this.speaker;
    data['organizer'] = this.organizer;
    data['location'] = this.location;
    return data;
  }
}

List<Event> events = [
  Event(
    title: "CodeNBuild",
    desc:
        "Code-N-Build aims to bring a widely known hackathon culture with our own added fun elements. The event spans over a duration of 30 hours brimming with coding, developing and not to miss fun activities.",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
    date: '17 May 2020',
    time: '06:00 PM',
    duration: '2 hours',
    speaker: 'Miri Rodrigues',
    organizer: 'Saksham Taneja',
    location: 'JECRC University',
  ),
  Event(
    title: "CodeNBuild",
    desc:
        "Code-N-Build aims to bring a widely known hackathon culture with our own added fun elements. The event spans over a duration of 30 hours brimming with coding, developing and not to miss fun activities.",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
    date: '17 May 2020',
    time: '06:00 PM',
    duration: '2 hours',
    speaker: 'Miri Rodrigues',
    organizer: 'Saksham Taneja',
    location: 'JECRC University',
  ),
  Event(
    title: "CodeNBuild",
    desc:
        "Code-N-Build aims to bring a widely known hackathon culture with our own added fun elements. The event spans over a duration of 30 hours brimming with coding, developing and not to miss fun activities.",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
    date: '17 May 2020',
    time: '06:00 PM',
    duration: '2 hours',
    speaker: 'Miri Rodrigues',
    organizer: 'Saksham Taneja',
    location: 'JECRC University',
  ),
  Event(
    title: "CodeNBuild",
    desc:
        "Code-N-Build aims to bring a widely known hackathon culture with our own added fun elements. The event spans over a duration of 30 hours brimming with coding, developing and not to miss fun activities.",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
    date: '17 May 2020',
    time: '06:00 PM',
    duration: '2 hours',
    speaker: 'Miri Rodrigues',
    organizer: 'Saksham Taneja',
    location: 'JECRC University',
  ),
  Event(
    title: "CodeNBuild",
    desc:
        "Code-N-Build aims to bring a widely known hackathon culture with our own added fun elements. The event spans over a duration of 30 hours brimming with coding, developing and not to miss fun activities.",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
    date: '17 May 2020',
    time: '06:00 PM',
    duration: '2 hours',
    speaker: 'Miri Rodrigues',
    organizer: 'Saksham Taneja',
    location: 'JECRC University',
  ),
  Event(
    title: "CodeNBuild",
    desc:
        "Code-N-Build aims to bring a widely known hackathon culture with our own added fun elements. The event spans over a duration of 30 hours brimming with coding, developing and not to miss fun activities.",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
    date: '17 May 2020',
    time: '06:00 PM',
    duration: '2 hours',
    speaker: 'Miri Rodrigues',
    organizer: 'Saksham Taneja',
    location: 'JECRC University',
  ),
];

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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: events.length,
        itemBuilder: (c, i) {
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
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: events[i].image,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  events[i].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(height: 10),
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height: 5,
                                  color: Tools.multiColors[Random().nextInt(4)],
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    events[i].desc,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
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
                                launch(events[0].url);
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
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.date_range,
                              size: 15.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(events[i].date),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              size: 15.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(events[i].time),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.timelapse,
                              size: 15.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(events[i].duration),
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
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.record_voice_over,
                              size: 15.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(events[i].speaker),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.settings,
                              size: 15.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(events[i].organizer),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              size: 15.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(events[i].location),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
