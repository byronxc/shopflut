import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: _info(),
    );
  }
}

_info() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('images/profile.jpg'),
            radius: 80,
          ),
        ),
        const Divider(
          height: 40,
          color: Colors.grey,
        ),
        const Text(
          "Creator:",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const Text(
          "Bayron Pineda",
          style: TextStyle(
              color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Profession:",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const Text(
          "Software Engineer",
          style: TextStyle(
              color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: const <Widget>[
            Icon(
              Icons.email,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "bapineda22@gmail.com",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Image.asset('images/linkedin.png'),
              iconSize: 50,
              onPressed: () async {
                const url = 'https://www.linkedin.com/in/bayronpineda/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            const SizedBox(
              width: 50,
            ),
            IconButton(
              icon: Image.asset('images/git.png'),
              iconSize: 50,
              onPressed: () async {
                const url = 'https://github.com/byronxc';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          ],
        ),
      ],
    ),
  );
}
