/// @description array(val1,val2,...)
/// @param val1
/// @param val2
/// @param ...
function array() {
	var a, c;
	for(c = argument_count-1;c >= 0;c--){
	    a[c] = argument[c];
	}
	return a;



}
