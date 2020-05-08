import 'dart:math';

import 'package:ScriptFoundation/universal/tools.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogsData {
  List<Blog> blogs;

  BlogsData({this.blogs});

  BlogsData.fromJson(Map<String, dynamic> json) {
    if (json['blogs'] != null) {
      blogs = new List<Blog>();
      json['blogs'].forEach((v) {
        blogs.add(Blog.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.blogs != null) {
      data['blogs'] = this.blogs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Blog {
  String title;
  String desc;
  String image;
  String url;

  Blog({
    this.title,
    this.desc,
    this.image,
    this.url,
  });

  Blog.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['url'] = this.url;
    return data;
  }
}

List<Blog> blogs = [
  Blog(
    title: "Setting Realistic Goals",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
  ),
  Blog(
    title: "Setting Realistic Goals",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
  ),
  Blog(
    title: "Setting Realistic Goals",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
  ),
  Blog(
    title: "Setting Realistic Goals",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
  ),
  Blog(
    title: "Setting Realistic Goals",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
  ),
  Blog(
    title: "Setting Realistic Goals",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
  ),
  Blog(
    title: "Setting Realistic Goals",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
  ),
  Blog(
    title: "Setting Realistic Goals",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
  ),
  Blog(
    title: "Setting Realistic Goals",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
  ),
  Blog(
    title: "Setting Realistic Goals",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    image: "https://miro.medium.com/max/1400/1*Nk3kkThks62avT7Cl2tc9Q.png",
    url:
        "https://medium.com/enappd/building-a-flutter-datetime-picker-in-just-15-minutes-6a4b13d6a6d1",
  ),
];

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Blog',
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
        itemCount: blogs.length,
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
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: blogs[i].image,
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
                              blogs[i].title,
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
                            SizedBox(height: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                blogs[i].desc,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.bookReader,
                            size: 25,
                          ),
                          onPressed: () {
                            launch(blogs[0].url);
                          },
                        ),
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
