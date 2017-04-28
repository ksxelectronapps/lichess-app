echo '# Renaming'
for dirname in dist{/,/win,/mac}
do
  echo '## Directory:' $dirname
  for filename in $dirname/*\ *.*
  do
    if [[ -f "$filename" ]]
      then
        target=${filename// /-}
        echo '### Rename:' $filename '->' $target
        mv "$filename" "$target"
    fi
  done
done
