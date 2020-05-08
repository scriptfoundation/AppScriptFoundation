import 'dart:math';

import 'package:ScriptFoundation/universal/tools.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamsData {
  List<Team> teams;

  TeamsData({this.teams});

  TeamsData.fromJson(Map<String, dynamic> json) {
    if (json['teams'] != null) {
      teams = new List<Team>();
      json['teams'].forEach((v) {
        teams.add(Team.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teams != null) {
      data['teams'] = this.teams.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Team {
  String name;
  String desc;
  String job;
  String image;
  String speciality;
  String fbUrl;
  String twitterUrl;
  String linkedinUrl;
  String email;

  Team({
    this.name,
    this.desc,
    this.job,
    this.image,
    this.speciality,
    this.fbUrl,
    this.twitterUrl,
    this.linkedinUrl,
    this.email,
  });

  Team.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    job = json['job'];
    image = json['image'];
    speciality = json['speciality'];
    fbUrl = json['fb_url'];
    twitterUrl = json['twitter_url'];
    linkedinUrl = json['linkedin_url'];
    email = json['github_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['job'] = this.job;
    data['image'] = this.image;
    data['speciality'] = this.speciality;
    data['fb_url'] = this.fbUrl;
    data['twitter_url'] = this.twitterUrl;
    data['linkedin_url'] = this.linkedinUrl;
    data['github_url'] = this.email;
    return data;
  }
}

List<Team> teams = [
  Team(
    name: "Jai Sadana",
    desc: "Co-Founder & CEO",
    image: "https://script.itsshivam.com/assets/images/team/jaisadana.jpg",
  ),
  Team(
    name: "Nitesh Nagpal",
    desc: "Co-Founder & CTO",
    image: "https://script.itsshivam.com/assets/images/team/niteshnagpal.jpg",
  ),
  Team(
    name: "Shivam Goyal",
    desc: "Chapter Lead Punjab",
    image: "https://script.itsshivam.com/assets/images/team/shivamgoyal.jpg",
  ),
  Team(
    name: "Jagmohan Singh",
    desc: "Backend Developer & Mentor",
    image: "https://script.itsshivam.com/assets/images/team/jagmohansingh.jpg",
  ),
  Team(
    name: "Aryan Verma",
    desc: "Campus Expert - Galgotias University",
    image: "https://script.itsshivam.com/assets/images/team/aryanverma.jpg",
  ),
  Team(
    name: "Ayush Take",
    desc: "Region Head Indore",
    image: "https://script.itsshivam.com/assets/images/team/ayushtake.jpg",
  ),
  Team(
    name: "Nikhil Sachdeva",
    desc: "Android Developer",
    image: "https://script.itsshivam.com/assets/images/team/nikhilsachdeva.jpg",
  ),
  Team(
    name: "Mohit Sharma",
    desc: "Region Head J&K",
    image: "https://script.itsshivam.com/assets/images/team/mohitsharma.jpg",
  ),
  Team(
    name: "Vanshika Uniyal",
    desc: "Campus Expert - IGDTUW",
    image: "https://script.itsshivam.com/assets/images/team/vanshikauniyal.jpg",
  ),
  Team(
    name: "Saksham Taneja",
    desc: "Campus Expert - JECRC University",
    image: "https://script.itsshivam.com/assets/images/team/sakshamtaneja.jpg",
  ),
  Team(
    name: "Priyanka Sharma",
    desc: "Technical Head Punjab",
    image: "https://script.itsshivam.com/assets/images/team/priyankasharma.jpg",
  ),
  Team(
    name: "Yash Sharma",
    desc: "North India Region Head",
    image: "https://script.itsshivam.com/assets/images/team/yashsharma.jpg",
  ),
  Team(
    name: "Mohit Bhat",
    desc: "Technical Head",
    image: "https://script.itsshivam.com/assets/images/team/mohibhat.jpg",
  ),
  Team(
    name: "Pavitra Walia",
    desc: "Campus Expert - MAIT",
    image: "https://script.itsshivam.com/assets/images/team/pavitrawalia.jpg",
  ),
  Team(
    name: "Deepanshu Jain",
    desc: "Core Team Member",
    image: "https://script.itsshivam.com/assets/images/team/deepanshujain.jpg",
  ),
  Team(
    name: "Swapnil Undage",
    desc: "Region Head Maharashtra",
    image: "https://script.itsshivam.com/assets/images/team/swapnilundage.jpeg",
  ),
  Team(
    name: "Avinash Koshal",
    desc: "Chapter Lead Jammu",
    image: "https://script.itsshivam.com/assets/images/team/avinashkoshal.jpeg",
  ),
  Team(
    name: "Adil Ishaq Ganai",
    desc: "Chapter Lead Jammu",
    image: "https://script.itsshivam.com/assets/images/team/adilishaqganai.png",
  ),
];

class TeamPage extends StatelessWidget {
  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.linkedinIn,
                size: 15,
              ),
              onPressed: () {
                launch(teams[0].linkedinUrl);
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.facebookF,
                size: 15,
              ),
              onPressed: () {
                launch(teams[0].fbUrl);
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.twitter,
                size: 15,
              ),
              onPressed: () {
                launch(teams[0].twitterUrl);
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.solidEnvelope,
                size: 15,
              ),
              onPressed: () async {
                var emailUrl = teams[0].email;
                var out = Uri.encodeFull(emailUrl);
                await launch(out);
              },
            ),
          ],
        ),
      );

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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: teams.length,
        itemBuilder: (c, i) {
          return Card(
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: teams[i].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              teams[i].name,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(height: 10),
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 5,
                              color: Tools.multiColors[Random().nextInt(4)],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          teams[i].desc,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        SizedBox(height: 10),
                        socialActions(context),
                      ],
                    ),
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
