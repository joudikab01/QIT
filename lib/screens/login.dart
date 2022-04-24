import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qit_test/providers/data_manager.dart';

import '../models/category.dart';

class LoginScreen extends ConsumerWidget {
  static final productProvider =
      ChangeNotifierProvider<ProductsProvider>((ref) => ProductsProvider());

  static const String route = '/login';
  LoginScreen({Key? key}) : super();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(productProvider);
    var _size = MediaQuery.of(context).size;
    double _width = _size.width;
    double _height = _size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _height / 7,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                'Please login to your account.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: _height / 15,
                child: TextField(
                  controller: userController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    hintText: 'Email Address',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                height: _height / 15,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.lock_outlined,
                      color: Colors.grey,
                    ),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              TextButton(
                onPressed: () {
                  if (userController.text == 'info@qit.company' &&
                       passwordController.text == '123456') {
                    Navigator.pushNamed(context, '/products');
                    ref.read(productProvider.notifier).loginRequest(
                        userController.text, passwordController.text);
                  }
                  else{
                    SnackBar s=SnackBar(content: Text('please try again'),);
                    ScaffoldMessenger.of(context).showSnackBar(s);
                  }

                  // ref.read(productProvider).getCategories();
                  // //ref.read(productProvider.notifier).getProducts('electronics');
                  // //print(notifier.getProduct);
                  // //print(notifier.getCategoriesName);
                  // List cat = notifier.categories;
                  // print(cat);
                  // if (cat.isEmpty) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Scaffold(
                  //         body: CircularProgressIndicator(),
                  //       ),
                  //     ),
                  //   );
                  // } else {
                  //   ref.read(productProvider.notifier).getProducts(cat[0]);
                  //Navigator.pushNamed(context, '/products');
                  // }
                },
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                  fixedSize: Size(_width, _height / 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: _width / 1.8, bottom: 35),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'or login with',
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(13),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.facebook_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.facebook,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(13),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.facebook_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _height / 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 12),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Create new now!',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "By signing up, you agree with our",
                    style: TextStyle(fontSize: 12),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
