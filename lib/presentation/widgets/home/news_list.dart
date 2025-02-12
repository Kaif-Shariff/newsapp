import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/presentation/screens/article_screen.dart';

import '../../../core/apptheme/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/getTheme.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      sampleImage,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: SizedBox(height: 30),
                          ),
                          TextSpan(
                            text: "$sampleHeading\n",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isLightTheme(context) ? AppColors.lightTextColor2 : AppColors.lightTextColor,
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(height: 45),
                          ),
                          TextSpan(
                            text: "February 12, 2025   •   Wired",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.lightTextColor,
                            ),
                          ),
                        ],
                      ),
                      maxLines: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
