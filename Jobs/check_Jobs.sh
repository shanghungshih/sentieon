#/bin/sh


###### modify here
check_dir="Outputs/*"
list_ID=$1
checkpoint="*.vqsr_SNP_INDEL.VQSR.pdf"
###### modify here


# arr : checkpoint found in Outputs
for i in ${check_dir}/${checkpoint}; do
  arr=($(echo $i | rev | cut -d / -f 1 | rev | cut -d . -f 1) "${arr[@]}")
done


# check whether id of list_ID is in arr
while read line; do
  if (printf '%s\n' "${arr[@]}" | grep -xq $line); then
    #printf '%s : success\n' "$line"
    arr_success=($line "${arr_success[@]}")
  else
    #printf '%s : fail\n' "$line"
    arr_fail=($line "${arr_fail[@]}")
  fi
done < $list_ID


# print arr_success / arr_fail
printf 'list_ID: [%s]\n' "$list_ID"
printf 'checkpoint: [%s]\n- - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n' "$checkpoint"

tmp=""
for i in ${arr_fail[@]}; do
  tmp="$i, $tmp"
done
printf 'fail list: %s samples, [%s]\n\n' "${#arr_fail[@]}" "$tmp"

tmp=""
for i in ${arr_success[@]}; do
  tmp="$i, $tmp"
done
printf 'success list: %s samples, [%s]\n\n' "${#arr_success[@]}" "$tmp"

