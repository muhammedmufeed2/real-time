import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_product/bloc/product_bloc.dart';

import '../Repository/model_class/stories_real_time.dart';


class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(Fetchproduct());
    // TODO: implement initState
    super.initState();
  }

  late StoriesRealTime data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductBlocloading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductBlocError) {
          return Center(
            child: Text("Error"),
          );
        }
        if (state is ProductBlocLoaded) {
          data = BlocProvider.of<ProductBloc>(context).store;
          return ListView.builder(
              itemCount: data.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 350,
                  child: Column(
                    children: [
                      Text(data.data![index].productId==null?"":data.data![index].productId.toString()),
                      Text(data.data![index].productTitle.toString()),

                        Image.network(data.data![index].productPhotos![0].toString()),
                      Text(data.data![index].productAttributes!.department.toString()),
                      Text(data.data![index].productAttributes!.size.toString())
                    ],
                  ),
                );
              });
        } else {
          return SizedBox();
        }
      }),
    );
  }
}
