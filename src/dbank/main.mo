import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor DBank{
  stable var currentValue: Float = 300;
  // currentValue := 100;
 
  let id = 23234234345325345;

   stable var startTime = Time.now();
  Debug.print(debug_show (startTime));

  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

 public func topUp(amount: Float) : () {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

 public func withdraw(withdraw: Float) {
    // currentValue += amount;
    let tempValue: Float = currentValue-withdraw;
    if(tempValue - withdraw >=0){
       currentValue -= withdraw;
    Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Amount too large ,currnet value is lessthan 0.");
    }
  };
 
 public query func checkBalance(): async Float{

  return currentValue;

 };
 
  // topUp()

  public func compound(){
    let currentTime = Time.now();
    let timelapsNS = currentTime-startTime;
    let timelapsS = timelapsNS/100000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timelapsS));
    startTime := currentTime;
  }
  


  
}