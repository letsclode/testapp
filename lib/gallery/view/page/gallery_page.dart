// pages/gallery_page.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/gallery/bloc/gallery_bloc.dart';
import 'package:my_app/gallery/bloc/gallery_state.dart';


class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          if (state is GalleryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GalleryLoaded) {
             if (state.images.isEmpty) {
              return Center(child: Text('No images', style: TextStyle(color: Colors.black)));
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: state.images.length,
              itemBuilder: (context, index) {
                return Image.file(
                  File(state.images[index].path),
                  fit: BoxFit.cover,
                );
              },
            );
          }
          return Center(child: Text('No images', style: TextStyle(color: Colors.black),));
        },
      ),
    );
  }
}
