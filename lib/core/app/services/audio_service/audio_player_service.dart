abstract class AudioPlayerService {
  //Para acessar determinado tempo da musica, em 10s, 1 minuto..
  Future<void> seek(int seconds);

  //Fica sendo executado para rodar cada segundo da musica
  Stream<Duration> getPositionStream();

  //Pega a posicao atual em q parou a msc
  //Automaticamente a Stream encerra
  Future<int> getCurrentPosition();

  //Carregar e toca-la
  Future<void> playMusic(String audioUrl);

  Future<void> pauseMusic();

  Future<void> resumeMusic();

  Future<void> stopMusic();

  //Automatizar a troca de musica
  Stream<void> onAudioComplete();
}
