if [[ -z "${1}" ]]; then
    device=/dev/ttyUSB0
else
    device="${1}"
fi

picocom -b 19200 "${device}" --imap lfcrlf --echo
