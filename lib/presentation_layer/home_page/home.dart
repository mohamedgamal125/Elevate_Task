import 'package:elevate_task/bussinessLogic_layer/product_cubit/product_cubit.dart';
import 'package:elevate_task/data_layer/models/product_model.dart';
import 'package:elevate_task/utils/app_const/my_colors.dart';
import 'package:elevate_task/utils/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductCubit>(context).getAllProducts();
  }


  PreferredSizeWidget _buildAppBar()
  {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: _buildTitle(),
    );
  }

  Widget _buildLoadingIcon(){
    return CircularProgressIndicator(color: MyColors.borderColor,);
  }

  Widget _buildBlocBuilder(BuildContext context){

    return BlocBuilder<ProductCubit,ProductState>(
      builder:(context, state) {
      if(state is ProductLoading)
        {
          _buildLoadingIcon();
        }
      else if(state is ProductLoaded) {
          return GridView.builder(
              itemBuilder: (context, index) {
                return ProductCard(item: state.products[index]);
              },
              itemCount:state.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing:16 ,
                mainAxisSpacing:16 ,
                mainAxisExtent: MediaQuery.of(context).size.height - 652.h,
                crossAxisCount: 2,

              ));
        }
      else if(state is ProductError)
        {
          return SnackBar(content: Text("Check Your internet Connection"));
        }
      return Center(child: Text(''));
    },
    );
  }

 Widget _buildTitle(){
    return Column(
      children: [
        Row(

          children: [
            Image.asset('assets/images/appbar.png'),
          ],
        ),
        SizedBox(height: 12,),
        Row(
          children: [
            Expanded(
              flex: 12,

              child: Container(
                height: 45,
                child: TextField(

                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff004182)),
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: ImageIcon(
                        AssetImage("assets/images/searchicon.png"),
                        color: Color(0xff004182)),
                    labelText: "what do you search for? ",
                  ),
                ),
              ),
            ),

            Spacer(),
            ImageIcon(
              AssetImage("assets/images/shoppingicon.png"),
              color: Color(0xff004182),
            )
          ],
        ),
      ],
    );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body:_buildBlocBuilder(context),
    );
  }
}
