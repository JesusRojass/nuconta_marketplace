import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://www.linkedin.com/in/jesusvr/';
const _urlNu = 'http://nubank.com.br';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 55, bottom: 20),
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/img/myself.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  'Jose de Jesus Valente Rojas',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchIn();
                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Image(
                        width: 40,
                        height: 40,
                        image: AssetImage('assets/img/in_logo.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'LinkedIn',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchNu();
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 220),
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage('assets/img/nu_logo.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchIn() async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }

  void _launchNu() async {
    await canLaunch(_urlNu)
        ? await launch(_urlNu)
        : throw 'Could not launch $_url';
  }
}
