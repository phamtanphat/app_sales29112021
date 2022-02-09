import 'package:app_sales29112021/data/datasources/remote/api/cart_api.dart';
import 'package:app_sales29112021/data/models/food_model.dart';
import 'package:app_sales29112021/data/repositories/cart_repository.dart';
import 'package:app_sales29112021/presentation/features/cart/cart_state.dart';
import 'package:app_sales29112021/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'cart_bloc.dart';
import 'cart_event.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => CartApi()),
          ProxyProvider<CartApi,CartRepository>(
            create: (context) => CartRepository(context.read<CartApi>()),
            update: (context , cartApi , repository){
              return CartRepository(cartApi);
            },
          ),
          ProxyProvider<CartRepository,CartBloc>(
            create: (context) => CartBloc(context.read<CartRepository>()),
            update: (context , repository , bloc){
              return CartBloc(repository);
            },
          )
        ],
        child: CartScreenContainer()
    );
  }
}

class CartScreenContainer extends StatefulWidget {
  const CartScreenContainer({Key? key}) : super(key: key);

  @override
  _CartScreenContainerState createState() => _CartScreenContainerState();
}

class _CartScreenContainerState extends State<CartScreenContainer> {

  late CartBloc bloc;
  late String orderId;

  @override
  void initState() {
    super.initState();
    bloc = context.read<CartBloc>();
    bloc.add(FetchListCart());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    orderId = ModalRoute.of(context)!.settings.arguments as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: BlocConsumer<CartBloc,CartStateBase>(
            bloc: bloc,
            listener: (context ,state){
              if(state is UpdateCartSuccess){
                bloc.add(FetchListCart());
              }
            },
            builder: (context, state) {
              if(state is FetchCartSuccess){
                if(state.cartModel != null && state.cartModel!.items != null){
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.cartModel!.items!.length,
                            itemBuilder: (lstContext, index) =>
                                _buildItem(state.cartModel!.items![index], context)),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: Text(
                              "Tổng tiền : " +
                                  NumberFormat("#,###", "en_US").format(state.cartModel!.total) +
                                  " đ",
                              style: TextStyle(fontSize: 25, color: Colors.white))),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.deepOrange)),
                            child: Text("Confirm",
                                style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                          )),
                    ],
                  );
                }else{
                  return Center(child: Text("Ban chua co san pham nao"));
                }
              }else if (state is FetchCartError){
                return Center(child: Text(state.message));
              }else if (state is CartLoading){
                return Center(child: LoadingWidget());
              }
              return SizedBox();

            },
          ),
        ));
  }
Widget _buildItem(FoodModel foodModel, BuildContext context) {
  return Container(
    height: 135,
    child: Card(
      elevation: 5,
      shadowColor: Colors.blueGrey,
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(foodModel.images![0].imageUrl!,
                    width: 150, height: 120, fit: BoxFit.fill),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(foodModel.foodName!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16)),
                    ),
                    Text(
                        "Giá : " +
                            NumberFormat("#,###", "en_US")
                                .format(foodModel.price) +
                            " đ",
                        style: TextStyle(fontSize: 12)),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (foodModel.quantity! > 1 ){
                              bloc.add(UpdateCart(orderId: orderId, foodId: foodModel.foodId!, quantity: foodModel.quantity! - 1));
                            }
                          },
                          child: Text("-"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(foodModel.quantity.toString(),
                              style: TextStyle(fontSize: 16)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            bloc.add(UpdateCart(orderId: orderId, foodId: foodModel.foodId!, quantity: foodModel.quantity! + 1));
                          },
                          child: Text("+"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: IconButton(
                icon: Icon(Icons.delete , color: Colors.red,),
                onPressed: (){
                  bloc.add(DeleteItemCart(foodId: foodModel.foodId!));
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
