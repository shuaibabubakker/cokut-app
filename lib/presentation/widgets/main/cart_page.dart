import 'package:cokut/models/order.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget();
  final fee = 15.00;
  final hpad = 15.0;
  final ordFont = 20.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent[150],
      padding: EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Food Cart", style: TextStyle(fontSize: 25.0)),
            getCartItemList(),
            SizedBox(height: 3.0),
            getBillDetails(),
            SizedBox(height: 8.0),
            Text("Address Details", style: TextStyle(fontSize: 18.0)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hpad),
              child: Container(
                height: 75.0,
                alignment: Alignment.center,
                color: Colors.white,
                child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("+Add Address"),
                  elevation: 5.0,
                  onPressed: () {
                    print("Current Address");
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Container(
                height: 40.0,
                width: 250.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: RaisedButton(
                  color: Colors.green,
                  child: Text(
                    "PLACE ORDER",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  onPressed: () {
                    print("Your Grand total is ${getTotal() + fee}RS");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //widget for getting bill
  Widget getBillDetails() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: hpad),
      height: 165.00,
      //padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            child: ListTile(
              title: Text("Items Total"),
              trailing: Text("${getTotal()}"),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              title: Text("Delivery Fee"),
              trailing: Text("$fee"),
            ),
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.black),
                ),
                color: Colors.white),
            //color: Colors.white,
            child: ListTile(
              title: Center(
                child: Text("Total"),
              ),
              trailing: Text("${getTotal() + fee}"),
            ),
          )
        ],
      ),
    );
  }

  //widget for getting order list
  Widget getCartItemList() {
    List<CartItem> items = getCartItem();
    return CartItems(hpad: hpad, items: items, ordFont: ordFont);
  }

  double getTotal() {
    double total = 0;
    List<CartItem> ord = getCartItem();
    ord.forEach((order) {
      total += order.price * order.count;
    });
    return total;
  }

  //to get list of orders
  List<CartItem> getCartItem() {
    List<CartItem> order = List<CartItem>();
    order.add(CartItem("Biriyani", "Hotel A", 100.00, 1));
    order.add(CartItem("Fried Rice", "Hotel b", 125.00, 1));
    //  order.add(CartItem("Orange Juice","Hotel b",25.00,1));
    return order;
  }
}

class CartItems extends StatelessWidget {
  const CartItems({
    Key key,
    @required this.hpad,
    @required this.items,
    @required this.ordFont,
  }) : super(key: key);

  final double hpad;
  final List<CartItem> items;
  final double ordFont;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.00,
      padding: EdgeInsets.symmetric(horizontal: hpad),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5.0),
            color: Colors.white,
            child: ListTile(
              title: Text(
                items[index].name,
                style: TextStyle(fontSize: ordFont),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items[index].hotel,
                    style: TextStyle(fontSize: ordFont - 5.0),
                  ),
                  Text(
                    "${items[index].price},",
                    style: TextStyle(fontSize: ordFont - 2.0),
                  )
                ],
              ),
              trailing: Container(
                width: 75.0,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),

                //row for choosing count
                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.add,
                      ),
                      onTap: () {
                        print("${items[index].count} add");
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("${items[index].count}"),
                    ),
                    GestureDetector(
                        child: Icon(
                          Icons.remove,
                        ),
                        onTap: () {
                          print("${items[index].count} minus");
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}