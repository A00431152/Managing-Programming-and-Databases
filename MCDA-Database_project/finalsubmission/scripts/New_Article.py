import csv

article_id = ['article_id']
article_title = ['article_title']
page_no = ['page_num']
volume_id = ['vol_id']

with open(r"articles.csv") as csvfile:
    readCSV = csv.DictReader(csvfile, delimiter=',')
    for row in readCSV:
        article_id.append(row['article_id'])
        article_title.append(row['article_title'])
        page_no.append(row['page_num'])
        volume_id.append(row['vol_id'])

X = [list(a) for a in zip(article_id,volume_id,article_title,page_no)]

with open (r"New_Article.csv", "w") as csvfile:
    csvwriter = csv.writer(csvfile)
    csvwriter.writerows(X)
