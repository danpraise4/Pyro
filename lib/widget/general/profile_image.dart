import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuleap/helpers/constants.dart';

// ignore: camel_case_types
class profileImage extends StatefulWidget {
  profileImage({super.key, this.h = 40, this.w = 40, this.url});

  double h;
  double w;

  String? url;

  @override
  State<profileImage> createState() => _profileImageState();
}

class _profileImageState extends State<profileImage> {
  double getHight() {
    return widget.h;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.h / 2),
        child: widget.url == null
            ? Container(
                color: white_,
                child: Image.asset(
                  '${imagesPath}place_holder.jpeg',
                  width: widget.w,
                  height: widget.h,
                ),
              )
            : CachedNetworkImage(
                width: widget.w,
                height: widget.h,
                fit: BoxFit.cover,
                imageUrl: widget.url!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => SvgPicture.asset(
                  '${svgPath}place_holder.svg',
                  width: widget.w,
                  height: widget.h,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
