import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String email;

  final String phone;
  final String gender;
  final String image;

  Details(
      {this.firstname,
      this.lastname,
      this.gender,
      this.email,
      this.image,
      this.phone});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selected User',
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.teal.withOpacity(0.3),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 60)),
            Container(
              height: 140,
              width: 140,
              child: Image.network(
                widget.image,
                fit: BoxFit.fill,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Text(
              widget.firstname + " " + widget.lastname,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontFamily: 'Roboto',
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Text(
              widget.email,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',

              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              widget.phone,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',

              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              widget.gender,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',

              ),
            ),
          ],
        ),
      ),
    );
  }
}
