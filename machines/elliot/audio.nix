{ pkgs, ... }:
{
  # Audio utilities — CLI media / DSP tooling installed system-wide so shells
  # and services share them. These back the pwnlab camera + intercom pipeline:
  #   ffmpeg     capture / encode / audio filters
  #   sox        profile-based noise reduction (noisered) + DSP
  #   alsa-utils arecord / aplay / amixer (device probing, mixer unmute)
  environment.systemPackages = with pkgs; [
    ffmpeg
    sox
    alsa-utils
  ];
}
