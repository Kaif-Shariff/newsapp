import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/widgets/home/custom_list_tile.dart';
import '../../../core/apptheme/colors.dart';
import '../../../core/error/error_widget.dart';
import '../../../state/article/article_bloc.dart';
import '../../../state/article/article_event.dart';
import '../../../state/article/article_state.dart';

class NewsList extends StatefulWidget {
  final String topic;

  const NewsList({
    super.key,
    required this.topic,
  });

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticleBloc>().add(FetchCategory(widget.topic, 20));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleLoading) {
          return SliverToBoxAdapter(
            child: SizedBox(
              child: Center(
                  child: CircularProgressIndicator(
                color: AppColors.blue,
              )),
            ),
          );
        } else if (state is ArticleError) {
          return state.statusCode == 429
              ? MyErrorWidget(width: width, height: height, message: "Api Exhausted")
              : SliverToBoxAdapter(
                  child: Center(
                    child: Text("Something went wrong"),
                  ),
                );
        } else if (state is ArticleLoaded) {
          final articles = state.articles;

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: articles.length,
              (context, index) {
                final article = articles[index];
                return CustomListTile(article: article);
              },
            ),
          );
        }
        return SliverToBoxAdapter(
          child: SizedBox(
            child: Center(child: Text("Something went horribly wrong")),
          ),
        );
      },
    );
  }
}
