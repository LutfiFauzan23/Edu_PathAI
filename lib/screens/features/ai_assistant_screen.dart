import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({super.key});
  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _ChatMessage {
  final String text;
  final bool isUser;
  final DateTime time;
  _ChatMessage(this.text, this.isUser) : time = DateTime.now();
}

class _ChatSession {
  final String id;
  final String title;
  final DateTime date;
  final bool isSaved;
  _ChatSession({required this.id, required this.title, required this.date, this.isSaved = false});
}

class _AiAssistantScreenState extends State<AiAssistantScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final List<_ChatMessage> _messages = [];
  bool _inChat = false;
  bool _isTyping = false;

  final _riwayat = [
    _ChatSession(id: '1', title: 'Belajar strategi SNBT 2026', date: DateTime(2026, 6, 21, 14, 10)),
    _ChatSession(id: '2', title: 'Belajar teknik mengerjakan TPS', date: DateTime(2026, 6, 21, 14, 10)),
    _ChatSession(id: '3', title: 'Belajar manajemen waktu ujian', date: DateTime(2026, 6, 21, 14, 10)),
  ];

  final _tersimpan = [
    _ChatSession(id: '4', title: 'Belajar analisis soal matematika', date: DateTime(2026, 6, 20, 14, 10), isSaved: true),
    _ChatSession(id: '5', title: 'Belajar tips lolos SNBP jalur prestasi', date: DateTime(2026, 6, 19, 14, 10), isSaved: true),
    _ChatSession(id: '6', title: 'Belajar cara buat portofolio kuat', date: DateTime(2026, 6, 18, 14, 10), isSaved: true),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _startChat(String initialMsg) {
    setState(() {
      _inChat = true;
      _messages.clear();
      if (initialMsg.isNotEmpty) {
        _messages.add(_ChatMessage(initialMsg, true));
        _simulateReply();
      }
    });
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(_ChatMessage(text, true));
      _controller.clear();
      _isTyping = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 100,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
    _simulateReply();
  }

  void _simulateReply() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      setState(() {
        _isTyping = false;
        _messages.add(_ChatMessage(
          'Pertanyaan bagus! Ini adalah respons demo dari EduAI Assistant. '
          'Sambungkan ke Claude API atau layanan AI lainnya untuk jawaban yang sesungguhnya. '
          'Aku siap membantu kamu dengan pertanyaan seputar jurusan, kampus, SNBT, beasiswa, dan karier! 🎓',
          false,
        ));
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent + 200,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _inChat ? _buildChatView() : _buildDefaultView(),
      ),
    );
  }

  // ─── DEFAULT VIEW ────────────────────────────────────────────────────────────
  Widget _buildDefaultView() {
    return Column(
      children: [
        _buildHeader(showBack: false),
        Expanded(
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.primary,
                labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                tabs: const [Tab(text: 'Riwayat Chat'), Tab(text: 'Tersimpan')],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildRiwayatTab(),
                    _buildTersimpanTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
        _buildInputBar(isDefault: true),
      ],
    );
  }

  Widget _buildHeader({required bool showBack}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          if (showBack)
            GestureDetector(
              onTap: () => setState(() {
                _inChat = false;
                _messages.clear();
              }),
              child: const Icon(Icons.arrow_back, color: AppColors.textPrimary, size: 20),
            ),
          if (showBack) const SizedBox(width: 10),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.auto_awesome, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('EduAI',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                Text('Asisten Pintar yang Siap Membantu',
                    style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search, size: 20, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildRiwayatTab() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      children: [
        // Prompt utama
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text('Apa yang sedang kamu\npikirkan hari ini?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
              const SizedBox(height: 20),
              // Quick prompt chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  _promptChip('🎓 Tips SNBT'),
                  _promptChip('📚 Rekomendasi jurusan'),
                  _promptChip('💡 Strategi belajar'),
                  _promptChip('🏫 Info kampus'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        _sectionLabel('Riwayat Chat', onTap: () {}),
        const SizedBox(height: 8),
        ..._riwayat.map((s) => _sessionTile(s, isSaved: false)),
      ],
    );
  }

  Widget _buildTersimpanTab() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      children: [
        _sectionLabel('Chat Tersimpan', onTap: () {}),
        const SizedBox(height: 8),
        ..._tersimpan.map((s) => _sessionTile(s, isSaved: true)),
      ],
    );
  }

  Widget _promptChip(String label) {
    return GestureDetector(
      onTap: () => _startChat(label.replaceAll(RegExp(r'^\S+\s'), '')),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
        ),
        child: Text(label,
            style: const TextStyle(
                fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _sectionLabel(String label, {required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        GestureDetector(
          onTap: onTap,
          child: Text('lainnya >',
              style: const TextStyle(fontSize: 11, color: AppColors.primary)),
        ),
      ],
    );
  }

  Widget _sessionTile(_ChatSession session, {required bool isSaved}) {
    final timeStr =
        'hari ini, ${session.date.hour}:${session.date.minute.toString().padLeft(2, '0')}';
    return GestureDetector(
      onTap: () => _startChat(''),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            const Icon(Icons.chat_bubble_outline, size: 16, color: AppColors.textSecondary),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(session.title,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text(timeStr,
                      style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                ],
              ),
            ),
            if (isSaved)
              const Icon(Icons.bookmark, size: 16, color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  // ─── CHAT VIEW ────────────────────────────────────────────────────────────────
  Widget _buildChatView() {
    return Column(
      children: [
        _buildHeader(showBack: true),
        Expanded(
          child: _messages.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(18)),
                        child: const Icon(Icons.auto_awesome,
                            size: 30, color: AppColors.primary),
                      ),
                      const SizedBox(height: 14),
                      const Text('Tanya apa saja tentang\npendidikan & kariermu!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary)),
                    ],
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  itemCount: _messages.length + (_isTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (_isTyping && index == _messages.length) {
                      return _typingIndicator();
                    }
                    return _bubble(_messages[index]);
                  },
                ),
        ),
        _buildInputBar(isDefault: false),
      ],
    );
  }

  Widget _bubble(_ChatMessage msg) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            msg.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!msg.isUser) ...[
            Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.auto_awesome, color: Colors.white, size: 14),
            ),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: msg.isUser ? AppColors.primary : AppColors.card,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(14),
                  topRight: const Radius.circular(14),
                  bottomLeft: Radius.circular(msg.isUser ? 14 : 4),
                  bottomRight: Radius.circular(msg.isUser ? 4 : 14),
                ),
                border: msg.isUser ? null : Border.all(color: AppColors.border),
              ),
              child: Text(msg.text,
                  style: TextStyle(
                      fontSize: 13,
                      color: msg.isUser ? Colors.white : AppColors.textPrimary,
                      height: 1.4)),
            ),
          ),
          if (msg.isUser) const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _typingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.auto_awesome, color: Colors.white, size: 14),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (i) => _dot(i)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + index * 150),
      builder: (_, v, __) => Container(
        width: 6,
        height: 6,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.3 + 0.7 * v),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  // ─── INPUT BAR ───────────────────────────────────────────────────────────────
  Widget _buildInputBar({required bool isDefault}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: isDefault ? () => setState(() => _inChat = true) : null,
              child: TextField(
                controller: _controller,
                enabled: !isDefault,
                onSubmitted: (_) => _send(),
                style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
                decoration: InputDecoration(
                  hintText: isDefault ? 'Ketik disini ...' : 'Tulis pesanmu...',
                  hintStyle: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                  filled: true,
                  fillColor: AppColors.background,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: isDefault ? () => setState(() => _inChat = true) : _send,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: AppColors.primary, shape: BoxShape.circle),
              child: const Icon(Icons.send_rounded, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
