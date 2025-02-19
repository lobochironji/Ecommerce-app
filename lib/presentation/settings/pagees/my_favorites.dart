import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        'Favorites',
        style: GoogleFonts.outfit(),
      ),
    ));
  }
}
