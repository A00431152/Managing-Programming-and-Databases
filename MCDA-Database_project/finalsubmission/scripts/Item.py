import csv

_id = ['_id']
price = ['price']

for a in range(10):
    _id.append(a)
for a in range(0, 100, 10):
    price.append(a)

X = [list(a) for a in zip(_id, price)]

with open (r"Item.csv", "w") as csvfile:
    csvwriter = csv.writer(csvfile)
    csvwriter.writerows(X)