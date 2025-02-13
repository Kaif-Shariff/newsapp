import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/widgets/home/news_list.dart';
import 'package:newsapp/state/category/category_event.dart';
import '../../state/category/category_bloc.dart';
import '../../state/category/category_state.dart';

class CategoryScreen extends StatefulWidget {
  final String topicName;

  const CategoryScreen({super.key, required this.topicName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _fetchCategoryNews();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= 200) {
      final state = context.read<CategoryBloc>().state;
      if (state is CategoryLoaded && !state.hasReachedMax && !state.isLoadingMore) {
        final nextPage = state.page + 20;
        context.read<CategoryBloc>().add(FetchCategoryEvent(widget.topicName, nextPage));
      }
    }
  }

  void _fetchCategoryNews() {
    context.read<CategoryBloc>().add(ResetCategoryEvent());
    context.read<CategoryBloc>().add(FetchCategoryEvent(widget.topicName, 20));
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(title: Text(widget.topicName)),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          NewsList(width: width, height: height),
        ],
      ),
    );
  }
}
