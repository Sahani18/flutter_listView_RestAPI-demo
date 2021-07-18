import 'dart:convert';

import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class GitHub extends StatefulWidget {
  @override
  _GitHubState createState() => _GitHubState();
}

class _GitHubState extends State<GitHub> {
  String firstname, lastname, email, phone, gender, image;
  final String link = "https://randomuser.me/api/?results=50";

  List data;
  bool isLoading = false;

  Future getUser() async {
    var response = await http.get(Uri.encodeFull(link));

    List userData = jsonDecode(response.body)['results'];
    setState(() {
      data = userData;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: (Text("REST API")),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(10),
        color: Colors.teal.withOpacity(0.3),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding:
                          EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      // tileColor: Colors.purple,
                      onTap: () {
                        _navigateToDetailPage(index);
                      },

                      leading: Image.network(
                          {data[index]['picture']['thumbnail']} == null
                              ? Icon(Icons.person)
                              : data[index]['picture']['thumbnail']),

                      title: Text(
                        data[index]['name']['first'] +
                            " " +
                            data[index]['name']['last'],
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3),
                      ),

                      subtitle: Text(
                        data[index]['email'],
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            letterSpacing: 0.3),
                      ),
                    );
                  }),
        ),
      ),
    );
  }

  _navigateToDetailPage(int index) async {
    String sendfirstname = this.data[index]['name']['first'];
    String sendlastname = this.data[index]['name']['last'];

    String sendemail = this.data[index]['email'];
    String sendphone = this.data[index]['phone'];
    String sendgender = this.data[index]['gender'];
    String sendimage = this.data[index]['picture']['medium'];

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => Details(
          firstname: sendfirstname,
          lastname: sendlastname,
          email: sendemail,
          phone: sendphone,
          gender: sendgender,
          image: sendimage,
        ),
      ),
    );
  }
}
