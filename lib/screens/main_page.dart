import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qit_test/models/product.dart';
import '../components/components.dart';
import '../locator.dart';
import '../providers/data_manager.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsPage extends ConsumerWidget {
  ProductsPage(
      {
      Key? key})
      : super(key: key);
  static final productProvider =
      ChangeNotifierProvider<ProductsProvider>((ref) => ProductsProvider());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(productProvider);
    var providerr = locator.get<ProductsProvider>();
    var _size = MediaQuery.of(context).size;
    double _width = _size.width;
    double _height = _size.height;
    //print('this is get it ${providerr.getCategoriesName}');
    return Scaffold(
      backgroundColor: Color(0Xff333742),
      drawer: const Icon(
        Icons.wysiwyg,
        color: Colors.white,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Color(0Xff333742),
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
          FutureBuilder(
              future: ref.read(productProvider.notifier).getCategories(),
              builder: (context, AsyncSnapshot snapshot) {
                List cats = snapshot.data ?? [];
                if (cats.isNotEmpty) {
                  return Container(
                    color: Color(0Xff333742),
                    width: _width,
                    height: _height / 12,
                    child: ListView.builder(
                      itemCount: cats.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (BuildContext context, int index) {
                        return HListTile(
                          text: cats[index],
                          callback: () {
                            ref
                                .read(productProvider.notifier)
                                .getProducts(cats[index]);
                            ref
                                .read(productProvider.notifier)
                                .changeCategory(index);
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Text(
                    'Loading',
                  );
                }
              }),
          Consumer(builder: (context, ref, child) {
            List prod = notifier.getProduct;
            if (prod.isNotEmpty) {
              return Expanded(
                child: MasonryGridView.count(
                  itemCount: prod.length,
                  scrollDirection: Axis.vertical,
                  // primary: true,
                  // shrinkWrap: true,
                  // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: 2,
                  //   crossAxisSpacing: 5,
                  //   mainAxisSpacing: 5,
                  // ),
                  itemBuilder: (BuildContext context, int index) {
                    return VListTile(product: prod[index]);
                  },
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
              );
            }
            return Text('hello');
          }),
        ],
      ),
    );
  }
}
