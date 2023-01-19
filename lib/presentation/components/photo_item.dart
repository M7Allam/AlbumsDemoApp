import 'package:albums_demo_app/core/utils/colors.dart';
import 'package:albums_demo_app/domain/entities/photo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final Photo photo;

  const PhotoItem({required this.photo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 3.0,
            offset: const Offset(0.0, 3.0),
          ),
        ],
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            photo.thumbnailUrl,
          ),
        ),
      ),
    );
  }
}
