# code 1
...
class div_by_5;
        rand bit[5:0]a;

        constraint c1{a%5 == 0;}

endclass

module div_5;
        div_by_5 div_h;
        initial begin
                div_h = new();
                repeat(10) begin
                div_h.randomize();
                $display("value of a=%0d",div_h.a);
                end
        end
endmodule
...


# code 2
...
//generate 0102030405
module pattern;

class con;
        rand int a[];
        constraint c1 {a.size() == 10;}
        constraint c2 {foreach(a[i])
                            if(i%2==0)
                              a[i]==0;
                            else
                              a[i]==(i+1)/2;}
endclass

con c_h=new();

initial begin
  c_h.randomize();
  $display("\n\n");
                                                                                                        // o/p:%d 0 1 0 2 0 3 0 4 0 5
  $write("The required pattern is: ");                                                                  // o/p: %0d 0102030405
  foreach(c_h.a[i])
    $write("%d",c_h.a[i]);

  $display("\n\n");
end

endmodule
...


# code 3
...
//unique no's b/w 99 to 100
module uniq;

class uniq_num;
        rand int val;
        real real_num;
        constraint c1 {val inside {[990:1000]};}

        function void post_randomize();
          real_num=val/10.0;
          $display("\n\t\t unique no. b/w 99-100 = %2f",real_num);
        endfunction
endclass

        initial begin
          uniq_num uniq_h = new();
          repeat(5);
          uniq_h.randomize();
        end
endmodule
...


# code 4
...
// odd numbers in 10 to 30
class odd_num;
  rand bit[7:0] num;
  constraint c_range {num inside {[10:30]};}
  constraint odd {num%2==1;}
endclass

module abc;
odd_num odd_h;
  initial begin
    odd_h = new();                                                  // repeat(5) begin
    odd_h.randomize();                                              // odd_h.randomize();
        repeat(5) begin                                             //$display ....
            $display("ODD NO =%d",odd_h.num);                       // to get random values i.e, inside repeat block generating values
   end
   end
endmodule
...


# code 5
...
//even no's in odd locations and odd no's in even location
class even_odd;
   rand bit[3:0] a[];
   int i;

   constraint c1 {a.size() inside {[15:20]};}
   constraint c2 {foreach(a[i]) {
                        if(i%2==0)   //even location
                           a[i]%2==1;   //odd number
                        else   //odd loaction
                           a[i]%2==0; //even number
                 }}
   function void display();
            $display("\n\t----size=%0d---\n",a.size());
                foreach(a[i]) begin
                  if(i%2==0)
                     $write("index=%d [even location]",i);
                  else
                     $write("index=%d [odd location]",i);

                  if(a[i]%2==0)
                    $write("index=%d [odd number]",i);
                  else
                    $write("index=%d [even number]",i);
            end
   endfunction
endclass

module abc;
even_odd c_h;
   initial begin
        c_h = new();
        $display("\n\n");

        repeat(2) begin
        c_h.randomize();
        foreach(c_h.a[i])
                $display("\t\t a=%p, odd number",c_h.a);
            end
        end
endmodule
...


# code 6
...
// constraint - for 0-100 range 70% and for 101-255 range 30%
class range;
  rand bit[7:0] a;
  constraint c1 {a dist {[0:100] :=7, [101:255] :=3};}
endclass

module abc;
    range c_h;
  initial begin
    c_h=new();
    $display("\n\n");

    repeat(10) begin
      c_h.randomize();
      if(c_h.a<100)     //< or >
        $display("\t\t a=%d (under [0:100])",c_h.a);
      else
        $display("\t\t a=%d (under [101:255])",c_h.a);
     end
   end
endmodule
...
