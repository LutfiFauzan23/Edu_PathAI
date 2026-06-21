import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/feature_dummy_data.dart';
import '../../models/feature_models.dart';
import '../../widgets/feature_widgets.dart';

/// 10. Forum & Komunitas
/// - Forum & Study Group
/// - Mentoring & Alumni Network
class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: FeatureAppBar(
          title: 'Forum & Komunitas',
          actions: [
            IconButton(icon: const Icon(Icons.add_comment_outlined, color: AppColors.textPrimary), onPressed: () {}),
          ],
        ),
        body: Column(
          children: [
            const TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              tabs: [
                Tab(text: 'Forum Diskusi'),
                Tab(text: 'Mentoring'),
              ],
            ),
            Expanded(
              child: TabBarView(children: [_ForumTab(), _MentoringTab()]),
            ),
          ],
        ),
      ),
    );
  }
}

class _ForumTab extends StatelessWidget {
  const _ForumTab();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      itemCount: FeatureDummyData.forumPosts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final post = FeatureDummyData.forumPosts[index];
        return _ForumPostCard(post: post);
      },
    );
  }
}

class _ForumPostCard extends StatelessWidget {
  final ForumPost post;
  const _ForumPostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 14, backgroundColor: AppColors.primaryLight),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.author, style: AppTextStyles.subheading.copyWith(fontSize: 12)),
                    Text(post.authorRole, style: AppTextStyles.caption.copyWith(fontSize: 10)),
                  ],
                ),
              ),
              Text(post.timeAgo, style: AppTextStyles.caption.copyWith(fontSize: 10)),
            ],
          ),
          const SizedBox(height: 10),
          Text(post.title, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
          const SizedBox(height: 4),
          Text(post.preview, style: AppTextStyles.caption, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.chat_bubble_outline, size: 14, color: AppColors.textSecondary),
              const SizedBox(width: 4),
              Text('${post.replyCount} balasan', style: AppTextStyles.caption),
            ],
          ),
        ],
      ),
    );
  }
}

class _MentoringTab extends StatelessWidget {
  const _MentoringTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        SectionTitle(title: 'Mentor & Alumni', subtitle: 'Terhubung dengan mahasiswa/profesional'),
        const SizedBox(height: 10),
        ...FeatureDummyData.mentors.map((m) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                child: Row(
                  children: [
                    const CircleAvatar(radius: 22, backgroundColor: AppColors.primaryLight, child: Icon(Icons.person, color: AppColors.primary)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(m.name, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                          Text(m.role, style: AppTextStyles.caption),
                          Text(m.expertise, style: AppTextStyles.caption.copyWith(fontSize: 10, color: AppColors.primary)),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star, size: 14, color: AppColors.warning),
                            const SizedBox(width: 2),
                            Text('${m.rating}', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
