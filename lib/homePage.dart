// ignore_for_file: prefer_const_constructors
import 'package:card_test_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_test_app/scopri.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'model/customeshape.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int imageIndex = 0;
  //Here I am using Index to control what product image is displayed
  void _previousImage() {
    setState() {
      imageIndex = imageIndex > 0 ? imageIndex - 1 : 0;
    }
  }
  void _nextImage() {
    setState() {
      imageIndex = imageIndex < products[0].img.length - 1 ? imageIndex + 1 : 0;
    }
  }

  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 850,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 60,
              mainAxisSpacing: 30,
              childAspectRatio: 0.51 / 0.8222,
            ),
            padding: const EdgeInsets.all(20),
            children: products.map((product) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 850,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 45,
                        width: 800,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // GestureDetector(),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                                left: 10,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  product.like
                                      ? Icons.favorite_border
                                      : Icons.favorite,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                onPressed: null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 15,
                                top: 0,
                              ),
                              child: SizedBox(
                                height: 45,
                                width: 45,
                                child: CustomPaint(
                                  size: const Size(28, 45),
                                  painter: CustomShape(product.nuovo),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 27,
                                        left: 1,
                                        right: 1,
                                        bottom: 0,
                                      ),
                                      child: product.nuovo
                                          ? Text(
                                              'NUOVO',
                                              style: GoogleFonts.barlow(
                                                fontSize: 14,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : Text(
                                              'USATO',
                                              style: GoogleFonts.barlow(
                                                fontSize: 14,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ) //
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        fit: StackFit.loose,
                        children: [
                          for (var currentImage in product.img)
                            Image.asset(product.img[imageIndex],
                                fit: BoxFit.cover),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded),
                                onPressed: _nextImage,
                                color: Colors.grey[900],
                                iconSize: 15,
                              ),
                              const SizedBox(width: 20.0),
                              IconButton(
                                icon:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                                onPressed: _previousImage,
                                color: Colors.grey[900],
                                iconSize: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                      //Here I put a LinearProgressIndicator to show the Index state of the images in case that was what was intended, it wasn't clear to me on the example
                      LinearProgressIndicator(
                        minHeight: 4,
                        backgroundColor: Colors.grey[300],
                        color: Colors.grey[800],
                        value: 0.2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                            height: 240,
                            width: 443.0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      product.brand,
                                      style: GoogleFonts.archivo(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 130,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            RatingStars(
                                              starSize: 13,
                                              starBuilder: (index, color) =>
                                                  Icon(
                                                Icons.star_rate_rounded,
                                                color: color,
                                                size: 17,
                                              ),
                                              starCount: 5,
                                              valueLabelRadius: 5,
                                              maxValue: 5,
                                              value: product.star,
                                              starSpacing: 3,
                                              maxValueVisibility: true,
                                              valueLabelVisibility: false,
                                              starOffColor: Color(0xFFEEEEEE),
                                              starColor: Color(0xFF212121),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 7,
                                                right: 5,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  product.reviers,
                                                  style: GoogleFonts.barlow(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 5,
                                ),
                                child: Text(
                                  product.model,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 24,
                                      fontFamily: 'Archivo-BlackItalic'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 5,
                                  top: 5,
                                ),
                                child: Text(
                                  product.description,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.archivo(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 95,
                                  color: Colors.grey[600],
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Center(
                                          child: Text(
                                            product.type,
                                            style: GoogleFonts.barlow(
                                                color: Colors.grey[300],
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        Text(
                                          product.format,
                                          style: GoogleFonts.barlow(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                color: Colors.grey[200],
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                        child: Text(
                                          'TAGLIA ',
                                          style: GoogleFonts.barlow(
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        product.sizes,
                                        style: GoogleFonts.barlow(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 3,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 70,
                                  color: Colors.grey[200],
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Center(
                                          child: Text(
                                            'COLORI ',
                                            style: GoogleFonts.barlow(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          product.colors,
                                          style: GoogleFonts.barlow(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            left: 10,
                            bottom: 19,
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.price,
                                  style: GoogleFonts.barlow(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  product.previousPrice,
                                  style: GoogleFonts.barlow(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                      fontStyle: FontStyle.italic),
                                ),
                              ]),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60,
                            width: 160,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 0,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isSelected = !_isSelected;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      height: 22,
                                      width: 22,
                                      decoration: BoxDecoration(
                                        color: _isSelected
                                            ? Colors.black
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        border: _isSelected
                                            ? null
                                            : Border.all(
                                                color: Colors.black,
                                                width: 2.0,
                                              ),
                                      ),
                                      child: _isSelected
                                          ? Icon(
                                              Icons.check,
                                              size: 15,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                  ),
                                  Text(
                                    'COMPARA',
                                    style: GoogleFonts.archivo(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              height: 55,
                              width: 130,
                              color: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 5.0,
                                  left: 15,
                                  right: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'SCOPRI',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_right_alt_rounded,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context, Scopri());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
