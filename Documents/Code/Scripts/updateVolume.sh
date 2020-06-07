#!/bin/bash
# Change volume
# Passed parameters to increase volume or dercrease volume
# This amixer abstraction layer is designed so that we can
# notify the user of the change and the current audio levels
# with dunstify or notify-send.

# Arbitrary but unique message id
msgId="954394"

# Increase the current sink volume
# If the sink is muted, unmute it
function increase_volume {
  mute="$(amixer get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
  amixer -q sset Master 5%+
  if [[ "$mute" == "off" ]]; then
    toggle_speaker_audio
  fi
  volume="$(amixer get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
  dunstify -a "Increased volume" -u low -i audio-volume-increased -r "$msgId" "Volume: ${volume}%"
}

# Decrease the current sink volume
# If the sink is muted, unmute it
function decrease_volume {
  mute="$(amixer get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
  amixer -q sset Master 5%-
  if [[ "$mute" == "off" ]]; then
    toggle_speaker_audio
  fi
  volume="$(amixer get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
  dunstify -a "Decreased volume" -u low -i audio-volume-decreased -r "$msgId" "Volume: ${volume}%"
}

# Mute or unmute the speakers
function toggle_speaker_audio {
  amixer -q sset Master toggle
  mute="$(amixer get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
  if [[ "$mute" == "off" ]]; then
    dunstify -a "Toggle speaker mute" -u low -i toggle-speaker-audio -r "$msgId" "Speakers Muted"
  else 
    dunstify -a "Toggle speaker mute" -u low -i toggle-speaker-audio -r "$msgId" "Speakers Unmuted"
  fi
}

# Mute or unmute the microphone
function toggle_microphone {
  amixer -q sset Capture toggle
  MicMute="$(amixer get Capture | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
  if [[ "$MicMute" == "off" ]]; then
    dunstify -a "Toggle microphone mute" -u low -i toggle-microphone-mute -r "$msgId" "Microphone Muted"
  else 
    dunstify -a "Toggle microphone mute" -u low -i toggle-microphone-mute -r "$msgId" "Microphone Unmuted"
  fi
}

# function that sends dunstify or notify-send command to user
# With current audio satatus
# function notify_audio_change {
# }

# Manage parameters and send to defined function
# function manage_input {
# }

increase_volume
sleep 1
decrease_volume
sleep 1
toggle_microphone
sleep 1
toggle_microphone
sleep 1
toggle_speaker_audio
sleep 1
toggle_speaker_audio
