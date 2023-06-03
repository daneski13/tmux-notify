#!/usr/bin/env bash
## -- Add tmux plugin variables

## Main variables
if [[ -z $XDG_CACHE_HOME ]]; then
  export PID_DIR=~/.tmux/notify
else
  export PID_DIR="$XDG_CACHE_HOME/tmux/tmux-notify"
fi

# Get ID's
export SESSION_ID=$(tmux display-message -p '#{session_id}'  | tr -d $)
export WINDOW_ID=$(tmux display-message -p '#{window_id}' | tr -d @)
export PANE_ID=$(tmux display-message -p '#{pane_id}' | tr -d %)
export PID_FILE_PATH="${PID_DIR}/${PANE_ID}.pid"

## Tnotify tmux options
export prompt_suffixes="@tnotify-prompt-suffixes"
export prompt_suffixes_default="$,#,%"

# Notification verbosity settings
export verbose_option="@tnotify-verbose"
export verbose_default="off"
export verbose_msg_option="@tnotify-verbose-msg"
export verbose_msg_default="(#S, #I:#P) Tmux pane task completed!"

# Monitor checker interval
export monitor_sleep_duration="@tnotify-sleep-duration"
export monitor_sleep_duration_default=10

# Telegram settings
export tmux_notify_telegram_bot_id="@tnotify-telegram-bot-id"
export tmux_notify_telegram_channel_id="@tnotify-telegram-channel-id"
export tmux_notify_telegram_bot_id_default=""
export tmux_notify_telegram_channel_id_default=""
