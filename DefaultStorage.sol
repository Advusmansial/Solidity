contract First {
//storage
uint stateVariable;  uint[] stateArray;
uint storage stateVariable1; // error  uint[] memory stateArray1; // error
}
