import 'package:flutter/material.dart';
import 'package:homework_w7/ui/screens/library/view_model/library_view_model.dart';
import 'package:homework_w7/ui/screens/library/widgets/library_content.dart';
import 'package:provider/provider.dart';
 
import '../../../data/repositories/songs/song_repository.dart';
import '../../../model/songs/song.dart';
import '../../states/player_state.dart';
import '../../states/settings_state.dart';
import '../../theme/theme.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context)=> LibraryViewModel(
        repository: context.read<SongRepository>(),
        playerState: context.read<PlayerState>(),
      ),
      child: const LibraryContent(),
    );
  }
}
