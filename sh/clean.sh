
CLEANLIST="$(pwd)/sh/lib/clean-list.sh"

compdir () (
  [ "$1" == "$2" ] || [ "$1" == "$2/" ] || [ "$1" == "$2\\" ]
)

checkdir () (
  DIR=$1
  lclchk () (
    !(compdir $DIR $1)
  )
  lclchk '.' && lclchk '..' && lclchk '.git' && lclchk 'node_modules' && [ -d $1 ]
)

cleandir () (
  cd $1
  for dir in $(ls -a .)
  do
    checkdir $dir && cleandir $dir
  done
  echo Directory $(pwd)
  rm -rfv $($CLEANLIST)
)

cleandir $(pwd)
