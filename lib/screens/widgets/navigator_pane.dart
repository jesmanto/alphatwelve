import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPane extends StatelessWidget {
  const NavigationPane({super.key, required this.title, this.callback});

  final String title;
  final Function()? callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed:
                callback != null
                    ? () {
                      callback!();
                    }
                    : () {},
            icon: Icon(CupertinoIcons.back),
            iconSize: 11,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
