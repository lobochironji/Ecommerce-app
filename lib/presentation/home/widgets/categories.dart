import 'package:ecommerce_app/presentation/allcategories/pages/all_categories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _seeAll(context),
        const SizedBox(height: 20),
        _categories(),
      ],
    );
  }

  Widget _seeAll(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categories',
            style:
                GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AllCategoriesPage();
                },
              ));
            },
            child: Text(
              'See All',
              style:
                  GoogleFonts.outfit(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categories() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/hoodie.webp'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Hoodies",
                style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemCount: 5, // Show 5 placeholders
      ),
    );
  }
}
