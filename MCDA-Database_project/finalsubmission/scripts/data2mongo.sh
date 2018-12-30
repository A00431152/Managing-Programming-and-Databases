#!/bin/bash
#
user=b_shree
pass=A00431152
db=b_shree

#


#step 1 - load sql data from existing_tables.sql
mysql -u $user --password=$pass $db -e "source existing_tables.sql"

#step 2 - create mysql table new_tables.sql
mysql -u $user --password=$pass $db -e "source new_tables.sql"

#step 3 - Drop  mongo collection AUTHOR
mongo $user -u $db -p $pass --eval "db.AUTHOR.drop()"

#step 4 - create mongo collection AUTHOR
mongo $user -u $db -p $pass --eval "db.createCollection('AUTHOR')"

#step 5 - import author json data into mongo collection
mongoimport -d $db -p $pass -u $user -c AUTHOR --file author_json.json --jsonArray

#step 6 - Drop  mongo collection Article and temparticle
mongo $user -u $db -p $pass --eval "db.ARTICLE.drop()"
mongo $user -u $db -p $pass --eval "db.TEMPARTICLE.drop()"

#step 7 - create temporary mongo collection
mongo $user -u $db -p $pass --eval "db.createCollection('TEMPARTICLE')"

#step 8 - import tempjson  into mongo collection
mongoimport -d $db -p $pass -u $user -c TEMPARTICLE --file article_temp.json --jsonArray

#step 9 - create mongo collection ARTICLE
mongo $user -u $db -p $pass --eval "db.createCollection('ARTICLE')"

#step 10 - run javascript to insert element
mongo $user -u $db -p $pass --eval "load('articleparse.js')"
