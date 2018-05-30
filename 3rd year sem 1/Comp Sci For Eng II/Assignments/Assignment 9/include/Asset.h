// taken from assignment page.
class Asset
{
private:
    int value;              // private variable for the value of an Asset
    int asset_id;           // private variable for the asset_id of an Asset
public:
    Asset(int v, int id);   // sets value of Asset to v and asset_id to id
    int getValue();         // returns value of Asset
    void setValue(int v);   // sets value of Asset to v
    int getAssetID();       // returns asset_id of asset
    void depreciateAsset(); // reduces value of Asset by 10%
    void print_details();   // prints out asset_id and value of asset
};

