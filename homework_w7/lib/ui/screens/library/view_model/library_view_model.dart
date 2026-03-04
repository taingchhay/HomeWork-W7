import 'package:flutter/material.dart';
import 'package:homework_w7/data/repositories/songs/song_repository.dart';
import 'package:homework_w7/model/songs/song.dart';
import 'package:homework_w7/ui/states/player_state.dart';
import 'package:provider/provider.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository repository;
  final PlayerState playerState;

  List<Song> _songs = [];
  List<Song> get songs => _songs;
  Song? get currentSong => playerState.currentSong;

  LibraryViewModel({required this.repository, required this.playerState}) {
    init();
    playerState.addListener(() => notifyListeners());
  }

  void init() {
    _songs = repository.fetchSongs();
    notifyListeners();
  }

  void play(Song song) {
    playerState.start(song);
    notifyListeners();
  }

  void stop() {
    playerState.stop();
    notifyListeners();
  }
}
