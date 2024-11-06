# Run this in Cloud Shell or from your Visual Studio Code by copying the code and pasting it into your terminal, then hit Enter
# After executing the scripts. Ensure to take note of the exported values for future use.


#Variables
$RESOURCE_GROUP_NAME='RG-Project10'
$STORAGE_ACCOUNT_NAME="Newproj$(Get-Random)"
$CONTAINER_NAME='Blob-Proj10'

# Create storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME -SkuName Standard_LRS -Location eastus

#Get Storage Account Key
#ACCOUNT_KEY=$(az storage account keys list –resource-group $RESOURCE_GROUP_NAME –account-name $STORAGE_ACCOUNT_NAME –query ‘[0].value’ -o tsv)
#Get-AzStorageAccountKey -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME | select Value[0]
$keys = Get-AzStorageAccountKey -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME
$firstKeyValue = $keys | Select-Object -First 1 -ExpandProperty Value

# Create blob container
New-AzStorageContainer -Name $CONTAINER_NAME -Context $storageAccount.context

#Print out names of resources created

echo “storage_account_name: $STORAGE_ACCOUNT_NAME”
echo “container_name: $CONTAINER_NAME”
echo “access_key: $firstKeyValue”
