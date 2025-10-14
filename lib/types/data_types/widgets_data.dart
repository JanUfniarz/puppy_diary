import 'package:flutter/material.dart';

typedef DrawerData = ({
  ({String? name, String? fullName}) active,
  List<({String name, int id})> rest
});


typedef TextFieldData = ({
  String label,
  void Function(String) onChanged
});


typedef InputData = ({
  String label,
  Widget child
});