import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/components.dart';
import '../locator.dart';
import '../providers/data_manager.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../providers/hlist_provider.dart';

class ProductsPage extends ConsumerStatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends ConsumerState {
  _ProductsPageState({Key? key}) : super();
  static final productProvider =
      ChangeNotifierProvider<ProductsProvider>((ref) => ProductsProvider());

  bool isTapped = false;
  Color? color = Colors.grey[800];
  double size = 80;
  final HListMsg _hListMsg = locator<HListMsg>();
  late StreamSubscription<int> streamSubscription;
  @override
  void initState() {
    streamSubscription = _hListMsg.idStream.listen(iid);
    super.initState();
  }

  void iid(int id) {
    setState(() {
      if (id == ref.read(productProvider.notifier).category) {
        isTapped = true;
        color = Colors.white;
        size = 20;
      } else {
        isTapped = false;
        color = Colors.grey[800];
        size = 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(productProvider);
    var _size = MediaQuery.of(context).size;
    double _width = _size.width;
    double _height = _size.height;
    return Scaffold(
      backgroundColor: Color(0Xff333742),
      drawer: const Icon(
        Icons.wysiwyg,
        color: Colors.white,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0Xff333742),
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
                          size: size,
                          text: cats[index],
                          id: index,
                          callback: () {
                            ref
                                .read(productProvider.notifier)
                                .getProducts(cats[index]);
                            ref
                                .read(productProvider.notifier)
                                .changeCategory(index);
                            _hListMsg.broadcastId(index);
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          Consumer(builder: (context, ref, child) {
            List prod = notifier.getProduct;
            if (prod.isNotEmpty) {
              return Expanded(
                child: MasonryGridView.count(
                  itemCount: prod.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return VListTile(product: prod[index]);
                  },
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }
}
