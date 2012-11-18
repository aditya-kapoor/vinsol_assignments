#!/bin/bash

cities=(Delhi Mumbai Chennai Kolkata)
domain_names=(yahoo.com gmail.com hotmail.com rediffmail.com)

generate_random_number()
{
  random_number=`expr $RANDOM % $total_length`
}

generate_city_name()
{
  total_length=${#cities[@]}
  generate_random_number
  random_city=${cities[$random_number]}
}

generate_domain_name()
{
  total_length=${#domain_names[@]}
  generate_random_number
  random_domain=${domain_names[$random_number]}
}

generate_phone_number()
{
  phone="9"
  for j in {1..9}
  do
    num=`expr $RANDOM % $j`    
    phone=$phone$num
  done
}

for i in {1..200}
do
  generate_domain_name
  generate_city_name
  generate_phone_number
  echo "random$i@$random_domain|$random_city|$phone" >> subscribers.txt
done