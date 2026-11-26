# code 1
...
//without inside operator generate random values for the range 34-43
class generate_without_in;
  rand bit[7:0] value;
  constraint c_range {(value>34) && (value<43);}
endclass

module abc;
    generate_without_in c_h;
  initial begin
    c_h = new();
    $display("\n\n");

    repeat(15) begin
      c_h.randomize();
      $display("value=%d",c_h.value);
    end
  end
endmodule
...


# code 2
...
//There are two constraints applied to same variable. one will be with in range of [25:50] and other is greater than 40.
// ans: constraint solver will satisfies all conditions parallely.. so o/p will generate greater than 40 values only

class con;
  rand bit[7:0]data;

  constraint c1 {data inside {[25:50]};}
  constraint c2 {data>40;}
endclass

module too;
   con c_h;

   initial begin
     c_h=new();
     $display("\n\n");

     repeat(10) begin
       c_h.randomize();
       $display("data=%0d",c_h.data);
     end
     $display("\n\n");
  end
endmodule
...


# code 3
...
//unique numbers between 1 and 20

class unique_array;
   rand bit [4:0] arr[5];
   constraint c_range { foreach (arr[i]) arr[i] inside {[1:20]}; }
   constraint c_unique { unique {arr}; }
endclass


module tb;
 unique_array u = new();
   initial begin
     if (u.randomize())
         $display("Unique Array = %p", u.arr);
   end
endmodule
...


# code 4
...
// sort array in ascending order
class sort_array;
    rand bit[7:0] arr[4];


    constraint c_sorted {
       arr[0] <= arr[1];
       arr[1] <= arr[2];
       arr[2] <= arr[3];
     }
endclass


module tb;
  sort_array s = new();
  initial begin
     if(s.randomize())
        $display("Sorted Array = %p",s.arr);
  end
endmodule
...


# code 5
...
//1234554321

class trans;
        rand int da[];
                constraint c1{da.size==10;}
                constraint c2{foreach (da[i])
                                if(i<5)
                                        da[i]==i+1;
                                else
                                        da[i]==10-i;}
endclass

module tb;
  trans tr;
    initial begin
        tr=new();
           assert(tr.randomize());
            $display("da=%p",tr.da);
    end
endmodule
...
  
  

