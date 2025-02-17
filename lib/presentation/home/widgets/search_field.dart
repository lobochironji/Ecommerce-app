import 'package:ecommerce_app/presentation/search/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        readOnly: true,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Search();
            },
          ));
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.blue, width: 1),
            ),
            prefixIcon: Icon(Icons.search),
            hintText: 'search',
            hintStyle: GoogleFonts.outfit()),
      ),
    );
  }
}
