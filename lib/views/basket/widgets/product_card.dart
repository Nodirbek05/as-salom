import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/constant/api_paths.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/icons_page.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';

class BasketProductCardWidget extends StatefulWidget {
  final BasketModel product;
  const BasketProductCardWidget({super.key, required this.product});

  @override
  State<BasketProductCardWidget> createState() =>
      _BasketProductCardWidgetState();
}

class _BasketProductCardWidgetState extends State<BasketProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ConstColor.dotColor),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    deleteDrugFromBasket(widget.product.id);
                  },
                  child: SvgPicture.asset(
                    ConstIcons.delete,
                  ),
                ),
                ScreenUtil().setHorizontalSpacing(10),
                Container(
                  height: 64.h,
                  width: 64.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            ApiPaths.imageUrl + widget.product.image),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10.r),
                    color: ConstColor.dotColor,
                  ),
                ),
                ScreenUtil().setHorizontalSpacing(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: Styles.style500sp14Black,
                    ),
                    Text(
                      widget.product.type,
                      style: Styles.style400sp13Grey,
                    ),
                  ],
                ),
              ],
            ),
            ScreenUtil().setVerticalSpacing(30),
            Row(
              children: [
                Text(
                  widget.product.price,
                  style: Styles.style600sp14Main,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      decreaseQuantity(widget.product.id);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 36.h,
                    width: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color: ConstColor.dotColor,
                      ),
                    ),
                    child: Text(
                      "-",
                      style: Styles.style400sp14Black,
                    ),
                  ),
                ),
                ScreenUtil().setHorizontalSpacing(10),
                Text(widget.product.qty.toString()),
                ScreenUtil().setHorizontalSpacing(10),
                InkWell(
                  onTap: () {
                    setState(() {
                      increaseQuantity(widget.product.id);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 36.h,
                    width: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color: ConstColor.dotColor,
                      ),
                    ),
                    child: Text(
                      "+",
                      style: Styles.style400sp14Black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void increaseQuantity(num drugId) {
    final box = Hive.box<BasketModel>('basketBox').values.toList();
    for (var product in box) {
      if (drugId == product.id) {
        print("DRUG Quantity increase");
        product.qty++;
        print("DRUG Quantity ${product.qty}");
        break;
      }
    }
  }

  void decreaseQuantity(num drugId) {
    final box = Hive.box<BasketModel>('basketBox').values.toList();
    for (var product in box) {
      if (drugId == product.id) {
        print("DRUG Quantity decrease");
        product.qty--;
        print("DRUG Quantity ${product.qty}");
        break;
      }
    }
  }

  num getDrugQty(num drugId) {
    num qty = 0;
    final drugBasket = Hive.box<BasketModel>('basketBox').values.toList();
    for (var prod in drugBasket) {
      if (prod.id == drugId) {
        qty = prod.qty;
      }
    }
    return qty;
  }

  void addDrugToBasket(
    int productId,
    String name,
    String type,
    String price,
    int qty,
  ) {
    final product = BasketModel()
      ..id = productId
      ..name = name
      ..type = type
      ..price = price
      ..qty = qty;
    final box = Hive.box<BasketModel>('basketBox');
    box.add(product);
  }

  void deleteDrugFromBasket(num drugId) {
    final box = Hive.box<BasketModel>('basketBox').values.toList();
    final listProducts = Hive.box<BasketModel>('basketBox');
    for (var product in box) {
      if (drugId == product.id) {
        print("DRUG REMOVED FROM BASKET");
        listProducts.delete(product.key);
        break;
      }
    }
  }

  bool isProductInHive(int productId) {
    final savedProductList = Hive.box<BasketModel>('basketBox').values.toList();
    var product = null;
    for (var prod in savedProductList) {
      if (prod.id == productId) {
        product = prod;
      }
    }
    return product != null;
  }
}
