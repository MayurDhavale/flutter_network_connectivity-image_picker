import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousesliderExample extends StatefulWidget {
  const CarousesliderExample({super.key});

  @override
  State<CarousesliderExample> createState() => _CarousesliderExampleState();
}

class _CarousesliderExampleState extends State<CarousesliderExample> {
  final List<String> imgList = [
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.hindustantimes.com%2Fcricket%2Fcsk-ceos-candid-admission-on-ms-dhoni-keeping-his-cards-close-to-his-chest-comes-out-at-last-moment-101731167224577.html&psig=AOvVaw1reCapdDiYb_7cZkRHLvyC&ust=1731586252738000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCPCth86j2YkDFQAAAAAdAAAAABAE',
    'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcR6AK1OtJ2FXnHR6omrAJwzJUpDnlRN4K-L3NfsTyFLYE2M4MFb26tkd0lxmNiNcEtINJw_Bjvc3RrQysQ',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FRohit_Sharma&psig=AOvVaw3EPtjheOB7mxsJxGpKx3wT&ust=1731586311543000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCNCarOqj2YkDFQAAAAAdAAAAABAE'
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carouseslider Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Center(
                        child: Image.network(e),
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (value, _) {
                    setState(() {
                      _currentPage = value;
                    });
                  }),
            ),
            buildCarouseIndicator()
          ],
        ),
      ),
    );
  }

  buildCarouseIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: EdgeInsets.all(5),
            height: i == _currentPage ? 7 : 5,
            width: i == _currentPage ? 7 : 5,
            decoration: BoxDecoration(
              color: i == _currentPage ? Colors.black : Colors.grey,
              shape: BoxShape.circle,
            ),
          )
      ],
    );
  }
}
