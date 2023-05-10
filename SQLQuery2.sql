select *
from dbo.DataCleaning

-- Date format

select saledateconvert,convert(Date,Saledate)
from dbo.DataCleaning

update datacleaning
set saledate=convert(Date,Saledate)

alter table datacleaning
add saledateconvert date;

update datacleaning
set saledateconvert=convert(Date,Saledate)

-- Property address (macth value in columns )
select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress,isnull(a.Propertyaddress,b.PropertyAddress)
from dbo.DataCleaning a
Join dbo.DataCleaning b
	on a.ParcelID = b.ParcelID
	and a.UniqueID <> b.UniqueID
where a.PropertyAddress is null ;

update a
set	PropertyAddress = isnull(a.Propertyaddress,b.PropertyAddress)
from dbo.DataCleaning a
Join dbo.DataCleaning b
	on a.ParcelID = b.ParcelID
	and a.UniqueID <> b.UniqueID
where a.PropertyAddress is null ;

-- Breaking out address into individual columns (address , city , state)
select 
substring (PropertyAddress,1,charindex(',',PropertyAddress) -1 ) as Address, 
substring (PropertyAddress,charindex(',',PropertyAddress) +1 , LEN(PropertyAddress)) as Address
from dbo.DataCleaning
 

alter table datacleaning
add PropertySplitAddress Nvarchar(255);

update datacleaning
set PropertySplitAddress=substring (PropertyAddress,1,charindex(',',PropertyAddress) -1 )

alter table datacleaning
add PropertySplitCity Nvarchar(255);

update datacleaning
set PropertySplitCity=substring (PropertyAddress,charindex(',',PropertyAddress) +1 , LEN(PropertyAddress))

select propertysplitcity
from DataCleaning


select 
	PARSENAME(REPLACE(Owneraddress,',','.') , 3) ,
	PARSENAME(REPLACE(Owneraddress,',','.') , 2) ,
	PARSENAME(REPLACE(Owneraddress,',','.') , 1) 
from DataCleaning

