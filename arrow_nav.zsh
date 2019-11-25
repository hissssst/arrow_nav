#!/usr/bin/zsh
ARROW_NAV_INDEX=0
down() {
	ARROW_NAV_DIRS=(../*/)
	ARROW_NAV_COUNT=${#ARROW_NAV_DIRS[@]}
	ARROW_NAV_INDEX=$(( (ARROW_NAV_INDEX + 1) % ARROW_NAV_COUNT ))
	dr=$ARROW_NAV_DIRS[$(( ARROW_NAV_INDEX + 1 ))]

	cd $dr
	zle reset-prompt
}
right() {
	ARROW_NAV_DIRS=(*/)
	if [[ ${#ARROW_NAV_DIRS[@]} = 0 ]] ; then
		echo "no directories here" ;
	else
		cd $ARROW_NAV_DIRS[1]
		ARROW_NAV_INDEX=0
		zle reset-prompt ;
	fi
}
left() {
	cd ..
	ARROW_NAV_INDEX=0
	zle reset-prompt
}
up() {
	ARROW_NAV_DIRS=(../*/)
	ARROW_NAV_COUNT=${#ARROW_NAV_DIRS[@]}
	ARROW_NAV_INDEX=$(( (ARROW_NAV_INDEX - 1) % ARROW_NAV_COUNT ))
	if [[ $ARROW_NAV_INDEX = -1 ]] ; then
		ARROW_NAV_INDEX=$(( ARROW_NAV_COUNT - 1));
	fi
	dr=$ARROW_NAV_DIRS[$(( ARROW_NAV_INDEX + 1 ))]

	cd $dr
	zle reset-prompt
}
zle -N down
zle -N right
zle -N left
zle -N up
bindkey '^[[1;3B'      down
bindkey '^[[1;3C'      right
bindkey '^[[1;3A'      up
bindkey '^[[1;3D'      left
bindkey '[B'      down
bindkey '[C'      right
bindkey '[A'      up
bindkey '[D'      left
