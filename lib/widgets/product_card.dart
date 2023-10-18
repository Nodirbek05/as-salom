import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/widgets/main_button.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatefulWidget {
  final int index;
  final bool withHeight;
  final double? height;
  const ProductCardWidget(
      {super.key, required this.index, required this.withHeight, this.height});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: 160,
            height: widget.withHeight ? widget.height : null,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1), // color of grid items

              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/product_image.png")),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    height: 110,
                  ),
                  Text(
                    '19 000 сум',
                    style: Styles.style600sp14Main,
                  ),
                  Text(
                    '34 000 сум',
                    style: Styles.style400sp12GreyUnderline,
                  ),
                  Text(
                    'Молоко 2,5 % “Простоквашино”...',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.styles400sp16Black,
                  ),
                  MainButtonWidget(
                    text: "В корзину",
                    onTap: () {},
                    width: 140,
                  )
                ],
              ),
            )),
        const Positioned(
            top: 10,
            right: 20,
            child: CircleAvatar(
              backgroundColor: ConstColor.mainWhite,
              radius: 17,
              child: Icon(
                Icons.favorite,
                color: ConstColor.as_salomText,
              ),
            ))
      ],
    );
  }
}
