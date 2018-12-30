import pandas as pd
import ast

author = pd.read_csv(r"authors.csv")
author_id = author['_id'].tolist()
author_name = list(author['fname'].values + ' ' + author['lname'].values)
article = pd.read_csv('articles.csv')
article_id = article['article_id'].tolist()
article_author = article['authors'].tolist()
article_author = [ast.literal_eval(i) for i in article_author]
result = []
count = 0
for i in range(len(article_author)):
    for j in range(len(article_author[i])):
        result.append([count, author_id[author_name.index(article_author[i][j])], article_id[i]])
        count = count + 1
pd.DataFrame(result).to_csv("article_author.csv", index=False, header=['art_auth_id', 'author_id', 'article_id'])
