import 'package:flutter/material.dart';

void main() {
  runApp(const D3liApp());
}

class D3liApp extends StatelessWidget {
  const D3liApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'D3LI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF070609),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8D4CE8),
          secondary: Color(0xFFD4AC5B),
          surface: Color(0xFF111015),
        ),
        fontFamily: 'Arial',
      ),
      home: const IntroScreen(),
    );
  }
}

/* -------------------------------------------------
   1. AÇILIŞ EKRANI
-------------------------------------------------- */

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  void _openLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.1,
            colors: [
              Color(0xFF261338),
              Color(0xFF09070C),
              Color(0xFF030304),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                const D3liCharacterIcon(size: 160),
                const SizedBox(height: 30),
                const D3liLogo(fontSize: 72),
                const SizedBox(height: 14),
                const Text(
                  'SCAN  •  PLAY  •  SURVIVE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA96BFF),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'THE REAL-WORLD\nRECYCLING ADVENTURE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFD9BE80),
                    fontSize: 17,
                    height: 1.4,
                    letterSpacing: 2,
                  ),
                ),
                const Spacer(),
                D3liButton(
                  text: 'ENTER THE HUNT',
                  icon: Icons.play_arrow_rounded,
                  onPressed: () => _openLogin(context),
                ),
                const SizedBox(height: 14),
                TextButton(
                  onPressed: () => _openLogin(context),
                  child: const Text(
                    'SKIP INTRO',
                    style: TextStyle(
                      color: Colors.white54,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------
   2. GİRİŞ / ÜYELİK
-------------------------------------------------- */

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _enterApp(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const MainGameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 34, 24, 24),
          child: Column(
            children: [
              const D3liLogo(fontSize: 62),
              const SizedBox(height: 12),
              const Text(
                'SCAN  •  PLAY  •  SURVIVE',
                style: TextStyle(
                  color: Color(0xFFA96BFF),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'BECOME A HUNTER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD9B96C),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Scan recyclable waste, collect Tarot Cards\nand rise on the leaderboard.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 38),
              SocialLoginButton(
                icon: Icons.g_mobiledata_rounded,
                text: 'CONTINUE WITH GOOGLE',
                onPressed: () => _enterApp(context),
              ),
              const SizedBox(height: 14),
              SocialLoginButton(
                icon: Icons.apple,
                text: 'CONTINUE WITH APPLE',
                onPressed: () => _enterApp(context),
              ),
              const SizedBox(height: 14),
              SocialLoginButton(
                icon: Icons.email_outlined,
                text: 'SIGN UP WITH EMAIL',
                onPressed: () => _enterApp(context),
              ),
              const SizedBox(height: 28),
              TextButton(
                onPressed: () => _enterApp(context),
                child: const Text(
                  'Already a Hunter?  SIGN IN',
                  style: TextStyle(
                    color: Color(0xFFD4AC5B),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Authentication will be connected to Firebase later.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------
   ANA UYGULAMA VE ALT MENÜ
-------------------------------------------------- */

class MainGameScreen extends StatefulWidget {
  const MainGameScreen({super.key});

  @override
  State<MainGameScreen> createState() => _MainGameScreenState();
}

class _MainGameScreenState extends State<MainGameScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ScanScreen(),
    CardsScreen(),
    RankingScreen(),
  ];

  void _selectPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0D0B10),
          border: Border(
            top: BorderSide(
              color: Color(0xFF5D4320),
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _selectPage,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: const Color(0xFFA968FF),
            unselectedItemColor: const Color(0xFFB79A62),
            selectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 10,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner),
                label: 'SCAN',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.style_outlined),
                activeIcon: Icon(Icons.style),
                label: 'CARDS',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.emoji_events_outlined),
                activeIcon: Icon(Icons.emoji_events),
                label: 'RANKING',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------
   3. ANA EKRAN
-------------------------------------------------- */

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PlayerHeader(),
            const SizedBox(height: 18),
            const XpProgress(),
            const SizedBox(height: 24),
            const D3liCharacterIcon(size: 150),
            const SizedBox(height: 14),
            const D3liLogo(fontSize: 52),
            const SizedBox(height: 8),
            const Text(
              'SCAN  •  PLAY  •  SURVIVE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFA96BFF),
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 24),
            D3liButton(
              text: 'SCAN QR',
              icon: Icons.qr_code_scanner,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Open the SCAN tab from the bottom menu.',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 22),
            const LatestCardPanel(),
            const SizedBox(height: 14),
            const Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'COLLECTION',
                    value: '32 / 108',
                    icon: Icons.style,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: StatCard(
                    title: 'GLOBAL RANK',
                    value: '#1,245',
                    icon: Icons.emoji_events,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: StatCard(
                    title: 'DAILY STREAK',
                    value: '7 DAYS',
                    icon: Icons.local_fire_department,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* -------------------------------------------------
   4. QR TARAMA
-------------------------------------------------- */

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  void _showFakeReward(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF121015),
          title: const Text(
            'REWARD UNLOCKED',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFD9B96C),
            ),
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.auto_awesome,
                color: Color(0xFFA968FF),
                size: 62,
              ),
              SizedBox(height: 18),
              Text(
                '+250 XP',
                style: TextStyle(
                  color: Color(0xFFA968FF),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'New Tarot Card Unlocked',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CLAIM REWARD'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
        child: Column(
          children: [
            const ScreenTitle(
              title: 'SCAN QR',
              subtitle: 'Find recyclable waste and scan its D3LI code.',
            ),
            const Spacer(),
            Container(
              width: 270,
              height: 270,
              decoration: BoxDecoration(
                color: const Color(0xFF120D18),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFFA968FF),
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x558D4CE8),
                    blurRadius: 28,
                  ),
                ],
              ),
              child: const Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.qr_code_2,
                    size: 170,
                    color: Colors.white,
                  ),
                  Positioned(
                    top: 22,
                    left: 22,
                    child: ScanCorner(),
                  ),
                  Positioned(
                    top: 22,
                    right: 22,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: ScanCorner(),
                    ),
                  ),
                  Positioned(
                    bottom: 22,
                    right: 22,
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: ScanCorner(),
                    ),
                  ),
                  Positioned(
                    bottom: 22,
                    left: 22,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: ScanCorner(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'QR camera access will be added later.',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 24),
            D3liButton(
              text: 'TEST QR REWARD',
              icon: Icons.qr_code_scanner,
              onPressed: () => _showFakeReward(context),
            ),
            const Spacer(),
            const Text(
              'Possible rewards',
              style: TextStyle(
                color: Color(0xFFD9B96C),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 14),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RewardIcon(
                  icon: Icons.bolt,
                  label: 'XP',
                ),
                RewardIcon(
                  icon: Icons.style,
                  label: 'CARD',
                ),
                RewardIcon(
                  icon: Icons.monetization_on_outlined,
                  label: 'COINS',
                ),
                RewardIcon(
                  icon: Icons.inventory_2_outlined,
                  label: 'CHEST',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* -------------------------------------------------
   5. KART KOLEKSİYONU
-------------------------------------------------- */

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const List<GameCardData> cards = [
    GameCardData('THE FOOL', 'EPIC', Icons.auto_awesome),
    GameCardData('THE MAGICIAN', 'EPIC', Icons.bolt),
    GameCardData('THE EMPRESS', 'RARE', Icons.brightness_7),
    GameCardData('THE EMPEROR', 'RARE', Icons.shield),
    GameCardData('THE LOVERS', 'EPIC', Icons.favorite),
    GameCardData('THE CHARIOT', 'COMMON', Icons.directions_car),
    GameCardData('STRENGTH', 'COMMON', Icons.fitness_center),
    GameCardData('THE HERMIT', 'LOCKED', Icons.lock),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 18, 16, 10),
            child: ScreenTitle(
              title: 'MY TAROT COLLECTION',
              subtitle: '32 / 108 cards collected',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterChipWidget(text: 'ALL', selected: true),
                  FilterChipWidget(text: 'COMMON'),
                  FilterChipWidget(text: 'RARE'),
                  FilterChipWidget(text: 'EPIC'),
                  FilterChipWidget(text: 'LEGENDARY'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 24),
              itemCount: cards.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.72,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return TarotCardWidget(
                  card: cards[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* -------------------------------------------------
   6. LİDERLİK TABLOSU
-------------------------------------------------- */

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  static const List<RankingData> rankings = [
    RankingData('D3LI_Master', '256,780'),
    RankingData('TarotKing', '210,450'),
    RankingData('MysticHunter', '194,320'),
    RankingData('d3li_Hunter', '178,600'),
    RankingData('ShadowSeeker', '165,230'),
    RankingData('CardCollector', '150,890'),
    RankingData('LegendaryOne', '142,760'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 18, 16, 14),
            child: ScreenTitle(
              title: 'LEADERBOARD',
              subtitle: 'Compete. Collect. Become legendary.',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: RankingTab(
                    text: 'GLOBAL',
                    active: true,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: RankingTab(text: 'COUNTRY'),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: RankingTab(text: 'FRIENDS'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 24),
              itemCount: rankings.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final player = rankings[index];
                final bool isCurrentPlayer =
                    player.name == 'd3li_Hunter';

                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 13,
                  ),
                  decoration: BoxDecoration(
                    color: isCurrentPlayer
                        ? const Color(0xFF28123E)
                        : const Color(0xFF111015),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isCurrentPlayer
                          ? const Color(0xFFA968FF)
                          : const Color(0xFF59421F),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: index < 3
                            ? const Color(0xFFD4AC5B)
                            : const Color(0xFF2B2730),
                        foregroundColor: Colors.black,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const CircleAvatar(
                        backgroundColor: Color(0xFF28123E),
                        child: Icon(
                          Icons.person,
                          color: Color(0xFFD4AC5B),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          player.name,
                          style: TextStyle(
                            color: isCurrentPlayer
                                ? const Color(0xFFE1C1FF)
                                : Colors.white,
                            fontWeight: isCurrentPlayer
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      Text(
                        '${player.score} XP',
                        style: const TextStyle(
                          color: Color(0xFFD4AC5B),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* -------------------------------------------------
   ORTAK WIDGETLAR
-------------------------------------------------- */

class PlayerHeader extends StatelessWidget {
  const PlayerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xFF28123E),
          child: Icon(
            Icons.person,
            color: Color(0xFFD4AC5B),
            size: 28,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'd3li_Hunter',
                style: TextStyle(
                  color: Color(0xFFE9D8B1),
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'LEVEL 24',
                style: TextStyle(
                  color: Color(0xFFA968FF),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        CurrencyBadge(
          icon: Icons.monetization_on,
          value: '24,680',
        ),
        SizedBox(width: 8),
        CurrencyBadge(
          icon: Icons.diamond,
          value: '1,250',
        ),
      ],
    );
  }
}

class CurrencyBadge extends StatelessWidget {
  const CurrencyBadge({
    required this.icon,
    required this.value,
    super.key,
  });

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF111015),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF59421F),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFFD4AC5B),
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFFE8D5A2),
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class XpProgress extends StatelessWidget {
  const XpProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'XP',
              style: TextStyle(
                color: Color(0xFFD4AC5B),
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              '7,250 / 12,000',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 11,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const LinearProgressIndicator(
            value: 0.60,
            minHeight: 8,
            backgroundColor: Color(0xFF211D25),
            valueColor: AlwaysStoppedAnimation<Color>(
              Color(0xFF9A52E8),
            ),
          ),
        ),
      ],
    );
  }
}

class LatestCardPanel extends StatelessWidget {
  const LatestCardPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111015),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF59421F),
        ),
      ),
      child: const Row(
        children: [
          ContainerCardIcon(),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LATEST CARD',
                  style: TextStyle(
                    color: Color(0xFFD4AC5B),
                    fontSize: 12,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'THE FOOL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'EPIC • +80 COLLECTION POINTS',
                  style: TextStyle(
                    color: Color(0xFFA968FF),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerCardIcon extends StatelessWidget {
  const ContainerCardIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 94,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF4F1A73),
            Color(0xFF18101E),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFD4AC5B),
        ),
      ),
      child: const Icon(
        Icons.auto_awesome,
        color: Color(0xFFD4AC5B),
        size: 34,
      ),
    );
  }
}

class D3liCharacterIcon extends StatelessWidget {
  const D3liCharacterIcon({
    required this.size,
    super.key,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(
          colors: [
            Color(0xFF6B2D9A),
            Color(0xFF1B1024),
            Color(0xFF080609),
          ],
        ),
        border: Border.all(
          color: const Color(0xFFD4AC5B),
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x668D4CE8),
            blurRadius: 28,
          ),
        ],
      ),
      child: Icon(
        Icons.theater_comedy,
        size: size * 0.52,
        color: const Color(0xFFD4AC5B),
      ),
    );
  }
}

class D3liLogo extends StatelessWidget {
  const D3liLogo({
    required this.fontSize,
    super.key,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      'd3li',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFFD8B366),
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
        shadows: const [
          Shadow(
            color: Color(0x888D4CE8),
            blurRadius: 16,
          ),
        ],
      ),
    );
  }
}

class D3liButton extends StatelessWidget {
  const D3liButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFFF5E6BE),
          backgroundColor: const Color(0xFF301347),
          side: const BorderSide(
            color: Color(0xFFD4AC5B),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: const Color(0xFFD4AC5B),
        ),
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Color(0xFF765722),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFD9B96C),
            fontSize: 23,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 13,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF111015),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF59421F),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFFA968FF),
            size: 24,
          ),
          const SizedBox(height: 7),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFD9B96C),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}

