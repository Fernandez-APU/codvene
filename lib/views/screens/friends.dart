// import 'package:flutter/material.dart';
// import 'package:social_app_ui/util/data.dart';

// class Friends extends StatefulWidget {
//   @override
//   _FriendsState createState() => _FriendsState();
// }

// class _FriendsState extends State<Friends> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           decoration: InputDecoration.collapsed(
//             hintText: 'Search',
//           ),
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(
//               Icons.filter_list,
//             ),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: ListView.separated(
//         padding: EdgeInsets.all(10),
//         separatorBuilder: (BuildContext context, int index) {
//           return Align(
//             alignment: Alignment.centerRight,
//             child: Container(
//               height: 0.5,
//               width: MediaQuery.of(context).size.width / 1.3,
//               child: Divider(),
//             ),
//           );
//         },
//         itemCount: friends.length,
//         itemBuilder: (BuildContext context, int index) {
//           Map friend = friends[index];
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: AssetImage(
//                   friend['dp'],
//                 ),
//                 radius: 25,
//               ),
//               contentPadding: EdgeInsets.all(0),
//               title: Text(friend['name']),
//               subtitle: Text(friend['status']),
//               trailing: friend['isAccept']
//                   ? TextButton(
//                       child: Text(
//                         "Unfollow",
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(Colors.grey),
//                       ),
//                       onPressed: () {},
//                     )
//                   : TextButton(
//                       child: Text(
//                         "Follow",
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(
//                           Theme.of(context).colorScheme.secondary,
//                         ),
//                       ),
//                       onPressed: () {},
//                     ),
//               onTap: () {},
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discovery',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildCategoryTile(
                    icon: Icons.local_bar,
                    label: 'Bars & Hotels',
                    count: '42',
                    onTap: () {},
                  ),
                  _buildCategoryTile(
                    icon: Icons.room_service,
                    label: 'Fine Dining',
                    count: '25',
                    onTap: () {},
                  ),
                  _buildCategoryTile(
                    icon: Icons.coffee,
                    label: 'Cafes',
                    count: '28',
                    onTap: () {},
                  ),
                  _buildCategoryTile(
                    icon: Icons.location_on,
                    label: 'Nearby',
                    count: '34',
                    isHighlighted: true,
                    onTap: () {},
                  ),
                  _buildCategoryTile(
                    icon: Icons.fastfood,
                    label: 'Fast Foods',
                    count: '29',
                    onTap: () {},
                  ),
                  _buildCategoryTile(
                    icon: Icons.local_pizza,
                    label: 'Featured Foods',
                    count: '21',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildBottomNavBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTile({
    required IconData icon,
    required String label,
    required String count,
    bool isHighlighted = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isHighlighted ? Colors.amber : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: isHighlighted ? Colors.white : Colors.black87,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isHighlighted ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$count Place',
              style: TextStyle(
                fontSize: 14,
                color: isHighlighted ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItem(Icons.home, 'Home', isSelected: false),
          _buildNavBarItem(Icons.location_on, 'Discovery', isSelected: true),
          _buildNavBarItem(Icons.bookmark_border, 'Bookmark', isSelected: false),
          _buildNavBarItem(Icons.notifications_none, 'Notification', isSelected: false),
          _buildNavBarItem(Icons.person_outline, 'Profile', isSelected: false),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, String label, {required bool isSelected}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.amber : Colors.grey,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.amber : Colors.grey,
          ),
        ),
      ],
    );
  }
}