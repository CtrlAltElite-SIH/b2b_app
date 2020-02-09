import 'package:flutter/material.dart';
import 'package:b2b_app/Shared/app_style.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> checkbox_tapped = [0, 0];
  List<int> count = [1, 1];
  int value = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text('My Cart'),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: InkWell(
                  child: checkbox_tapped[index] == 0
                      ? Icon(Icons.check_circle_outline)
                      : Icon(Icons.check_circle),
                  onTap: () {
                    setState(() {
                      checkbox_tapped[index] =
                          checkbox_tapped[index] == 0 ? 1 : 0;
                    });
                  },
                ),
              ),
              Expanded(
                child: Card(
                    elevation: 2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('Product Name',
                                  style: AppStyle.loginPageStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                width: 100,
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                height: 2,
                                width: 10,
                                color: Colors.red,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Text('100.00', style: TextStyle(fontSize: 15)),
                              SizedBox(
                                width: 200,
                              ),
                              InkWell(
                                child: Icon(Icons.arrow_downward),
                                onTap: () {
                                  setState(() {
                                    value =
                                        count[index] > 1 ? value - 100 : value;
                                    count[index] =
                                        count[index] > 1 ? count[index] - 1 : 1;
                                  });
                                },
                              ),
                              Text(count[index].toString()),
                              InkWell(
                                  child: Icon(Icons.arrow_upward),
                                  onTap: () {
                                    setState(() {
                                      value = value + 100;
                                      count[index] = count[index] + 1;
                                    });
                                  }),
                            ],
                          ),
                        ])),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("Total Amount"),
                subtitle: Text(value.toString()),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    count = [1, 1];
                    value=200;
                  });
                },
                child: Text("Purchase",style: TextStyle(color: Colors.white),),
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
