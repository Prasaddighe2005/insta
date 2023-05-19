import 'package:flutter/material.dart';

import '../app_spacings.dart';
import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const _InstagramProfileAppBar(),
          const SliverToBoxAdapter(child: ProfileHeader()),
          SliverPersistentHeader(
            pinned: true,
            delegate: ProfileTabbar(
              child: Container(
                color: Colors.white,
                child: const TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.grid_on),
                    ),
                    Tab(
                      icon: Icon(Icons.assignment_ind_outlined),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: const TabBarView(
          children: [
            _ProfileGridView(),
            _ProfileGridView(),
          ],
        ),
      ),
    );
  }
}

class _ProfileGridView extends StatelessWidget {
  const _ProfileGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];
        return Container(
          color: Colors.grey,
          child: Image.asset(
            post,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

class ProfileTabbar extends SliverPersistentHeaderDelegate {
  final Widget child;

  ProfileTabbar({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 48;

  @override
  // TODO: implement minExtent
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacings.l),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _ProfileInfo(),
          SizedBox(height: AppSpacings.l),
          _ProfileBio(),
          SizedBox(height: AppSpacings.l),
          // _ProfileButtons(),
          _StoryHighlights(),
        ],
      ),
    );
  }
}

class _StoryHighlights extends StatelessWidget {
  const _StoryHighlights({
    Key? key,
  }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 90,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         itemCount: Highlight.highlights.length,
//         itemBuilder: (BuildContext context, int index) {
//           final highlight = Highlight.highlights[index];
//           return Container(
//             margin: const EdgeInsets.only(right: AppSpacings.l),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Container(
//                     height: 62,
//                     width: 62,
//                     padding: const EdgeInsets.all(AppSpacings.s),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade300),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Container(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.grey,
//                         border: Border.all(color: Colors.grey.shade300),
//                         image: DecorationImage(
//                           image: AssetImage(highlight.image),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: AppSpacings.s),
//                 Text(
//                   highlight.name,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class _ProfileButtons extends StatelessWidget {
//   const _ProfileButtons({
//     Key? key,
//   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacings.xl),
            ),
          ),
          child: Text(
            "Edit Profile",
            style: Theme.of(context).textTheme.button,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacings.xl),
                  ),
                ),
                child: Text(
                  "Following",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
            const SizedBox(width: AppSpacings.s),
            Icon(Icons.keyboard_arrow_down),
            Expanded(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacings.xxl),
                  ),
                ),
                child: Text(
                  "Message",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
            const SizedBox(width: AppSpacings.m),
            Icon(Icons.contact_emergency),
          ],
        ),
      ],
    );
  }
}

class _ProfileBio extends StatelessWidget {
  const _ProfileBio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mahesh Ghule Flutter Dev \n ignore is best insult in the world💯\n #flutter_devoloper💻✨\n#softwere_devoloper💕",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacings.s),
        
        const SizedBox(height: AppSpacings.s),
      ],
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _ProfileImage(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _ProfileFollowersCountWidget(
                count: "0",
                title: "Posts",
              ),
              _ProfileFollowersCountWidget(
                count: "0",
                title: "Followers",
              ),
              _ProfileFollowersCountWidget(
                count: "0",
                title: "Following",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileFollowersCountWidget extends StatelessWidget {
  const _ProfileFollowersCountWidget({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  final String title, count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(title),
      ],
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
            image: DecorationImage(
              image: AssetImage("mahesh.png"),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}

class _InstagramProfileAppBar extends StatelessWidget {
  const _InstagramProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: Row(
        children: const [
          Text(
            "its mahi",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_box_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.dehaze_outlined),
        ),
      ],
    );
  }
}
