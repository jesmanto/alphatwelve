import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Color(0xff60b5ff)),
              child: Text(
                "Full Logo",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff2563eb),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "DELIVERY ADDRESS",
                  style: GoogleFonts.ibmPlexSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Umuezike Road, Oyo State",
                    style: GoogleFonts.ibmPlexSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SvgPicture.asset('assets/icons/hugeicons_notification.svg'),
          ],
        ),
      ],
    );
  }
}
