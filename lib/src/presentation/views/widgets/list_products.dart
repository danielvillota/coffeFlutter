import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:coffe/src/utils/constants/colors.dart';
import 'package:coffe/src/data/services/firebase/firestore.dart';

class ListProducts extends StatefulWidget {
  const ListProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: RefreshIndicator(
          onRefresh: () async {
            await getAllCollection(nameCollection: 'products');
            setState(() {});
          },
          child: FutureBuilder(
            future: getAllCollection(nameCollection: 'products'),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;

                return ListView.builder(
                  itemExtent: 120.0, // Puedes ajustar esta altura según tus necesidades
                  itemCount: data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0), // Agregado espacio entre filas
                      child: GestureDetector(
                        onTap: () {
                          // Manejar el evento de toque
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: NetworkImage(data?[index]['img']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data?[index]['title'],
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: textSecondary,
                                      fontSize: 22,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row (
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/shopping-bag.svg',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '\$${data?[index]['price']} USD',
                                        style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}