//**************************************************************************User Objects
class User
{
  //Instance Variables
  String username;
  int rank = 1;
  int preferredColor;
  String data;

  //Constructor Declaration of Class
  User(String username, int rank, int preferredColor)
  {
    this.username = username.toUpperCase();
    this.rank = rank;
    this.preferredColor = preferredColor;
  }

  String getUsername()
  {
    return username;
  }
  int getRank() {
    return rank;
  }
  int getPreferredColor() {
    return preferredColor;
  }
  void addRank() {
    rank += 1;
  }
  void setUsername(String username) {
    this.username = username.toUpperCase();
  }
  void setPreferredColor(int preferredColor) {
    this.preferredColor = preferredColor;
  }
}

/* Type Mismatch when incrementing objects to the list, will redo using simply strings
 Object createNewUserFromData(String data) 
 {
 tempUser = data.split(",");
 return new User(tempUser[0], int(tempUser[1]), int(tempUser[2]));
 }
 
 Object createNewUser(String name, int rank, int preferredColorIndex) 
 {
 return new User(name, rank, preferredColorIndex);
 }*/
