import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/feature_dummy_data.dart';
import '../../models/feature_models.dart';
import '../../widgets/feature_widgets.dart';
import 'portfolio_screen.dart' show DummyDataDateFormatter;

/// 9. Produktivitas & Manajemen Waktu
/// - Kalender Akademik & To-Do List
/// - Smart Reminder
class ProductivityScreen extends StatefulWidget {
  const ProductivityScreen({super.key});

  @override
  State<ProductivityScreen> createState() => _ProductivityScreenState();
}

class _ProductivityScreenState extends State<ProductivityScreen> {
  late List<TodoTask> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = List.of(FeatureDummyData.todoTasks);
  }

  void _toggle(int index) {
    setState(() {
      final t = _tasks[index];
      _tasks[index] = TodoTask(
        id: t.id,
        title: t.title,
        dueDate: t.dueDate,
        category: t.category,
        isDone: !t.isDone,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final sorted = [..._tasks]..sort((a, b) => a.dueDate.compareTo(b.dueDate));
    final doneCount = _tasks.where((t) => t.isDone).length;

    return Scaffold(
      appBar: FeatureAppBar(
        title: 'Produktivitas',
        actions: [
          IconButton(icon: const Icon(Icons.add, color: AppColors.textPrimary), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Progress Hari Ini', style: AppTextStyles.caption),
                      Text('$doneCount/${_tasks.length} selesai', style: AppTextStyles.subheading.copyWith(color: AppColors.primary)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: _tasks.isEmpty ? 0 : doneCount / _tasks.length,
                    strokeWidth: 5,
                    backgroundColor: AppColors.border,
                    valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SectionTitle(title: 'Kalender & Deadline Mendatang'),
          const SizedBox(height: 10),
          ...sorted.asMap().entries.map((entry) {
            final originalIndex = _tasks.indexOf(entry.value);
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _TodoCard(
                task: entry.value,
                onToggle: () => _toggle(originalIndex),
              ),
            );
          }),
          if (_tasks.isEmpty)
            const EmptyState(icon: Icons.event_available_outlined, message: 'Belum ada jadwal/tugas. Tambahkan sekarang!'),
        ],
      ),
    );
  }
}

class _TodoCard extends StatelessWidget {
  final TodoTask task;
  final VoidCallback onToggle;
  const _TodoCard({required this.task, required this.onToggle});

  Color get _categoryColor {
    switch (task.category) {
      case 'Ujian':
        return AppColors.warning;
      case 'Deadline':
        return Colors.red;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: task.isDone ? AppColors.success : Colors.transparent,
                border: Border.all(color: task.isDone ? AppColors.success : AppColors.border, width: 2),
              ),
              child: task.isDone ? const Icon(Icons.check, size: 14, color: Colors.white) : null,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                    decoration: task.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    AppChip(label: task.category, color: _categoryColor),
                    const SizedBox(width: 8),
                    Text(DummyDataDateFormatter.format(task.dueDate), style: AppTextStyles.caption.copyWith(fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
