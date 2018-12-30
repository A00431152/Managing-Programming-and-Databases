import csv

Volume_id = ['vol_id']
Pub_Year = ['publication_year']
Magazine_ID = ['magazine_id']

with open(r"articles.csv") as csvfile:
    readCSV = csv.DictReader(csvfile, delimiter=',')
    for row in readCSV:
        if row['vol_id'] in Volume_id:
            continue
        Volume_id.append(row['vol_id'])
        Pub_Year.append(row['year'])
        name = row['name']

        with open(r"Magazines.csv") as csvfile2:
            readCSV2 = csv.DictReader(csvfile2, delimiter=',')
            for rowm in readCSV2:
                if name == rowm['name']:
                    Magazine_ID.append(rowm['_id'])


X = [list(a) for a in zip(Volume_id, Pub_Year, Magazine_ID)]

with open (r"Magazine_Volume.csv", "w") as csvfile:
    csvwriter = csv.writer(csvfile)
    csvwriter.writerows(X)





