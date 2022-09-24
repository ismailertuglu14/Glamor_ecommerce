import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProjectNetworkImage extends CachedNetworkImage {
  ProjectNetworkImage(
      {String src =
          'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640'})
      : super(imageUrl: src, key: UniqueKey(), fit: BoxFit.contain);
}
