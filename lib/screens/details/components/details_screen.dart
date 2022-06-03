// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../contants.dart';
import '../../../models/product.dart';
import 'color_dot.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.backgroundcolor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                height: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            product.image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: CustomSizes.defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                  CustomSizes.defaultPadding,
                  CustomSizes.defaultPadding * 2,
                  CustomSizes.defaultPadding,
                  CustomSizes.defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(CustomSizes.defaultBorderRadius * 3),
                  topRight:
                      Radius.circular(CustomSizes.defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: CustomSizes.defaultPadding),
                      Text(
                        "\$ ${product.price.toString()}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: CustomSizes.defaultPadding),
                    child: Text("Lorem ipsum"),
                  ),
                  Text(
                    "Colors",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const SizedBox(height: CustomSizes.defaultPadding / 2),
                  Row(
                    children: const [
                      ColorDot(
                        color: Color(0xFFBEE8EA),
                        isActive: false,
                      ),
                      ColorDot(
                        color: Color(0xFF141B4A),
                        isActive: true,
                      ),
                      ColorDot(
                        color: Color(0xFFF4E5C3),
                        isActive: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: CustomSizes.defaultPadding * 2),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: CustomColors.primaryColor,
                            shape: const StadiumBorder()),
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
