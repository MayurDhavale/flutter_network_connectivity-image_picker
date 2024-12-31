// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: CachedNetworkImage(
          imageUrl:
              'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcR6AK1OtJ2FXnHR6omrAJwzJUpDnlRN4K-L3NfsTyFLYE2M4MFb26tkd0lxmNiNcEtINJw_Bjvc3RrQysQ',
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    ),
  ));
}
