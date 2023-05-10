## Date format
```
SELECT saledateconvert,
       convert(Date,Saledate)
FROM dbo.DataCleaning

UPDATE datacleaning
SET saledate=convert(Date,Saledate)

ALTER TABLE datacleaning
ADD saledateconvert date;

UPDATE datacleaning
SET saledateconvert=convert(Date,Saledate)
```
## Property address (macth value in columns )
```
SELECT  a.ParcelID,
        a.PropertyAddress,
        b.ParcelID,
        b.PropertyAddress,
        isnull(a.Propertyaddress,b.PropertyAddress)
FROM dbo.DataCleaning a
JOIN dbo.DataCleaning b
	ON  a.ParcelID = b.ParcelID
	AND a.UniqueID <> b.UniqueID
WHERE a.PropertyAddress is null ;

UPDATE a
SET	PropertyAddress = isnull(a.Propertyaddress,b.PropertyAddress)
FROM dbo.DataCleaning a
JOIN dbo.DataCleaning b
	ON a.ParcelID = b.ParcelID
	AND a.UniqueID <> b.UniqueID
WHERE a.PropertyAddress is null ;
```

## Breaking out address into individual columns (address , city , state)

```
SELECT 
  substring (PropertyAddress,1,charindex(',',PropertyAddress) -1 ) as Address, 
  substring (PropertyAddress,charindex(',',PropertyAddress) +1 , LEN(PropertyAddress)) as Address
FROM dbo.DataCleaning
 

ALTER TABLE datacleaning
ADD PropertySplitAddress Nvarchar(255);

UPDATE datacleaning
SET PropertySplitAddress=substring (PropertyAddress,1,charindex(',',PropertyAddress) -1 )

ALTER TABLE datacleaning
ADD PropertySplitCity Nvarchar(255);

UPDATE datacleaning
SET PropertySplitCity=substring (PropertyAddress,charindex(',',PropertyAddress) +1 , LEN(PropertyAddress))

SELECT propertysplitcity
FROM DataCleaning

SELECT 
	PARSENAME(REPLACE(Owneraddress,',','.') , 3) ,
	PARSENAME(REPLACE(Owneraddress,',','.') , 2) ,
	PARSENAME(REPLACE(Owneraddress,',','.') , 1) 
FROM DataCleaning

```
