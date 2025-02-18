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
              child: ListTile(
                title: Text(review[i].name!,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold
                  )
                ),
                subtitle: Text(
                  review[i].review!,
                  style: Theme.of(context).textTheme.labelMedium
                ),
                trailing: Text(
                  review[i].date!,
                  style: Theme.of(context).textTheme.labelMedium
                ),
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
