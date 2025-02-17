import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _topSelling(),
        const SizedBox(height: 20),
        _products(),
      ],
    );
  }

  Widget _topSelling() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Top Selling',
        style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _products() {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/shoes.png'),
                    fit: BoxFit.cover,
                  ), 
                ),
              ),
              const SizedBox(height: 8),
               Text(
                "Nike Air Pro", 
                style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                '\$120', 
                style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 5,
      ),
    );
  }
}
