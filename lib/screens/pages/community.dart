import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityData {
  List<Community> community;

  CommunityData({this.community});

  CommunityData.fromJson(Map<String, dynamic> json) {
    if (json['community'] != null) {
      community = new List<Community>();
      json['community'].forEach((v) {
        community.add(Community.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.community != null) {
      data['community'] = this.community.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Community {
  String name;
  String desc;
  String job;
  String image;
  String telegramUrl;

  Community({
    this.name,
    this.desc,
    this.job,
    this.image,
    this.telegramUrl,
  });

  Community.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    job = json['job'];
    image = json['image'];
    telegramUrl = json['telegram_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['job'] = this.job;
    data['image'] = this.image;
    data['telegram_url'] = this.telegramUrl;
    return data;
  }
}

List<Community> community = [
  Community(
    name: "Bengaluru",
    image: "https://script.itsshivam.com/assets/images/chapters/bangalore.jpg",
    telegramUrl: "https://t.me/scriptbangalore",
  ),
  Community(
    name: "Chandigarh",
    image: "https://script.itsshivam.com/assets/images/chapters/chandigarh.jpg",
    telegramUrl: "https://t.me/scriptchandigarh",
  ),
  Community(
    name: "Gujarat",
    image: "https://script.itsshivam.com/assets/images/chapters/gujarat.jpg",
    telegramUrl: "https://t.me/scriptgujarat",
  ),
  Community(
    name: "Chennai",
    image: "https://script.itsshivam.com/assets/images/chapters/chennai.jpg",
    telegramUrl: "https://t.me/scriptchennai",
  ),
  Community(
    name: "Delhi NCR",
    image: "https://script.itsshivam.com/assets/images/chapters/delhi.jpg",
    telegramUrl: "https://t.me/scriptdelhincr",
  ),
  Community(
    name: "Hyderabad",
    image: "https://script.itsshivam.com/assets/images/chapters/hyderabad.jpg",
    telegramUrl: "https://t.me/scripthyderabad",
  ),
  Community(
    name: "Indore",
    image: "https://script.itsshivam.com/assets/images/chapters/indore.jpg",
    telegramUrl: "https://t.me/scriptindore",
  ),
  Community(
    name: "Goa",
    image: "https://script.itsshivam.com/assets/images/chapters/goa.png",
    telegramUrl: "https://t.me/scriptgoa",
  ),
  Community(
    name: "Jammu & Kashmir",
    image: "https://script.itsshivam.com/assets/images/chapters/j&k.jpg",
    telegramUrl: "https://t.me/scriptjk",
  ),
  Community(
    name: "Jaipur",
    image: "https://script.itsshivam.com/assets/images/chapters/jaipur.jpg",
    telegramUrl: "https://t.me/scriptjaipur",
  ),
  Community(
    name: "Kolkata",
    image: "https://script.itsshivam.com/assets/images/chapters/kolkata.jpg",
    telegramUrl: "https://t.me/joinchat/H3kNl1fcGuR7NMcpkP__Gw",
  ),
  Community(
    name: "Kota",
    image: "https://script.itsshivam.com/assets/images/chapters/kota.jpg",
    telegramUrl: "https://t.me/scriptkota",
  ),
  Community(
    name: "Lucknow",
    image: "https://script.itsshivam.com/assets/images/chapters/lucknow.jpg",
    telegramUrl: "https://t.me/scriptlucknow",
  ),
  Community(
    name: "Nagpur",
    image: "https://script.itsshivam.com/assets/images/chapters/nagpur.jpg",
    telegramUrl: "https://t.me/scriptnagpur",
  ),
  Community(
    name: "Pune",
    image: "https://script.itsshivam.com/assets/images/chapters/pune.jpg",
    telegramUrl: "https://t.me/scriptpune",
  ),
  Community(
    name: "Mumbai",
    image: "https://script.itsshivam.com/assets/images/chapters/mumbai.jpg",
    telegramUrl: "https://t.me/scriptmumbai",
  ),
];

class CommunityPage extends StatelessWidget {
  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.telegramPlane,
                size: 25,
              ),
              onPressed: () {
                launch(community[0].telegramUrl);
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
          'Community',
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
        itemCount: community.length,
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
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: community[i].image,
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
                        Text(
                          community[i].name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6,
                        ),
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
