    /*
     ******************************************************
     * Fergal Lonergan - 13456938                         *
     * COMP20080, Semester 1 2015-16 -- Practical 2       *
     *                                                    *
     * Reads three different times in hours, minutes and  *
     * seconds inputted by the user, adds them together   *
     * and returns the value in "canonical" form.         *
     ******************************************************
     */

    #include <iostream> // so we can use cin and cout
 using namespace std;

     // struct time of the times entered in (hours, minutes and seconds)
    struct timet
    {
        int hours;
        int minutes;
        int seconds;
    };


    /* Function Prototypes
     ********************************
     addTimes used to sum our three times together
     ********************************
     getTotalSeconds reads in the value of the sum of our three times
        which is not in canonical form and finds out its total time in
        seconds
     ********************************
     convertSeconds converts our total seconds value from our
        getTotalSeconds funtion and converts it back into out timet
        struct format
     ********************************
     CanonicalFormConverter converts our time which is in a time
     struct format to its total time in seconds and then back
     into a timet struct however now it is in canonical form. */
    timet addTimes(timet, timet, timet);
    int getTotalSeconds(timet);
    timet convertSeconds(int);
    timet CanonicalFormConverter(timet);


    //Main function
    int main()
    {
      timet time1, time2, time3;


       /* Read the 3 times inputted by the user, also explains the format
       it wishes to receive the times in. */

      cout << "Enter time 1 (hours minutes seconds). use only integers. ";
      cin >> time1.hours >> time1.minutes >> time1.seconds; // This lets the user enter the hours, minutes and seconds at once
                                                            //as long as the values are separated by spaces
    // Error checking to ensure integers are entered for the times
    while(cin.fail()) {
        cout << "Error: some value is not an integer.\nIntegers are positive or negative whole numbers ie 1 -13 273 etc." << std::endl;
        cin.clear();
        cin.ignore(256,'\n');
        cin >> time1.hours >> time1.minutes >> time1.seconds;
    }

      cout << "Enter time 2 (hours minutes seconds) ";
      cin >> time2.hours >> time2.minutes >> time2.seconds;
      while(cin.fail()) {
        cout << "Error: some value is not an integer.\nIntegers are positive or negative whole numbers ie 1 -13 273 etc." << std::endl;
        cin.clear();
        cin.ignore(256,'\n');
        cin >> time2.hours >> time2.minutes >> time2.seconds;
    }

      cout << "Enter time 3 (hours minutes seconds) ";
      cin >> time3.hours >> time3.minutes >> time3.seconds;
      while(cin.fail()) {
        cout << "Error: some value is not an integer.\nIntegers are positive or negative whole numbers ie 1 -13 273 etc." << std::endl;
        cin.clear();
        cin.ignore(256,'\n');
        cin >> time3.hours >> time3.minutes >> time3.seconds;
    }

    // shows the user the three times it entered in hours minutes and seconds
      cout << "\nTime1: " << time1.hours << " hrs, " << time1.minutes << " mins, " << time1.seconds << " seconds\n";
      cout << "Time2: " << time2.hours << " hrs, " << time2.minutes << " mins, " << time2.seconds << " seconds\n";
      cout << "Time3: " << time3.hours << " hrs, " << time3.minutes << " mins, " << time3.seconds << " seconds\n";

      //Find the sum of the times in canonical form after adding them together.
      timet sum = addTimes(time1, time2, time3);

      // Displays result of our time addition after conversion to canonical form
      cout << "\nTime1 + Time2 + Time3: " << sum.hours << " hrs, " << sum.minutes << " mins, " << sum.seconds << " seconds\n";
      return 0;
    }


    // add the three timet structures together, returning a timet structure in canonical form
    timet addTimes(timet time1, timet time2, timet time3)
    {
      timet canonicalTime, sumtime;

      // element-by-element addition
      sumtime.hours = time1.hours + time2.hours + time3.hours;
      sumtime.minutes = time1.minutes + time2.minutes + time3.minutes;
      sumtime.seconds = time1.seconds + time2.seconds + time3.seconds;

      // Convert to canonical form
      canonicalTime = CanonicalFormConverter(sumtime);

      return canonicalTime;
    }

    // Convert a timet structure into a timet structure in "canonical form"
    timet CanonicalFormConverter(timet time1)
    {
      // Convert the time to seconds
      int seconds = getTotalSeconds(time1);

      // Convert seconds back to a timet struct (this process ensures "canonical form")
      timet time2 = convertSeconds(seconds);

      return time2;
    }

    /* Convert from a timet structure, i.e. hours minutes and seconds. to a time of just seconds
     multiplies all components out to their seconds value and adds them together*/
    int getTotalSeconds(timet totaltime)
    {
      return ((totaltime.hours*60*60) + (totaltime.minutes*60) + totaltime.seconds);
    }


    /* Convert from seconds into a canonical timet structure
     * divides totalSeconds by largest component, i.e. hours, then uses the remainder in seconds
     * to get the minutes and finally sets the remainder equal to the seconds. */
    timet convertSeconds(int totalSeconds)
    {
      timet canonicalTime;
      int remainingSeconds;
      canonicalTime.hours = totalSeconds / (60*60);
      remainingSeconds = totalSeconds % (60*60);
      canonicalTime.minutes = remainingSeconds / 60;
      remainingSeconds = remainingSeconds % 60;
      canonicalTime.seconds = remainingSeconds;
      return canonicalTime;
    }