class RewardIcon extends StatelessWidget {
  const RewardIcon({
    required this.icon,
    required this.label,
    super.key,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFF28123E),
          child: Icon(
            icon,
            color: const Color(0xFFD4AC5B),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class ScanCorner extends StatelessWidget {
  const ScanCorner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFD4AC5B),
            width: 4,
          ),
          left: BorderSide(
            color: Color(0xFFD4AC5B),
            width: 4,
          ),
        ),
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  const FilterChipWidget({
    required this.text,
    this.selected = false,
    super.key,
  });

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFF3B1755)
            : const Color(0xFF111015),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected
              ? const Color(0xFFA968FF)
              : const Color(0xFF59421F),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected
              ? const Color(0xFFE8CFFF)
              : Colors.white60,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TarotCardWidget extends StatelessWidget {
  const TarotCardWidget({
    required this.card,
    super.key,
  });

  final GameCardData card;

  @override
  Widget build(BuildContext context) {
    final bool isLocked = card.rarity == 'LOCKED';

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isLocked
              ? const [
                  Color(0xFF161419),
                  Color(0xFF09080B),
                ]
              : const [
                  Color(0xFF34144C),
                  Color(0xFF100C14),
                ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isLocked
              ? Colors.white24
              : const Color(0xFFD4AC5B),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF0D0B10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  isLocked ? Icons.lock : card.icon,
                  size: 60,
                  color: isLocked
                      ? Colors.white24
                      : const Color(0xFFD4AC5B),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              card.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              card.rarity,
              style: TextStyle(
                color: isLocked
                    ? Colors.white38
                    : const Color(0xFFA968FF),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RankingTab extends StatelessWidget {
  const RankingTab({
    required this.text,
    this.active = false,
    super.key,
  });

  final String text;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFF3B1755)
            : const Color(0xFF111015),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: active
              ? const Color(0xFFA968FF)
              : const Color(0xFF59421F),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: active
              ? const Color(0xFFE8CFFF)
              : Colors.white60,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }
}

/* -------------------------------------------------
   VERİ MODELLERİ
-------------------------------------------------- */

class GameCardData {
  const GameCardData(
    this.name,
    this.rarity,
    this.icon,
  );

  final String name;
  final String rarity;
  final IconData icon;
}

class RankingData {
  const RankingData(
    this.name,
    this.score,
  );

  final String name;
  final String score;
}
