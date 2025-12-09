import 'package:flutter/foundation.dart';
import 'dart:html' as html;

import 'package:flutter/material.dart';

Widget buildImageThatWorks(String url) {
  return SizedBox(
    width: 100,
    height: 100,
    child: Builder(
      builder: (context) {
        // This will load the image via HTML
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final img = html.ImageElement()
            ..src = url
            ..style.width = '100px'
            ..style.height = '100px'
            ..style.position = 'absolute'
            ..style.top = '0'
            ..style.left = '0';
          
          // Find the container and add image
          final containerId = 'image-container-${context.hashCode}';
          final container = html.DivElement()
            ..id = containerId
            ..style.width = '100px'
            ..style.height = '100px'
            ..style.position = 'relative';
          
          container.append(img);
          
          // Get Flutter's container and append our div
          final flutterContainer = html.document.getElementById('flt-glass-pane');
          if (flutterContainer != null) {
            flutterContainer.append(container);
          }
        });
        
        return Container(
          width: 100,
          height: 100,
          color: Colors.transparent,
        );
      },
    ),
  );
}