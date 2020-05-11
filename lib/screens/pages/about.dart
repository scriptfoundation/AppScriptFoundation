import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var _homeBloc = HomeBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
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
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 100.0,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 120,
                  ),
                  backgroundImage: AssetImage('assets/images/splash_bg.png'),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Script Foundation",
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w600,
                  fontSize: 35.0,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'We are an organization that aspires to establish a platform for every student and professional who desires to learn something new and innovative. We are motivated to a single vision to introduce more and more students and professionals to our platform so that they can learn something new and innovative. Our mission is to promote education interactively so that students and professionals should learn interactively and interestingly.',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
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
                            child: CircleAvatar(
                              radius: 75.0,
                              child: Icon(
                                FontAwesomeIcons.lightbulb,
                                size: 50.0,
                                color: Colors.white,
                              ),
                              backgroundColor: Colors.yellow[700],
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
                                  'Quality',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
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
                            child: CircleAvatar(
                              radius: 75.0,
                              child: Icon(
                                FontAwesomeIcons.bookReader,
                                size: 40.0,
                                color: Colors.white,
                              ),
                              backgroundColor: Colors.blue[700],
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
                                  'Content',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
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
                            child: CircleAvatar(
                              radius: 75.0,
                              child: Icon(
                                FontAwesomeIcons.chartLine,
                                size: 40.0,
                                color: Colors.white,
                              ),
                              backgroundColor: Colors.pink[700],
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
                                  'Support',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
