import 'package:app_sales29112021/data/datasources/remote/api/food_api.dart';
import 'package:app_sales29112021/data/models/food_model.dart';
import 'package:app_sales29112021/data/repositories/food_repository.dart';
import 'package:app_sales29112021/presentation/features/home/home_bloc.dart';
import 'package:app_sales29112021/presentation/features/home/home_event.dart';
import 'package:app_sales29112021/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'home_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FoodApi()),
        ProxyProvider<FoodApi, FoodRepository>(
          create: (context) => FoodRepository(context.read<FoodApi>()),
          update: (context, api, repository) {
            return FoodRepository(api);
          },
        ),
        ProxyProvider<FoodRepository, HomeBloc>(
          create: (context) => HomeBloc(context.read<FoodRepository>()),
          update: (context, repository, bloc) {
            return HomeBloc(repository);
          },
        ),
      ],
      child: HomeScreenContainer(),
    );
  }
}

class HomeScreenContainer extends StatefulWidget {
  const HomeScreenContainer({Key? key}) : super(key: key);

  @override
  _HomeScreenContainerState createState() => _HomeScreenContainerState();
}

class _HomeScreenContainerState extends State<HomeScreenContainer> {
  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeBloc>();
    bloc.add(FetchListFood());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: Container(
          child: BlocConsumer<HomeBloc, HomeStateBase>(
            bloc: bloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is FetchListFoodSuccess) {
                return ListView.builder(
                    itemCount: state.listFoods.length,
                    itemBuilder: (context, index) {
                      return _buildItemFood(state.listFoods[index]);
                    });
              }else if(state is HomeStateLoading){
                return Center(child: LoadingWidget());
              }else if (state is FetchListFoodError){
                return Center(child: Text(state.message));
              }else{
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildItemFood(FoodModel foodModel) {
    return Container(
      height: 135,
      child: Card(
        elevation: 5,
        shadowColor: Colors.blueGrey,
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(foodModel.images![0].imageUrl!,
                    width: 150, height: 120, fit: BoxFit.fill),
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
                      ElevatedButton(
                        onPressed: () {
                          // bloc.eventSink
                          //     .add(HomeEventAddCart(foodId: product.foodId!));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Color.fromARGB(200, 240, 102, 61);
                              } else {
                                return Color.fromARGB(230, 240, 102, 61);
                              }
                            }),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))))),
                        child:
                        Text("Add To Cart", style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
