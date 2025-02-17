import 'package:ecommerce_app/presentation/home/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/images/order-placed-purchased-icon.png',height: 200, width: 200),
          ),
          const SizedBox(
            height: 60,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Color.fromARGB(221, 121, 121, 121),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    'Order Placed Successfully',
                    style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      child: Text('Finish',style: GoogleFonts.outfit(fontWeight: FontWeight.bold),),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ));
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
