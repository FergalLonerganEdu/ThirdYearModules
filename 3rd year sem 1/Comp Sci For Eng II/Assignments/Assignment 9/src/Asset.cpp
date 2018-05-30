#include <iostream>
#include "Asset.h"
using namespace std;

// Constructor for the Asset class. Sets the value and asset_id data fields of an Asset
// to the given arguments v and id respectively.
Asset::Asset(int v, int id)
{
    value=v;
    asset_id=id;
}

// The getValue() method is used to return the value of an Asset for the private data field of value.
int Asset::getValue()
{
    return value;
}

// The setValue() method sets the value of the private data field value of the Asset to the argument v.
void Asset::setValue(int v)
{
    value=v;
}

// The getAssetID() method gets the value of the private data field asset_id of the Asset .
int Asset::getAssetID()
{
    return asset_id;
}

// The depreciateAsset method is used to reduce the value of an asset by 10% of its original value.
void Asset::depreciateAsset()
{
    value*=0.9;//Multiplying value by 0.9 to reduce the value by 10%.
}

// The print_details method is used to print the different data fields of the asset.
void Asset::print_details()
{
    cout << "This is asset number " << asset_id << " with the value of " << value << endl;
}
