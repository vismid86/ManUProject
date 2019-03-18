#set -e

CHANGED_FILES=`git diff --name-only HEAD~1`
IS_CMS=False
CMS="apps\/contents\/"

for CHANGED_FILE in $CHANGED_FILES; do
  if [[ $CHANGED_FILE =~ $CMS ]]; then
    IS_CMS=True
    break
  fi
done

if [[ $IS_CMS == True ]]; then
  echo "CMS files found, continue"
  export cms=1
else
  echo "No changes to CMS content; Terminating"
  export cms=0
fi

