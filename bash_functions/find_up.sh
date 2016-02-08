# Defines a function that lets you search for a file walking "up" directories.
# For example, if you call "find_up foo" this will start with pwd and, if pwd
# contains a file named "foo" this will echo to stdout `pwd`. If `pwd` does
# not contain a file named foo the directory above `pwd` is then checked
# and so on until the file is found.
find_up() {
   if [ $# -ne 1 ]
   then
      echo "Error: You must supply exactly 1 argument."
      return 1
   fi

   dir=`pwd`
   while [ ! -e ${dir}/$1 ]
   do
      dir=${dir%/*}
   done

   if [ -e $dir ]
   then
      echo "$dir"
   else
      echo "Error: $1 not found" 2>&1
      return 1
   fi
}
   
