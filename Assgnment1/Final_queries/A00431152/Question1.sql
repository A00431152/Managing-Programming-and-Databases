SELECT 
    sname, city
FROM
    S,
    SP
WHERE
    S.sno = SP.sno AND SP.pno = 3;

SELECT 
    P.pno, pname
FROM
    P,
    S,
    SP
WHERE
    P.pno = SP.pno AND S.sno = SP.sno
        AND S.city = 'Paris'
        AND S.status >= 20;

SELECT 
    P.pno, pname, COUNT(*) AS Supplierstotal
FROM
    P,
    SP
WHERE
    P.pno = SP.pno
GROUP BY SP.pno;


SELECT 
    sname, SUM(SP.qty) AS Totalquant
FROM
    S,
    SP
WHERE
    S.sno = SP.sno AND S.city = 'London'
GROUP BY SP.sno
HAVING Totalquant >= 1000;


SELECT DISTINCT
    s.sname, s.city
FROM
    S,
    P,
    SP
WHERE
    P.pno = SP.pno AND S.sno = SP.sno
        AND P.weight < 4;