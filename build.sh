# compile and build project
mkdir build
cd build || exit
cmake -G Ninja ..
ninja
cd ..
clear

# flash pico
RPName="RPI-RP2"
if [ -d "/Volumes/$RPName" ]; then
  cp "/Users/louisschell/CLionProjects/pico-test/build/PicoTemplate.uf2" "/Volumes/$RPName/PicoTemplate.uf2"
  echo "Successfully flashed $RPName"
  echo "Starting serial monitor."
else
  echo "Your $RPName must be connected and in boot mode in order to be flashed."
  exit
fi

# wait for PICO startup
sleep 2

# start printout
bash monitor.bash "tty.usbmodem1101"