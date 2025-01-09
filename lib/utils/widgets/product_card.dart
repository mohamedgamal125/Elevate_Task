
import 'package:elevate_task/data_layer/models/product_model.dart';
import 'package:elevate_task/utils/app_const/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductCard extends StatelessWidget {
  final ProductModel item;

  ProductCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: MyColors.borderColor,
          width: 3.0.w,
        ),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  item.image.isNotEmpty ? item.image : "https://via.placeholder.com/150",
                  fit: BoxFit.fitHeight,
                  width: 191.w,
                  height: 150.h,
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: MyColors.textColor,
                      ),
                    ),
                    SizedBox(height: 8.h,),

                    Row(

                      children: [
                        Expanded(
                          child: Text(
                            "EGP ${item.price.toStringAsFixed(1)}",
                            style: TextStyle(
                              fontSize: 13.0.sp,
                              color: MyColors.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),


                        Expanded(
                          child: Text(
                            " EGP${(item.price / (50/100)).toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: MyColors.oldPriceColor,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8.0.h),

                    Row(
                      children: [
                        Text(
                          "Review (${item.rating.rate})",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: MyColors.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 4.0.w),
                        SvgPicture.asset(
                          'assets/images/starIcon.svg',
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          'assets/images/plusCircleIcon.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/images/heartCircleIcon.svg',
          ),
        ],
      ),
    );
  }
}
