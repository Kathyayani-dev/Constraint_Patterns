//0102030405
...
module pattern;

        class abc;
                rand int a[];
                constraint c1 {a.size()==10;}
                constraint c2 {foreach(a[i])
                                if (i%2==0)
                                        a[i]==0;
                                else
                                        a[i]==(i+1)/2;}
        endclass

abc a_h=new();
        initial begin
                a_h.randomize();
                $display("\n\n");
                $display("\t\t\t The required pattern is:");
                foreach(a_h.a[i])
                $write("%0d",a_h.a[i]);
                $display("\n\n");
        end
endmodule
...
