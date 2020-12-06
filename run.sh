acorn0='                         '
acorn1='              _          '
acorn2='            _/-\_        '
acorn3='         .-`-:-:-`-.     '
acorn4='        /-:-:-:-:-:-\    '
acorn5='        \:-:-:-:-:-:/    '
acorn6='         |`       `|     '
acorn7='         |         |     '
acorn8='         `\       /`     '
acorn9='           `-._.-`       '
acorn10='              `         '
acorn11='                        '
acorn12='                        '



tree0='       oxoxoo    ooxoo       '
tree1='     ooxoxo oo  oxoxooo      '
tree2='    oooo xxoxoo ooo ooox     '
tree3='    oxo o oxoxo  xoxxoxo     '
tree4='     oxo xooxoooo o ooo      '
tree5='       ooo\oo\  /o/o         '
tree6='           \  \/ /           '
tree7='            |   /            '
tree8='            |  |             '
tree9='            |<B|             '
tree10='            |  |            '
tree11='            |  |            '
tree12='     ______/____\____       '

heart0='                            '
heart1='      *  *       *  *       '
heart2='    *      *   *      *     '
heart3='    *       * *       *     '
heart4='     *       *       *      '
heart5='       *           *        '
heart6='         *       *          '
heart7='           *   *            '
heart8='            * *             '
heart9='             *              '
heart10='                           '
heart11='                         '
heart12='                         '

clear;
# draw the acorn, one row at a time
((row=12))
while [[ $row -gt -1 ]] ; do
    tput cup $row 0; eval "echo \"\$acorn$row\""
    ((row--))
    sleep 0.25
done

# Move the acorn down by drawing it all with no delay, but drawing less
# of it, so that we still start at row 12, but we draw starting at row 11.
((row=12))
((frame=0))
while [[ $frame -lt 5 ]] ; do
    ((row=12))
    while [[ $row -gt -1 ]] ; do
        ((arow=$row-$frame))
        if [[ $arow -gt -1 ]] ; then
            tput cup $row 0; eval "echo \"\$acorn$arow\""
        else
            tput cup $row 0; echo '                     '
        fi
        ((row--))
    done
    ((frame++))
    sleep 0.25
done

# break the top open and draw the horizontal line that is the base of the tree
# then start drawing the tree on top and moving the entire thing down.
((row=7))
((widen=1))
while [[ $widen -lt 7 ]] ; do
    ((w=$widen*2))
    v=$(printf "%-${w}s" "-")
    ((indent=9-$widen+1))
    ((row=7))
    tput cup $row $indent; echo ".-'-:${v// /-}:-'-.   "
    ((row--))
    ((indent=11-$widen+1))
    tput cup $row $indent; echo "_/${v// /-}\_           "
    ((row--))
    ((indent=12-$widen+1))
    tput cup $row $indent; echo " ${v// /-}           "
    sleep 0.25
    ((widen++))
done

# start growing straight up now
((row=7))
while [[ $row -gt 3 ]] ; do
    tput cup $row 0; echo "             | |            "
    sleep 0.25
    ((row--))
done
# 13 spaces in
tput cup $row 0; echo "              #             "
sleep .5
((row++))
tput cup $row 0; echo "            #| |            "
sleep 0.5
((row++))
tput cup $row 0; echo "             | |#            "
sleep 3

# now start drawing the tree up starting at row 7 (and the 12 of the tree)
# then when that finishes, move the acorn down and the tree down
# so that we can see the entire tree
((row=7))
while [[ $row -gt -1 ]] ; do
    ((tre=$row+5))
    tput cup $row 0; eval "echo \"\$tree$tre\""
    ((row--))
    sleep 0.25
done
sleep 0.25

# starting with row 7, draw the acron down and the tree up
((row=7))
((startRow=7))
while [[ $row -lt 13 ]] ; do
    ((tre=12))
    ((acn=4))
    # draw tree
    while [[ $row -gt -1 ]] ; do
        tput cup $row 0; eval "echo \"\$tree$tre\""
        ((tre--))
        ((row--))
    done
    ((row=$startRow +1))
    # draw acorn
    while [[ $row -lt 13 ]] ; do
        tput cup $row 0; eval "echo \"\$acorn$acn\""
        ((row++))
        ((acn++))
    done
    sleep 0.25
    ((startRow++))
    ((row=$startRow))
done
sleep 3

((counter=2000))
while [[ $counter -gt 0 ]] ; do
    (( row=( RANDOM % 14 ) -1  ))
    eval "rowtxt=\$heart$row"
    (( col=(RANDOM % ${#rowtxt}) ))
    tput cup $row $col; eval "echo \"\${rowtxt:col:1}\""
    tput cup 0 0; echo "  "
    sleep 0.001
    ((counter--))
done

# then draw the heart
((row=12))
while [[ $row -gt -1 ]] ; do
    tput cup $row 0; eval "echo \"\$heart$row\""
    ((row--))
done
sleep 5
