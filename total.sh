INSERTIONS=`git diff --stat | sed '$!d ; s/.*changed,[[:space:]]// ; s/[[:space:]]insertions.*//'`
CREATIONS=`expr \`for i in $(git grep -I --name-only --untracked -e . -- $(git ls-files -o  --exclude-standard | sed '/search[[:space:]](for[[:space:]]N-th[[:space:]]occurrence)\./d')); do wc -l $i | sed 's/[[:space:]].*//g'; done | awk 'ORS=" + "' | head -c -1\` 0`
MATCHED_FILES=`git ls-files -o  --exclude-standard | sed '/search[[:space:]](for[[:space:]]N-th[[:space:]]occurrence)\./d'`
CREATED_FILES=`git grep -I --name-only --untracked -e . -- "${MATCHED_FILES:-\!\*}" | cat | awk '{ print ln++ }' | sed '$!d'`

git diff --color=always --stat $@ | sed "s/${INSERTIONS}/$(expr $INSERTIONS + $CREATIONS)/ ; s/changed,/changed, ${CREATED_FILES} files created,/"
