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
