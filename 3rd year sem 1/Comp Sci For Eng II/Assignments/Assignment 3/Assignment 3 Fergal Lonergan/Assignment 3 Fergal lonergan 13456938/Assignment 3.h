
typedef int Number;

  const int maxSize=20;

  struct NumberSet

  {

    Number items[maxSize];

    int count;

  };

  void numberSetAdd(NumberSet& set, Number num);

  void numberSetRemove(NumberSet& set, Number num);

  int numberSetCount(NumberSet& set);

  Number numberSetSum(NumberSet& set);

  NumberSet newNumberSet();
