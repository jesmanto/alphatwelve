import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPane extends StatelessWidget {
  const NavigationPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(CupertinoIcons.back,size: 11,),
          ),
          Text("Technology", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),)
        ],
      ),
    );
  }
}
