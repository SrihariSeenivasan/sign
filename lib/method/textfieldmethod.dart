import 'package:flutter/material.dart';

class Textfieldmethod extends StatelessWidget {
  const Textfieldmethod({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

TextField textfieldmethod(hintname, lablename, icon, obs, con) {
  return TextField(
    controller: con,
    obscureText: obs,
    decoration: InputDecoration(
      hintText: hintname,
      labelText: lablename,
      prefixIcon: Icon(icon),
      labelStyle: TextStyle(color: Colors.black),
      hintStyle: TextStyle(color: Colors.black),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.black)),
    ),
  );
}
