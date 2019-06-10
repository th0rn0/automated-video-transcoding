export PATH="/usr/local/bundle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export GEM_HOME=/usr/local/bundle
export TERM=xterm
export FFMPEG_VERSION=4.1
export BUNDLE_SILENCE_ROOT_WARNING=1
export BUNDLE_APP_CONFIG=/usr/local/bundle
export PATH=/usr/local/bundle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/share/rvm/bin
export PWD=/cronScripts
export RUBY_MAJOR=2.4
export RUBYGEMS_VERSION=2.6.10
export BUNDLE_BIN=/usr/local/bundle/bin
export FDKAAC_VERSION=0.1.6
export GEM_VERSION=0.25.2
export SHLVL=1
export HOME=/root
export HANDBRAKE_VERSION=1.1.2
export NASM_VERSION=2.13.01
export BUNDLE_PATH=/usr/local/bundle
export LIBX265_VERSION=2.9
export RUBY_VERSION=2.4.0
export BUNDLER_VERSION=1.14.3
_=/usr/bin/printenv
export OLDPWD=/input

GEM_HOME=/usr/local/bundle
INPUT_PATH=/input
OUTPUT_PATH=/output
FILES=${INPUT_PATH}/*

mkdir -p "${OUTPUT_PATH}/originals"

if find "$INPUT_PATH" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
	for f in $FILES
	do
	  echo "Processing $f file..."
	  # take action on each file. $f store current file name
	  name=$(echo "$f" | cut -f 1 -d '.')
	  transcode-video --add-audio all "${f}" -o "/tmp/$(basename -- $name).mkv"
	  mv "/tmp/$(basename -- $name).mkv" "${OUTPUT_PATH}/$(basename -- $name).mkv"
	  mv "$f" "${OUTPUT_PATH}/originals/$(basename -- $f)"
	done
else
	echo "No Files Found"
fi
