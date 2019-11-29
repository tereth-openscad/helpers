//Functions in this file primarily originated from the OpenSCAD User Manual
//https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks#Add_all_values_in_a_list

//This file should be included by using "use" NOT "include"


//-------------------  This is an example -------------------
// The function that maps input values x to output values, the
// example uses floor() to convert floating point to integer
// values.
//function map(x) = floor(x);
  
//input = [58.9339, 22.9263, 19.2073, 17.8002, 40.4922, 19.7331, 38.9541, 28.9327, 18.2059, 75.5965];
  
// Use a list comprehension expression to call the map() function
// for every value of the input list and put the result of the
// function in the output list.
//output = [ for (x = input) map(x) ];
  
//echo(output);
// ECHO: [58, 22, 19, 17, 40, 19, 38, 28, 18, 75]
//------------------------------------------------------------


// Create a simple recursive function that adds the values of a list of floats;
// the simple tail recursive structure makes it possible to
// internally handle the calculation as loop, preventing a
// stack overflow.
function add(v, i = 0, r = 0) = i < len(v) ? add(v, i + 1, r + v[i]) : r;
 
//input = [2, 3, 5, 8, 10, 12];
 
//output = add(input);

//echo(output);
// ECHO: 40
//------------------ add2 -----------------------
// An even simpler non recursive code version of add explores the 
// the matrix product operator
function add2(v) = [for(p=v) 1]*v;

//echo(add2(input));
// ECHO: 40

// add2 works also with lists of vectors
//input2 = [ [2, 3] , [5, 8] , [10, 12] ];
//echo(add2(input2));
// ECHO: [17, 23]
//echo(add(input2));
// ECHO: undef  // Why?
//----------------- add3 --------------------------
// With a little more code, the function add may be used also 
// to add any homogeneous list structure of floats
function add3(v, i = 0, r) = 
    i < len(v) ? 
        i == 0 ?
            add3(v, 1, v[0]) :
            add3(v, i + 1, r + v[i]) :
        r;

//input3 = [ [[1], 1] , [[1], 2] , [[1], 3] ];
//input4 = [ 10, [[1], 1] , [[1], 2] , [[1], 3] ];

//echo(add3(input3));
// ECHO: [[3], 6]
//echo(add2(input3));
// ECHO: undef // input3 is not a list of vectors
//echo(add3(input4));
// ECHO: undef // input4 is not a homogeneous list

