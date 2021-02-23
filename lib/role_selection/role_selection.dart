import 'package:flutter/material.dart';
import 'package:Helper_Hiring_System/role_selection/components/body.dart';

class RoleSelection extends StatefulWidget {
  final String name;
  final String email;
  final String contactno;
  final String state;
  final String city;
  final String password;
  RoleSelection({this.name, this.email, this.contactno, this.state, this.city, this.password});

  @override
  _RoleSelectionState createState() => _RoleSelectionState();
}

class _RoleSelectionState extends State<RoleSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(name: widget.name,email: widget.email,contactno: widget.contactno,state: widget.state,city: widget.city,password: widget.password),
    );
  }
}
