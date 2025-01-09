import 'package:bloc/bloc.dart';
import 'package:elevate_task/data_layer/repo/product_repo.dart';
import 'package:meta/meta.dart';

import '../../data_layer/models/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.productRepo}) : super(ProductInitial());

  final ProductRepo productRepo;

  void getAllProducts (){
    try{

      productRepo.getAllProducts().then((products){
        emit(ProductLoaded(products: products));
      });

    }catch(e){
      print(e.toString());
      emit(ProductError(error: e.toString()));
    }
  }
}
