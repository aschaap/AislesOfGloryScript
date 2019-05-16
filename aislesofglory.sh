#!/bin/sh
# Script depending on xdotool to play through the "Hauler: Aisles of Glory" NoFrills retro game, and enter one's PC Optimum card number
# Made for the edification of the author only
# License: MIT, i.e. no warranty nor liability

# Assumption: screen resolution is 1920x1200
# Assumption: browser starts maximized and has minimal toolbars squishing the game canvas
# Assumption: screen has a dead area of 200px above the top of the browser (due to multimonitor positioning)
# Assumption: browser start time and game opening animation are both done within 5 seconds

# Ensure the browser launches in private/incognito mode to avoid cookies
BROWSER='falkon -i'
URL='https://aislesofglory.nofrills.ca'
# Space-separated digits of your PC Optimum card, minus the 608559 prefix
CARDDIGITS='0 0 0 0 0 0 0 0 0 0 0 0 0'

# Launch browser
${BROWSER} ${URL} &
# Wait and press start
sleep 5
xdotool key space
# Wait and get through info screens
sleep 2
xdotool key --delay 2000 space space space space space space space
# Arbitrary sequence; not too long in case the game ends early, could be replaced with one sleep command
sleep 5
xdotool key Down
sleep 2
xdotool key Up
sleep 7
xdotool key space
sleep 3
xdotool key Up
sleep 1
xdotool key Down
xdotool key space
sleep 2
xdotool key space
# end arbitrary sequence
# Wait until game over, 30 seconds seems to be enough
sleep 30
# Get through high-score screen
xdotool key --delay 2000 space space
# Press reward button
xdotool mousemove 1300 1360
sleep 1
xdotool click 1
# Wait and Tab to first card number field, enter digits and move to terms & conditions checkbox, click it and move to submit button, and click it
sleep 1
xdotool key --delay 100 Tab ${CARDDIGITS} mousemove 855 1045 click 1 mousemove 960 1130 click 1
# Wait and close the window
sleep 3
xdotool key Alt+F4
