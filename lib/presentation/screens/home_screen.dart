import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/category/category_bloc.dart';
import '../../state/category/category_event.dart';
import '../../state/category/category_state.dart';
import '../widgets/home/carouselContainer.dart';
import '../widgets/home/news_list.dart';
import '../widgets/home/tabSlider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        context.read<CategoryBloc>().add(FetchCategoryEvent("general", nextPage));
      }
    }
  }

  void _fetchCategoryNews() {
    context.read<CategoryBloc>().add(ResetCategoryEvent());
    context.read<CategoryBloc>().add(FetchCategoryEvent("general", 20));
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CarouselContainer(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: TabSlider(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 5,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Latest News",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
            ),
          ),
          NewsList(width: width, height: height),
        ],
      ),
    );
  }
}
