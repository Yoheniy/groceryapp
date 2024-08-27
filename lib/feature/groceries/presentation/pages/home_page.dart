import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocessary/feature/groceries/domain/entity/groceryItem_entity.dart';
import 'package:grocessary/feature/groceries/presentation/bloc/grocery_bloc.dart';
import 'package:grocessary/feature/groceries/presentation/widgets/product_card.dart';
import 'package:grocessary/feature/groceries/presentation/pages/grocery_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Trigger event to load all groceries when the page is initialized
    context.read<GroceryBloc>().add(LoadAllGroceriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.asset('assets/images/appbarimage.png', fit: BoxFit.cover), // Correct path for asset
                  ),
                  Text(
                    " Burger",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.toc_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<GroceryBloc, GroceryState>(
                builder: (context, state) {
                  if (state is GroceryLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is LoadedAllGroceriesState) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<GroceryBloc>().add(LoadAllGroceriesEvent());
                      },
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: state.groceries.length,
                        itemBuilder: (context, index) {
                          final grocery = state.groceries[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/grocery_detail_page',
                                arguments: grocery,
                              );
                            },
                            child: ProductCard(
                              imageUrl: grocery.imageUrl, // Use imageUrl from API
                              title: grocery.title,
                              rating: grocery.rating.toString(),
                              price: grocery.price, // Pass price as double
                              discount: grocery.discount, // Pass discount value from API
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is GroceryErrorState) {
                    return Center(child: Text(state.message));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
