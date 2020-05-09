import 'package:ScriptFoundation/screens/pages/about.dart';
import 'package:ScriptFoundation/screens/pages/blog.dart';
import 'package:ScriptFoundation/screens/pages/community.dart';
import 'package:ScriptFoundation/screens/pages/events.dart';
import 'package:ScriptFoundation/screens/pages/partners.dart';
import 'package:ScriptFoundation/screens/pages/team.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.chrome),
              onPressed: () async {
                await _launchURL("https://scriptindia.org/");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.facebookF),
              onPressed: () async {
                await _launchURL("https://www.facebook.com/scriptfoundationindia/");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.twitter),
              onPressed: () async {
                await _launchURL("https://twitter.com/ScriptFoundati1");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () async {
                _launchURL("https://www.linkedin.com/company/script-foundation-india/");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.youtube),
              onPressed: () async {
                await _launchURL("https://www.youtube.com/channel/UC4OVJeHogUQDHws7AKG7dMA");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.meetup),
              onPressed: () async {
                await _launchURL("https://commudle.com/script-foundation-india");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.solidEnvelope),
              onPressed: () async {
                var emailUrl =
                    '''mailto:support@scriptindia.org?subject=Support Request''';
                var out = Uri.encodeFull(emailUrl);
                await _launchURL(out);
              },
            ),
          ],
        ),
      );

  Widget newActions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 20.0,
        runSpacing: 20.0,
        children: <Widget>[
          ActionCard(
            icon: Icons.event_seat,
            color: Colors.green,
            title: 'Events',
            onPressed: () => Navigator.push(context,
                CupertinoPageRoute(builder: (context) => EventPage())),
          ),
          ActionCard(
            icon: Icons.location_on,
            color: Colors.amber,
            title: 'Community',
            onPressed: () => Navigator.push(context,
                CupertinoPageRoute(builder: (context) => CommunityPage())),
          ),
          ActionCard(
            icon: Icons.import_contacts,
            color: Colors.purple,
            title: 'Blog',
            onPressed: () => Navigator.push(
                context, CupertinoPageRoute(builder: (context) => BlogPage())),
          ),
          ActionCard(
            icon: Icons.info,
            color: Colors.brown,
            title: 'About Us',
            onPressed: () => Navigator.push(
                context, CupertinoPageRoute(builder: (context) => AboutPage())),
          ),
          ActionCard(
            icon: Icons.people,
            color: Colors.red,
            title: 'Team',
            onPressed: () => Navigator.push(
                context, CupertinoPageRoute(builder: (context) => TeamPage())),
          ),
          ActionCard(
            icon: Icons.attach_money,
            color: Colors.blue,
            title: 'Partners',
            onPressed: () => Navigator.push(context,
                CupertinoPageRoute(builder: (context) => PartnerPage())),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/header.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to Script Foundation',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w700, fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'We are an organization that aspires to establish a platform for every student and professional who desires to learn something new and innovative. We are motivated to a single vision to introduce more and more students and professionals to our platform so that they can learn something new and innovative. Our mission is to promote education interactively so that students and professionals should learn interactively and interestingly.',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w400,
                  fontSize: 11.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              newActions(context),
              SizedBox(height: 20),
              socialActions(context),
              SizedBox(height: 20),
              Text(
                'Version 1.0.0',
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard({Key key, this.onPressed, this.icon, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
