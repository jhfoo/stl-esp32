$fn=50;
box_height = 8;
box_length = 89;
box_width = 65;
wall_ext_thickness = 2;

module base() {
  difference() {
    cube([box_length+wall_ext_thickness*2, 
      box_width+wall_ext_thickness*2,box_height]);
    translate([wall_ext_thickness,wall_ext_thickness,2])
      cube([box_length, box_width, box_height]);
  }
}

module holes_spacers() {
  radius = 2;
  
  // hole bottom left
  translate([wall_ext_thickness+3, 
    wall_ext_thickness+3, 
    -1])
    cylinder(box_height, 2,2);

  // hole top left
  translate([wall_ext_thickness+3, 
    box_width-1, 
    -1])
    cylinder(box_height, 2,2);

  // hole bottom right
  translate([box_length-wall_ext_thickness+1, 
    wall_ext_thickness+3, 
    -1])
    cylinder(box_height, 2,2);

  // hole top right
  translate([box_length-wall_ext_thickness+1, 
    box_width-1, 
    -1])
    cylinder(box_height, 2,2);
}

module holes_ports() {
  // sdcard 
  translate([box_length+wall_ext_thickness-3,20, -1])
    color("#ff0000")
    cube([wall_ext_thickness+5,20,box_height+5]);

    // microusb
//  translate([box_length+wall_ext_thickness-1,5, 2+3])
//    color("#ff0000")
//    cube([wall_ext_thickness+2,35,box_height]);
}

module VersionNum() {
  translate([box_length/2,box_width/2,3])
    rotate([0,180,0])
    linear_extrude(4)
    text("2", size=10);
}

difference() {
  base();
  holes_spacers();
  holes_ports();
  VersionNum();
}
