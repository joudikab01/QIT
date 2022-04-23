import 'package:flutter/material.dart';
import 'package:qit_test/components/rating_card.dart';

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
      height: _height / 2.3,
      child: Card(
        semanticContainer: true,
        color: Color(0Xff454D5A),
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
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  constraints: BoxConstraints(
                    // maxWidth: _width / 3,
                    maxHeight: _height / 4,
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
                  height: 12,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            " '\$' ${product.price.toString()}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                            ),
                          ),
                          Text(
                            " \$ ${product.price.toString()}",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingCard(rating: product.rating),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star_border,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: _height/7,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  color: Colors.black45,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
