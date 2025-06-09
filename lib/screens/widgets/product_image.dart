import 'package:alphatwelve/models/Product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 350,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            placeholder:
                (context, url) => const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            errorWidget:
                (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  size: 48,
                  color: Colors.grey,
                ),
          ),
        ),
        Positioned(
          right: 16,
          top: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset('assets/icons/hugeicons_favourite.svg'),
          )
          // Container(
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: Colors.white,
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: ,
          //   ),
          // ),
        ),

      ],
    );
  }
}
