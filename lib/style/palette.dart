import 'package:flutter/material.dart';

Map<Col, Color> palette = {
  Col.background: Colors.grey.shade900,
  Col.primary: const Color(0xffffbe02),
  Col.secondary: const Color(0xFF024480),
  Col.text: const Color(0xC7EFEDF6),
};

enum Col {
  background, primary, secondary, text
}