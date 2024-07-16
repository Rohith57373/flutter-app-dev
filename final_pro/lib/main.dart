import 'package:flutter/material.dart';
import './widgets/drawer.dart';
import './widgets/routes.dart';
import './pages/login_page.dart';
import './pages/product_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        // MyRoutes.homeRoute: (context) => Home_page(),
        MyRoutes.loginRoute: (context) => Login_page()
      },
      home: CatalogApp(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}

class CatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              iconTheme: IconThemeData(size: 35, color: Colors.white),
              elevation: 0,
              backgroundColor: Colors.deepPurple,
              title: Text(
                'Catalog App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              margin: EdgeInsets.only(right: 205),
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    EdgeInsets.only(right: 10, left: 20, top: 3, bottom: 3),
                child: Text(
                  'Trending Products :',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailPage(product: products[index]),
                ),
              );
            },
            child: ProductCard(product: products[index]),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5),
          Center(
            child: Text(
              product.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Image.network(
              product.imageUrl,
              width: 90,
              height: 90,
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              product.description,
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              ' Price:\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            'Product Name: ${product.name}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Center(
            child: Image.network(
              product.imageUrl,
              width: 200,
              height: 200,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Description: ${product.description}\n',
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(45, 180, 98, 243),
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 32),
            child: Text(
              "Specifications : \n\n${product.longdes}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          )),
          // Text(
          //   'Price: \$${product.price.toStringAsFixed(2)}',
          //   style: TextStyle(fontSize: 28, color: Colors.green),
          // ),
          Container(
            height: 50,
            margin: EdgeInsets.only(right: 10, left: 10),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green,
            ),
            child: Center(
              child: Text(
                '\t\t Price: \$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 242, 246, 242)),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
