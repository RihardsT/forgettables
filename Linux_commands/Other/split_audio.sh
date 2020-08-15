sudo apt install cuetools shntool flac

shnsplit -f CUEFILE -o flac SOURCE_FLAC
cuetag CUEFILE split-track*.flac

PREFIX=''
shnsplit -f "${PREFIX}cue" "${PREFIX}flac" -o flac -t "%n - %t"
cuetag "${PREFIX}cue" [0-9]*.flac
