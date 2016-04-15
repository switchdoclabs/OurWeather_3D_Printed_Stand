//
// OurWeather Bottom Case
//
// SwitchDoc Labs January 2016
//


include <RoundedRect.scad>


module rcube(size=[30, 20, 10], radius=[3, 2, 1], center=true)
    hull() {
        translate( center ? [0,0,0] : size/2 ) {
            cube(size-2*radius+[2*radius[0],0,0],center=true);
            cube(size-2*radius+[0,2*radius[1],0],center=true);
            cube(size-2*radius+[0,0,2*radius[2]],center=true);
 
            for(x = [-0.5,0.5], y = [-0.5,0.5], z = [-0.5,0.5])
                translate([x * ( size[0] - 2*radius[0]),
                           y * ( size[1] - 2*radius[1]),
                           z * ( size[2] - 2*radius[2])])
                    scale([radius[0], radius[1], radius[2]])
 //                       sphere(1.0,$fn=4*4);
                       sphere(1.0,$fn=6*6);
        }
    }
    
    
    module ourWeatherPylon()
    {
        
        difference()
        {
      cylinder(h=10,r1=3, r2=2.5/2, $fn=100);
            
            translate([0,0,5])
            cylinder(h=5,r1=0.8, r2=0.8, $fm=100);
            
        }
 
    }


module bottomBox()
{
   
    union()
    {
        difference()
        {
        
            rcube([140, 60, 23], center=false);   // 3 mm walls (it will be in the sun)
                
        
            
                
            translate([2,2,2])
            cube([136, 56, 50]);
            
           // now take cuts out for plugs
            
            // power plug
            #translate([53,40,5])            
            cube([12,40, 50]);
            
            // RJ45 plugs
            
             #translate([130,15,5])            
            cube([40,30, 50]);
           
            // Slot for display
            
            rotate([-15,0,0])
            #translate([-4,10,20])
            cube([10,1.85,30]);
            
        }


            
            // slots for I2C Hub
     
        translate([35,-30,0])
        rotate([0,0,90])
            union()
            {
            translate([40-2,2,0])
            cube([30-2,1.5,8]);
            translate([40-2,20.5+.025 + 3.0,0])
            cube([30-2.5,1.5,8]);
            }
            
             // Pylons for Weather Plus
        translate([50,10,0])
        union()
            {
        
                translate([76+1.5,40+0.5,0])
                ourWeatherPylon();
                translate([76+1.5,0,0])
                ourWeatherPylon();
                translate([0,40+0.5,0])
                ourWeatherPylon();
                translate([0,0,0])
                ourWeatherPylon();
            }
            
        }
}





rotate([0,0,90])
union()
{
translate([0,0,0])
bottomBox();
/*
translate([0, 70,0])
bottomBox();


translate([0,70*2,0])
bottomBox();
    */

}


