import 'package:albums_demo_app/core/utils/colors.dart';
import 'package:albums_demo_app/domain/entities/album.dart';
import 'package:flutter/material.dart';

class AlbumItem extends StatelessWidget {
  final Album album;
  final GestureTapCallback? onTap;

  const AlbumItem({required this.album, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
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
        ),
        child: Center(
          child: Text(
            album.title,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
