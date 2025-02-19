import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop by Categories',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_categories()],
        ),
      ),
    );
  }

  Widget _categories() {
    List<Map<String, String>> categories = [
      {"title": "Books", "image": "book.jpg"},
      {"title": "Electronics", "image": "electronics.jpeg"},
      {"title": "Gaming", "image": "gaming.webp"},
    ];

    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            height: 70,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 54, 98, 204),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/${categories[index]['image']}'),
                      fit: BoxFit.cover,  
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  categories[index]['title']!,
                  style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: categories.length,
    );
  }
}
