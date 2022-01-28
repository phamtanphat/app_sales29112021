import 'package:app_sales29112021/data/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class CartScreen extends StatefulWidget {

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return CartScreenContainer();
  }
}

class CartScreenContainer extends StatefulWidget {
  const CartScreenContainer({Key? key}) : super(key: key);

  @override
  _CartScreenContainerState createState() => _CartScreenContainerState();
}

class _CartScreenContainerState extends State<CartScreenContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: 10,
            //       itemBuilder: (lstContext, index) =>
            //           _buildItem(cartModel.items![index], context)),
            // ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                    "Tổng tiền : " +
                        NumberFormat("#,###", "en_US")
                            .format(100000) +
                        " đ",
                    style: TextStyle(fontSize: 25, color: Colors.white))),
            Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.deepOrange)),
                  child: Text("Confirm",
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                )),
          ],
        ),
      )
    );
  }
  // Widget _buildItem(FoodModel foodModel, BuildContext context) {
  //   return Container(
  //     height: 135,
  //     child: Card(
  //       elevation: 5,
  //       shadowColor: Colors.blueGrey,
  //       child: Container(
  //         padding: EdgeInsets.only(top: 5, bottom: 5),
  //         child: Row(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(2),
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(5),
  //                 child: Image.network(foodModel.images![0].imageUrl!,
  //                     width: 150, height: 120, fit: BoxFit.fill),
  //               ),
  //             ),
  //             Expanded(
  //               child: Padding(
  //                 padding: const EdgeInsets.only(left: 5),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Padding(
  //                       padding: const EdgeInsets.only(top: 5),
  //                       child: Text(foodModel.foodName!,
  //                           maxLines: 1,
  //                           overflow: TextOverflow.ellipsis,
  //                           style: TextStyle(fontSize: 16)),
  //                     ),
  //                     Text(
  //                         "Giá : " +
  //                             NumberFormat("#,###", "en_US")
  //                                 .format(foodModel.price) +
  //                             " đ",
  //                         style: TextStyle(fontSize: 12)),
  //                     Row(
  //                       children: [
  //                         ElevatedButton(
  //                           onPressed: () {
  //
  //                           },
  //                           child: Text("-"),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.symmetric(horizontal: 15),
  //                           child: Text(foodModel.quantity.toString(),
  //                               style: TextStyle(fontSize: 16)),
  //                         ),
  //                         ElevatedButton(
  //                           onPressed: () {
  //                            },
  //                           child: Text("+"),
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             Center(
  //               child: IconButton(
  //                 icon: Icon(Icons.delete , color: Colors.red,),
  //                 onPressed: (){
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

