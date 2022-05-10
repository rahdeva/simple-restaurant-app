import 'package:flutter/material.dart';
import '../data/model/resto_detail.dart';

class CustomerReviews extends StatelessWidget {
  final List<CustomerReview> review; 

  const CustomerReviews({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: review.length,
          itemBuilder: (context, i) {
            return Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              child: ListTile(
                title: Text(review[i].name!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(review[i].review!),
                trailing: Text(review[i].date!),
                dense: true,
              ),
            );
          }
        ),


      ]
    );
  }
}
