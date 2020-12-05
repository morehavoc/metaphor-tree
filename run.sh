tree0='    oxoxoo    ooxoo'
tree1='  ooxoxo oo  oxoxooo'
tree2=' oooo xxoxoo ooo ooox'
tree3=' oxo o oxoxo  xoxxoxo'
tree4='  oxo xooxoooo o ooo'
tree5='    ooo\oo\  /o/o'
tree6='        \  \/ /'
tree7='         |   /'
tree8='         |  |'
tree9='         |<B|'
tree10='         |  |'
tree11='         |  |'
tree12='  ______/____\____'

heart0='                         '
heart1='   *  *       *  *       '
heart2=' *      *   *      *     '
heart3=' *       * *       *     '
heart4='  *       *       *      '
heart5='    *           *        '
heart6='      *       *          '
heart7='        *   *            '
heart8='         * *             '
heart9='          *              '
heart10='                         '
heart11='                         '
heart12='                         '

clear;
((row=12))
while [[ $row -gt -1 ]] ; do
    tput cup $row 0; eval "echo \"\$tree$row\""
    ((row--))
    sleep 0.25
done
sleep 5
((row=12))
while [[ $row -gt -1 ]] ; do
    tput cup $row 0; eval "echo \"\$heart$row\""
    ((row--))
    sleep 0.25
done
sleep 5
clear;
