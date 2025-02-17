import 'package:ecommerce_app/presentation/settings/widgets/my_favorite_tile.dart';
import 'package:ecommerce_app/presentation/settings/widgets/my_order_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',style: GoogleFonts.outfit(),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            MyFavortiesTile(),
            SizedBox(
              height: 15,
            ),
            MyOrdersTile()
          ],
        ),
      ),
    );
  }
}
