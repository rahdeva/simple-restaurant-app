import 'package:flutter/material.dart';
import '../widgets/add_reviews.dart';
import '../data/model/resto_detail.dart';

class CustomerReviews extends StatelessWidget {
  final List<CustomerReview> review; 
  final String id;

  const CustomerReviews({super.key, required this.review, required this.id});

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
        AddReviews(ctx: context, id: id)
      ]
    );
  }
}
