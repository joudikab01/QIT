import 'package:flutter/material.dart';

import '../models/product.dart';

class VListTile extends StatelessWidget {
  final Product product;
  const VListTile({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    var _height = _size.height;
    var _width = _size.width;
    return SizedBox(
      height: _height/3,
      child: Card(
        semanticContainer: true,
        color: Colors.grey[700],
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: _width / 2,
                    maxHeight: _height / 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        16,
                      ),
                      topRight: Radius.circular(
                        16,
                      ),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        product.image,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.title,
                ),
                Text(
                  product.price.toString(),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    //rating card
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
