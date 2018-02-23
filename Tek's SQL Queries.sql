#Find Driver with 3 months before license expired
SELECT 
    firstname, lastname, expirationDate
FROM
    uberaccount u,
    driverlicense dl,
    driver d
WHERE
    d.driverid = dl.driverid
        AND u.username = d.username
        AND DATEDIFF(expirationDate, CURDATE()) <= 89;

#Count Number of Female Driver (Please test this)
SELECT
    COUNT(*)
FROM
    driverlicense
WHERE
    driverlicense.gender = "Female";
    
#Subtotal For CurrentDate (Please test this)
SELECT
    SUM(f.amount) AS FareGrandTotal,
    SUM(f.basefare) AS BaseFeeGrandTotal,
    SUM(f.surge) AS SurgeGrandTotal,
    SUM(f.tolls) AS TollGrandTotal,
FROM
    Fare f,
    receipt r
WHERE
    f.receiptNumb = r.receiptNumber
        AND DATEDIFF(r.receiptDate, CURDATE()) = 0;
