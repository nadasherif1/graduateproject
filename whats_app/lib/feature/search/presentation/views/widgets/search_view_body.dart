import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/core/utils/styles.dart';
import 'package:whats_app/core/utils/widgets/custom_Loading.dart';
import 'package:whats_app/feature/search/presentation/manager/searchusers/searchusers_cubit.dart';
import 'package:whats_app/feature/search/presentation/views/widgets/all_users_listview.dart';
import 'package:whats_app/feature/search/presentation/views/widgets/custom_appbar_search.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(left: 20, top: 60, right: 20),
          sliver: SliverList(
              delegate: SliverChildListDelegate([
            CustomAppBarSearch(
              onChanged: (p0) {
                BlocProvider.of<SearchusersCubit>(context)
                    .filterNames(name: p0);
              },
            ),
            BlocBuilder<SearchusersCubit, SearchusersState>(
              builder: (context, state) {
                if (state is SearchusersInitial) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 15, top: 20, bottom: 20),
                    child: Text(
                      'All Users',
                      style: Styles.textStyle16,
                    ),
                  );
                } else if (state is SearchusersFilter) {
                  return const SizedBox(
                    height: 20,
                  );
                } else {
                  return const SizedBox(
                    height: 40,
                  );
                }
              },
            ),
          ])),
        ),
        BlocBuilder<SearchusersCubit, SearchusersState>(
          builder: (context, state) {
            if (state is SearchusersFilter) {
              return SliverPadding(
                padding: const EdgeInsets.only(left: 20, bottom: 60, right: 20),
                sliver: AllUsersListview(
                  names: state.filterNames,
                ),
              );
            }
            if (state is SearchusersInitial) {
              return SliverPadding(
                padding: const EdgeInsets.only(left: 20, bottom: 60, right: 20),
                sliver: AllUsersListview(
                  names: state.names,
                ),
              );
            } else if (state is SearchusersLoading) {
              return const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 60, right: 20),
                  child: CustomLoading(),
                ),
              );
            } else {
              return const SliverToBoxAdapter(
                  child: Text(
                'No Results',
                style: Styles.textStyle16,
                textAlign: TextAlign.center,
              ));
            }
          },
        )
      ],
    );
  }
}
