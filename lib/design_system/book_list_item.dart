import 'package:flutter/cupertino.dart';

class BLBookListItem extends StatelessWidget {
  const BLBookListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/7'
              '/7a/The_Great_Gatsby_Cover_1925_Retouched.jpg',
              height: 84,
              width: 77,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
