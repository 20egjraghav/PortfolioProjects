select * from PortfolioProject..NashvilleHousing;

select SaleDateConverted, convert(Date,SaleDate) as Date 
from PortfolioProject..NashvilleHousing;

Update PortfolioProject..NashvilleHousing
set SaleDate = convert(Date,SaleDate);

Alter Table PortfolioProject..NashvilleHousing
add SaleDateConverted Date;

Update PortfolioProject..NashvilleHousing
set SaleDateConverted = convert(Date,SaleDate);

select *
from PortfolioProject..NashvilleHousing
where PropertyAddress is Null;
order by ParcelID;

select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
from PortfolioProject..NashvilleHousing a
Join PortfolioProject..NashvilleHousing b on
a.ParcelID = b.ParcelID and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is Null;


Update a
set PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
from PortfolioProject..NashvilleHousing a
Join PortfolioProject..NashvilleHousing b on
a.ParcelID = b.ParcelID and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is Null;


select PropertyAddress
from PortfolioProject..NashvilleHousing;
--where PropertyAddress is Null;
--order by ParcelID;

select SUBSTRING(PropertyAddress, 1, Charindex(',',PropertyAddress) -1 ) as Address,
SUBSTRING(PropertyAddress, Charindex(',',PropertyAddress) +1 , LEN(PropertyAddress)) as Address
--Charindex(',',PropertyAddress)
from PortfolioProject..NashvilleHousing;


Alter Table PortfolioProject..NashvilleHousing
add PropertySplitAddress Nvarchar(255);

Update PortfolioProject..NashvilleHousing
set PropertySplitAddress = SUBSTRING(PropertyAddress, 1, 
Charindex(',',PropertyAddress) -1 );


Alter Table PortfolioProject..NashvilleHousing
add PropertySplitCity Nvarchar(255);

Update PortfolioProject..NashvilleHousing
set PropertySplitCity = SUBSTRING(PropertyAddress, Charindex(',',PropertyAddress) +1 , LEN(PropertyAddress));

select * from PortfolioProject..NashvilleHousing;


select OwnerAddress from PortfolioProject..NashvilleHousing;

select PARSENAME(Replace(OwnerAddress, ',','.'), 3),
PARSENAME(Replace(OwnerAddress, ',','.'), 2),
PARSENAME(Replace(OwnerAddress, ',','.'), 1)
from PortfolioProject..NashvilleHousing;


Alter Table PortfolioProject..NashvilleHousing
add PropertySplitAddress Nvarchar(255);

Update PortfolioProject..NashvilleHousing
set PropertySplitAddress = SUBSTRING(PropertyAddress, 1, 
Charindex(',',PropertyAddress) -1 );


Alter Table PortfolioProject..NashvilleHousing
add PropertySplitCity Nvarchar(255);

Update PortfolioProject..NashvilleHousing
set PropertySplitCity = SUBSTRING(PropertyAddress, 
Charindex(',',PropertyAddress) +1 , LEN(PropertyAddress));

update PortfolioProject..NashvilleHousing
set SoldAsVacant = Case when SoldAsVacant = 'Y' then 'Yes'
						when SoldAsVacant = 'N' then 'No'
						else SoldAsVacant
						End;

select distinct(SoldAsVacant) , count(SoldAsVacant) as TotalCount from 
PortfolioProject..NashvilleHousing
group by SoldAsVacant
order by count(SoldAsVacant);

With RowNumCTE as(
select *,
ROW_NUMBER() over (
Partition by ParcelID,
PropertyAddress,SalePrice,
SaleDate, LegalReference
Order by UniqueID) row_num
from PortfolioProject..NashvilleHousing
--order by ParcelID
)
select * from RowNumCTE where row_num >1
Order by PropertyAddress;



With RowNumCTE as(
select *,
ROW_NUMBER() over (
Partition by ParcelID,
PropertyAddress,SalePrice,
SaleDate, LegalReference
Order by UniqueID) row_num
from PortfolioProject..NashvilleHousing
--order by ParcelID
)
Delete from RowNumCTE where row_num > 1




select * from PortfolioProject..NashvilleHousing;

alter table PortfolioProject..NashvilleHousing
drop column OwnerAddress, TaxDistrict,PropertyAddress

alter table PortfolioProject..NashvilleHousing
drop column SaleDate
