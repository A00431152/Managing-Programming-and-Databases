import csv

Magazine_Id = ['_id']
Magazine_Id_count = 1
Magazine_Name = ['name']

with open(r"articles.csv") as csvfile:
    readCSV = csv.DictReader(csvfile, delimiter=',')
    for row in readCSV:
        if row['name'] in Magazine_Name:
            continue
        Magazine_Name.append(row['name'])
        Magazine_Id.append(Magazine_Id_count)
        Magazine_Id_count += 1
        # print(X)

X = [list(a) for a in zip(Magazine_Id, Magazine_Name)]

with open (r"Magazines.csv", "w") as csvfile:
    csvwriter = csv.writer(csvfile)
    csvwriter.writerows(X)
