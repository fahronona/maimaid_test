import 'package:flutter/material.dart';

Widget loadingCircular() {
  return Center(
    child: Container(
        height: 60,
        width: 60,
        child: const Center(child: CircularProgressIndicator())),
  );
}
