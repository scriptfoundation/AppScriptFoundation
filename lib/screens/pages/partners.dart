import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Partner {
  String name;
  String image;
  String desc;
  String url;

  Partner({this.name, this.image, this.desc, this.url});

  Partner.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    desc = json['desc'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['desc'] = this.desc;
    data['url'] = this.url;
    return data;
  }
}

List<Partner> partners = [
  Partner(
    name: "Microsoft",
    desc: "Community Partner",
    image: "https://script.itsshivam.com/assets/images/partners/microsoft.png",
    url: "https://www.microsoft.com/",
  ),
  Partner(
    name: "GitHub",
    desc: "Community Partner",
    image: "https://script.itsshivam.com/assets/images/partners/github.png",
    url: "https://github.com/",
  ),
  Partner(
    name: "Balsamiq",
    desc: "Community Partner",
    image: "https://script.itsshivam.com/assets/images/partners/balsamiq.png",
    url: "https://balsamiq.com/",
  ),
  Partner(
    name: "GeeksforGeeks",
    desc: "Community Partner",
    image:
    "https://script.itsshivam.com/assets/images/partners/geeksforgeeks.png",
    url: "https://www.geeksforgeeks.org/",
  ),
  Partner(
    name: "GitKraken",
    desc: "Community Partner",
    image: "https://script.itsshivam.com/assets/images/partners/gitkraken.png",
    url: "https://www.gitkraken.com/",
  ),
  Partner(
    name: "Linode",
    desc: "Community Partner",
    image: "https://script.itsshivam.com/assets/images/partners/linode.png",
    url: "https://www.linode.com/",
  ),
  Partner(
    name: "Codechef",
    desc: "Community Partner",
    image: "https://script.itsshivam.com/assets/images/partners/codechef.png",
    url: "https://www.codechef.com/",
  ),
  Partner(
    name: "Coding Blocks",
    desc: "Community Partner",
    image:
    "https://script.itsshivam.com/assets/images/partners/codingblocks.png",
    url: "https://codingblocks.com/",
  ),
  Partner(
    name: "Gatsby",
    desc: "Community Partner",
    image: "https://script.itsshivam.com/assets/images/partners/gatsby.png",
    url: "https://www.gatsbyjs.org/",
  ),
  Partner(
    name: "Hackerrank",
    desc: "Community Partner",
    image: "https://script.itsshivam.com/assets/images/partners/hackerrank.png",
    url: "https://www.hackerrank.com/",
  ),
  Partner(
    name: "Stickermule",
    desc: "Community Partner",
    image:
    "https://script.itsshivam.com/assets/images/partners/stickermule.png",
    url: "https://stickermule.com/",
  ),
  Partner(
    name: "Egghead",
    desc: "Community Partner",
    image: "https://script.itsshivam.com/assets/images/partners/egghead.png",
    url: "https://egghead.io/",
  ),
  Partner(
    name: "Bugsee",
    desc: "Community Partner",
    image: "https://script.itsshivam.com/assets/images/partners/bugsee.png",
    url: "https://www.bugsee.com/",
  ),
];

class PartnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Partners',
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
                subject: 'Script Foundation App',
              );
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: partners.length,
        itemBuilder: (c, i) {
          return GestureDetector(
            onTap: () => launch(partners[i].url),
            child: Card(
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints.expand(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.2,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: partners[i].image,
                        fit: BoxFit.fitWidth,
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
                                partners[i].name,
                                overflow: TextOverflow.ellipsis,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline6,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            partners[i].desc,
                            overflow: TextOverflow.ellipsis,
                            style: Theme
                                .of(context)
                                .textTheme
                                .subtitle2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PartnerImage extends StatelessWidget {
  final String imgUrl;

  const PartnerImage({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          height: 200.0,
          width: 200.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
