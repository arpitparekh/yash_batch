import 'package:flutter/material.dart';
import 'package:yash_batch/pass_data/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListingPage(),
    );
  }
}

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  String? productNameError = null;
  String? productPriceError = null;

  // null safety in flutter

  // create a list of products
  List<Product> products = [];

  var buttonName = "Add Product";
  bool logic = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[500],
          centerTitle: true,
          title: const Text(
            'Product Listing',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextField(

              controller: productNameController,
              onChanged: (value) {
                setState(() {
                  productNameError = null;
                });
              },
              decoration: InputDecoration(
                errorText: productNameError,
                hintText: 'Enter Product Name',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: productPriceController,
              onChanged: (value) {
                setState(() {
                  productPriceError = null;
                });
              },
              decoration: InputDecoration(

                errorText: productPriceError,
                hintText: 'Enter Product Price',
                border: const OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (productNameController.text.isEmpty &&
                        productPriceController.text.isEmpty) {
                      productNameError = "Enter Product Name";
                      productPriceError = "Enter Product Price";
                    } else if (productNameController.text.isEmpty) {
                      productNameError = "Enter Product Name";
                    } else if (productPriceController.text.isEmpty) {
                      productPriceError = "Enter Product Price";
                    } else {
                      // add

                      if (logic) {

                        Product p = products[index];
                        p.name = productNameController.text;
                        p.price = productPriceController.text;

                        products[index] = p;

                        logic = false;
                        buttonName = "Add Product";
                        index = 0;
                        productNameController.clear();
                        productPriceController.clear();

                      } else {
                        Product p = new Product(productNameController.text,
                            productPriceController.text);

                        products.add(p);
                        productNameController.clear();
                        productPriceController.clear();

                        logic = false;
                        buttonName = "Add Product";
                        index = 0;
                      }
                    }
                  });
                },
                child: Text(buttonName)),
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft, //alignment
                            child: Text(products[index].name +
                                "\n" +
                                products[index].price),
                          ),
                          Row(
                            children: [
                              IconButton(
                                color: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    products.removeAt(index);
                                    logic = false;
                                    buttonName = "Add Product";
                                    index = 0;
                                    productNameController.clear();
                                    productPriceController.clear();
                                  });
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                color: Colors.green,
                                onPressed: () {
                                 setState(() {
                                   Product p = products[index];
                                   productNameController.text = p.name;
                                   productPriceController.text = p.price;
                                   buttonName = "Update Product";
                                   logic = true;
                                   this.index= index;
                                 });
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          ]),
        ));
  }
}

// product Listing Page
// product show page
