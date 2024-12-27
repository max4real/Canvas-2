import 'package:canvas_test_2/pac_man.dart';
import 'package:flutter/material.dart';

// class Picasso extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // TODO: implement paint
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     throw UnimplementedError();
//   }
// }
class Picasso extends StatelessWidget {
  const Picasso({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: CarouselView.weighted(
          flexWeights: const [1, 2, 1],
          itemSnapping: true,
          children: List<Widget>.generate(10, (int index) {
            return Container(
              height: 200,
              margin: const EdgeInsets.all(8.0),
              color: Colors.blueAccent,
              child: Center(
                child: Text(
                  '$index',
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
