import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SnackBar customSnackBar(String errorMsg,{Color? color}) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    backgroundColor:color ?? Colors.red.shade900,
    content: Row(
      children: [
        Icon(CupertinoIcons.info, color: Colors.white, size: 25),
        SizedBox(width: 10),
        Text(
          errorMsg,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          )
        ),
      ],
    ),
  );
}
