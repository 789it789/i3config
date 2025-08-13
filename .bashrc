fastfetch_custom() {
  logo="/home/chase/proto"
  logo_lines=$(wc -l < "$logo")

  logo_output=$(cat "$logo" | acecat-c)

  # Split logo_output into lines for padding
  mapfile -t logo_lines_arr <<< "$logo_output"

  max_width=0
  for line in "${logo_lines_arr[@]}"; do
    stripped=$(echo -e "$line" | sed -r 's/\x1B\[[0-9;]*[mK]//g')
    length=${#stripped}
    if (( length > max_width )); then
      max_width=$length
    fi
  done

  padding=4
  padded_width=$((max_width + padding))
  padded_logo=()
  for line in "${logo_lines_arr[@]}"; do
    stripped=$(echo -e "$line" | sed -r 's/\x1B\[[0-9;]*[mK]//g')
    len=${#stripped}
    spaces=$((padded_width - len))
    padded_logo+=("$line$(printf '%*s' "$spaces")")
  done

  fastfetch_output=$(fastfetch --logo "$logo" | tail -n +$((logo_lines + 1)) | lolcat-c)

  paste -d ' ' <(printf '%s\n' "${padded_logo[@]}") <(echo "$fastfetch_output")
}


alias ls='ls --color=auto'

export PS1="[\[$(tput bold)\]\u\[$(tput sgr0)\]] \w \\$ \[$(tput sgr0)\]"

alias pacman='sudo pacman'
