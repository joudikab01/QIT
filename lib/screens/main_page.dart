import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qit_test/models/category.dart';
import 'package:qit_test/models/product.dart';
import 'package:qit_test/models/rating.dart';
import '../components/components.dart';
import '../models/products.dart';
import '../providers/data_manager.dart';

class ProductsPage extends ConsumerWidget {
  // Category category;
  // Products products;
   ProductsPage({
     //required this.category,required this.products,
     Key? key}) : super(key: key);
  static final productProvider =
  ChangeNotifierProvider<ProductsProvider>((ref) => ProductsProvider());
  //Product product = const Product(id: 1, title: 'Xbox', price: 100, description: 'hjdkf', category: 'elec',rating: Rating(rate: 20, count: 10), image: 'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg');
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final notifier = ref.watch(productProvider);
    ref.read(productProvider.notifier).getCategories();
    List cat = notifier.categories;
    ref.read(productProvider.notifier).getProducts(cat[0]);
    List<Product> products = notifier.products;
    var _size = MediaQuery.of(context).size;
    double _width = _size.width;
    double _height = _size.height;
    return Scaffold(
      drawer: const Icon(
        Icons.wysiwyg,
        color: Colors.white,
      ),
      appBar: AppBar(elevation: 0,
        backgroundColor: Colors.grey[800],
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_alert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: _width,
            height: _height/12,
            child: ListView.builder(
              itemCount: cat.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (BuildContext context, int index) {
                return HListTile(text: cat[index]);
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              scrollDirection: Axis.vertical,
              primary: true,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return VListTile(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
