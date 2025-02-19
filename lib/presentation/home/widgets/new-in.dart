import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _newIn(),
        const SizedBox(
          height: 20,
        ),
        _products()
      ],
    );
  }

  Widget _newIn() {
    return  Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Text(
        'New In',
        style: GoogleFonts.outfit(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _products() {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/newin.webp'),
                    fit: BoxFit.cover,
                  )),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: 5),
    );
  }
}
