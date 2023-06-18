import 'package:flutter/material.dart';
import 'package:project_dkriya/helper/my_color.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
        primaryColor: Colors.orange[100],
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ShoppingCartScreen(),
    );
  }
}

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<ProductItem> cartItems = [
    ProductItem('Anyaman Tangan', 'Bandung maju', 10000, 'images/anyaman_tangan.png'),
    ProductItem('Lukisan', 'Lukisan Yuhu', 15000, 'images/lukisan.png'),
    ProductItem('Ukiran Batu', 'Ukiryuk', 20000, 'images/ukiran_batu.png'),
  ];

  List<ProductItem> selectedItems = [];

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Product removed from cart'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              cartItems.insert(
                index,
                ProductItem('Product ${index + 1}', 'Shop ${index + 1}', 10000, ''),
              );
            });
          },
        ),
      ),
    );
  }

  void _toggleItemSelection(int index) {
    setState(() {
      ProductItem item = cartItems[index];
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  void _decreaseItemCount(int index) {
    setState(() {
      if (cartItems[index].count > 0) {
        cartItems[index].count--;
      }
    });
  }

  void _increaseItemCount(int index) {
    setState(() {
      cartItems[index].count++;
    });
  }

  String _formatCurrency(double amount) {
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return formatCurrency.format(amount);
  }

  double _calculateTotal() {
    double total = 0;
    for (ProductItem item in selectedItems) {
      total += item.price * item.count;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
        title: Text('Keranjang Saya'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          ProductItem item = cartItems[index];
          bool isSelected = selectedItems.contains(item);
          return ListTile(
            leading: SizedBox(
              width: 60,
              height: 60,
              child: Checkbox(
                value: isSelected,
                onChanged: (value) {
                  _toggleItemSelection(index);
                },
              ),
            ),
            title: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(item.shopName),
                      SizedBox(height: 4),
                      Text(
                        _formatCurrency(item.price),
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        _decreaseItemCount(index); // Mengurangi jumlah produk yang ingin dibeli
                      },
                    ),
                    Text(item.count.toString()), // Jumlah produk yang ingin dibeli
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _increaseItemCount(index); // Menambah jumlah produk yang ingin dibeli
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _removeItem(index); // Menghapus produk dari keranjang
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Total: ${_formatCurrency(_calculateTotal())}',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ), // Total pembayaran
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Checkout pressed'),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MyColor.primaryColor),
                  ),
                  child: Text(
                    'Beli',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem {
  final String name;
  final String shopName;
  final double price;
  final String imagePath;
  int count;

  ProductItem(this.name, this.shopName, this.price, this.imagePath, {this.count = 0});
}
