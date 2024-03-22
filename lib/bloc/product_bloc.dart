

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/api/online_saling.dart';
import '../Repository/model_class/stories_real_time.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  late StoriesRealTime store;
  store1 productApi=store1();
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {emit(ProductBlocloading());
    try{
      store =await productApi.getAnime();
      emit(ProductBlocLoaded());
    } catch(e){
      print(e);
      emit(ProductBlocError());}
    });
      // TODO: implement event handler

  }
}
