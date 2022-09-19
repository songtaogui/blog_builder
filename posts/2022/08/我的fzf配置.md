+++
title = "我的fzf配置"
# tags = [ "programming","bioinformatics","genetics","paper","work","daily","random","insight", ... ]
tags = ["linux","work", "daily"]
showall = true
summary = """
  模糊搜索用得好, 搬砖效率高不少!
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
hascomment = true

pubdate = Date("2022-08-18")
+++

{{page_tags}}

\bhack{`fzv`: 搜索当前目录中的文本文件,用默认编辑器编辑}{
\bash{
# edit
fzv() {
  # only list non-binary files
  local files
  files=$(find ${1:-.} -type f -exec file {} + 2>/dev/null |\
		awk -F: '/ASCII text/ {print $1}' |\
		 fzf -m)
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
}
}

\bhack{`fzd`: 搜索当前目录中的文件夹, 并cd}{
\bash{
# cd
fzd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null |\
fzf --preview-window=hidden +m) &&
  cd "$dir"
}
}
}

\bhack{`fzkill`: 搜索当前用户的jobs, 并kill, 为防止误杀, 需要输入y确认}{
\bash{
# job kill
fzkill() {
  local pid
  local pinfo=$(ps -ef | grep -P "^$USER" | fzf -m --preview-window=hidden)
  local pid=$(echo "$pinfo" | perl -lane 'print $F[1]')
  if [ "x$pid" != "x" ]
  then
	gst_warn "
Kill these processes? [y/N]
------------------------------
$pinfo
------------------------------
"
	local cfm="N"
	read cfm
	if [[ "$cfm" == "y" ]];then
		echo "$pid" | xargs kill -${1:-9}
	fi
  fi
}
}
}

\bhack{`fzmd`: 搜索并加载module, 多选}{
\bash{
# module
fzmd(){
	local avalmds
	if [[ -n "$MODULESHOME" ]];then
		avalmd=$(module aval 2>&1 | perl -lane '$,="\n"; print @F unless /^-/ or /^\s*$/' |\
			fzf -m --preview-window=hidden | perl -pe 's/\n/ / unless eof')
		if [ "x$avalmd" != "x" ];then
			gst_rcd "load selected modules: $avalmd "
			module load $avalmd
		fi
	fi
}
}
}


\bhack{用fzf实现文件夹书签: adb添加当前目录到书签, cdb进入书签}{
\bash{
# bookmarks
unalias adb 2>/dev/null
unalias cdb 2>/dev/null
export GST_BOOKMARK="$GSTCFG/bookmark.cfg"

adb(){
	# add current path to pathdb
	local cur_path=$PWD
	touch $GST_BOOKMARK
	cat $GST_BOOKMARK | grep -P "^${cur_path}$" >/dev/null
	if [ $? -ne 0 ];then
		echo "$cur_path" >> $GST_BOOKMARK
		echo -e "\033[36m[$(date +'%y-%m-%d %H:%M')]\033[0m Added pwd to GST_BOOKMARK"
	else
		echo -e "\033[35m[WARNING]\033[0m --> Already in bookmark" >&2
	fi
}

cdb(){
	local dest_dir=$(cat $GST_BOOKMARK | sed 's/^#.*//g; /^\s*$/d' | fzf --preview-window=hidden)
	if [[ $dest_dir != '' ]];then
		cd "$dest_dir" && ls
	fi
}

alias vdb="vim $GST_BOOKMARK"
}
}
